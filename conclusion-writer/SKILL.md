---
name: conclusion-writer
description: Writes concise, impactful Conclusion sections for academic papers. Summarizes contributions without verbatim repetition, restates key findings, proposes specific actionable future work directions (not generic ones), and closes with a memorable final statement. Ensures the conclusion works as a standalone summary for readers who skim. Use when finalizing a paper or writing a thesis conclusion chapter.
---

# Conclusion Writer

Writes concise, impactful Conclusion sections that effectively close academic papers.

## When to Use

- Writing the Conclusion section of a research paper
- Ensuring the conclusion stands alone as a summary for skim-readers
- Crafting a memorable closing that reinforces the paper's value
- Generating specific, actionable future work directions
- Writing a thesis conclusion chapter (longer format)

## Input Requirements

1. **Paper's contributions**: What was achieved? (from introduction/abstract)
2. **Key findings**: Most important results (from results/discussion)
3. **Limitations**: What are the boundaries of this work? (from discussion)
4. **Open questions**: What remains unsolved? (from discussion/research-gap)
5. **Target venue**: Determines expected length and tone
6. **Future work ideas** (optional): Directions the authors already have in mind

## Conclusion Structure

### Standard Conclusion (1 page, ~3-5 paragraphs)

```
Paragraph 1: Restate the problem and contribution
  - What problem did you set out to solve?
  - What did you achieve? (1-2 sentences on main contribution)
  - Do NOT copy-paste from introduction — rephrase

Paragraph 2: Summarize key findings
  - 2-4 most important results
  - Include key numbers (quantitative conclusions are stronger)
  - What do these results mean for the field?

Paragraph 3: Future work
  - 2-4 specific, actionable directions
  - NOT "more research is needed" or "future work will improve results"
  - Each direction should be a concrete project someone could pick up

Paragraph 4 (optional): Closing statement
  - Memorable final sentence connecting to broader significance
  - Look forward, not backward
```

## Writing Principles

### DO ✅

- **Be self-contained**: A reader who only reads the abstract + conclusion should get the paper's message
- **Include numbers**: "Improved accuracy by 23%" not "Improved accuracy"
- **Propose specific future work**: "Extending the method to handle streaming data, which would require online adaptation of the attention mechanism" not "Future work will explore other domains"
- **Use present tense for contributions**: "This paper presents..." (the paper still presents it)
- **Match introduction promises**: Every contribution claimed in the intro should appear in the conclusion
- **End strong**: The final sentence should leave a positive impression

### DON'T ❌

- **Copy-paste from abstract or introduction**: Rephrase — avoid verbatim repetition
- **Introduce new information**: Conclusion summarizes previously stated content
- **Make the future work a dumping ground**: Don't list every idea you ever had
- **Use weak future work**: "More experiments are needed", "Future work should investigate other datasets", "This approach could be applied to other problems" — these are applicable to ANY paper
- **End weakly**: "In conclusion, we have presented..." → flat ending
- **Overclaim in the closing**: End with justified confidence, not exaggerated claims

## Future Work Quality

### Weak Future Work (Avoid) ❌

| Weak | Why It's Weak |
|------|---------------|
| "Future work could apply this to other domains." | Vague — applies to any paper |
| "More experiments could be conducted." | Meaningless — always true |
| "The method could be improved." | Obvious — doesn't guide anyone |
| "Different datasets could be tested." | Generic |
| "Hyperparameter tuning could yield better results." | Trivial |
| "Future work will address the limitations." | Lazy — be specific about which limitations and how |

### Strong Future Work (Use) ✅

| Strong | Why It's Strong |
|--------|-----------------|
| "Extending the approach to handle multi-modal inputs would require redesigning the fusion mechanism to accommodate [specific challenge]." | Specific challenge identified |
| "Investigating whether the observed improvement in [X] transfers to [specific related task Y] could reveal fundamental properties of [mechanism]." | Concrete hypothesis |
| "The current approach assumes [assumption]. Relaxing this assumption to handle [specific case] would require [specific technical challenge]." | Clear barrier identified |
| "Combining this method with [specific other method] could address the complementary limitation of [specific limitation]." | Concrete combination proposed |
| "Developing a theoretical framework to explain [observed empirical phenomenon] would strengthen the foundation of this line of work." | Identifies a knowledge gap |

