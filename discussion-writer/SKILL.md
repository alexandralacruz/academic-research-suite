---
name: discussion-writer
description: Writes the Discussion section of an academic paper. Interprets results, explains surprising findings, acknowledges limitations honestly, addresses threats to validity, extracts broader implications, and connects findings back to the research questions and literature. Produces a thoughtful, critical discussion rather than a simple restatement of results. Use when writing the discussion section of a paper or preparing a response to reviewers.
---

# Discussion Writer

Writes critical, interpretive Discussion sections that go beyond restating results.

## When to Use

- Writing the Discussion section of a research paper
- Interpreting experimental results beyond surface-level description
- Preparing thoughtful responses to reviewer questions about result interpretation
- Extracting broader implications from findings
- Writing a thesis discussion chapter

## Input Requirements

1. **Results summary**: Key findings from experiments
2. **Research questions/hypotheses**: What was being tested?
3. **State of the Art context**: How do these results relate to prior work?
4. **Known limitations**: Methodological and experimental limitations
5. **Unexpected findings**: Any surprising results?
6. **Target venue**: Journal/conference expectations for discussion depth

## Discussion vs. Results

A common mistake is turning the Discussion into a rehash of Results:

| Results Section | Discussion Section |
|----------------|-------------------|
| **What** happened | **Why** it happened |
| **What** the data shows | **What** the data means |
| Descriptive | Interpretive |
| Objective reporting | Critical thinking |
| "Table 2 shows X improved by 12%" | "The 12% improvement suggests that..." |
| Past tense | Mix of present and past tense |
| No new references | May introduce references to interpret findings |

## Discussion Structure

### Standard Flow

1. **Summary of principal findings** (1 paragraph)
   - Restate the 2-4 most important results
   - Do NOT repeat all results — select the ones worth discussing

2. **Interpretation of findings** (2-4 paragraphs)
   - Why did we get these results?
   - What mechanisms explain the observed effects?
   - How do results compare to prior work?
   - What explains surprising or contradictory findings?

3. **Implications** (1-2 paragraphs)
   - Theoretical implications: What does this mean for the field's understanding?
   - Practical implications: What should practitioners do differently?
   - Methodological implications: What does this say about how research should be done?

4. **Limitations** (1-2 paragraphs)
   - Honest, proactive acknowledgment
   - NOT a weakness confession — a scientific responsibility
   - For each limitation: what it is, why it exists, how it affects interpretation

5. **Threats to validity** (if applicable — 1 paragraph or subsection)
   - Internal validity: Could something else explain the results?
   - External validity: Do results generalize?
   - Construct validity: Do measures capture what they should?
   - Conclusion validity: Are statistical conclusions sound?

6. **Connection to broader context** (1 paragraph)
   - How do these findings advance the field?
   - What questions do they open up?
   - Bridge to future work section

## Writing Principles

### DO ✅

- **Interpret, don't restate**: "The improvement in X suggests that Y mechanism plays a key role..."
- **Compare to literature**: "Our finding aligns with Smith et al. [1], who observed..."
- **Acknowledge contradictions**: "Contrary to Jones et al. [2], we found that... This discrepancy may be due to..."
- **Be honest about limitations**: Proactively addressing limitations strengthens credibility
- **Use cautious language**: "suggests", "indicates", "is consistent with" — not "proves"
- **Discuss negative results**: What didn't work is often as informative as what did

### DON'T ❌

- **Overclaim**: "Our results definitively prove..." → "Our results provide evidence that..."
- **Ignore contradictory evidence**: Address results that don't fit the narrative
- **Introduce new results**: Discussion interprets previously reported results; no new data
- **Over-speculate**: Ground interpretation in evidence; flag speculation explicitly
- **Apologize excessively**: Acknowledge limitations confidently, don't undermine the work
- **Make the Discussion a second Results section**: If it reads like Results, restructure

## Output Format

