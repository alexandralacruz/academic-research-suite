# Academic Research Suite

> A collection of 16 specialized skills covering the entire scientific research cycle: from literature discovery to pre-submission review.

**16 skills · 5 phases · 1 orchestrator · multi-agent**

Compatible with any AI coding agent that follows the [Agent Skills](https://agentskills.io/specification) standard:

| Agent | Install command | Skills are installed to |
|-------|----------------|------------------------|
| [**pi**](https://github.com/badlogic/pi-coding-agent) | `./install.sh --all` | `~/.pi/agent/skills/` |
| [**Claude Code**](https://docs.anthropic.com/en/docs/claude-code) | `./install.sh --all --agent claude` | `~/.claude/skills/` |
| [**Codex CLI**](https://github.com/openai/codex) | `./install.sh --all --agent codex` | `~/.codex/skills/` |
| **Any harness** | `PI_SKILLS_DIR=<path> ./install.sh --all` | The path you specify |

---

## 🚀 Quick install

### Mac / Linux (terminal)

```bash
# One-liner — does NOT require git (if missing, it downloads the repo as a ZIP):
curl -sSL https://raw.githubusercontent.com/alexandralacruz/academic-research-suite/main/install.sh | bash -s -- --all --agent codex

# Or clone and install manually:
git clone https://github.com/alexandralacruz/academic-research-suite.git
cd academic-research-suite
./install.sh --all                    # pi (default)
./install.sh --all --agent claude     # Claude Code
./install.sh --all --agent codex      # Codex CLI
./install.sh --all --agent all        # All detected agents
```

### Mac / Linux without git (manual ZIP download)

```bash
# 1. Download and extract the ZIP:
curl -sSL -o /tmp/academic-research-suite.zip \
  https://github.com/alexandralacruz/academic-research-suite/archive/refs/heads/main.zip
unzip /tmp/academic-research-suite.zip -d /tmp/academic-research-suite

# 2. Enter the folder and run:
cd /tmp/academic-research-suite/academic-research-suite-main
./install.sh --all --agent codex
```

### Windows (PowerShell)

```powershell
# One-liner from PowerShell — does NOT require git (if missing, it downloads the repo as a ZIP):
iwr https://raw.githubusercontent.com/alexandralacruz/academic-research-suite/main/install.ps1 -OutFile "$env:TEMP\install.ps1"
powershell -NoProfile -ExecutionPolicy Bypass -File "$env:TEMP\install.ps1" -All -Agent codex

# Or clone and install manually:
git clone https://github.com/alexandralacruz/academic-research-suite.git
cd academic-research-suite
.\install.ps1 -All -Agent codex       # Codex CLI
.\install.ps1 -All -Agent claude      # Claude Code
.\install.ps1 -All                    # pi
.\install.ps1 -All -Agent all         # All agents
```

### Windows without git (manual ZIP download)

If you don't have git or don't want to use the one-liner, download the ZIP and extract it:

```powershell
# 1. Download the ZIP in your browser (or with this command):
#    https://github.com/alexandralacruz/academic-research-suite/archive/refs/heads/main.zip

# 2. Extract it, enter the folder, then run:
Expand-Archive -Path "$env:USERPROFILE\Downloads\academic-research-suite-main.zip" -DestinationPath "$env:USERPROFILE\Downloads\"
cd "$env:USERPROFILE\Downloads\academic-research-suite-main"
.\install.ps1 -All -Agent codex
```

### Windows (Git Bash / WSL)

```bash
# Use the same one-liner as Mac/Linux (no git required):
curl -sSL https://raw.githubusercontent.com/alexandralacruz/academic-research-suite/main/install.sh | bash -s -- --all --agent codex
```

### Installation options

| Command | Description |
|---------|-------------|
| `./install.sh` | Interactive menu (pick skills one by one) |
| `./install.sh --all` | Install all 16 skills into pi |
| `./install.sh --all --agent <agent>` | Install into claude, codex, or all |
| `./install.sh <name>` | Install a specific skill |
| `./install.sh --list` | List all available skills |
| `./install.sh --status` | Show installation status |
| `./install.sh --uninstall <name>` | Uninstall a skill |
| `./install.sh --uninstall --all` | Uninstall everything |
| `./install.sh --help` | Show all agents and options |

> **💡 Windows (PowerShell):** same options with `.\install.ps1`, using a single dash in the parameters: `-All`, `-Agent <agent>`, `-Skill <name>`, `-List`, `-Status`, `-Uninstall <name>`, `-UninstallAll`, `-Help`.

### Custom destination (any harness)

```bash
# Install into a local project (pi)
PI_SKILLS_DIR=.pi/skills ./install.sh --all

# Install into a specific harness with a custom path
PI_SKILLS_DIR=~/.my-agent/skills ./install.sh --all

# Share skills between agents with symlinks
ln -s ~/.pi/agent/skills ~/.claude/skills
```

---

## 🧭 Architecture

```
Academic Research Suite
        │
        ├── Phase 1: EXPLORE ──────────────────────
        │   ├── literature-discovery      ← Searches and maps literature
        │   ├── state-of-the-art          ← Synthesizes papers into a narrative
        │   └── research-gap              ← Identifies research gaps
        │
        ├── Phase 2: VALIDATE ─────────────────────
        │   └── novelty-analysis          ← Evaluates the real novelty of an idea
        │
        ├── Phase 3: DESIGN ───────────────────────
        │   ├── methodology-designer      ← Designs experiments and methods
        │   ├── paper-outline             ← Generates the paper outline
        │   └── title-generator           ← Proposes and evaluates titles
        │
        ├── Phase 4: WRITE ────────────────────────
        │   ├── related-work              ← Writes the related work section
        │   ├── discussion-writer         ← Interpretive discussion of results
        │   ├── conclusion-writer         ← Conclusion with actionable future work
        │   ├── abstract-writer           ← Multi-style abstract (IEEE, ACM, Nature...)
        │   └── keywords-generator        ← Keywords optimized for discoverability
        │
        └── Phase 5: POLISH ───────────────────────
            ├── reference-checker         ← Validates references (orphans, format, DOI)
            ├── journal-selector          ← Recommends journals (quartile, IF, scope fit)
            └── reviewer                  ← Full pre-submission review

research-manager  ← Orchestrator that guides the full flow
```

---

## 🎯 Available skills

### 🔍 Exploration

| Skill | What it does | When to use it |
|-------|--------------|----------------|
| `literature-discovery` | Discovers literature, groups it by line of work, detects trends, identifies authors/datasets/tools | When starting a project |
| `state-of-the-art` | Synthesizes papers into a narrative: approaches, strengths, weaknesses, evolution | Writing the background section |
| `research-gap` | Identifies open problems, missing datasets, uncompared methods, unexplored domains | Defining a thesis/paper direction |

### ✅ Validation

| Skill | What it does | When to use it |
|-------|--------------|----------------|
| `novelty-analysis` | Evaluates real novelty, compares with prior work, positions the contribution | Before committing to a direction |

### 🏗️ Design

| Skill | What it does | When to use it |
|-------|--------------|----------------|
| `methodology-designer` | Designs experiments, formalizes the problem, selects baselines and metrics, plans ablations | Writing the method section |
| `paper-outline` | Generates an IMRaD outline with a page budget, planned figures, narrative flow | Planning the paper before writing |
| `title-generator` | Proposes titles in IEEE/ACM/Nature styles, evaluates novelty, impact, discoverability | Choosing the final title |

### ✍️ Writing

| Skill | What it does | When to use it |
|-------|--------------|----------------|
| `related-work` | Writes the related work section, grouping papers thematically and differentiating the contribution | Drafting the paper's related work |
| `discussion-writer` | Interprets results, explains findings, acknowledges limitations, extracts implications | Writing the discussion |
| `conclusion-writer` | Summarizes contributions, proposes actionable (not generic) future work, closes strongly | Finalizing the paper |
| `abstract-writer` | Generates IEEE, ACM, Nature, Springer, structured, graphical, and plain-language abstracts | Preparing the abstract for the venue |
| `keywords-generator` | Generates keywords optimized for indexing, reviewer matching, and discoverability | Completing the paper's metadata |

### 🔧 Polishing

| Skill | What it does | When to use it |
|-------|--------------|----------------|
| `reference-checker` | Validates citations: orphans, format, DOI, missing citations, self-citations, recency | Before submitting |
| `journal-selector` | Recommends journals by scope, quartile, IF, APC, review times, submission strategy | Choosing where to publish |
| `reviewer` | Full pre-submission review: novelty, clarity, rigor, validity, reproducibility, figures, references | Last step before submitting |

### 🎛️ Orchestrator

| Skill | What it does | When to use it |
|-------|--------------|----------------|
| `research-manager` | Orchestrates skills into workflows, tracks progress, recommends next steps | Managing a complete project |

---

## 📖 Usage

Skills are invoked the same way in all agents using the `/skill:` prefix followed by the name:

```bash
# 1. Load the orchestrator to start a guided project
/skill:research-manager

# 2. Or invoke skills directly by phase
/skill:literature-discovery
/skill:research-gap
/skill:title-generator
/skill:reviewer

# 3. The manager will tell you which skill to run next
```

> **💡 Tip:** On some agents the exact command may vary slightly (e.g. `@skill:` or a mention). Check your harness documentation. The `SKILL.md` content is the same — the agent reads it as system instructions.

### Full workflow example

```bash
# Phase 1: Explore
/skill:literature-discovery     # → Research landscape with open problems
/skill:research-gap             # → Gaps prioritized by impact/feasibility

# Phase 2: Validate
/skill:novelty-analysis         # → Is my idea actually novel?

# Phase 3: Design
/skill:methodology-designer     # → Experimental protocol, baselines, metrics
/skill:paper-outline            # → Paper outline with a page budget
/skill:title-generator          # → Ranked candidate titles

# Phase 4: Write
/skill:related-work             # → Related work section
/skill:discussion-writer        # → Interpretive discussion
/skill:conclusion-writer        # → Conclusion with concrete future work
/skill:abstract-writer          # → Multi-style abstract
/skill:keywords-generator       # → Optimized keywords

# Phase 5: Polish
/skill:reference-checker        # → Reference validation
/skill:journal-selector         # → Where to submit (quartile, IF, times, APC)
/skill:reviewer                 # → Full pre-submission review
```

---

## 🔗 Requirements and compatibility

- Bash (Linux/macOS/WSL) or PowerShell (Windows)
- **`git` is NOT required**: the one-liner uses it if available, and otherwise downloads the repo as a ZIP automatically — **npm is not needed**
- Each skill is just markdown — **no external dependencies**
- Compatible with any AI coding agent that loads skills from a directory:

| Agent | Skills dir | Tested? |
|-------|-----------|---------|
| [pi](https://github.com/badlogic/pi-coding-agent) | `~/.pi/agent/skills/` | ✅ |
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | `~/.claude/skills/` | ✅ |
| [Codex CLI](https://github.com/openai/codex) | `~/.codex/skills/` | ✅ |
| [Aider](https://aider.chat/) | `~/.aider/skills/` | ⚡ |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | `~/.gemini/skills/` | ⚡ |
| Any Agent Skills harness | Configurable via `PI_SKILLS_DIR` | ⚡ |

> ✅ Tested · ⚡ Compatible with the [Agent Skills spec](https://agentskills.io/specification)

---

## 📁 Repository structure

```
academic-research-suite/
├── README.md
├── LICENSE
├── install.sh                      ← Multi-agent installer
├── install.ps1                     ← Windows (PowerShell) installer
├── .claude-plugin/
│   ├── plugin.json                 ← Claude Code marketplace
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

Each `SKILL.md` follows the [Agent Skills standard](https://agentskills.io/specification) with YAML frontmatter (`name`, `description`) and markdown content with detailed instructions, output formats, quality criteria, and integration with other skills.

> **💡 The magic:** You only need the skill folder and its `SKILL.md`. No dependencies, no scripts, no extra configuration. Copy it to any agent's `skills/` folder and it works.

---

## 🤝 Contributing

1. Fork the repository
2. Create a new skill: `mkdir my-skill && vim my-skill/SKILL.md`
3. Follow the frontmatter format from the [Agent Skills spec](https://agentskills.io/specification)
4. Document inputs, outputs, and integrations with other skills
5. PR

---

## 📄 License

MIT
