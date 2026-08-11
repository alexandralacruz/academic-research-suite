# Academic Research Suite

> Colección de 16 Skills especializadas que cubren todo el ciclo de investigación científica: desde el descubrimiento de literatura hasta la revisión pre-submission.

**16 skills · 5 fases · 1 orquestador · multi-agente**

Compatible con cualquier AI coding agent que siga el estándar [Agent Skills](https://agentskills.io/specification):

| Agente | Comando de instalación | Skills se instalan en |
|--------|----------------------|----------------------|
| [**pi**](https://github.com/badlogic/pi-coding-agent) | `./install.sh --all` | `~/.pi/agent/skills/` |
| [**Claude Code**](https://docs.anthropic.com/en/docs/claude-code) | `./install.sh --all --agent claude` | `~/.claude/skills/` |
| [**Codex CLI**](https://github.com/openai/codex) | `./install.sh --all --agent codex` | `~/.codex/skills/` |
| **Cualquier harness** | `PI_SKILLS_DIR=<ruta> ./install.sh --all` | La ruta que especifiques |

---

## 🚀 Instalación rápida

```bash
# 1. Clonar el repositorio
git clone https://github.com/alexandralacruz/academic-research-suite.git
cd academic-research-suite

# 2. Instalar en tu agente
./install.sh --all                    # pi (por defecto)
./install.sh --all --agent claude     # Claude Code
./install.sh --all --agent codex      # Codex CLI
./install.sh --all --agent all        # Todos los agentes detectados

# 3. O instalar solo las skills que necesites
./install.sh literature-discovery
./install.sh reviewer
```

### Opciones de instalación

| Comando | Descripción |
|---------|-------------|
| `./install.sh` | Menú interactivo (elegir skills una a una) |
| `./install.sh --all` | Instalar las 16 skills en pi |
| `./install.sh --all --agent <agente>` | Instalar en claude, codex, o all |
| `./install.sh <nombre>` | Instalar una skill específica |
| `./install.sh --list` | Ver todas las skills disponibles |
| `./install.sh --status` | Ver estado de instalación |
| `./install.sh --uninstall <nombre>` | Desinstalar una skill |
| `./install.sh --uninstall --all` | Desinstalar todo |
| `./install.sh --help` | Ver todos los agentes y opciones |

### Destino personalizado (cualquier harness)

```bash
# Instalar en un proyecto local (pi)
PI_SKILLS_DIR=.pi/skills ./install.sh --all

# Instalar en un harness específico con ruta custom
PI_SKILLS_DIR=~/.mi-agente/skills ./install.sh --all

# Compartir skills entre agentes con symlinks
ln -s ~/.pi/agent/skills ~/.claude/skills
```

---

## 🧭 Arquitectura

```
Academic Research Suite
        │
        ├── Phase 1: EXPLORE ──────────────────────
        │   ├── literature-discovery      ← Busca y mapea literatura
        │   ├── state-of-the-art          ← Sintetiza papers en narrativa
        │   └── research-gap              ← Identifica huecos de investigación
        │
        ├── Phase 2: VALIDATE ─────────────────────
        │   └── novelty-analysis          ← Evalúa la novedad real de una idea
        │
        ├── Phase 3: DESIGN ───────────────────────
        │   ├── methodology-designer      ← Diseña experimentos y métodos
        │   ├── paper-outline             ← Genera el esquema del paper
        │   └── title-generator           ← Propone y evalúa títulos
        │
        ├── Phase 4: WRITE ────────────────────────
        │   ├── related-work              ← Escribe la sección de trabajos relacionados
        │   ├── discussion-writer         ← Discusión interpretativa de resultados
        │   ├── conclusion-writer         ← Conclusión con futuros trabajos accionables
        │   ├── abstract-writer           ← Abstract multi-estilo (IEEE, ACM, Nature...)
        │   └── keywords-generator        ← Keywords optimizadas para discoverability
        │
        └── Phase 5: POLISH ───────────────────────
            ├── reference-checker         ← Valida referencias (huérfanas, formato, DOI)
            ├── journal-selector          ← Recomienda journals (Q, IF, scope fit)
            └── reviewer                  ← Revisión pre-submission completa

research-manager  ← Orquestador que guía el flujo completo
```

---

## 🎯 Skills disponibles

### 🔍 Exploración

| Skill | Qué hace | Cuándo usarla |
|-------|----------|---------------|
| `literature-discovery` | Descubre literatura, agrupa por líneas, detecta tendencias, identifica autores/datasets/herramientas | Al iniciar un proyecto |
| `state-of-the-art` | Sintetiza papers en una narrativa: enfoques, fortalezas, debilidades, evolución | Escribir sección de background |
| `research-gap` | Identifica problemas abiertos, datasets faltantes, métodos no comparados, dominios no explorados | Definir dirección de tesis/paper |

### ✅ Validación

| Skill | Qué hace | Cuándo usarla |
|-------|----------|---------------|
| `novelty-analysis` | Evalúa novedad real, compara con trabajos previos, posiciona la contribución | Antes de comprometerte con una dirección |

### 🏗️ Diseño

| Skill | Qué hace | Cuándo usarla |
|-------|----------|---------------|
| `methodology-designer` | Diseña experimentos, formaliza problema, selecciona baselines y métricas, planifica ablaciones | Escribir la sección de método |
| `paper-outline` | Genera esquema IMRaD con presupuesto de páginas, figuras planeadas, flujo narrativo | Planificar el paper antes de escribir |
| `title-generator` | Propone títulos en estilos IEEE/ACM/Nature, evalúa novedad, impacto, discoverability | Elegir el título final |

### ✍️ Escritura

| Skill | Qué hace | Cuándo usarla |
|-------|----------|---------------|
| `related-work` | Escribe sección de trabajos relacionados, agrupando papers temáticamente, diferenciando la contribución | Redactar related work del paper |
| `discussion-writer` | Interpreta resultados, explica hallazgos, reconoce limitaciones, extrae implicaciones | Escribir la discusión |
| `conclusion-writer` | Resume contribuciones, propone futuro trabajo accionable (no genérico), cierra con fuerza | Finalizar el paper |
| `abstract-writer` | Genera abstracts IEEE, ACM, Nature, Springer, estructurados, graphical abstract, plain-language | Preparar abstract para el venue |
| `keywords-generator` | Genera keywords optimizadas para indexing, reviewer matching y discoverability | Completar metadata del paper |

### 🔧 Pulido

| Skill | Qué hace | Cuándo usarla |
|-------|----------|---------------|
| `reference-checker` | Valida citas: huérfanas, formato, DOI, missing citations, autocitas, antigüedad | Antes de enviar |
| `journal-selector` | Recomienda journals por scope, cuartil, IF, APC, tiempos de revisión, estrategia de submission | Elegir dónde publicar |
| `reviewer` | Revisión completa pre-submission: novedad, claridad, rigor, validez, reproducibilidad, figuras, referencias | Último paso antes de enviar |

### 🎛️ Orquestador

| Skill | Qué hace | Cuándo usarla |
|-------|----------|---------------|
| `research-manager` | Orquesta las skills en flujos de trabajo, sigue el progreso, recomienda próximos pasos | Gestionar un proyecto completo |

---

## 📖 Uso

Las skills se invocan igual en todos los agentes mediante el prefijo `/skill:` seguido del nombre:

```bash
# 1. Cargar el orquestador para empezar un proyecto guiado
/skill:research-manager

# 2. O invocar skills directamente según la fase
/skill:literature-discovery
/skill:research-gap
/skill:title-generator
/skill:reviewer

# 3. El manager te dirá qué skill ejecutar a continuación
```

> **💡 Tip:** En algunos agentes el comando exacto puede variar ligeramente (ej. `@skill:` o mención). Consulta la documentación de tu harness. El contenido de `SKILL.md` es el mismo — lo lee el agente como instrucciones de sistema.

### Ejemplo de flujo completo

```bash
# Fase 1: Explorar
/skill:literature-discovery     # → Research landscape con open problems
/skill:research-gap             # → Gaps priorizados por impacto/feasibility

# Fase 2: Validar
/skill:novelty-analysis         # → ¿Mi idea es realmente novedosa?

# Fase 3: Diseñar
/skill:methodology-designer     # → Protocolo experimental, baselines, métricas
/skill:paper-outline            # → Esquema del paper con page budget
/skill:title-generator          # → Títulos candidatos rankeados

# Fase 4: Escribir
/skill:related-work             # → Sección de trabajos relacionados
/skill:discussion-writer        # → Discusión interpretativa
/skill:conclusion-writer        # → Conclusión con future work concreto
/skill:abstract-writer          # → Abstract multi-estilo
/skill:keywords-generator       # → Keywords optimizadas

# Fase 5: Pulir
/skill:reference-checker        # → Validación de referencias
/skill:journal-selector         # → Dónde enviar (Q, IF, tiempos, APC)
/skill:reviewer                 # → Revisión pre-submission completa
```

---

## 🔗 Requisitos y compatibilidad

- Bash (Linux/macOS/WSL)
- Cada skill es solo markdown — **sin dependencias externas**
- Compatible con cualquier AI coding agent que cargue skills desde un directorio:

| Agente | Skills dir | ¿Probado? |
|--------|-----------|-----------|
| [pi](https://github.com/badlogic/pi-coding-agent) | `~/.pi/agent/skills/` | ✅ |
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | `~/.claude/skills/` | ✅ |
| [Codex CLI](https://github.com/openai/codex) | `~/.codex/skills/` | ✅ |
| [Aider](https://aider.chat/) | `~/.aider/skills/` | ⚡ |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | `~/.gemini/skills/` | ⚡ |
| Cualquier harness Agent Skills | Configurable vía `PI_SKILLS_DIR` | ⚡ |

> ✅ Probado · ⚡ Compatible con el estándar [Agent Skills spec](https://agentskills.io/specification)

---

## 📁 Estructura del repositorio

```
academic-research-suite/
├── README.md
├── install.sh                      ← Instalador multi-agente
├── .claude-plugin/
│   ├── plugin.json                 ← Marketplace de Claude Code
│   └── marketplace.json
├── literature-discovery/
│   └── SKILL.md
├── state-of-the-art/
│   └── SKILL.md
├── research-gap/
│   └── SKILL.md
├── novelty-analysis/
│   └── SKILL.md
├── title-generator/
│   └── SKILL.md
├── abstract-writer/
│   └── SKILL.md
├── keywords-generator/
│   └── SKILL.md
├── paper-outline/
│   └── SKILL.md
├── methodology-designer/
│   └── SKILL.md
├── related-work/
│   └── SKILL.md
├── discussion-writer/
│   └── SKILL.md
├── conclusion-writer/
│   └── SKILL.md
├── journal-selector/
│   └── SKILL.md
├── reviewer/
│   └── SKILL.md
├── reference-checker/
│   └── SKILL.md
└── research-manager/
    └── SKILL.md
```

Cada `SKILL.md` sigue el [Agent Skills standard](https://agentskills.io/specification) con frontmatter YAML (`name`, `description`) y contenido en markdown con instrucciones detalladas, formatos de salida, criterios de calidad e integración con otras skills.

> **💡 La magia:** Solo necesitás la carpeta de la skill y su `SKILL.md`. No hay dependencias, no hay scripts, no hay configuraciones adicionales. Copiala a la carpeta `skills/` de cualquier agente y funciona.

---

## 🤝 Contribuir

1. Fork del repositorio
2. Crea una skill nueva: `mkdir mi-skill && vim mi-skill/SKILL.md`
3. Sigue el formato de frontmatter del [Agent Skills spec](https://agentskills.io/specification)
4. Documenta inputs, outputs e integraciones con otras skills
5. PR

---

## 📄 Licencia

MIT
