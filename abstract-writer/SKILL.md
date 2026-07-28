---
name: abstract-writer
description: Writes academic abstracts in multiple styles and formats. Generates structured abstracts, unstructured abstracts, graphical abstract descriptions, and plain-language summaries. Supports venue-specific conventions (IEEE, ACM, Nature, Springer, Elsevier) with appropriate tone, length, and structure. Use when writing an abstract for a paper submission, adapting an abstract for different venues, or creating supplementary summary formats.
---

# Abstract Writer

Generates professional academic abstracts in multiple styles, formats, and venue-specific conventions.

## When to Use

- Writing the abstract for a new paper submission
- Adapting an existing abstract for a different venue with different requirements
- Creating a graphical abstract description for journals that require one
- Writing a plain-language summary for public engagement or funding reports
- Generating multiple abstract variants for co-author discussion

## Input Requirements

1. **Full paper or detailed summary**: The content to abstract
2. **Target venue**: Journal/conference (determines style and length)
3. **Abstract type**: Structured / Unstructured / Both
4. **Word limit**: If specified by the venue (default: 150-250 words)
5. **Key highlights** (optional): Specific results or contributions to emphasize

## Abstract Styles

### IEEE Style
- **Structure**: Unstructured single paragraph
- **Length**: 150-250 words
- **Tone**: Technical, precise, quantitative
- **Emphasis**: Problem, method, quantitative results
- **Keywords**: Included as separate section

### ACM Style
- **Structure**: Unstructured, sometimes with labeled sections
- **Length**: 150-250 words
- **Tone**: Conceptual, emphasizes contribution significance
- **Emphasis**: Problem significance, novel approach, broader implications

### Nature/Science Style
- **Structure**: Unstructured, single paragraph
- **Length**: ~150 words (strict)
- **Tone**: Accessible to broad scientific audience, engaging
- **Emphasis**: The big-picture significance, key finding, implications
- **No**: Technical jargon, acronyms without expansion, citations

### Springer/Elsevier Style
- **Structure**: Often structured (Background, Methods, Results, Conclusions)
- **Length**: 200-300 words
- **Tone**: Formal, comprehensive
- **Emphasis**: Systematic coverage of all paper sections

### Structured Abstract (IMRaD)

```
Background: [Context and motivation — why this matters]
Objective: [What this study aimed to achieve]
Methods: [How the study was conducted, key techniques]
Results: [Main findings with key numbers]
Conclusions: [Interpretation and implications]
```

### Structured Abstract (Other Common Headings)

```
Purpose:
Design/Methodology/Approach:
Findings:
Research Limitations/Implications:
Practical Implications:
Originality/Value:
```

## Output Format

```markdown
# Abstracts for: [Paper Title]

---

## Primary Abstract (Target: [Venue])
*Style: [IEEE/ACM/Nature/...] | Words: [N] | Limit: [N]*

[Abstract text]

---

## Structured Abstract

**Background**: [1-2 sentences]
**Objective**: [1 sentence]
**Methods**: [2-3 sentences]
**Results**: [2-3 sentences with key numbers]
**Conclusions**: [1-2 sentences]

*Total words: [N]*

---

## Alternative Venue Abstracts

### IEEE Format
[Abstract text]
*Words: [N]*

### ACM Format
[Abstract text]
*Words: [N]*

### Nature/Science Format
[Abstract text]
*Words: [N]*

### Springer/Elsevier Format
**Background**: ...
**Methods**: ...
**Results**: ...
**Conclusions**: ...
*Words: [N]*

---

## Graphical Abstract Description
*For journals requiring a graphical abstract — describes what the visual should convey*

**Concept**: [1 sentence core idea]
**Visual elements**: [What to depict]
**Caption**: [Suggested caption text, 1-2 sentences]
**Message**: [What the reader should take away from the visual]

---

## Plain-Language Summary
*For public engagement, press releases, funding reports — accessible to non-specialists*

[2-4 sentences in simple language, no jargon, explaining what was done, why it matters, and what it means for the world]

*Flesch-Kincaid reading level: ~[grade level]*

---

## Abstract Quality Checklist

- [ ] **Problem stated**: Is it clear what problem is being solved?
- [ ] **Novelty clear**: Is what's new immediately apparent?
- [ ] **Method summarized**: Is the approach understandable from the abstract alone?
- [ ] **Results quantified**: Are key numbers included (not just "improves performance")?
- [ ] **Implications stated**: Does it say why these results matter?
- [ ] **No citations**: Abstracts rarely include references (venue-dependent)
- [ ] **No undefined acronyms**: All acronyms expanded on first use
- [ ] **Self-contained**: Can the abstract stand alone without the paper?
- [ ] **Word limit**: Within the venue's limit
- [ ] **No promises**: Avoids "will be discussed", "is described" — use past/present tense

---

## SEO Keywords List
*Terms that should appear in the abstract for academic database discoverability*

[Keyword 1], [Keyword 2], [Keyword 3], [Keyword 4], [Keyword 5]
```

## Writing Principles

1. **Lead with the problem, not the solution**: Establish why the reader should care
2. **Be specific, not vague**: "Achieves 23% improvement on benchmark X" not "shows promising results"
3. **One abstract, one story**: Don't try to cover every finding — focus on the main narrative
4. **Match venue tone**: Read 5 abstracts from the target venue and match their style
5. **Write, then cut**: Draft long, then cut to the word limit by removing weaker sentences
6. **Avoid**: "This paper presents...", "In this work, we..." (overused openers — vary sentence structure)
7. **No hype**: "Revolutionary", "novel", "state-of-the-art" — let results speak

## Integration

- **Input from**: `title-generator` (title sets context), `paper-outline` (structure), full paper text
- **Output to**: `journal-selector` (abstract helps match to journals), `reviewer` (abstract quality check), `research-manager`
- The abstract should be written near the end of the writing process, after results are clear
