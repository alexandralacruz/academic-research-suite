---
name: novelty-analysis
description: Evaluates the novelty of a specific research contribution against the existing literature. Analyzes what is genuinely new versus incremental, identifies similar prior work, assesses contribution significance, and provides a structured novelty assessment. Use before committing to a research direction, when writing the introduction's contribution claims, or when preparing a rebuttal to reviewers questioning novelty.
---

# Novelty Analysis

Systematic evaluation of the novelty and significance of a research contribution against existing literature.

## When to Use

- Validating a research idea before investing significant effort
- Writing contribution claims for a paper introduction
- Preparing a rebuttal to reviewers who question novelty
- Comparing multiple candidate research directions to choose the most novel
- Assessment for thesis proposals or grant applications

## Input Requirements

1. **Research contribution description**: Detailed description of the proposed work
   - What is the problem?
   - What is the proposed method/approach?
   - What are the key technical innovations?
   - What results/improvements are expected?
2. **Paper collection**: Relevant literature (from `literature-discovery` or manual)
3. **Research gaps** (optional): From `research-gap` for richer context

## Novelty Analysis Framework

### Level 1: Claim Verification

For each novelty claim the researcher makes, verify:

- **Claim**: Exact statement of what is claimed as new
- **Closest prior work**: Most similar existing paper(s)
- **Overlap analysis**: What is shared vs. what differs
- **Novelty verdict**: Novel / Incremental improvement / Already published / Unknown (insufficient evidence)

### Level 2: Dimension-by-Dimension Novelty

Analyze novelty across multiple dimensions:

| Dimension | Question |
|-----------|----------|
| **Problem formulation** | Is the problem definition new? |
| **Method/Algorithm** | Is the technical approach new? |
| **Architecture/Design** | Is the system design new? |
| **Theoretical insight** | Is there a new theoretical contribution? |
| **Dataset** | Is a new dataset contributed? |
| **Evaluation** | Is the evaluation methodology new or more comprehensive? |
| **Application domain** | Is the method applied to a new domain? |
| **Combination** | Is a novel combination of existing techniques the contribution? |
| **Scale** | Is operating at unprecedented scale the contribution? |
| **Analysis/Insight** | Is a new empirical or analytical insight the contribution? |

### Level 3: Contribution Significance

Evaluate the significance of the novelty:

- **Type**: Conceptual breakthrough / Significant advance / Solid incremental / Minor tweak
- **Generalizability**: Does this advance one narrow task or an entire problem class?
- **Barrier removal**: Does it solve a problem that was blocking progress?
- **Enablement**: Does it enable new research directions?
- **Practical impact**: Would practitioners adopt this?

### Level 4: Similarity Audit

Check for excessively similar prior work:

- **Identical problem + similar method**: High risk of novelty rejection
- **Similar problem + different method**: Moderate risk, depends on motivation
- **Different problem + similar method**: Generally acceptable with proper positioning
- **Identical method + different evaluation**: Low novelty unless evaluation reveals new insights

## Output Format

```markdown
# Novelty Analysis: [Contribution Title]

---

## Summary Verdict
**Overall Novelty**: [High / Moderate-High / Moderate / Incremental / Insufficient]
**Significance**: [Breakthrough / Significant / Solid / Minor]
**Risk of Rejection on Novelty Grounds**: [Low / Medium / High / Critical]

---

## 1. Contribution Claims Assessment

*Evaluation of each specific novelty claim*

| # | Claim | Closest Prior Work | Overlap | Difference | Verdict |
|---|-------|-------------------|---------|------------|---------|
| 1 | [Claim text] | [Paper + description] | [% or description] | [What is different] | Novel / Incremental / Already published |
| 2 | ... | ... | ... | ... | ... |

## 2. Dimensional Novelty Profile

| Dimension | Level of Novelty | Evidence |
|-----------|-----------------|----------|
| Problem formulation | New / Variant / Existing | [Explanation] |
| Method/Algorithm | Novel / Hybrid / Adaptation / Standard | [Explanation] |
| Architecture/Design | Novel / Modification / Existing | [Explanation] |
| Theoretical insight | New theorem / New analysis / Absent | [Explanation] |
| Dataset | New dataset / Extension / None | [Explanation] |
| Evaluation | Comprehensive / Standard / Limited | [Explanation] |
| Application domain | New domain / Adjacent / Same domain | [Explanation] |
| Combination | Novel combo / Expected combo / Single method | [Explanation] |

## 3. Similarity Analysis

### High-Similarity Papers (⚠️ Risk)

| Paper | Similarity | What's Shared | Critical Difference |
|-------|-----------|---------------|---------------------|
| ... | ⚠️ High | [Description] | [Why this work is different] |

### Moderate-Similarity Papers

| Paper | Similarity | Distinction |
|-------|-----------|-------------|
| ... | Medium | [How to differentiate] |

## 4. Contribution Positioning Strategy

*How to frame the contribution to maximize perceived novelty*

- **Primary narrative**: [What is the main story — what gap does this fill?]
- **Differentiation from [Paper X]**: [Explicit language to distance from the closest work]
- **What this is NOT claiming as new**: [Honesty about incremental aspects builds credibility]
- **What this uniquely enables**: [The downstream impact beyond the immediate contribution]

## 5. Weakness Pre-registration

*Honest acknowledgment of limitations to address proactively*

| Limitation | Severity | Mitigation Strategy |
|------------|----------|---------------------|
| ... | ... | Address in limitations section / Future work / Cannot mitigate |

## 6. Recommended Contribution Framing

*Suggested language for the paper*

**Contribution statement** (draft):
> [1-2 sentences that accurately and compellingly describe the contribution]

**Alternative framings**:
1. **Method-focused**: "We present [X], a novel approach that..."
2. **Problem-focused**: "We identify [Y] as a critical gap and address it by..."
3. **Insight-focused**: "We demonstrate that [Z], which leads to..."

## 7. Risk Assessment

| Risk | Probability | Impact | Mitigation |
|------|------------|--------|------------|
| Reviewer finds prior work we missed | Low/Med/High | Rejection / Major revision | Continue literature monitoring |
| Novelty considered incremental | ... | ... | Strengthen empirical validation |
| Contribution scope too narrow | ... | ... | Broaden evaluation or generalize method |
| Overclaiming damages credibility | ... | ... | Tone down claims; add limitations |

---

## Next Steps

- [ ] If high-similarity papers found: carefully differentiate in related work section
- [ ] Run `title-generator` to check title uniqueness
- [ ] Run `reference-checker` to ensure no missing citations to similar work
- [ ] Consider `reviewer` for a full pre-submission assessment
```

## Quality Criteria

- Be honest — inflated novelty assessment harms the researcher
- Every "novel" verdict must be supported by specific comparison to closest work
- If the literature coverage is incomplete, state this explicitly as a limitation
- Acknowledge that novelty assessment is probabilistic — a reviewer may find prior work not in our analysis
- Distinguish between "novel to the field" and "novel combination of known techniques" (both can be valuable)
- When novelty is low, suggest alternative framings that highlight other strengths (rigor, scale, insight)

## Integration

- **Input from**: `literature-discovery` (papers), `research-gap` (gap context)
- **Output to**: `title-generator` (novelty informs title), `abstract-writer` (contribution framing), `reviewer` (novelty section), `research-manager`
- Works best after `research-gap` has identified what is actually missing
