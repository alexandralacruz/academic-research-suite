---
name: research-manager
description: Orchestrates the Academic Research Suite skills into coherent research workflows. Guides researchers through the entire paper lifecycle — from literature discovery to submission-ready manuscript — by chaining specialized skills in optimal order. Provides progress tracking, checkpoint summaries, and decision support for research planning. Use when starting a new research project, managing a paper submission, or coordinating a systematic research process.
---

# Research Manager

Orchestration layer for the Academic Research Suite. Coordinates specialized skills into coherent research workflows.

## When to Use

- Starting a new research project and need a structured process
- Managing a paper from idea to submission
- Coordinating multi-skill analysis (literature → gaps → novelty → writing)
- Tracking research progress across multiple phases
- Making strategic decisions based on accumulated analysis
- Onboarding new researchers to a structured workflow

## Architecture

```
Academic Research Suite
        │
        ├── Phase 1: EXPLORE ──────────────────────
        │   ├── literature-discovery
        │   │   ↓ (papers + landscape)
        │   ├── state-of-the-art (optional depth)
        │   │   ↓
        │   └── research-gap
        │       ↓ (gap analysis)
        │
        ├── Phase 2: VALIDATE ─────────────────────
        │   └── novelty-analysis
        │       ↓ (novelty confirmed?)
        │
        ├── Phase 3: DESIGN ───────────────────────
        │   ├── methodology-designer
        │   │   ↓
        │   ├── paper-outline
        │   │   ↓
        │   └── title-generator (candidates)
        │
        ├── Phase 4: WRITE ────────────────────────
        │   ├── related-work
        │   ├── methodology-designer (section)
        │   ├── discussion-writer
        │   ├── conclusion-writer
        │   ├── abstract-writer
        │   └── keywords-generator
        │
        ├── Phase 5: POLISH ───────────────────────
        │   ├── reference-checker
        │   ├── journal-selector
        │   └── reviewer
        │
        └── Phase 6: MAINTAIN ─────────────────────
            └── (re-run skills as literature evolves)
```

## Research Workflows

### Workflow 1: New Research Project (From Scratch)

**Goal**: Go from "I have a research area" to "I have a validated research direction"

```
Step 1: literature-discovery
  Input: Research domain, time window, quality threshold
  Output: Research landscape, open problems, opportunities

Step 2: state-of-the-art
  Input: Papers from Step 1
  Output: Narrative synthesis of the field

Step 3: research-gap
  Input: Papers + State of the Art
  Output: Prioritized gaps, recommended directions

Step 4: novelty-analysis
  Input: Proposed contribution + Literature + Gaps
  Output: Novelty assessment, positioning strategy

→ Decision point: Is the direction sufficiently novel and feasible?
  YES → Proceed to Phase 3 (Design)
  NO  → Return to Step 3, explore different gap
```

### Workflow 2: Paper Writing (From Validated Idea)

**Goal**: Go from "I have a validated idea + results" to "paper ready for review"

```
Step 1: methodology-designer
  Input: Method details, experimental results
  Output: Methodology section draft, experimental design documentation

Step 2: paper-outline
  Input: Contribution, results, target venue
  Output: Complete paper outline with page budgets

Step 3: title-generator
  Input: Abstract/summary, contribution, target venue
  Output: Candidate titles, recommendation

Step 4: related-work
  Input: Papers, contribution, differentiation points
  Output: Related work section draft

Step 5: discussion-writer
  Input: Results, research questions, limitations
  Output: Discussion section draft

Step 6: conclusion-writer
  Input: Contributions, findings, limitations, future work ideas
  Output: Conclusion section draft

Step 7: abstract-writer
  Input: Complete paper, target venue
  Output: Abstract in venue-specific format

Step 8: keywords-generator
  Input: Title, abstract, target venue
  Output: Optimized keyword sets
```

### Workflow 3: Pre-Submission Review

**Goal**: Ensure the paper is submission-ready

