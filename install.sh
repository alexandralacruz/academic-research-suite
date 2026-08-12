#!/usr/bin/env bash
# =============================================================================
# Academic Research Suite — Multi-agent installer
# =============================================================================
#
# Compatible con: pi-coding-agent · Claude Code (Claude) · OpenAI Codex CLI
#
# Uso local (repo clonado):
#   ./install.sh                  # Modo interactivo (menú)
#   ./install.sh --all            # Instalar todas las skills
#   ./install.sh <skill-name>     # Instalar una skill específica
#   ./install.sh --uninstall <skill-name>  # Desinstalar una skill
#   ./install.sh --uninstall --all         # Desinstalar todas
#   ./install.sh --list           # Listar skills disponibles
#   ./install.sh --status         # Ver estado de instalación
#   ./install.sh --help           # Mostrar ayuda
#
# Uso remoto (one-liner desde cualquier máquina):
#   curl -sSL https://raw.githubusercontent.com/alexandralacruz/academic-research-suite/main/install.sh | bash
#   curl -sSL https://raw... | bash -s -- --all --agent codex
#   curl -sSL https://raw... | bash -s -- --all --agent all
#
# Multi-agente:     ./install.sh --all --agent codex
#                   ./install.sh --all --agent claude
#                   ./install.sh --all --agent all
# =============================================================================

set -euo pipefail

# ─── Bootstrap remoto: si no hay SKILL.md local, clonar el repo ─────────────

# Detectar si estamos en un repo local con skills o si es ejecución remota (curl|bash)
_is_local_repo() {
    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-}")" 2>/dev/null && pwd)" || return 1
    # Buscar al menos un SKILL.md en subdirectorios hermanos
    local skill_count
    skill_count=$(find "$script_dir" -maxdepth 2 -name SKILL.md -type f 2>/dev/null | wc -l)
    [ "$skill_count" -gt 0 ]
}

if ! _is_local_repo; then
    # Ejecución remota (curl | bash): clonar el repo automáticamente
    REPO_URL="${REPO_URL:-https://github.com/alexandralacruz/academic-research-suite.git}"
    TMP_DIR="$(mktemp -d /tmp/academic-research-suite.XXXXXX)"
    trap 'rm -rf "$TMP_DIR"' EXIT

    echo "→ Clonando Academic Research Suite..."
    if command -v git &>/dev/null; then
        git clone --depth 1 "$REPO_URL" "$TMP_DIR" 2>&1 | tail -1
    else
        echo "Error: git no encontrado. Instala git o clona el repo manualmente:"
        echo "  git clone $REPO_URL && cd academic-research-suite && ./install.sh --all --agent codex"
        exit 1
    fi

    cd "$TMP_DIR"
    # Sin exec: compatible con Windows (Git Bash) donde execvp falla
    "$TMP_DIR/install.sh" "$@"
    exit $?
fi

# ─── Configuración ───────────────────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="${PI_SKILLS_DIR:-$HOME/.pi/agent/skills}"

# Rutas por agente
AGENT_SKILLS_DIRS=(
    "pi:$HOME/.pi/agent/skills"
    "claude:$HOME/.claude/skills"
    "codex:$HOME/.codex/skills"
)

# ─── Colores ─────────────────────────────────────────────────────────────────

if [ -t 1 ] && command -v tput >/dev/null 2>&1; then
    BOLD=$(tput bold)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    BLUE=$(tput setaf 4)
    CYAN=$(tput setaf 6)
    RESET=$(tput sgr0)
else
    BOLD=""; RED=""; GREEN=""; YELLOW=""; BLUE=""; CYAN=""; RESET=""
fi

# ─── Skills disponibles (directorios con SKILL.md) ───────────────────────────

get_available_skills() {
    local skills=()
    for dir in "$SCRIPT_DIR"/*/; do
        [ -d "$dir" ] || continue
        local name; name=$(basename "$dir")
        # Excluir scripts o hidden dirs
        [[ "$name" == .* || "$name" == scripts || "$name" == node_modules ]] && continue
        [ -f "$dir/SKILL.md" ] || continue
        skills+=("$name")
    done
    printf '%s\n' "${skills[@]}" | sort
}

get_skill_description() {
    local skill_dir="$SCRIPT_DIR/$1"
    [ -f "$skill_dir/SKILL.md" ] || { echo "(no description)"; return; }
    # Extraer el campo description del frontmatter YAML
    sed -n '/^---$/,/^---$/p' "$skill_dir/SKILL.md" \
        | grep '^description:' \
        | sed 's/^description:[[:space:]]*//' \
        | head -c 120
    echo
}

