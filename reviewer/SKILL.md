---
name: reviewer
description: Performs a comprehensive pre-submission review of an academic paper. Evaluates novelty, clarity, contribution significance, methodological rigor, experimental validity, threats to validity, reproducibility, figure/table quality, reference completeness, and overall structure. Identifies weaknesses that real reviewers would flag and suggests concrete improvements. Use before submitting a paper to anticipate and address reviewer concerns.
---

# Pre-Submission Reviewer

Comprehensive pre-submission review that simulates the peer review process to identify and address weaknesses before submission.

## When to Use

- Before submitting a paper to a journal or conference
- After receiving a rejection and preparing for resubmission
- As a "friendly review" to strengthen a draft before sharing with collaborators
- Quality assurance check before posting a preprint
- Preparing for a thesis defense by anticipating committee questions

## Input Requirements

1. **Complete paper draft**: All sections, figures, tables, references
2. **Target venue**: To calibrate review standards appropriately
3. **Author's own concerns** (optional): Areas the authors already worry about
4. **Previous reviews** (if resubmission): Reviewer comments from prior submission

## Review Dimensions

### 1. Novelty & Contribution (Weight: High)

| Sub-dimension | Questions |
|---------------|-----------|
| **Problem significance** | Is the problem worth solving? Who benefits? |
| **Novelty clarity** | Is what's new clearly stated and easy to identify? |
| **Contribution level** | Incremental improvement / solid advance / significant breakthrough? |
| **Differentiation** | Is this clearly different from prior work? Could a reader confuse it with existing papers? |
| **Overclaiming risk** | Do claims match evidence? Are there exaggerated statements? |

### 2. Clarity & Presentation (Weight: High)

| Sub-dimension | Questions |
|---------------|-----------|
| **Abstract quality** | Does the abstract accurately convey the contribution and results? |
| **Introduction flow** | Does it hook the reader, state the problem, and preview contributions? |
| **Technical clarity** | Is the method described clearly enough for a knowledgeable reader to understand? |
| **Figure/Table quality** | Are visuals clear, well-captioned, and informative without reading the text? |
| **Writing quality** | Grammar, typos, awkward phrasing, overly long sentences? |
| **Structure & organization** | Logical flow? Sections in the right order? Appropriate length per section? |

### 3. Methodological Rigor (Weight: High)

| Sub-dimension | Questions |
|---------------|-----------|
| **Problem formalization** | Is the problem well-defined mathematically or conceptually? |
| **Method justification** | Are design choices justified (not just described)? |
| **Baseline selection** | Are baselines appropriate, fairly implemented, and properly tuned? |
| **Metric selection** | Are evaluation metrics appropriate for the task? |
| **Ablation completeness** | Do ablation studies isolate the contribution of each component? |
| **Implementation detail** | Is enough detail provided for reproduction? |

### 4. Experimental Validity (Weight: High)

| Sub-dimension | Questions |
|---------------|-----------|
| **Dataset appropriateness** | Are datasets standard for this task? Are they adequate in size and diversity? |
| **Statistical rigor** | Are statistical tests used? Are confidence intervals reported? Are multiple runs averaged? |
| **Generalization evidence** | Do results generalize beyond the specific test conditions? |
| **Fair comparison** | Are baselines given fair treatment (same data, tuning, hardware)? |
| **Error analysis** | Are failure cases analyzed, or only successes highlighted? |

### 5. Threats to Validity (Weight: Medium)

| Threat Type | Questions |
|-------------|-----------|
| **Internal validity** | Could confounding factors explain results? Are there implementation confounds? |
| **External validity** | Do findings generalize to other populations, domains, or conditions? |
| **Construct validity** | Do metrics actually measure what they claim to measure? |
| **Conclusion validity** | Are statistical conclusions justified? Is there sufficient statistical power? |

### 6. Reproducibility (Weight: Medium)

| Sub-dimension | Questions |
|---------------|-----------|
| **Code availability** | Is code mentioned? Will it be released? |
| **Data availability** | Are datasets publicly accessible? Preprocessing documented? |
| **Hyperparameters** | All values specified (not just ranges)? |
| **Hardware/Software** | Specific versions documented? Random seeds fixed? |
| **Evaluation protocol** | Exact procedures documented for metric computation? |

### 7. References (Weight: Medium)

