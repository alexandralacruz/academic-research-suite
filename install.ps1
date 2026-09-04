# =============================================================================
# Academic Research Suite — PowerShell Installer para Windows
# =============================================================================
#
# Compatible con: pi-coding-agent · Claude Code · OpenAI Codex CLI
#
# Uso desde PowerShell:
#   .\install.ps1                          # Menú interactivo
#   .\install.ps1 -All                     # Instalar todas las skills (pi)
#   .\install.ps1 -All -Agent codex        # Instalar todas para Codex
#   .\install.ps1 -All -Agent claude       # Instalar todas para Claude
#   .\install.ps1 -All -Agent all          # Instalar en todos los agentes
#   .\install.ps1 -Skill literature-discovery  # Instalar una skill
#   .\install.ps1 -List                    # Listar skills
#   .\install.ps1 -Status                  # Ver estado
#   .\install.ps1 -Uninstall reviewer      # Desinstalar una skill
#   .\install.ps1 -UninstallAll            # Desinstalar todas
#
# One-liner desde PowerShell (descargar y ejecutar).
# NOTA: NO requiere git — si no está instalado, descarga el repo como ZIP automáticamente:
#   iwr https://raw.githubusercontent.com/alexandralacruz/academic-research-suite/main/install.ps1 -OutFile "$env:TEMP\install.ps1"
#   powershell -NoProfile -ExecutionPolicy Bypass -File "$env:TEMP\install.ps1" -All -Agent codex
# =============================================================================

param(
    [switch]$All,
    [string]$Agent = "pi",
    [string]$Skill,
    [switch]$List,
    [switch]$Status,
    [string]$Uninstall,
    [switch]$UninstallAll,
    [switch]$Help
)

$ErrorActionPreference = "Stop"

# ─── Asegurar ExecutionPolicy (RemoteSigned) para el usuario actual ─────────
# Si la política bloquea scripts (Restricted/Undefined), la ajusta automáticamente
# para que el usuario no tenga que ejecutar Set-ExecutionPolicy manualmente.
# (Aplica solo al usuario actual; no requiere permisos de administrador.)

try {
    $policy = Get-ExecutionPolicy -ErrorAction SilentlyContinue
    if (-not $policy -or $policy -eq "Restricted" -or $policy -eq "Undefined") {
        Write-Host "→ La ExecutionPolicy ($policy) bloquea scripts. Ajustando a RemoteSigned (CurrentUser)..." -ForegroundColor Yellow
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force -ErrorAction Stop
        Write-Host "  ✔ ExecutionPolicy: RemoteSigned (CurrentUser)" -ForegroundColor Green
    }
} catch {
    Write-Host "⚠ No se pudo ajustar la ExecutionPolicy automáticamente. Ejecuta manualmente:" -ForegroundColor Yellow
    Write-Host "  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Yellow
}

# ─── Configuración ───────────────────────────────────────────────────────────

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillsDir = if ($env:PI_SKILLS_DIR) { $env:PI_SKILLS_DIR } else { "$env:USERPROFILE\.pi\agent\skills" }

# Rutas por agente
$AgentDirs = @{
    pi     = "$env:USERPROFILE\.pi\agent\skills"
    claude = "$env:USERPROFILE\.claude\skills"
    codex  = "$env:USERPROFILE\.codex\skills"
}

$RepoUrl = "https://github.com/alexandralacruz/academic-research-suite.git"
$ZipUrl  = "https://codeload.github.com/alexandralacruz/academic-research-suite/zip/refs/heads/main"

# ─── Bootstrap remoto: clonar el repo si no hay skills locales ──────────────

function Test-LocalRepo {
    param([string]$Dir)
    if ([string]::IsNullOrEmpty($Dir) -or -not (Test-Path $Dir)) { return $false }
    $found = @(Get-ChildItem -Path $Dir -Directory -ErrorAction SilentlyContinue | Where-Object {
        Test-Path (Join-Path $_.FullName "SKILL.md")
    })
    return ($found.Count -gt 0)
}