# ─── Funciones de instalación ────────────────────────────────────────────────

install_skill() {
    local skill_name="$1"
    local src="$SCRIPT_DIR/$skill_name"
    local dst="$DEST_DIR/$skill_name"

    # Validar que existe
    if [ ! -d "$src" ] || [ ! -f "$src/SKILL.md" ]; then
        echo "  ${RED}✖${RESET} ${BOLD}$skill_name${RESET} — no es una skill válida (falta SKILL.md)"
        return 1
    fi

    # Si ya existe, preguntar (solo en modo interactivo)
    if [ -d "$dst" ]; then
        echo "  ${YELLOW}⚠${RESET}  ${BOLD}$skill_name${RESET} ya está instalada en ${CYAN}$dst${RESET}"
        return 0
    fi

    # Crear directorio destino si no existe
    mkdir -p "$DEST_DIR"

    # Copiar la skill
    cp -r "$src" "$dst"
    echo "  ${GREEN}✔${RESET} ${BOLD}$skill_name${RESET} instalada → ${CYAN}$dst${RESET}"
    return 0
}

uninstall_skill() {
    local skill_name="$1"
    local dst="$DEST_DIR/$skill_name"

    if [ ! -d "$dst" ]; then
        echo "  ${YELLOW}○${RESET} ${BOLD}$skill_name${RESET} — no está instalada"
        return 1
    fi

    rm -rf "$dst"
    echo "  ${GREEN}✔${RESET} ${BOLD}$skill_name${RESET} desinstalada"
    return 0
}

is_installed() {
    [ -d "$DEST_DIR/$1" ] && [ -f "$DEST_DIR/$1/SKILL.md" ]
}

# ─── Comandos ────────────────────────────────────────────────────────────────

cmd_list() {
    echo
    echo "${BOLD}${BLUE}Academic Research Suite${RESET} — Skills disponibles"
    echo "${BLUE}────────────────────────────────────────────${RESET}"
    echo
    printf "  ${BOLD}%-28s %s${RESET}\n" "SKILL" "DESCRIPCIÓN"
    printf "  %-28s %s\n" "─────" "──────────"
    while IFS= read -r skill; do
        local desc; desc=$(get_skill_description "$skill")
        local status=""
        is_installed "$skill" && status=" ${GREEN}[instalada]${RESET}"
        printf "  ${CYAN}%-28s${RESET} %s%s\n" "$skill" "${desc:0:85}" "$status"
    done < <(get_available_skills)
    echo
    echo "  ${BOLD}Total:${RESET} $(get_available_skills | wc -l) skills"
    echo
    echo "  Destino: ${CYAN}$DEST_DIR${RESET}"
    echo
    echo "  ${BOLD}Comandos:${RESET}"
    echo "    ./install.sh --all          Instalar todas"
    echo "    ./install.sh <nombre>       Instalar una"
    echo "    ./install.sh                Modo interactivo"
    echo
}

cmd_status() {
    echo
    echo "${BOLD}${BLUE}Estado de instalación${RESET}"
    echo "${BLUE}───────────────────────${RESET}"
    echo
    local installed=0 total=0
    while IFS= read -r skill; do
        total=$((total + 1))
        if is_installed "$skill"; then
            installed=$((installed + 1))
            echo "  ${GREEN}✔${RESET} ${BOLD}$skill${RESET}"
        else
            echo "  ${RED}✖${RESET} ${BOLD}$skill${RESET}"
        fi
    done < <(get_available_skills)
    echo
    echo "  ${BOLD}$installed/$total${RESET} skills instaladas"
    echo "  Destino: ${CYAN}$DEST_DIR${RESET}"
    echo
}