```
Step 1: reference-checker
  Input: Complete manuscript
  Output: Reference validation, missing citations

Step 2: journal-selector
  Input: Abstract, keywords, contribution strength
  Output: Ranked journal recommendations, submission strategy

Step 3: reviewer
  Input: Complete manuscript, target venue
  Output: Comprehensive review with prioritized fixes

→ Iterate: Fix issues → re-run reviewer → fix → (repeat until satisfied)
```

### Workflow 4: Systematic Literature Review

**Goal**: Produce a comprehensive survey or review paper

```
Step 1: literature-discovery
  (with expanded parameters: deeper search, wider net)

Step 2: state-of-the-art
  (comprehensive synthesis of all findings)

Step 3: research-gap
  (focus on identifying open problems for the community)

Step 4: paper-outline
  (survey paper structure)

Step 5: related-work (adapted)
  (but as a taxonomy, not paper-specific positioning)

Step 6: discussion-writer
  (broader implications for the field)

Step 7: conclusion-writer
  (future directions for the community)
```

### Workflow 5: Revision After Rejection

**Goal**: Address reviewer comments and resubmit

```
Step 1: Read reviewer comments carefully

Step 2: reviewer
  Input: Revised paper + previous review comments
  Output: Assessment of whether each comment was addressed

Step 3: reference-checker
  Input: Updated manuscript
  Output: Ensure new citations are correct

Step 4: novelty-analysis
  (Re-run if contribution framing changed)

Step 5: journal-selector
  (Re-evaluate if journal needs to change)
```

## Output Format

```markdown
# Research Project Dashboard: [Project Name]
*Last Updated: [Date] | Phase: [Current Phase]*

---

## Project Overview

| Attribute | Detail |
|-----------|--------|
| **Research Domain** | [Domain] |
| **Research Question** | [Core question] |
| **Proposed Contribution** | [Brief description] |
| **Target Venue** | [Journal/Conference] |
| **Status** | [Exploring / Validating / Designing / Writing / Polishing / Submitted] |
| **Started** | [Date] |
| **Target Submission** | [Date] |

---

## Phase Progress

| Phase | Status | Completion | Key Deliverable |
|-------|--------|------------|-----------------|
| 1. EXPLORE | ✅ Done / 🔄 In Progress / ⏳ Pending | [%] | Research landscape + gaps identified |
| 2. VALIDATE | ✅ Done / 🔄 In Progress / ⏳ Pending | [%] | Novelty confirmation |
| 3. DESIGN | ✅ Done / 🔄 In Progress / ⏳ Pending | [%] | Methodology + outline + title |
| 4. WRITE | ✅ Done / 🔄 In Progress / ⏳ Pending | [%] | Complete manuscript draft |
| 5. POLISH | ✅ Done / 🔄 In Progress / ⏳ Pending | [%] | Submission-ready paper |
| 6. MAINTAIN | 🔄 Ongoing | [%] | Updated literature monitoring |

---

## Current Action Items

### 🔴 Critical (Blocking)
- [ ] [Action item with deadline if applicable]

### 🟠 High Priority (This Week)
- [ ] [Action item]
- [ ] [Action item]

### 🟡 Medium Priority (This Month)
- [ ] [Action item]

### 🟢 Low Priority (When Possible)
- [ ] [Action item]

---

## Key Decisions Log

| Date | Decision | Rationale | Impact |
|------|----------|-----------|--------|
| [Date] | [Decision made] | [Why this was chosen] | [How it affects the project] |
| ... | ... | ... | ... |

---

## Next Recommended Step

**[Next action]**

**Rationale**: [Why this step is the logical next action based on current phase and progress]

**Skill to use**: `[skill-name]`

**Input needed**: [What the researcher needs to provide before running this skill]

**Expected output**: [What this step will produce]

**Estimated time**: [Hours / Days]

---

## Full Workflow Map

*Based on [Workflow 1/2/3/4/5]*

```
[✓] Step 1: literature-discovery
[✓] Step 2: state-of-the-art
[✓] Step 3: research-gap
[ ] Step 4: novelty-analysis          ← YOU ARE HERE
[ ] Step 5: methodology-designer
[ ] Step 6: paper-outline
[ ] Step 7: title-generator
[ ] Step 8: related-work
[ ] Step 9: discussion-writer
[ ] Step 10: conclusion-writer
[ ] Step 11: abstract-writer
[ ] Step 12: keywords-generator
[ ] Step 13: reference-checker
[ ] Step 14: journal-selector
[ ] Step 15: reviewer
```

---

## Research Assets Inventory

| Asset | Location | Status |
|-------|----------|--------|
| Literature collection | [Path/File] | [N] papers |
| Research landscape | From `literature-discovery` | ✅ Generated |
| State of the Art | From `state-of-the-art` | ✅ Generated |
| Gap analysis | From `research-gap` | ✅ Generated |
| Novelty assessment | From `novelty-analysis` | ⏳ Pending |
| Paper draft | [Path] | ⏳ Pending |
| Figures/Tables | [Paths] | [N] prepared |

---

## Risk Register

| Risk | Probability | Impact | Mitigation |
|------|------------|--------|------------|
| Direction not sufficiently novel | Low/Med/High | High | Run `novelty-analysis` early |
| Key prior work missed | Low/Med/High | High | Comprehensive `literature-discovery` + `reference-checker` |
| Experimental results weak | Low/Med/High | Critical | Design robust experiments via `methodology-designer` |
| Venue scope mismatch | Low/Med/High | High | Run `journal-selector` before formatting |
| Similar work published concurrently | Low/Med/High | High | Continuous literature monitoring |

---

## Timeline

| Milestone | Target Date | Status |
|-----------|-------------|--------|
| Literature review complete | [Date] | ✅ / 🔄 / ⏳ |
| Research direction validated | [Date] | ✅ / 🔄 / ⏳ |
| Experiments complete | [Date] | ✅ / 🔄 / ⏳ |
| First draft complete | [Date] | ✅ / 🔄 / ⏳ |
| Internal review complete | [Date] | ✅ / 🔄 / ⏳ |
| Submission | [Date] | ✅ / 🔄 / ⏳ |
```

