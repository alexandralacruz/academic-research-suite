---
name: paper-outline
description: Generates structured academic paper outlines following IMRaD and venue-specific conventions. Produces section-by-section plans with page budgets, key messages, figure/table placements, and paragraph-level guidance. Works for full papers, short papers, surveys, and thesis chapters. Use when starting to write a paper, restructuring an existing draft, or planning a thesis chapter.
---

# Paper Outline Generator

Generates detailed structured outlines for academic papers following venue-specific conventions.

## When to Use

- Planning a new paper before writing begins
- Restructuring an existing draft that feels disorganized
- Aligning a paper structure with a specific venue's expectations
- Planning a survey paper, position paper, or thesis chapter
- Coordinating multi-author writing by assigning clear sections

## Input Requirements

1. **Research contribution**: What was done, found, and why it matters
2. **Target venue**: Journal or conference (determines structure conventions)
3. **Paper type**: Full research paper / Short paper / Survey / Position paper / Demo / Thesis chapter
4. **Page limit**: Maximum pages (or word count)
5. **Key results**: What are the 2-4 most important findings?
6. **Figures/tables planned**: What visuals will be included?

## Paper Structures by Type

### Standard Research Paper (IMRaD)

```
1. Introduction                    [~15% of pages]
2. Related Work                    [~15% of pages]
3. Methodology / Proposed Method   [~25% of pages]
4. Experimental Setup              [~10% of pages]
5. Results & Analysis              [~20% of pages]
6. Discussion                      [~10% of pages]
7. Conclusion & Future Work        [~5% of pages]
```

### Short Paper / Poster

```
1. Introduction + Related Work     [~25%]
2. Proposed Approach              [~40%]
3. Results                        [~25%]
4. Conclusion                     [~10%]
```

### Survey Paper

```
1. Introduction                    [~10%]
2. Background & Definitions        [~15%]
3. Taxonomy of Approaches          [~40%]
4. Comparative Analysis            [~20%]
5. Open Problems & Future Directions [~10%]
6. Conclusion                      [~5%]
```

### Two-Column Conference Paper (IEEE/ACM)

- Introduction ends on page 1 (critical for readability)
- Figure 1 or Table 1 on page 1 (visual hook)
- Method overview figure early in section 3
- Results summary table within first page of results section

## Output Format

