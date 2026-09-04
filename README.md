# Academic Research Suite

### AI-Agent Skills for Academic and Scientific Research

**Academic Research Suite (ARS)** is a collection of specialized AI-agent
skills designed to support the academic research lifecycle — from
literature discovery and research-gap identification to methodology design,
scientific writing, reference validation, journal selection, and
pre-submission review.

> **Created and maintained by Alexandra La Cruz**

---

## Overview

Academic Research Suite provides a structured, multi-stage workflow for
researchers, educators, students, and academic professionals working with
AI coding agents.

The suite currently includes **16 specialized skills**, organized into
**five research phases**, with a dedicated **research-manager** acting as
the central orchestrator.

```text
Academic Research Suite
│
├── Phase 1: EXPLORE
│   ├── literature-discovery
│   ├── state-of-the-art
│   └── research-gap
│
├── Phase 2: VALIDATE
│   └── novelty-analysis
│
├── Phase 3: DESIGN
│   ├── methodology-designer
│   ├── paper-outline
│   └── title-generator
│
├── Phase 4: WRITE
│   ├── related-work
│   ├── discussion-writer
│   ├── conclusion-writer
│   ├── abstract-writer
│   └── keywords-generator
│
└── Phase 5: POLISH
    ├── reference-checker
    ├── journal-selector
    └── reviewer

research-manager
└── Orchestrates the complete research workflow
```

---

# Research Workflow

ARS is designed to support a research process rather than isolated text
generation.

### 1. Explore

Discover and organize the scientific literature surrounding a research
problem.

**Skills:**

- `literature-discovery` — Searches and maps relevant literature.
- `state-of-the-art` — Synthesizes the current state of research.
- `research-gap` — Identifies potential research gaps.

### 2. Validate

Evaluate whether a proposed research idea provides meaningful novelty.

**Skill:**

- `novelty-analysis` — Evaluates the novelty and contribution of a research
  idea.

### 3. Design

Transform a research idea into a structured research and publication plan.

**Skills:**

- `methodology-designer` — Designs research methodologies and experiments.
- `paper-outline` — Structures academic manuscripts.
- `title-generator` — Generates and evaluates research titles.

### 4. Write

Support the construction of the main components of an academic paper.

**Skills:**

- `related-work` — Develops the related-work section.
- `discussion-writer` — Supports interpretation and discussion of results.
- `conclusion-writer` — Develops conclusions and future research directions.
- `abstract-writer` — Generates abstracts using different academic styles.
- `keywords-generator` — Generates keywords for academic discoverability.

### 5. Polish

Perform quality-control and pre-submission activities.

**Skills:**

- `reference-checker` — Checks references, citations, DOI information, and
  consistency.
- `journal-selector` — Supports journal selection based on scope and
  bibliometric information.
- `reviewer` — Performs a structured pre-submission manuscript review.

### Orchestration

- `research-manager` — Coordinates the complete research workflow and helps
  determine which skills should be used at each stage.

---

# Supported AI Coding Agents