cmd_install_all() {
    local agent="${1:-}"

    if [ -n "$agent" ] && [ "$agent" != "all" ]; then
        local agent_dir; agent_dir=$(get_agent_dir "$agent")
        if [ -z "$agent_dir" ]; then
            echo "${RED}Error:${RESET} Agente '${BOLD}$agent${RESET}' no reconocido."
            echo "Agentes válidos: pi, claude, codex, all"
            exit 1
        fi
        DEST_DIR="$agent_dir"
    fi

    if [ "$agent" = "all" ]; then
        cmd_install_all_agents
        return
    fi

    echo
    echo "${BOLD}${BLUE}Instalando Academic Research Suite (todas las skills)${RESET}"
    echo "${BLUE}──────────────────────────────────────────────────────${RESET}"
    echo
    echo "  Destino: ${CYAN}$DEST_DIR${RESET}"
    [ -n "$agent" ] && echo "  Agente:   ${CYAN}$agent${RESET}"
    echo

    local count=0 errors=0
    while IFS= read -r skill; do
        if install_skill "$skill"; then
            count=$((count + 1))
        else
            errors=$((errors + 1))
        fi
    done < <(get_available_skills)

    echo
    echo "  ${BOLD}Resultado:${RESET} ${GREEN}$count instaladas${RESET}$([ $errors -gt 0 ] && echo ", ${RED}$errors errores${RESET}")"
    echo
    case "${agent:-pi}" in
        pi)     echo "  ${BOLD}Nota:${RESET} Reinicia pi o usa ${CYAN}/skill:<nombre>${RESET} para cargar las skills." ;;
        claude) echo "  ${BOLD}Nota:${RESET} En Claude Code usa ${CYAN}/skill:<nombre>${RESET} para invocar." ;;
        codex)  echo "  ${BOLD}Nota:${RESET} En Codex usa ${CYAN}/skill:<nombre>${RESET} para invocar." ;;
    esac
    echo
}

cmd_install_all_agents() {
    echo
    echo "${BOLD}${BLUE}Instalando en todos los agentes detectados${RESET}"
    echo "${BLUE}──────────────────────────────────────────${RESET}"
    echo

    local detected
    mapfile -t detected < <(detect_agents)

    if [ ${#detected[@]} -eq 0 ]; then
        echo "  ${YELLOW}No se detectaron agentes. Instalando en pi por defecto.${RESET}"
        DEST_DIR="$HOME/.pi/agent/skills" cmd_install_all "pi"
        return
    fi

    for agent in "${detected[@]}"; do
        echo "  ${BOLD}→ Instalando para ${CYAN}$agent${RESET} ..."
        local agent_dir; agent_dir=$(get_agent_dir "$agent")
        DEST_DIR="$agent_dir" cmd_install_all "$agent"
        echo
    done

    echo "  ${GREEN}✔${RESET} Instalación multi-agente completada."
    echo
}

cmd_uninstall_all() {
    echo
    echo "${BOLD}${RED}Desinstalando todas las skills de Academic Research Suite${RESET}"
    echo "${RED}────────────────────────────────────────────────────────${RESET}"
    echo
    echo "  Destino: ${CYAN}$DEST_DIR${RESET}"
    echo

    local count=0 errors=0
    while IFS= read -r skill; do
        if uninstall_skill "$skill"; then
            count=$((count + 1))
        else
            errors=$((errors + 1))
        fi
    done < <(get_available_skills)

    echo
    echo "  ${BOLD}Resultado:${RESET} ${GREEN}$count desinstaladas${RESET}$([ $errors -gt 0 ] && echo ", ${RED}$errors no encontradas${RESET}")"
    echo
}

cmd_install_one() {
    local skill="$1"

    # Permitir nombre parcial (ej: "literature" matchea "literature-discovery")
    local match; match=$(get_available_skills | grep -i "^$skill" || true)
    if [ -z "$match" ]; then
        match=$(get_available_skills | grep -i "$skill" || true)
    fi

    local matches; matches=$(echo "$match" | wc -l)
    if [ "$matches" -eq 0 ]; then
        echo "${RED}Error:${RESET} Skill '${BOLD}$skill${RESET}' no encontrada."
        echo "Usa ${CYAN}./install.sh --list${RESET} para ver las disponibles."
        exit 1
    elif [ "$matches" -gt 1 ]; then
        echo "${YELLOW}Múltiples skills coinciden con '${BOLD}$skill${RESET}':${RESET}"
        echo "$match" | while read -r m; do echo "  - $m"; done
        echo "Sé más específico."
        exit 1
    fi

    skill="$match"
    echo
    echo "${BOLD}${BLUE}Instalando skill:${RESET} ${CYAN}$skill${RESET}"
    echo

    if install_skill "$skill"; then
        echo
        echo "  ${GREEN}✔${RESET} Listo. Usa ${CYAN}/skill:$skill${RESET} en pi."
    fi
    echo
}

cmd_uninstall_one() {
    local skill="$1"
    local match; match=$(get_available_skills | grep -i "^$skill" || true)
    if [ -z "$match" ]; then
        match=$(get_available_skills | grep -i "$skill" || true)
    fi
    local matches; matches=$(echo "$match" | wc -l)
    if [ "$matches" -eq 0 ]; then
        echo "${RED}Error:${RESET} Skill '${BOLD}$skill${RESET}' no encontrada."
        exit 1
    elif [ "$matches" -gt 1 ]; then
        echo "${YELLOW}Múltiples skills coinciden:${RESET}"
        echo "$match"
        exit 1
    fi
    skill="$match"
    echo
    echo "${BOLD}${RED}Desinstalando skill:${RESET} ${CYAN}$skill${RESET}"
    echo
    uninstall_skill "$skill"
    echo
}

# ─── Detección de agentes ──────────────────────────────────────────────────

detect_agents() {
    local detected=()
    for entry in "${AGENT_SKILLS_DIRS[@]}"; do
        local agent="${entry%%:*}"
        local dir="${entry#*:}"
        case "$agent" in
            pi)     command -v pi &>/dev/null || [ -d "$HOME/.pi" ] && detected+=("pi") ;;
            claude) command -v claude &>/dev/null || [ -d "$HOME/.claude" ] && detected+=("claude") ;;
            codex)  command -v codex &>/dev/null || [ -d "$HOME/.codex" ] && detected+=("codex") ;;
        esac
    done
    printf '%s\n' "${detected[@]}"
}