```markdown
# Paper Outline: [Proposed Title]
*Target: [Venue] | Type: [Paper type] | Page Budget: [N] pages*

---

## Structure Overview

| Section | Pages | % | Key Message |
|---------|-------|---|-------------|
| 1. Introduction | [N] | [%] | [One sentence on what this section must convey] |
| 2. Related Work | [N] | [%] | ... |
| 3. Method | [N] | [%] | ... |
| 4. Experimental Setup | [N] | [%] | ... |
| 5. Results | [N] | [%] | ... |
| 6. Discussion | [N] | [%] | ... |
| 7. Conclusion | [N] | [%] | ... |

---

## Section-by-Section Plan

### 1. Introduction [Page budget: N pages]

**Objective**: [What must this introduction achieve?]

**Paragraph flow**:
1. **Hook** (1 paragraph): [Broad context and why this matters — grab attention]
2. **Problem statement** (1 paragraph): [Specific gap or challenge this paper addresses]
3. **Limitations of prior work** (1 paragraph): [Why existing solutions fall short — set up your contribution]
4. **Proposed approach** (1 paragraph): [Your solution at a high level — no details yet]
5. **Contributions** (bullet list or paragraph): [3-4 specific, verifiable contributions]
6. **Paper structure** (1-2 sentences): [Roadmap of the paper]

**Figures/Tables**: [None typically, or one motivating figure]

**Key references to cite**: [2-4 most important background references]

---

### 2. Related Work [Page budget: N pages]

**Objective**: [Position this work in the literature, show gap exists]

**Subsections**:
- **2.1 [Approach Family 1]** ([N] paragraphs)
  - Papers to cover: [List key papers with 1-sentence on each]
  - Gap/limitation to highlight: [What these methods don't do]

- **2.2 [Approach Family 2]** ([N] paragraphs)
  - ...

- **2.3 [Approach Family 3]** ([N] paragraphs)
  - ...

**Key differentiator paragraph**: [Explicit statement of how this paper differs from ALL related work]

**Figures/Tables**: [Optional: summary table comparing related work]

---

### 3. Proposed Method [Page budget: N pages]

**Objective**: [Enable reproduction of the work]

**Subsections**:
- **3.1 Problem Formulation**
  - [Notation, formal problem definition, assumptions]
  - Figure: [Illustrative diagram of the problem]

- **3.2 Method Overview**
  - [High-level architecture / pipeline description]
  - Figure: [Architecture/pipeline diagram — most important figure in the paper]

- **3.3 [Component 1]**
  - [Detailed description]
  - [Mathematical formulation if applicable]

- **3.4 [Component 2]**
  - [Detailed description]

- **3.5 [Training/Optimization details if applicable]**

- **3.6 Complexity Analysis** (if applicable)

**Algorithm boxes**: [Number and placement of pseudocode/algorithms]

---

### 4. Experimental Setup [Page budget: N pages]

**Objective**: [Enable exact reproduction]

**Subsections**:
- **4.1 Datasets** (Table: dataset statistics)
- **4.2 Baselines** (List with citations)
- **4.3 Evaluation Metrics** (Definitions and rationale)
- **4.4 Implementation Details** (Hyperparameters, hardware, libraries)
- **4.5 Experimental Protocol** (Train/val/test splits, repetitions, statistical tests)

---

### 5. Results & Analysis [Page budget: N pages]

**Objective**: [Demonstrate superiority convincingly]

**Main results table/figure**: [What is the headline result?]

**Subsections**:
- **5.1 Main Results** (Table: comparison to SOTA on primary benchmark)
- **5.2 Ablation Studies** (What happens when you remove components?)
- **5.3 [Additional Analysis]** (Parameter sensitivity, error analysis, qualitative examples)
- **5.4 [Domain-specific analysis]**

**Figures/Tables planned**:
1. [Figure/Table name]: [What it shows, key takeaway]
2. ...

---

### 6. Discussion [Page budget: N pages]

**Objective**: [Interpret results, acknowledge limitations, extract insights]

**Paragraph flow**:
1. **Summary of findings** (1 paragraph)
2. **Interpretation of surprising/important results** (1-2 paragraphs)
3. **Limitations** (1 paragraph — honest, proactive)
4. **Threats to validity** (if applicable: internal, external, construct, conclusion)
5. **Implications for practice/theory**

---

### 7. Conclusion & Future Work [Page budget: N pages]

**Objective**: [Summarize contribution, point forward]

**Paragraph flow**:
1. **Restate problem and contribution** (2-3 sentences — no new information)
2. **Summarize key findings** (2-3 sentences)
3. **Future work** (3-5 specific, actionable directions — not "more research is needed")

---

## Narrative Flow Check

*Does the paper tell a coherent story?*

```
Section 1: Here is an important problem.
Section 2: Others have tried to solve it, but their solutions have limitations.
Section 3: We propose a new solution that addresses these limitations.
Section 4: Here is how we tested it.
Section 5: Here is evidence that our solution works better.
Section 6: Here is what the results mean and what we learned.
Section 7: Here is what we contributed and what comes next.
```

---

## Visual Planning

| Figure/Table | Section | Content | Caption Message | Priority |
|-------------|---------|---------|-----------------|----------|
| Fig. 1 | 1 or 3 | [Motivation/Method overview] | [Key message] | Essential |
| Fig. 2 | 3 | [Architecture detail] | ... | Essential |
| Table 1 | 5 | [Main results] | ... | Essential |
| Fig. 3 | 5 | [Ablation/analysis] | ... | Important |
| Table 2 | 4 | [Dataset stats] | ... | Standard |

---

## Writing Order Recommendation

*Don't write in linear order. Follow this sequence for efficiency:*

1. **Methodology** (Section 3) — Write while implementation is fresh
2. **Results** (Section 5) — Write immediately after running experiments
3. **Experimental Setup** (Section 4) — After results to match what was actually done
4. **Introduction** (Section 1) — Write last, when you know the full story
5. **Related Work** (Section 2) — Write after introduction to match framing
6. **Discussion & Conclusion** (Sections 6-7) — After seeing all results
7. **Abstract** — Very last, after the paper is complete

---

## Venue-Specific Checklist

- [ ] Page limit respected with current plan
- [ ] Introduction ends on first page (two-column format)
- [ ] At least one figure or table on first page
- [ ] Section numbering matches venue style
- [ ] Reference format matches venue requirements
- [ ] Appendix allowed? If so, what goes there?
- [ ] Supplementary material structure planned
```

## Quality Criteria

- Every section must have a clear objective and key message
- The narrative flow must be coherent — does section N naturally lead to section N+1?
- Page budgets must be realistic for the content planned
- Figures and tables are planned before writing starts (they drive the paper)
- The outline should expose structural weaknesses: missing analysis, weak motivation, poor flow
- Venue conventions are respected (section naming, reference format, structure)

## Integration

- **Input from**: `novelty-analysis` (contribution framing), `state-of-the-art` (related work content), `methodology-designer` (method details)
- **Output to**: `abstract-writer`, `discussion-writer`, `conclusion-writer`, `related-work` (separate skill for detailed writing of related work section)
- Generates the blueprint; individual section skills produce the actual text
