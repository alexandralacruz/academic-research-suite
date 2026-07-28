---
name: research-gap
description: Identifies specific research gaps by analyzing existing literature against unexplored dimensions. Examines open problems, missing datasets, incompletely compared methods, unexplored domains, missing benchmarks, and under-explored research questions. Takes a paper collection as input and systematically identifies what the community has NOT yet addressed. Use after literature-discovery or state-of-the-art to identify promising research contributions.
---

# Research Gap Analysis

Systematic identification of research gaps, open problems, and unexplored dimensions in a research domain.

## When to Use

- Defining a PhD thesis topic or research direction
- Validating that a proposed contribution is truly novel
- Writing the "Research Gaps" or "Problem Statement" section of a paper
- Identifying low-hanging fruit for a quick publication
- Strategic planning of a research agenda
- After `literature-discovery` or `state-of-the-art` to formalize gaps

## Input Requirements

1. **Paper collection**: Set of papers covering the domain (from `literature-discovery` or manual)
2. **State of the Art summary** (optional): From `state-of-the-art` for richer analysis
3. **Research direction of interest** (optional): If the researcher already has a tentative direction
4. **Scope constraints**: What dimensions should be included/excluded from the gap analysis

## Gap Analysis Framework

Systematically examine the research space across these dimensions:

### Dimension 1: Problem Space Gaps

What problems remain unsolved?

- **New problem variants**: Variations of the core problem not yet formalized
- **Edge cases**: Corner cases that existing methods fail on
- **Real-world constraints**: Practical requirements not addressed in current work
- **User/domain-specific needs**: Stakeholder requirements not captured by current formulations

### Dimension 2: Method Space Gaps

What methodological combinations haven't been tried?

- **Cross-paradigm approaches**: Combinations from different methodological families
- **Transfer from other fields**: Methods successful in other domains not yet applied here
- **Hybrid techniques**: Potential synergies between existing approaches
- **Underexplored architecture/design choices**: Variants not systematically studied

### Dimension 3: Data Space Gaps

What data-related gaps exist?

- **Missing datasets**: What types of data are not publicly available?
- **Dataset limitations**: Biases, size constraints, annotation quality issues in existing datasets
- **Missing languages/domains**: Underrepresented populations, languages, or settings
- **Data modalities**: Modalities not combined or explored
- **Benchmark gaps**: Evaluation scenarios not covered by existing benchmarks

### Dimension 4: Evaluation Gaps

What hasn't been properly measured?

- **Uncompared methods**: Pairs of approaches never directly compared
- **Missing metrics**: Important dimensions of performance not measured
- **Reproducibility issues**: Methods without open implementations or sufficient detail
- **Statistical rigor**: Papers lacking proper statistical testing
- **Real-world validation**: Methods not tested outside lab conditions

### Dimension 5: Theoretical Gaps

What isn't understood?

- **Lack of theoretical guarantees**: Methods without formal properties established
- **Unexplained phenomena**: Empirical observations without theoretical backing
- **Missing formal frameworks**: Absence of unifying formalisms
- **Contradictory findings**: Results that disagree without resolution

### Dimension 6: Domain Gaps

What contexts are unexplored?

- **Unaddressed application domains**: Fields where the methods haven't been applied
- **Cross-cultural gaps**: Settings not studied across different cultural contexts
- **Scale gaps**: Methods not tested at realistic scales
- **Temporal gaps**: Lack of longitudinal studies or temporal dynamics

## Output Format

