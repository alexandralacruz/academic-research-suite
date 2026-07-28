---
name: state-of-the-art
description: Synthesizes a collection of research papers into a narrative State of the Art section. Analyzes current approaches, identifies strengths and weaknesses, traces research evolution, detects research gaps, and proposes future directions. Does NOT search for new papers — it works with papers already collected (e.g., from literature-discovery). Use when writing the background/related work section of a paper, thesis, or research proposal.
---

# State of the Art

Synthesis of existing research into a coherent narrative State of the Art section.

## When to Use

- Writing the background/literature review section of a paper
- Preparing a thesis or dissertation chapter
- Writing a research proposal
- Understanding how different approaches relate to each other
- After running `literature-discovery` and having a paper collection ready

## Input Requirements

1. **Paper collection**: Set of papers (titles, abstracts, full text when available)
2. **Research clusters** (optional): From `literature-discovery` output, if available
3. **Target audience**: Journal type / conference / thesis committee
4. **Narrative angle**: What specific aspect of the field are you focusing on?
5. **Length target**: Approximate word count or page count

## Methodology

### Phase 1: Paper Categorization

Group papers by:
- **Approach type**: Methodological families (e.g., supervised, unsupervised, RL-based, symbolic)
- **Problem variant**: Subtask or specific variant solved
- **Chronology**: Track evolution over time
- **Performance tier**: SOTA vs. baseline vs. surpassed

### Phase 2: Deep Analysis per Approach

For each approach family, extract:

1. **Core idea**: What is the key insight? (1-2 sentences)
2. **Technical mechanism**: How does it work at a high level?
3. **Key papers**: Representative works for this approach
4. **Strengths**:
   - What does it do well?
   - Under what conditions does it excel?
   - What are its unique advantages over alternatives?
5. **Weaknesses**:
   - Where does it struggle?
   - What are its inherent limitations?
   - What assumptions does it make?
6. **Performance profile**: Typical results on standard benchmarks
7. **Computational requirements**: Training/inference cost profile

### Phase 3: Cross-Approach Analysis

- **Comparative analysis**: Head-to-head comparisons available in the literature
- **Complementarity**: How different approaches could be combined
- **Paradigm shifts**: Major transitions in the field's thinking
- **Unresolved tensions**: Disagreements or contradictory findings

### Phase 4: Research Evolution Timeline

Trace how the field evolved:
- **Phase 1** (early): Problem formulation, initial approaches
- **Phase 2** (growth): Proliferation of methods, benchmarks emerge
- **Phase 3** (maturity): Consolidation around best approaches
- **Phase 4** (current): Where the field stands now

## Output Format

```markdown
# State of the Art: [Topic/Domain]

## 1. Introduction
*Overview of the research landscape, key challenges, and scope of this review*

[2-3 paragraphs setting context and defining scope]

## 2. Taxonomy of Approaches

### 2.1 [Approach Family 1]

**Core idea**: [1-2 sentence summary]

**Key papers**: [3-5 representative works with brief description of each contribution]

**Technical mechanism**: [How it works, at a conceptual level]

**Strengths**:
- [Strength 1 with evidence]
- [Strength 2 with evidence]
- ...

**Weaknesses & Limitations**:
- [Weakness 1 with evidence]
- [Weakness 2 with evidence]
- ...

**Performance profile**: [Typical results, benchmarks, conditions where it excels/fails]

### 2.2 [Approach Family 2]
...

## 3. Comparative Analysis

| Dimension | Approach 1 | Approach 2 | Approach 3 | ... |
|-----------|------------|------------|------------|-----|
| Accuracy/SOTA | | | | |
| Efficiency | | | | |
| Data requirements | | | | |
| Interpretability | | | | |
| Robustness | | | | |
| Generalization | | | | |
| Scalability | | | | |

## 4. Research Evolution

*How the field has progressed over time*

```
[Year range] → [Key developments]
[Year range] → [Key developments]
[Year range] → [Key developments (current)]
```

**Paradigm shifts observed**: [Description of major transitions]

## 5. Research Gaps & Open Problems

*Problems the community acknowledges as unsolved*

| Gap | Severity | Why Unsolved | Recent Attempts |
|-----|----------|--------------|-----------------|
| ... | Critical/High/Med | ... | ... |

## 6. Future Directions

*Promising avenues based on synthesis of current state*

- **Direction 1**: [Description with rationale grounded in identified gaps]
- **Direction 2**: [Description]
- ...

## 7. Summary

*Concise takeaway: where the field is and where it's going*

[1 paragraph]
```

## Writing Style Guidelines

- **Narrative, not enumerative**: Synthesize, don't list papers one by one
- **Critical perspective**: Don't just describe — evaluate
- **Evidence-based claims**: Every assertion must be traceable to specific papers
- **Acknowledge uncertainty**: "The literature suggests..." vs. "The literature proves..."
- **Neutral tone**: Present strengths and weaknesses fairly
- **Forward-looking**: Connect current state to future opportunities
- **Self-contained**: A reader unfamiliar with the field should grasp the landscape

## Integration

- **Input from**: `literature-discovery` (papers + clusters), direct paper uploads
- **Output to**: `research-gap` (gaps feed into gap analysis), `related-work` (condensed version for paper), `research-manager`
- This skill produces a comprehensive synthesis; `related-work` produces a shorter, paper-specific version