function Get-SuiteSource {
    $cloneDir = Join-Path $env:TEMP ("academic-research-suite-" + [guid]::NewGuid().ToString("N").Substring(0, 8))

    # ── Opción 1: git clone (si git está disponible) ────────────────────────
    if (Get-Command git -ErrorAction SilentlyContinue) {
        Write-Host "→ Descargando Academic Research Suite (git)..." -ForegroundColor Cyan
        git clone --depth 1 $RepoUrl $cloneDir | Out-Host
        if ($LASTEXITCODE -eq 0 -and (Test-Path (Join-Path $cloneDir "install.ps1"))) {
            return [PSCustomObject]@{ Path = $cloneDir; CleanupDir = $cloneDir }
        }
        Write-Host "⚠ git clone falló. Intentando descarga directa (ZIP)..." -ForegroundColor Yellow
        Remove-Item -Recurse -Force $cloneDir -ErrorAction SilentlyContinue
    } else {
        Write-Host "→ git no detectado. Usando descarga directa (ZIP, sin git)..." -ForegroundColor Cyan
    }

    # ── Opción 2: descarga del ZIP desde GitHub (NO requiere git) ────────────
    try {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    } catch { }

    $zipPath = Join-Path $env:TEMP ("academic-research-suite-" + [guid]::NewGuid().ToString("N") + ".zip")
    $extractRoot = Join-Path $env:TEMP ("academic-research-suite-x-" + [guid]::NewGuid().ToString("N"))
    Write-Host "→ Descargando Academic Research Suite (ZIP)..." -ForegroundColor Cyan

    try {
        Invoke-WebRequest -Uri $ZipUrl -OutFile $zipPath -UseBasicParsing
    } catch {
        Write-Host "Error: no se pudo descargar el repositorio (ZIP)." -ForegroundColor Red
        Write-Host "  Descarga manual: https://github.com/alexandralacruz/academic-research-suite/archive/refs/heads/main.zip" -ForegroundColor Yellow
        if (Test-Path $zipPath) { Remove-Item -Force $zipPath -ErrorAction SilentlyContinue }
        return $null
    }

    New-Item -ItemType Directory -Path $extractRoot -Force | Out-Null
    try {
        Expand-Archive -Path $zipPath -DestinationPath $extractRoot -Force
    } catch {
        Write-Host "Error: no se pudo descomprimir el ZIP." -ForegroundColor Red
        Write-Host "  Extrae el ZIP manualmente y ejecuta install.ps1 desde la carpeta." -ForegroundColor Red
        return $null
    }
    Remove-Item -Force $zipPath -ErrorAction SilentlyContinue

    # El ZIP se extrae en una carpeta "academic-research-suite-main"
    $suiteDir = Join-Path $extractRoot "academic-research-suite-main"
    if (-not (Test-Path (Join-Path $suiteDir "install.ps1"))) {
        $found = Get-ChildItem -Path $extractRoot -Recurse -Filter "install.ps1" -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($found) { $suiteDir = $found.DirectoryName }
    }
    if (-not $suiteDir -or -not (Test-Path (Join-Path $suiteDir "install.ps1"))) {
        Write-Host "Error: no se encontró install.ps1 en el ZIP descargado." -ForegroundColor Red
        return $null
    }
    return [PSCustomObject]@{ Path = $suiteDir; CleanupDir = $extractRoot }
}

# Si el script se ejecutó "suelto" (descargado sin las carpetas de skills),
# clonar el repo y re-ejecutar la copia clonada.
if (-not (Test-LocalRepo $ScriptDir)) {
    $suite = Get-SuiteSource
    if (-not $suite) { exit 1 }
    & (Join-Path $suite.Path "install.ps1") @PSBoundParameters
    $exitCode = $LASTEXITCODE
    Remove-Item -Recurse -Force $suite.CleanupDir -ErrorAction SilentlyContinue
    exit $exitCode
}

# ─── Funciones ───────────────────────────────────────────────────────────────

function Get-AgentDir($agentName) {
    if ($AgentDirs.ContainsKey($agentName)) {
        return $AgentDirs[$agentName]
    }
    Write-Host "Error: Agente '$agentName' no reconocido. Usa: pi, claude, codex, all" -ForegroundColor Red
    exit 1
}

function Get-AvailableSkills {
    Get-ChildItem -Path $ScriptDir -Directory | Where-Object {
        Test-Path (Join-Path $_.FullName "SKILL.md")
    } | ForEach-Object { $_.Name } | Sort-Object
}

