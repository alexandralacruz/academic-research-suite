---
name: journal-selector
description: Matches a research paper to suitable target journals based on scope, quartile, impact factor, acceptance scope, and fit. Analyzes the paper's topic, methodology, contribution type, and quality level against journal profiles. Produces ranked recommendations with rationale, submission strategy (primary + backup journals), and open access considerations. Use when deciding where to submit a completed or nearly completed paper.
---

# Journal Selector

Systematic matching of research papers to suitable publication venues.

## When to Use

- Deciding where to submit a completed paper
- Choosing between multiple candidate journals
- Planning a submission strategy (primary target + backups)
- Understanding the competitiveness and expectations of target venues
- Avoiding desk rejection by submitting to appropriate venues
- Evaluating open access vs. subscription journal trade-offs

## Input Requirements

1. **Paper summary**: Title, abstract, keywords, contribution type
2. **Paper quality self-assessment**: Honest evaluation of contribution strength
3. **Field/domain**: Primary and secondary research areas
4. **Constraints**: Time to publication, open access requirements, funding for APCs, career stage
5. **Preferred journals** (optional): Journals the authors are already considering
6. **Previous rejections** (if any): Journals that have already rejected this paper

## Journal Evaluation Framework

### Dimension 1: Scope Fit

How well does the paper match the journal's stated scope?

- **Perfect fit**: Paper squarely in the journal's core area
- **Good fit**: Paper is in an area the journal regularly publishes
- **Marginal fit**: Paper touches on areas the journal occasionally covers
- **Poor fit**: Paper is outside the journal's typical scope (→ likely desk rejection)

### Dimension 2: Quality Match

Is the paper at the right level for this journal?

- **Contribution level**: Incremental improvement vs. significant advance vs. breakthrough
- **Methodological rigor**: Does the paper meet the journal's standards?
- **Evaluation comprehensiveness**: Does the experimental validation match journal expectations?
- **Novelty expectation**: Journal's typical novelty bar

### Dimension 3: Practical Factors

| Factor | Consideration |
|--------|---------------|
| **Quartile** | Q1 (top 25%), Q2 (25-50%), Q3 (50-75%), Q4 (75-100%) |
| **Impact Factor** | Journal-level metric (consider field-normalized) |
| **Acceptance rate** | Rough indicator of competitiveness |
| **Review time** | Average weeks from submission to first decision |
| **Publication time** | Weeks from acceptance to publication (online/print) |
| **APC (Article Processing Charge)** | For open access journals and hybrid OA options |
| **Open Access options** | Green OA (self-archive), Gold OA (author pays), Hybrid, Diamond (free OA) |
| **Indexing** | Scopus, Web of Science, PubMed, DBLP, etc. |
| **Special issues** | Any upcoming special issues relevant to the paper? |

### Dimension 4: Strategic Fit

- **Career impact**: Is this journal valued in the researcher's career stage/context?
- **Audience reach**: Does this journal reach the right readers?
- **Citation potential**: Do papers in this journal get cited in this field?
- **Competitor presence**: Do leading researchers in this area publish here?

## Output Format

```markdown
# Journal Recommendations: [Paper Title]

---

## Top Recommendation

### 🥇 Primary Target: [Journal Name]

| Attribute | Detail |
|-----------|--------|
| **Publisher** | [Elsevier/Springer/ACM/IEEE/MDPI/...] |
| **Quartile** | Q[N] |
| **Impact Factor** | [X.X] |
| **Acceptance Rate** | ~[X]% |
| **Review Time** | ~[N] weeks to first decision |
| **APC** | $[X] (or free/diamond OA) |
| **OA Options** | [Gold / Green / Hybrid / Diamond] |
| **Indexing** | [Scopus, WoS, etc.] |

**Why this journal**:
- **Scope fit**: [Why the paper matches this journal's scope — be specific]
- **Quality match**: [Why the contribution level is appropriate]
- **Recent similar papers**: [2-3 examples of similar papers published here recently]
- **Risk assessment**: [Probability of desk rejection, competitiveness]

---

## Ranked Recommendations

| Rank | Journal | Q | IF | Scope Fit | Quality Match | Review Time | APC | Recommendation |
|------|---------|---|----|-----------|---------------|-------------|-----|----------------|
| 1 | [Journal] | Q[N] | [X.X] | Excellent | Good | [N] wk | $[X] | 🥇 Primary |
| 2 | [Journal] | Q[N] | [X.X] | Good | Good | [N] wk | $[X] | 🥈 First backup |
| 3 | [Journal] | Q[N] | [X.X] | Good | Fair | [N] wk | $[X] | 🥉 Second backup |
| 4 | [Journal] | Q[N] | [X.X] | Fair | Good | [N] wk | $[X] | Consider |
| 5 | [Journal] | Q[N] | [X.X] | Fair | Fair | [N] wk | $[X] | Fallback |

---

## Submission Strategy

### Tiered Approach

```
Attempt 1: [Primary Target] — Highest impact, competitive
    ↓ If rejected