Academic Research Suite follows the
[Agent Skills](https://agentskills.io/) approach and can be installed for
multiple AI coding agents.

| Agent | Installation |
|---|---|
| Pi | `./install.sh --all` |
| Claude Code | `./install.sh --all --agent claude` |
| Codex CLI | `./install.sh --all --agent codex` |

The installer can also target a custom skills directory.

---

# Quick Installation

## macOS / Linux

Clone the repository:

```bash
git clone https://github.com/alexandralacruz/academic-research-suite.git
cd academic-research-suite
```

Install all skills:

```bash
./install.sh --all
```

Install for Claude Code:

```bash
./install.sh --all --agent claude
```

Install for Codex CLI:

```bash
./install.sh --all --agent codex
```

Install for all detected agents:

```bash
./install.sh --all --agent all
```

---

## Windows

Using PowerShell:

```powershell
git clone https://github.com/alexandralacruz/academic-research-suite.git
cd academic-research-suite
.\install.ps1 -All
```

For Claude Code:

```powershell
.\install.ps1 -All -Agent claude
```

For Codex CLI:

```powershell
.\install.ps1 -All -Agent codex
```

---

# Installation Commands

```text
./install.sh
```

Interactive installation.

```text
./install.sh --all
```

Install all 16 skills.

```text
./install.sh --list
```

List available skills.

```text
./install.sh --status
```

Display installation status.

```text
./install.sh <skill-name>
```

Install a specific skill.

```text
./install.sh --uninstall <skill-name>
```

Uninstall a specific skill.

```text
./install.sh --uninstall --all
```

Uninstall all installed skills.

```text
./install.sh --help
```

Display available options.

---

# Examples

### Literature review

```text
Use the literature-discovery skill to identify recent research
on AI-assisted academic writing.
```

### Research gap

```text
Use the research-gap skill to identify potential research gaps
in AI-based medical image analysis.
```

### Novelty analysis

```text
Use the novelty-analysis skill to evaluate whether this research
idea provides a sufficiently original contribution.
```

### Methodology

```text
Use the methodology-designer skill to design an experimental
methodology for comparing three deep learning models.
```

### Manuscript review

```text
Use the reviewer skill to perform a pre-submission peer review
of this manuscript.
```

### Complete workflow

```text
Use research-manager to guide the complete research process
from research question to pre-submission review.
```

---

# Design Philosophy

Academic Research Suite is designed around several principles:

### Research before writing

The system prioritizes understanding the scientific landscape before
generating manuscript content.

### Evidence over unsupported claims

Research-related outputs should be grounded in identifiable scientific
evidence whenever external sources are available.

### Human oversight

ARS is intended to assist researchers, not replace academic judgment,
scientific expertise, peer review, or institutional research processes.

### Reproducibility

The workflows encourage explicit research questions, methodological
decisions, evidence tracking, citation checking, and transparent revision.

### Responsible use of AI

Researchers remain responsible for verifying generated information,
citations, interpretations, methodological decisions, and final
manuscript content.

---

# Academic and Scientific Use

Academic Research Suite is intended to support:

- Scientific research
- Academic writing
- Literature reviews
- Systematic research workflows
- Research methodology design
- Research gap identification
- Scientific manuscript preparation
- Peer-review preparation
- Teaching and learning
- Research reproducibility
- Non-commercial experimentation

Researchers are encouraged to disclose the use of AI-assisted tools when
required by their institution, publisher, conference, journal, or research
ethics policies.

Use of ARS does not replace human responsibility for the accuracy,
originality, integrity, and ethical compliance of academic work.

---

# License

**Academic Research Suite is NOT released under the MIT License.**

ARS is distributed under the:

**Academic Research Suite – Non-Commercial Academic License (ARS-NC 1.0)**

The license permits free use, modification, and redistribution for
personal, educational, academic, scientific, and other non-commercial
purposes.

### Commercial use is not permitted.

Without prior written authorization from Alexandra La Cruz, users may not:

- sell Academic Research Suite;
- sell substantial portions or modified versions of the suite;
- incorporate substantial portions into commercial products;
- incorporate substantial portions into paid applications or SaaS
  platforms;
- offer substantially derived functionality as a paid service;
- sublicense the suite for commercial purposes; or
- otherwise commercially exploit the project.

See [`LICENSE — ARS-NC 1.0`](LICENSE) for the complete terms.

---

# Attribution

If you use Academic Research Suite in academic or scientific work, please
attribute the project to:

**Alexandra La Cruz**

Suggested attribution:

> Academic Research Suite — Alexandra La Cruz (2026)

For formal citation, see [`CITATION.cff`](CITATION.cff).

---

# Copyright

Copyright © 2026 Alexandra La Cruz.

All rights not expressly granted under the ARS-NC 1.0 license are reserved.

---

# Author

**Alexandra La Cruz**

Academic Research Suite is an independently developed research-oriented
AI-agent framework intended to facilitate academic research, scientific
writing, experimentation, and reproducible research workflows.

---

# Disclaimer

Academic Research Suite is provided for research and educational purposes.

The generated outputs may contain errors, omissions, unsupported claims,
incorrect references, or other inaccuracies. Users are responsible for
independently verifying outputs before using them in academic,
professional, scientific, clinical, or other consequential contexts.

The use of this software does not constitute endorsement of any generated
content.

---

# Contributing

Contributions, suggestions, and academic feedback are welcome.

Any contribution should respect the project's non-commercial licensing
model and preserve appropriate attribution to the original work.

Before submitting substantial contributions, please review the project's
license and contribution guidelines.

---

# Citation

If Academic Research Suite contributes to your research, please cite it
using the project's `CITATION.cff` file.

Recommended citation:

**La Cruz, Alexandra. (2026). Academic Research Suite.**
https://github.com/alexandralacruz/academic-research-suite

---

**Academic Research Suite**

*AI-agent skills for academic and scientific research.*

Created and maintained by **Alexandra La Cruz**.