function Get-SkillDescription($skillName) {
    $skillFile = Join-Path (Join-Path $ScriptDir $skillName) "SKILL.md"
    if (Test-Path $skillFile) {
        $content = Get-Content $skillFile -Raw
        if ($content -match "description:\s*(.+?)(\r?\n|$)") {
            return $Matches[1].Substring(0, [Math]::Min(120, $Matches[1].Length))
        }
    }
    return "(sin descripción)"
}

function Install-Skill($skillName, $destDir) {
    $src = Join-Path $ScriptDir $skillName
    $dst = Join-Path $destDir $skillName

    if (-not (Test-Path (Join-Path $src "SKILL.md"))) {
        Write-Host "  ✖ $skillName — no es una skill válida" -ForegroundColor Red
        return $false
    }

    if (Test-Path $dst) {
        Write-Host "  ⚠ $skillName ya está instalada" -ForegroundColor Yellow
        return $true
    }

    New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    Copy-Item -Recurse $src $dst
    Write-Host "  ✔ $skillName → $dst" -ForegroundColor Green
    return $true
}

function Uninstall-Skill($skillName, $destDir) {
    $dst = Join-Path $destDir $skillName
    if (-not (Test-Path $dst)) {
        Write-Host "  ○ $skillName — no está instalada" -ForegroundColor Yellow
        return $false
    }
    Remove-Item -Recurse -Force $dst
    Write-Host "  ✔ $skillName desinstalada" -ForegroundColor Green
    return $true
}

function Test-IsInstalled($skillName, $destDir) {
    return (Test-Path (Join-Path (Join-Path $destDir $skillName) "SKILL.md"))
}

# ─── Comandos ────────────────────────────────────────────────────────────────

function Show-List {
    Write-Host ""
    Write-Host "Academic Research Suite — Skills disponibles" -ForegroundColor Blue
    Write-Host "────────────────────────────────────────────" -ForegroundColor Blue
    Write-Host ""
    Write-Host ("  {0,-28} {1}" -f "SKILL", "DESCRIPCIÓN")
    Write-Host ("  {0,-28} {1}" -f "─────", "──────────")

    $skills = Get-AvailableSkills
    foreach ($s in $skills) {
        $desc = Get-SkillDescription $s
        Write-Host ("  {0,-28} {1}" -f $s, $desc.Substring(0, [Math]::Min(85, $desc.Length)))
    }
    Write-Host ""
    Write-Host "  Total: $($skills.Count) skills"
    Write-Host ""
}

function Show-Status {
    $destDir = Get-AgentDir $Agent
    Write-Host ""
    Write-Host "Estado de instalación ($Agent)" -ForegroundColor Blue
    Write-Host "───────────────────────" -ForegroundColor Blue
    Write-Host ""
    Write-Host "  Destino: $destDir" -ForegroundColor Cyan
    Write-Host ""

    $installed = 0
    $total = 0
    foreach ($s in Get-AvailableSkills) {
        $total++
        if (Test-IsInstalled $s $destDir) {
            $installed++
            Write-Host "  ✔ $s" -ForegroundColor Green
        } else {
            Write-Host "  ✖ $s" -ForegroundColor Red
        }
    }
    Write-Host ""
    Write-Host "  $installed / $total skills instaladas"
    Write-Host ""
}

function Install-All {
    $destDir = Get-AgentDir $Agent
    Write-Host ""
    Write-Host "Instalando Academic Research Suite (todas las skills)" -ForegroundColor Blue
    Write-Host "──────────────────────────────────────────────────────" -ForegroundColor Blue
    Write-Host ""
    Write-Host "  Destino: $destDir" -ForegroundColor Cyan
    Write-Host "  Agente:  $Agent" -ForegroundColor Cyan
    Write-Host ""

    $count = 0
    $errors = 0
    foreach ($s in Get-AvailableSkills) {
        if (Install-Skill $s $destDir) { $count++ } else { $errors++ }
    }

    Write-Host ""
    Write-Host "  Resultado: $count instaladas" -ForegroundColor Green
    if ($errors -gt 0) { Write-Host "  Errores: $errors" -ForegroundColor Red }
    Write-Host ""
}

function Install-AllAgents {
    Write-Host ""
    Write-Host "Instalando en todos los agentes" -ForegroundColor Blue
    Write-Host "────────────────────────────────" -ForegroundColor Blue
    Write-Host ""

    foreach ($agentName in $AgentDirs.Keys) {
        Write-Host "  → $agentName → $($AgentDirs[$agentName])" -ForegroundColor Cyan
        $destDir = $AgentDirs[$agentName]
        foreach ($s in Get-AvailableSkills) {
            Install-Skill $s $destDir | Out-Null
        }
        Write-Host ""
    }
    Write-Host "  ✔ Instalación multi-agente completada." -ForegroundColor Green
    Write-Host ""
}