Attempt 2: [First Backup] — Strong fit, slightly lower impact
    ↓ If rejected
Attempt 3: [Second Backup] — Solid fit, more accessible
    ↓ If rejected
Attempt 4: [Fallback] — Safe option, lower impact
```

**Strategy notes**:
- [Any special considerations, e.g., upcoming special issues, known editor preferences]
- [Time sensitivity considerations]
- [Whether to consider fast-track options]

---

## Detailed Journal Profiles

### [Journal 1]: [Full Name]

**Scope Description**: [Summary of journal's aims and scope]
**Typical Papers**: [What kind of papers does this journal publish? — methods, applications, surveys, etc.]
**Contribution Expectation**: [What level of novelty/significance is expected]
**Methodological Standards**: [What level of rigor is expected in experiments]
**Recent Relevant Publications**:
1. [Paper title] ([Year]) — [Why it's similar to our paper]
2. [Paper title] ([Year])
3. [Paper title] ([Year])

**Fit Assessment**:
- ✅ **Strengths of fit**: [What aligns well]
- ⚠️ **Fit concerns**: [What might be marginal or problematic]
- 📊 **Competitiveness**: [How our paper compares to typical publications here]

### [Journal 2]: [Full Name]
...

---

## Scope Fit Analysis

*How well does the paper's content match each journal's scope?*

| Journal | Core Topic Match | Method Match | Contribution Type Match | Overall Fit |
|---------|-----------------|--------------|------------------------|-------------|
| [J1] | ✅ / ⚠️ / ❌ | ✅ / ⚠️ / ❌ | ✅ / ⚠️ / ❌ | Excellent / Good / Fair / Poor |
| [J2] | ... | ... | ... | ... |

---

## Desk Rejection Risk Assessment

*Factors that commonly lead to desk rejection*

| Risk Factor | [Journal 1] | [Journal 2] | [Journal 3] |
|-------------|-------------|-------------|-------------|
| Scope mismatch | Low/Med/High | ... | ... |
| Novelty insufficient | Low/Med/High | ... | ... |
| Methodological weakness | Low/Med/High | ... | ... |
| Length/page limit issues | Low/Med/High | ... | ... |
| Formatting non-compliance | Low/Med/High | ... | ... |
| **Overall desk rejection risk** | [X]% | [X]% | [X]% |

---

## Open Access Considerations

| Journal | OA Model | APC (USD) | Waiver Available? | Green OA Allowed? | Embargo Period |
|---------|----------|-----------|-------------------|-------------------|----------------|
| [J1] | Gold/Hybrid/Diamond | $[X] | Yes/No | Yes/No | [N] months |
| [J2] | ... | ... | ... | ... | ... |

**OA Strategy**: [Recommendation based on funding, institutional requirements, and personal preference]

---

## Journals to Avoid

*Journals considered but NOT recommended*

| Journal | Reason to Avoid |
|---------|-----------------|
| [Journal] | Scope too broad / too narrow / desk rejection likely / predatory indicators / excessive APC / excessively long review times |
| [Journal] | ... |

---

## Timeline Estimate

| Stage | [Journal 1] | [Journal 2] |
|-------|-------------|-------------|
| Formatting + Submission | [N] days | [N] days |
| Editorial screening | [N] weeks | [N] weeks |
| Review | [N] weeks | [N] weeks |
| Revision (if major) | [N] weeks | [N] weeks |
| Re-review (if major) | [N] weeks | [N] weeks |
| Acceptance to online | [N] weeks | [N] weeks |
| Acceptance to print | [N] months | [N] months |
| **Total (optimistic)** | **[N] months** | **[N] months** |

---

## Final Recommendation

**[Journal Name]**

**Rationale summary**: [3-5 sentences justifying the final choice]

**Action items**:
- [ ] Read 5 recent papers from this journal to calibrate expectations
- [ ] Check formatting requirements (template, length, reference style)
- [ ] Review recent editorial board for potential conflicts of interest
- [ ] Check if a special issue relevant to this paper is upcoming
- [ ] Prepare cover letter highlighting fit with this journal
```

## Important Caveats

- **Journal metrics change**: Impact factors and quartiles are updated annually
- **Scope evolves**: Journals shift focus over time — check recent issues
- **APCs change**: Verify current pricing on journal websites
- **Review times vary**: Averages don't guarantee your experience
- **Predatory journals**: Be vigilant. Warning signs include: unsolicited email invitations, fake editorial boards, no proper peer review process, missing from reputable indexes
- **This skill provides guidance, not certainty**: Final decision should involve human judgment and consultation with colleagues

## Integration

- **Input from**: `abstract-writer` (abstract), `keywords-generator` (keywords for scope matching), `novelty-analysis` (contribution strength self-assessment)
- **Output to**: `research-manager` (as part of the paper preparation pipeline)
- Journal selection should happen after the paper is substantially complete, before submission-ready formatting