| Sub-dimension | Questions |
|---------------|-----------|
| **Coverage** | Are key papers in the field cited? Any obvious omissions? |
| **Recency** | Recent work (last 2-3 years) included? |
| **Seminal works** | Foundational papers cited where appropriate? |
| **Self-citation balance** | Excessive self-citation? Missing self-citation where needed? |
| **Citation accuracy** | Do citations support the claims made about them? |

### 8. Overall Structure & Venue Fit (Weight: Medium)

| Sub-dimension | Questions |
|---------------|-----------|
| **Venue conventions** | Section naming, length, reference format, figure style? |
| **Page/word limit** | Within limits? |
| **Appendix usage** | Appropriate material in appendix vs. main text? |
| **Supplementary material** | Well-organized and referenced from main text? |

## Output Format

```markdown
# Pre-Submission Review: [Paper Title]
*Target Venue: [Journal/Conference] | Reviewer: Academic Research Suite*

---

## Overall Assessment

**Recommendation**: [Strong Accept / Accept / Weak Accept / Borderline / Weak Reject / Reject]
*This is an honest pre-submission assessment, not a prediction of the actual review outcome.*

**Summary**: [3-5 sentences summarizing the paper's strengths and main areas for improvement]

---

## Dimension Scores

| Dimension | Score (1-5) | Weight | Weighted |
|-----------|-------------|--------|----------|
| Novelty & Contribution | [X] | High (x3) | [X] |
| Clarity & Presentation | [X] | High (x3) | [X] |
| Methodological Rigor | [X] | High (x3) | [X] |
| Experimental Validity | [X] | High (x3) | [X] |
| Threats to Validity | [X] | Medium (x2) | [X] |
| Reproducibility | [X] | Medium (x2) | [X] |
| References | [X] | Medium (x2) | [X] |
| Structure & Venue Fit | [X] | Medium (x2) | [X] |
| **Overall** | — | — | **[Weighted avg]** |

*Score: 1 = Critical flaw, 2 = Weak, 3 = Adequate, 4 = Strong, 5 = Excellent*

---

## Detailed Review by Dimension

### 1. Novelty & Contribution [Score: X/5]

**Strengths**:
- [What is genuinely novel and well-articulated]

**Weaknesses**:
- [What reduces perceived novelty]
- [Overclaiming instances, if any]
- [Insufficient differentiation from prior work]

**Recommendations**:
- [Specific changes to improve novelty perception]

### 2. Clarity & Presentation [Score: X/5]

**Strengths**:
- [What is well-written and clear]

**Weaknesses**:
- [Specific unclear passages, confusing figures, awkward phrasing]
- [Typos/grammar issues]

**Recommendations**:
- [Specific rewrites, figure improvements, reorganization suggestions]

### 3. Methodological Rigor [Score: X/5]

**Strengths**:
- [Well-justified design choices, solid formalization]

**Weaknesses**:
- [Unjustified design choices]
- [Missing ablation studies]
- [Insufficient baseline tuning information]
- [Weak or inappropriate metrics]

**Recommendations**:
- [Additional experiments needed]
- [Design choices that need justification]
- [Alternative metrics to consider]

### 4. Experimental Validity [Score: X/5]

**Strengths**:
- [Well-designed experiments, convincing evidence]

**Weaknesses**:
- [Dataset limitations]
- [Missing statistical tests]
- [Insufficient runs for variance estimation]
- [Potential confounds]

**Recommendations**:
- [Specific additional experiments or analyses]
- [Statistical tests to add]
- [Datasets to include]

### 5. Threats to Validity [Score: X/5]

**Strengths**:
- [Threats that are properly acknowledged]

**Weaknesses**:
- [Unacknowledged threats]
- [Dismissed threats that are actually significant]

**Recommendations**:
- [Threats to add to the limitations section]
- [Mitigation strategies to discuss]

### 6. Reproducibility [Score: X/5]

**Strengths**:
- [What is well-documented for reproduction]

**Weaknesses**:
- [Missing details that would prevent reproduction]
- [Undocumented hyperparameters, random seeds, software versions]
- [Unclear evaluation protocol]

**Recommendations**:
- [Specific details to add]
- [Recommendation to prepare a reproducibility checklist or anonymous repository]

### 7. References [Score: X/5]

**Strengths**:
- [Well-covered areas of the literature]

**Weaknesses**:
- **Missing citations**: [Papers that should be cited but aren't]
- **Over-citation**: [Citations that don't add value]
- **Self-citation concerns**: [Excessive or insufficient self-citations]
- **Recency gap**: [Important recent work (last 2 years) not cited]

**Recommendations**:
- [Specific papers to add with brief justification]
- [Citations to reconsider]

### 8. Structure & Venue Fit [Score: X/5]

**Strengths**:
- [Structural elements that work well]

**Weaknesses**:
- [Venue convention violations]
- [Length issues]
- [Section organization problems]

**Recommendations**:
- [Specific restructuring suggestions]

---

## Critical Issues (Must Fix Before Submission)

*Issues that would likely lead to rejection if unaddressed*

| # | Issue | Severity | Section | Recommendation |
|---|-------|----------|---------|----------------|
| 1 | [Issue] | 🔴 Critical | [Section] | [How to fix] |
| 2 | [Issue] | 🔴 Critical | [Section] | [How to fix] |

---

## Major Issues (Should Fix)

| # | Issue | Severity | Section | Recommendation |
|---|-------|----------|---------|----------------|
| 1 | [Issue] | 🟠 Major | [Section] | [How to fix] |
| 2 | ... | ... | ... | ... |

---

## Minor Issues (Consider Fixing)

| # | Issue | Severity | Section | Recommendation |
|---|-------|----------|---------|----------------|
| 1 | [Issue] | 🟡 Minor | [Section] | [How to fix] |
| 2 | ... | ... | ... | ... |

---

## Expected Reviewer Questions

*Questions a real reviewer is likely to ask, with suggested responses*

| Reviewer Question | Suggested Response / Action |
|-------------------|-----------------------------|
| "Why didn't you compare to [X]?" | [Include comparison / justify exclusion in text] |
| "How sensitive is the method to [parameter Y]?" | [Add sensitivity analysis / report parameter study] |
| "Can you explain why [unexpected result]?" | [Add interpretation to discussion] |
| "What is the computational cost compared to baselines?" | [Add efficiency comparison table] |
| ... | ... |

---

## Figures & Tables Audit

| Figure/Table | Clear? | Informative? | Well-Captioned? | Colorblind-Safe? | Resolution? | Recommendation |
|-------------|--------|-------------|----------------|-----------------|-------------|----------------|
| Fig. 1 | ✅/⚠️/❌ | ✅/⚠️/❌ | ✅/⚠️/❌ | ✅/⚠️/❌ | ✅/⚠️/❌ | [Fix if needed] |
| Table 1 | ✅/⚠️/❌ | ✅/⚠️/❌ | ✅/⚠️/❌ | N/A | N/A | [Fix if needed] |
| ... | ... | ... | ... | ... | ... | ... |

---

## Writing Quality Spot Check

*Random sampling of paragraphs for writing quality*

| Location | Issue Type | Original | Suggested |
|----------|-----------|----------|-----------|
| [Section, para] | [Grammar / Clarity / Redundancy / Jargon] | "[original text]" | "[improved version]" |
| ... | ... | ... | ... |

---

## Improvement Priority List

*Ranked by impact on acceptance probability per effort*

| Priority | Action | Estimated Effort | Impact |
|----------|--------|-----------------|--------|
| 1 | [Highest-impact, lowest-effort fix] | Low / Med / High | High / Med |
| 2 | ... | ... | ... |
| 3 | ... | ... | ... |
| ... | ... | ... | ... |

---

## Estimated Review Outcome (if submitted now)

**Predicted reviewer recommendation**: [Accept / Weak Accept / Borderline / Reject]
**Confidence**: [Low / Medium / High]
**Most likely rejection reason**: [If applicable]
**Time to fix before submission**: [Hours / Days / Weeks]
```

## Review Principles

1. **Be constructively critical**: Identify weaknesses to fix them, not to discourage
2. **Be specific**: "Section 3.2 is unclear" → "Section 3.2 assumes the reader knows [X] — add a sentence defining it"
3. **Prioritize**: Distinguish between critical issues (rejection-likely) and minor issues (polish)
4. **Simulate a real reviewer**: Would an actual reviewer notice this? Care about this?
5. **Acknowledge subjectivity**: Many review criteria are subjective — flag when a judgment call is involved
6. **Respect the author's voice**: Suggest improvements, don't rewrite in a different voice

## Integration

- **Input from**: ALL other skills produce sections that `reviewer` evaluates
- **Output to**: `research-manager` (review feeds into revision planning)
- Run this as the final step before submission, after all sections are complete
- Can be run iteratively: review → fix → review again