```markdown
# Research Gap Analysis: [Topic/Domain]
*Based on analysis of [N] papers*

---

## Executive Summary
*Top 3-5 most promising gaps ranked by potential impact*

| Rank | Gap | Type | Impact | Feasibility | Time to Publish |
|------|-----|------|--------|-------------|-----------------|
| 1 | [Brief description] | [Problem/Method/Data/...] | High/Med | High/Med/Low | Short/Med/Long |
| ...

---

## 1. Problem Space Gaps

### Unresolved Problems
*Problems the community acknowledges as open*

| Problem | Evidence (papers that mention it) | Difficulty | Importance |
|---------|----------------------------------|------------|------------|
| ... | [Refs] | ... | Critical/High/Med |

### Unexplored Problem Variants
*Variations not yet formalized*

- **[Variant 1]**: [Description. Why it matters. Feasibility assessment.]
- ...

## 2. Method Space Gaps

### Unexplored Method Combinations

| Combination | Rationale | Expected Benefit | Risk |
|-------------|-----------|-----------------|------|
| [Method A] + [Method B] | Why this might work | What improvement expected | Why it might fail |

### Methods Not Yet Applied to This Domain

| Method | Origin Domain | Potential Application | Feasibility |
|--------|---------------|----------------------|-------------|
| ... | ... | ... | ... |

## 3. Data Space Gaps

### Missing Datasets

| Needed Dataset | Why Missing | Difficulty to Create | Impact if Available |
|----------------|-------------|---------------------|---------------------|
| ... | ... | ... | ... |

### Existing Dataset Limitations

| Dataset | Limitation | Severity | Mitigation Possible? |
|---------|------------|----------|----------------------|
| ... | ... | ... | ... |

### Underrepresented Domains/Languages

- [Domain/Language]: [Extent of underrepresentation. Evidence. Opportunity.]

## 4. Evaluation Gaps

### Head-to-Head Comparisons Missing

| Method A | Method B | Why Important | Difficulty of Comparison |
|----------|----------|---------------|--------------------------|
| ... | ... | ... | ... |

### Missing Evaluation Dimensions

| Dimension | Current Practice | Why Missing Matters |
|-----------|-----------------|---------------------|
| Fairness/Bias | Not measured | ... |
| Robustness | Rarely tested | ... |
| Efficiency | Often ignored | ... |
| Interpretability | Not standard | ... |

## 5. Theoretical Gaps

- **Unproven properties**: [Method/claim lacking formal proof]
- **Unexplained empirical findings**: [Observation without explanation]
- **Missing frameworks**: [What a unifying theory could explain]

## 6. Domain Gaps

| Underexplored Domain | Relevance | Barrier to Entry | Opportunity |
|----------------------|-----------|-----------------|-------------|
| ... | ... | ... | ... |

---

## Gap Prioritization Matrix

*Evaluate each gap on feasibility vs. impact*

```
Impact
  ▲
  │  QUICK WINS         HIGH-VALUE TARGETS
  │  (do immediately)   (plan carefully)
  │
  │  LOW PRIORITY       HIGH RISK
  │  (defer)            (reconsider)
  │
  └──────────────────────────────► Feasibility
```

| Gap | Impact (1-5) | Feasibility (1-5) | Time to Paper | Risk | Recomm. |
|-----|--------------|-------------------|---------------|------|---------|
| ... | ... | ... | ... | ... | Pursue / Consider / Defer |

---

## Recommended Research Directions
*Actionable proposals based on gap analysis*

### Direction 1: [Title]
- **Gap addressed**: [Which gap(s)]
- **Proposed approach**: [High-level idea]
- **Expected contribution**: [What the community gains]
- **Validation plan**: [How to demonstrate value]
- **Fallback plan**: [If the main idea doesn't pan out]

### Direction 2: [Title]
...
```

## Quality Criteria

- Every gap must be supported by evidence from the literature
- Distinguish between: "no one has done this" vs. "no one has published this"
- For each gap, consider: why hasn't it been addressed? (truly hard? overlooked? recently possible?)
- Prioritize gaps with high impact AND reasonable feasibility
- Acknowledge that gap identification is inherently subjective and limited by literature coverage
- Note when a gap is filled by ongoing work (preprints, concurrent submissions)

## Integration

- **Input from**: `literature-discovery` (papers + landscape), `state-of-the-art` (synthesis)
- **Output to**: `novelty-analysis` (validate a specific idea against gaps), `title-generator` (inform novelty), `research-manager`
- Complements `novelty-analysis` — this identifies gaps broadly; novelty analysis validates a specific contribution