get_agent_dir() {
    local agent="$1"
    for entry in "${AGENT_SKILLS_DIRS[@]}"; do
        [[ "${entry%%:*}" == "$agent" ]] && echo "${entry#*:}" && return 0
    done
    echo ""
    return 1
}

# ─── Modo interactivo ────────────────────────────────────────────────────────

interactive_menu() {
    local detected
    mapfile -t detected < <(detect_agents)

    echo
    echo "${BOLD}${BLUE}╔══════════════════════════════════════════════╗${RESET}"
    echo "${BOLD}${BLUE}║      Academic Research Suite Installer       ║${RESET}"
    echo "${BOLD}${BLUE}║     pi · Claude Code · Codex compatible      ║${RESET}"
    echo "${BOLD}${BLUE}╚══════════════════════════════════════════════╝${RESET}"
    echo
    echo "  Destino: ${CYAN}$DEST_DIR${RESET}"
    if [ ${#detected[@]} -gt 0 ]; then
        echo "  Agentes detectados: ${GREEN}${detected[*]}${RESET}"
    fi
    echo

    # Mostrar skills con números
    local skills=()
    while IFS= read -r s; do skills+=("$s"); done < <(get_available_skills)

    echo "  ${BOLD}Skills disponibles:${RESET}"
    echo
    for i in "${!skills[@]}"; do
        local num=$((i + 1))
        local status=""
        is_installed "${skills[$i]}" && status=" ${GREEN}[instalada]${RESET}" || status=" ${YELLOW}[no instalada]${RESET}"
        printf "  ${CYAN}%2d)${RESET} %-28s %s\n" "$num" "${skills[$i]}" "$status"
    done

    echo
    echo "  ${BOLD}Opciones:${RESET}"
    echo "  ${CYAN} a${RESET}) Instalar ${BOLD}todo${RESET}"
    echo "  ${CYAN} 1-$(echo "${#skills[@]}")${RESET}) Instalar skill individual"
    echo "  ${CYAN} s${RESET}) Ver estado"
    echo "  ${CYAN} q${RESET}) Salir"
    echo

    read -r -p "  ${BOLD}Elige una opción:${RESET} " choice
    echo

    case "$choice" in
        [aA])
            cmd_install_all
            ;;
        [sS])
            cmd_status
            interactive_menu
            ;;
        [qQ])
            echo "  ¡Hasta luego!"
            echo
            exit 0
            ;;
        *)
            if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] 2>/dev/null \
                && [ "$choice" -le "${#skills[@]}" ]; then
                local skill="${skills[$((choice - 1))]}"
                if is_installed "$skill"; then
                    echo "  ${YELLOW}$skill${RESET} ya está instalada."
                    read -r -p "  ${BOLD}¿Reinstalar? (s/N):${RESET} " reinstall
                    if [[ "$reinstall" =~ ^[sSyY] ]]; then
                        rm -rf "$DEST_DIR/$skill"
                        install_skill "$skill"
                    fi
                else
                    install_skill "$skill"
                fi
                echo
                read -r -p "  ${BOLD}Presiona Enter para continuar...${RESET}"
                interactive_menu
            else
                echo "  ${RED}Opción no válida.${RESET}"
                echo
                interactive_menu
            fi
            ;;
    esac
}