```markdown
# Discussion Section: [Paper Title]

---

## Draft: Discussion

### [N]. Discussion

#### [N].1 Summary of Findings

[1 paragraph summarizing the 2-4 most important findings. Be selective — not all results need discussion.]

> Example: "Our experiments demonstrate three principal findings. First, [finding 1 with evidence]. Second, [finding 2 with evidence]. Third, [finding 3 with evidence]. Together, these results indicate that [overall takeaway]."

#### [N].2 Interpretation

##### [Finding 1]: [Brief title]

[1-2 paragraphs interpreting this finding]

- **What explains this result?** [Mechanism, design choice, data characteristic]
- **How does it compare to prior work?** [Agreement/contradiction with specific references]
- **What is unexpected or noteworthy?** [Surprising aspects and possible explanations]
- **Alternative explanations**: [Could something else explain it?]

##### [Finding 2]: [Brief title]

[1-2 paragraphs]

##### [Finding 3]: [Brief title]

[1-2 paragraphs]

#### [N].3 Implications

##### Theoretical Implications
- [What do these findings tell us about how/why things work?]
- [Do they support/challenge existing theories?]
- [What new hypotheses do they suggest?]

##### Practical Implications
- [What should practitioners do differently based on these results?]
- [What design recommendations emerge?]
- [What are the adoption considerations?]

##### Methodological Implications
- [What do these results say about how research should be conducted?]
- [Are current evaluation practices sufficient?]

#### [N].4 Limitations and Threats to Validity

| Limitation | Type | Impact on Interpretation | Why It Exists | Future Mitigation |
|------------|------|-------------------------|---------------|-------------------|
| [Limitation 1] | Internal/External/Construct | [How does this limit what we can conclude?] | [Practical/technical reason] | [How future work could address] |
| [Limitation 2] | ... | ... | ... | ... |

##### Threats to Validity

**Internal Validity**: [Could confounding variables explain results? Were baselines fairly compared?]
**External Validity**: [Do results generalize beyond test conditions? Population, domain, scale limitations?]
**Construct Validity**: [Do metrics capture the intended constructs? Are there unmeasured important dimensions?]
**Conclusion Validity**: [Are statistical tests appropriate? Is there sufficient statistical power?]

#### [N].5 Broader Context

[1 paragraph connecting findings to the bigger picture]

> "These findings contribute to the growing body of evidence that [broader trend]. They also raise important questions about [open issue]. Addressing these questions will require [what kind of future work]."

---

## Interpretation Quality Checklist

- [ ] Each major finding has a WHY explanation, not just a WHAT description
- [ ] Surprising results are flagged and explored (not ignored)
- [ ] Comparisons to prior work are specific (not "consistent with prior work" without details)
- [ ] Limitations are acknowledged proactively (not buried or omitted)
- [ ] Speculation is clearly labeled as such ("We speculate that...", "A possible explanation is...")
- [ ] Alternative explanations are considered for key findings
- [ ] Practical implications are concrete (not "more research is needed")
- [ ] The discussion connects back to the research questions stated in the introduction

---

## Tone Calibration

*Check that the language is appropriately calibrated*

| Overconfident ❌ | Balanced ✅ | Undermining ❌ |
|-----------------|-------------|----------------|
| "Our results prove..." | "Our results suggest..." | "Our results might possibly indicate..." |
| "We have solved..." | "We have addressed..." | "We have partially attempted to address..." |
| "There are no limitations" | "The main limitations are..." | "This work is deeply flawed because..." |
| "This changes everything" | "This advances the field by..." | "This is a small contribution that..." |

---

## Common Reviewer Critiques

*Preempt these in the discussion*

| Critique | Preemptive Strategy |
|-----------|-------------------|
| "Overclaiming" | Use calibrated language; include limitations |
| "Ignoring contradictory evidence" | Address results that don't fit the narrative |
| "Insufficient analysis of failures" | Include error analysis and failure mode discussion |
| "Limitations not acknowledged" | Proactive limitations section |
| "Practical relevance unclear" | Concrete practical implications subsection |
```

## Integration

- **Input from**: Results (from experiments), `state-of-the-art` (literature context), `methodology-designer` (threats to validity)
- **Output to**: `conclusion-writer` (discussion feeds into conclusion), `reviewer` (discussion quality check), `abstract-writer` (key interpretive points)
- Discussion should be written after all results are analyzed and before the conclusion