function Install-One($skillName) {
    $matches = @(Get-AvailableSkills | Where-Object { $_ -like "*$skillName*" })
    if ($matches.Count -eq 0) {
        Write-Host "Error: Skill '$skillName' no encontrada." -ForegroundColor Red
        exit 1
    }
    if ($matches.Count -gt 1) {
        Write-Host "Múltiples skills coinciden con '$skillName':" -ForegroundColor Yellow
        $matches | ForEach-Object { Write-Host "  - $_" }
        exit 1
    }

    $skill = $matches[0]
    $destDir = Get-AgentDir $Agent
    Write-Host ""
    Write-Host "Instalando: $skill" -ForegroundColor Blue
    Write-Host ""
    Install-Skill $skill $destDir
    Write-Host ""
    Write-Host "  ✔ Listo. Usa /skill:$skill en tu agente." -ForegroundColor Green
    Write-Host ""
}

function Uninstall-One($skillName) {
    $matches = @(Get-AvailableSkills | Where-Object { $_ -like "*$skillName*" })
    if ($matches.Count -eq 0) {
        Write-Host "Error: Skill '$skillName' no encontrada." -ForegroundColor Red
        exit 1
    }
    $skill = $matches[0]
    $destDir = Get-AgentDir $Agent
    Write-Host ""
    Uninstall-Skill $skill $destDir
    Write-Host ""
}

function Uninstall-AllSkills {
    $destDir = Get-AgentDir $Agent
    Write-Host ""
    Write-Host "Desinstalando todas las skills de $Agent" -ForegroundColor Red
    Write-Host "────────────────────────────────────────" -ForegroundColor Red
    Write-Host ""
    foreach ($s in Get-AvailableSkills) {
        Uninstall-Skill $s $destDir
    }
    Write-Host ""
}

function Show-HelpText {
    Write-Host ""
    Write-Host "Academic Research Suite — PowerShell Installer" -ForegroundColor Blue
    Write-Host ""
    Write-Host "  USO:"
    Write-Host "    .\install.ps1                          Menú interactivo"
    Write-Host "    .\install.ps1 -All                     Instalar todas (pi)"
    Write-Host "    .\install.ps1 -All -Agent codex        Instalar todas para Codex"
    Write-Host "    .\install.ps1 -All -Agent claude       Instalar todas para Claude"
    Write-Host "    .\install.ps1 -All -Agent all          Todos los agentes"
    Write-Host "    .\install.ps1 -Skill literature-discovery  Instalar una"
    Write-Host "    .\install.ps1 -List                    Listar skills"
    Write-Host "    .\install.ps1 -Status                  Ver estado"
    Write-Host "    .\install.ps1 -Uninstall reviewer      Desinstalar una"
    Write-Host "    .\install.ps1 -UninstallAll            Desinstalar todas"
    Write-Host ""
    Write-Host "  ONE-LINER (PowerShell):"
    Write-Host '    iwr https://raw.../install.ps1 -OutFile "$env:TEMP\install.ps1"'
    Write-Host '    powershell -NoProfile -ExecutionPolicy Bypass -File "$env:TEMP\install.ps1" -All -Agent codex'
    Write-Host ""
}

# ─── Entrypoint ───────────────────────────────────────────────────────────────

if ($Help) { Show-HelpText; exit 0 }
if ($List) { Show-List; exit 0 }
if ($Status) { Show-Status; exit 0 }

if ($All) {
    if ($Agent -eq "all") {
        Install-AllAgents
    } else {
        Install-All
    }
    exit 0
}

if ($UninstallAll) {
    Uninstall-AllSkills
    exit 0
}

if ($Uninstall) {
    Uninstall-One $Uninstall
    exit 0
}

if ($Skill) {
    Install-One $Skill
    exit 0
}

# Menú interactivo
Show-List
$choice = Read-Host "  Ingresa nombre de skill (o 'all'/'q')"
if ($choice -eq "q") { exit 0 }
if ($choice -eq "all") { Install-All; exit 0 }
if ($choice) { Install-One $choice }