## Output Format

```markdown
# Conclusion Section: [Paper Title]

---

## Draft: Conclusion

### [N]. Conclusion

[Paragraph 1: Problem + Contribution]
> This paper addressed the problem of [problem statement]. We presented [method name], a [brief description of approach] that [key innovation]. Through extensive experiments on [datasets/tasks], we demonstrated that [headline result with numbers].

[Paragraph 2: Key Findings]
> Our results reveal several important findings. First, [finding 1 with evidence and interpretation]. Second, [finding 2]. Third, [finding 3]. These findings indicate that [broader takeaway], which has implications for [field/application area].

[Paragraph 3: Future Work]
> This work opens several promising directions for future investigation:
> 1. **[Direction 1 title]**: [2-3 sentences describing a specific, actionable project]
> 2. **[Direction 2 title]**: [2-3 sentences]
> 3. **[Direction 3 title]**: [2-3 sentences]

[Paragraph 4 (optional): Closing]
> [1-2 sentences connecting to broader significance. End with forward-looking confidence.]

---

## Contribution-Finding Alignment Check

*Does the conclusion reflect what was promised in the introduction?*

| Contribution (from Introduction) | Reflected in Conclusion? | Evidence |
|----------------------------------|-------------------------|----------|
| [Contribution 1] | ✅ / ❌ | [Line/paragraph] |
| [Contribution 2] | ✅ / ❌ | [Line/paragraph] |
| [Contribution 3] | ✅ / ❌ | [Line/paragraph] |

---

## Length and Density Check

| Metric | Value | Recommendation |
|--------|-------|----------------|
| Word count | [N] | Typically 200-500 words |
| Paragraphs | [N] | Typically 3-5 |
| Future work items | [N] | 2-4 specific directions |
| New information introduced | [Y/N] | Should be N |
| Verbatim repetition from intro/abstract | [Y/N] | Should be N |

---

## Future Work Quality Score

| Direction | Specific? | Actionable? | Novel? | Score (3-9) |
|-----------|-----------|-------------|--------|-------------|
| [Direction 1] | Y/N | Y/N | Y/N | [X]/9 |
| [Direction 2] | ... | ... | ... | [X]/9 |
| [Direction 3] | ... | ... | ... | [X]/9 |

*Scoring: 1-3 per criterion. < 6/9 = revise or remove.*

---

## Closing Sentence Strength

| Criterion | Assessment |
|-----------|------------|
| Forward-looking? | ✅ / ❌ |
| Memorable? | ✅ / ❌ |
| Confident but not overclaiming? | ✅ / ❌ |
| Connects to broader significance? | ✅ / ❌ |

---

## Common Conclusion Mistakes

- [ ] **Copying the abstract**: Changed wording? Rephrased? Different emphasis?
- [ ] **Weak future work**: Are all directions specific and actionable?
- [ ] **New information**: Have any new results, methods, or references appeared?
- [ ] **Mismatch with introduction**: Do contributions match 1:1?
- [ ] **Flat ending**: Is the final sentence strong and memorable?
- [ ] **Missing numbers**: Are key results quantified?
- [ ] **Overclaiming**: Is the language appropriately calibrated?
```

## Venue-Specific Notes

| Venue Type | Conclusion Expectations |
|------------|------------------------|
| **Conference (8-10 pages)** | Brief (1/4 to 1/2 page). Future work optional or very short. |
| **Journal (12+ pages)** | Full page. Substantive future work expected. |
| **Thesis** | Chapter-length. Comprehensive synthesis of all contributions. |
| **Short paper / Poster** | 1 short paragraph. May be combined with discussion. |

## Integration

- **Input from**: `discussion-writer` (interpretation + limitations), `abstract-writer` (to ensure distinct phrasing), introduction section
- **Output to**: `reviewer` (conclusion quality check)
- Write the conclusion last, after all other sections are complete