## Usage with pi

This skill coordinates the other skills. After running `research-manager`, it will recommend which specific skill to invoke next:

```bash
# In pi, after loading the research manager:
/skill:research-manager

# The manager will assess the current state and recommend the next skill:
/skill:literature-discovery
/skill:state-of-the-art
/skill:research-gap
# ... etc.
```

## Decision Points

The manager identifies key decision points where researcher judgment is essential:

| Decision Point | When | Considerations |
|----------------|------|----------------|
| **Research direction selection** | After `research-gap` | Feasibility, impact, alignment with career goals, available resources |
| **Novelty sufficiency** | After `novelty-analysis` | Is the contribution strong enough for the target venue? |
| **Methodology adequacy** | After `methodology-designer` | Are experiments sufficient to convince reviewers? |
| **Title finalization** | After `title-generator` | Which title best balances impact, accuracy, and discoverability? |
| **Abstract finalization** | After `abstract-writer` | Which abstract style best fits the target venue? |
| **Journal selection** | After `journal-selector` | Submit high or play it safe? Open access considerations? |
| **Submission readiness** | After `reviewer` | Are remaining issues acceptable, or should more revision be done? |

## Important Principles

1. **Skills are tools, not replacements for researcher judgment**: The manager recommends, the researcher decides
2. **Iteration is expected**: Most skills benefit from being run, results reviewed, changes made, and re-run
3. **Not all steps are mandatory**: A researcher with a clear idea and existing results might skip to Phase 3
4. **The manager tracks state but does not enforce it**: The researcher always controls the process
5. **Literature monitoring is ongoing**: Even after submission, new papers emerge that may affect novelty claims

## Integration

The Research Manager is the entry point to the Academic Research Suite. It:
- **Tracks progress** across all phases
- **Recommends next steps** based on current state
- **Maintains a decision log** for research rationale
- **Identifies bottlenecks** and risks
- **Coordinates skill execution order**

Start here for any research project. The manager will guide you to the right skill at the right time.
