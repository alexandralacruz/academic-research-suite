---
name: related-work
description: Writes a well-structured Related Work section that positions the paper within the existing literature. Synthesizes relevant work into thematic subsections, identifies gaps that motivate the current contribution, and clearly differentiates the proposed work without disparaging others. Unlike state-of-the-art (which is a comprehensive survey), this produces a focused, paper-specific section typically 1-2 pages. Use when writing the related work section of a specific paper.
---

# Related Work Writer

Writes focused, well-structured Related Work sections that effectively position a paper within the literature.

## When to Use

- Writing the Related Work section for a specific paper
- Condensing a comprehensive State of the Art into a paper-appropriate length
- Ensuring the paper clearly differentiates itself from prior work
- Avoiding common Related Work pitfalls (laundry list, insufficient differentiation, missing key citations)

## Input Requirements

1. **Paper's contribution**: What is the specific contribution of this paper?
2. **Literature collection**: Papers relevant to this work (from `literature-discovery` or manual)
3. **State of the Art summary** (optional): From `state-of-the-art` for richer context
4. **Target venue**: Determines length expectations and citation norms
5. **Subsection themes** (optional): How the authors want to organize the section

## Related Work Organization Strategies

### Strategy A: Method-Based Organization
*Group by methodological approach*

```
2. Related Work
  2.1 Approach Family A
  2.2 Approach Family B
  2.3 Approach Family C
  2.4 Positioning of Our Work
```

**Best for**: Papers where the primary contribution is a new method that differs from existing families.

### Strategy B: Problem-Based Organization
*Group by sub-problems addressed*

```
2. Related Work
  2.1 Sub-problem 1
  2.2 Sub-problem 2
  2.3 Sub-problem 3
  2.4 Multi-Task / Joint Approaches
  2.5 Our Contribution
```

**Best for**: Papers addressing a problem with multiple established sub-tasks.

### Strategy C: Chronological + Thematic
*Trace evolution then position*

```
2. Related Work
  2.1 Early Approaches
  2.2 Modern Methods
  2.3 Recent Advances
  2.4 Limitations and Our Contribution
```

**Best for**: Papers in fast-moving fields where showing evolution matters.

### Strategy D: Gap-Focused Organization
*Lead with what's missing*

```
2. Related Work
  2.1 Existing Solutions for [Problem]
  2.2 Approaches to [Related Aspect]
  2.3 Unaddressed Challenges
  2.4 How Our Work Fills the Gap
```

**Best for**: Papers where the gap is as important as the method.

## Writing Principles

### DO ✅

- **Group papers thematically**: "Several approaches have explored [X]. Smith et al. [1] proposed..., while Jones et al. [2] extended this by..."
- **Critique respectfully**: "While [1] achieved strong results, it assumes [condition] which limits its applicability to..."
- **Clearly differentiate**: "In contrast to prior work, our approach [key difference]..."
- **Cite the originators**: Give credit to the first paper that proposed an idea, not the most recent
- **Include recent work**: Show awareness of the current state of the field
- **Be concise**: 1-2 pages typically; each cited paper gets 1-3 sentences
- **Use a summary table**: For 8+ closely related papers, a comparison table is valuable

### DON'T ❌

- **Laundry list**: "Smith [1] did X. Jones [2] did Y. Brown [3] did Z." — no narrative, no synthesis
- **Strawman arguments**: Misrepresenting prior work to make yours look better
- **Disparaging language**: "Smith et al. failed to consider..." → "Smith et al. did not address..."
- **Missing key citations**: Especially the most similar work to yours (reviewers will notice)
- **Citing without reading**: Don't cite papers based on their abstract alone
- **Over-citing**: 50+ references in a 1-page related work section dilutes focus
- **Under-citing the competition**: Cite the strongest competitors and differentiate convincingly

## Output Format