# ─── Help ─────────────────────────────────────────────────────────────────────

cmd_help() {
    echo
    echo "${BOLD}Academic Research Suite — Installer (multi-agente)${RESET}"
    echo
    echo "  ${BOLD}USO:${RESET}"
    echo "    ./install.sh                          Modo interactivo (menú)"
    echo "    ./install.sh --all                    Instalar todas las skills (pi)"
    echo "    ./install.sh --all --agent claude     Instalar todas para Claude Code"
    echo "    ./install.sh --all --agent codex      Instalar todas para Codex CLI"
    echo "    ./install.sh --all --agent all        Instalar en todos los agentes"
    echo "    ./install.sh <skill-name>             Instalar una skill"
    echo "    ./install.sh --uninstall <name>       Desinstalar una skill"
    echo "    ./install.sh --uninstall --all        Desinstalar todas"
    echo "    ./install.sh --list                   Listar skills disponibles"
    echo "    ./install.sh --status                 Ver estado de instalación"
    echo "    ./install.sh --help                   Esta ayuda"
    echo
    echo "  ${BOLD}AGENTES SOPORTADOS:${RESET}"
    echo "    pi       → ~/.pi/agent/skills/       (pi-coding-agent)"
    echo "    claude   → ~/.claude/skills/         (Claude Code / Anthropic)"
    echo "    codex    → ~/.codex/skills/          (OpenAI Codex CLI)"
    echo "    all      → Instala en todos los agentes detectados"
    echo
    echo "  ${BOLD}VARIABLES DE ENTORNO:${RESET}"
    echo "    PI_SKILLS_DIR      Directorio destino (default: ~/.pi/agent/skills/)"
    echo
    echo "  ${BOLD}EJEMPLOS:${RESET}"
    echo "    ./install.sh --all"
    echo "    ./install.sh --all --agent claude"
    echo "    ./install.sh --all --agent all"
    echo "    ./install.sh literature-discovery"
    echo "    ./install.sh --uninstall reviewer"
    echo "    PI_SKILLS_DIR=.pi/skills ./install.sh --all"
    echo
}

# ─── Entrypoint ───────────────────────────────────────────────────────────────

main() {
    # Parse --agent flag before other args
    local agent=""
    local args=()
    while [ $# -gt 0 ]; do
        case "$1" in
            --agent)
                agent="$2"
                shift 2
                ;;
            --agent=*)
                agent="${1#*=}"
                shift
                ;;
            *)
                args+=("$1")
                shift
                ;;
        esac
    done
    set -- "${args[@]}"

    if [ $# -eq 0 ]; then
        interactive_menu
        exit 0
    fi

    case "${1:-}" in
        --help|-h|help)
            cmd_help
            ;;
        --list|-l|list)
            cmd_list
            ;;
        --status|-s|status)
            cmd_status
            ;;
        --all|-a)
            cmd_install_all "$agent"
            ;;
        --uninstall|-u)
            shift
            if [ $# -eq 0 ]; then
                echo "${RED}Error:${RESET} Especifica una skill o --all para desinstalar."
                echo "  ./install.sh --uninstall <skill-name>"
                echo "  ./install.sh --uninstall --all"
                exit 1
            fi
            if [ "${1:-}" = "--all" ] || [ "${1:-}" = "-a" ]; then
                cmd_uninstall_all
            else
                cmd_uninstall_one "$1"
            fi
            ;;
        *)
            cmd_install_one "$1"
            ;;
    esac
}

main "$@"