```markdown
# Related Work Section: [Paper Title]

---

## Section Structure

**Organization Strategy**: [Method-Based / Problem-Based / Chronological / Gap-Focused]

| Subsection | Papers | Key Argument |
|------------|--------|--------------|
| 2.1 [Title] | [N] | [What this subsection establishes] |
| 2.2 [Title] | [N] | ... |
| 2.3 Differentiation | — | [How we are different] |

---

## Draft: Related Work Section

### 2. Related Work

*[Optional: 1-2 sentence overview of how the section is organized]*

#### 2.1 [Subsection Title]

[Paragraph synthesizing papers in this group. Include: what has been done, key results, common limitations.]

> Papers covered: [1], [2], [3], [4], [5]

#### 2.2 [Subsection Title]

[Paragraph synthesizing papers in this group.]

> Papers covered: [6], [7], [8], [9]

#### 2.3 [Subsection Title]

[Paragraph]

> Papers covered: [10], [11], [12]

#### 2.4 Positioning of Our Work

[1 paragraph that explicitly states what ALL prior work misses and how this paper addresses it.]

> This is the most important paragraph in the section. It must:
> 1. Acknowledge what prior work has achieved
> 2. Identify the specific gap that persists across all approaches
> 3. State concisely how this paper fills that gap
> 4. Preview the key result (optional, but effective)

---

## Differentiation Table (Optional — include for 8+ papers)

| Paper | Approach | Task | Data | Key Limitation | Our Advantage |
|-------|----------|------|------|----------------|---------------|
| [1] | [Method] | [Task] | [Data] | [Limitation] | [How we improve] |
| [2] | ... | ... | ... | ... | ... |

---

## Citation Coverage Audit

*Ensure all essential references are included*

### Must Cite (Critical)
| Paper | Reason | Cited? |
|-------|--------|--------|
| [Seminal paper] | Established the problem | ✅ |
| [Closest competitor] | Most similar work — reviewers will check | ✅ |
| [SOTA method] | Current best results on main benchmark | ✅ |
| [Dataset paper] | Introduced the dataset being used | ✅ |
| [Recent survey] | Comprehensive overview of the field | ✅ |

### Should Cite (Important)
| Paper | Reason | Cited? |
|-------|--------|--------|
| ... | ... | ✅ / ❌ |

### Could Cite (Optional)
| Paper | Reason | Cited? |
|-------|--------|--------|
| ... | ... | ✅ / ❌ |

---

## Differentiation Strength Check

*How clearly does the text distinguish this paper?*

| Prior Work Weakness | Our Solution | Text Reference |
|--------------------|--------------|----------------|
| [Weakness 1] | [How we address it] | [Line/paragraph] |
| [Weakness 2] | [How we address it] | [Line/paragraph] |
| [Weakness 3] | [How we address it] | [Line/paragraph] |

---

## Self-Citation Check
*If this is not the first paper from this group*

| Our Prior Paper | Relationship | How to Reference |
|----------------|-------------|-----------------|
| [Prior paper] | [This paper extends / This is an application of / This is a different approach from] | [Appropriate framing] |

---

## Common Reviewer Critiques & Preemptive Responses

| Likely Critique | Preemptive Response in Text |
|----------------|---------------------------|
| "Missing [important paper]" | [Ensure it's cited; if intentionally omitted, have a reason] |
| "Insufficient differentiation from [X]" | [Strengthen differentiation paragraph for X] |
| "Related work is a laundry list" | [Restructure with more synthesis, fewer individual paper descriptions] |
| "Too many self-citations" | [Reduce if excessive; justify if essential] |
```

## Integration

- **Input from**: `literature-discovery` (paper collection), `state-of-the-art` (comprehensive synthesis), `novelty-analysis` (differentiation points)
- **Output to**: `reference-checker` (validate citations), `reviewer` (related work quality check)
- This skill produces a focused 1-2 page section, while `state-of-the-art` produces a comprehensive survey
