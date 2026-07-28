---
name: reference-checker
description: Validates academic paper references for consistency, completeness, format compliance, and accuracy. Checks that all citations appear in the reference list (and vice versa), verifies reference format matches venue requirements, identifies potential missing citations, flags retracted or dubious references, and checks for DOI availability. Use before submitting a paper to avoid reference-related reviewer criticisms.
---

# Reference Checker

Systematic validation of academic paper references for correctness and completeness.

## When to Use

- Before submitting a paper (final quality check)
- After writing the related work section
- When preparing a camera-ready version
- After restructuring a paper (sections may have moved, citations may be orphaned)
- When adapting a paper to a different venue with different reference format

## Input Requirements

1. **Paper manuscript**: Complete text with all citations
2. **Reference list**: Complete bibliography
3. **Target venue**: Reference style requirements (if known)
4. **Literature collection** (optional): Papers known to be relevant for missing citation check

## Validation Checks

### Check 1: Citation-Reference Consistency

**Every citation in the text must have a corresponding reference. Every reference must be cited in the text.**

| Issue | Description | Example |
|-------|-------------|---------|
| **Orphan citation** | [Author, Year] in text, but not in reference list | "[Smith et al., 2023]" in text, no Smith 2023 in references |
| **Orphan reference** | Entry in reference list never cited | A reference that appears in the bibliography but is never mentioned |
| **Mismatched year** | Citation year differs from reference year | "[Smith et al., 2023]" in text, but reference says "Smith et al. (2024)" |
| **Mismatched author** | Author name differs between citation and reference | "[Smith and Jones, 2023]" but reference says "Smith, J. and Johnson, P." |
| **Et al. ambiguity** | Using "et al." when it's ambiguous which paper | "[Smith et al., 2023]" when there are two Smith et al. papers from 2023 |

### Check 2: Reference Format Compliance

Verify format matches venue requirements:

| Style | Typical Format | Common Venues |
|-------|---------------|---------------|
| **IEEE** | [1] A. Author, "Title," *Journal*, vol., no., pp., Year. | IEEE journals/conferences |
| **ACM** | [1] Author, A. Year. Title. *Journal* Vol, Issue (Year), pages. | ACM conferences, journals |
| **APA** | Author, A. (Year). Title. *Journal*, Vol(Issue), pages. | Social sciences |
| **Vancouver** | [1] Author A. Title. Journal. Year;Vol:pages. | Biomedical |
| **Springer LNCS** | 1. Author, A.: Title. In: *Proceedings*, pp. XX-YY. Year. | CS conference proceedings |
| **Elsevier** | [1] A. Author, Title, Journal Volume (Year) pages. | Elsevier journals |

### Check 3: Reference Completeness

Each reference should include:

- [ ] All authors (or "et al." where appropriate per style)
- [ ] Complete title (not truncated, correctly capitalized)
- [ ] Venue name (journal or conference, not abbreviated incorrectly)
- [ ] Year of publication
- [ ] Volume, issue, page numbers (or article number)
- [ ] DOI (strongly recommended for modern papers)
- [ ] Publisher (if required by style)

### Check 4: DOI Validation

For references with DOIs:
- Is the DOI syntactically valid? (`10.XXXX/...`)
- Does the DOI resolve? (requires external lookup)
- Is the DOI for the correct paper?

### Check 5: Self-Citation Analysis

| Metric | Threshold | Concern |
|--------|-----------|---------|
| Self-citation percentage | > 20% | May raise reviewer concerns |
| Consecutive self-citations | > 3 in a row | Suggests narrow literature awareness |
| Self-citation clustering | All in one section | Consider distributing if appropriate |

### Check 6: Missing Citation Detection

Based on the literature provided, identify:

- **Seminal papers** in the field not cited
- **State-of-the-art methods** not compared to or cited
- **Recent relevant work** (last 1-2 years) that should be acknowledged
- **Papers that introduced datasets** being used
- **Similar approaches** that a reviewer would expect to see cited

### Check 7: Retracted or Problematic References

Flag if any references:
- Are known to be retracted
- Appear on retraction watchlists
- Come from potentially predatory journals
- Are from discredited authors (use with extreme caution — focus on the work, not the author)

### Check 8: Reference Age Distribution

| Age | Percentage | Assessment |
|-----|-----------|------------|
| Last 2 years | [X]% | Should be substantial for active fields |
| 2-5 years | [X]% | Core of recent literature |
| 5-10 years | [X]% | Foundational and established work |
| > 10 years | [X]% | Should be mostly seminal/classic papers |
| > 20 years | [X]% | Only true classics should appear |

## Output Format

```markdown
# Reference Check: [Paper Title]
*Target Venue: [Journal/Conference] | Style: [IEEE/ACM/...]*

---

## Executive Summary

| Metric | Value | Status |
|--------|-------|--------|
| Total citations in text | [N] | — |
| Total references in list | [N] | — |
| Orphan citations | [N] | ✅ / ⚠️ / 🔴 |
| Orphan references | [N] | ✅ / ⚠️ / 🔴 |
| Format errors | [N] | ✅ / ⚠️ / 🔴 |
| Incomplete references | [N] | ✅ / ⚠️ / 🔴 |
| Self-citation % | [X]% | ✅ / ⚠️ |
| References without DOI | [N] | ⚠️ |
| Potential missing citations | [N] | ⚠️ |
| **Overall health** | — | **✅ / ⚠️ / 🔴** |

---

## 1. Citation-Reference Consistency

### Orphan Citations (in text, not in references)
| Location | Citation | Issue |
|----------|----------|-------|
| [Section, para] | "[Author, Year]" | Not found in reference list |

*✅ No orphan citations found — or — 🔴 [N] issues to fix*

### Orphan References (in list, not in text)
| Reference | Issue |
|-----------|-------|
| [Ref #] [Author, Year, Title] | Not cited anywhere in the text |

*✅ No orphan references found — or — 🔴 [N] issues to fix*

### Year/Author Mismatches
| Citation in Text | Reference in List | Discrepancy |
|-----------------|-------------------|-------------|
| "[Author, Year]" | [Ref #] [Author, Different Year] | Year differs |
| "[Author A and Author B, Year]" | [Ref #] [Author A and Author C, Year] | Author name differs |

---

## 2. Format Compliance

*Style: [IEEE/ACM/APA/...]*

| Ref # | Issue | Current | Expected |
|-------|-------|---------|----------|
| [N] | [Missing element / Wrong order / Wrong punctuation] | "[current format]" | "[expected format]" |
| [N] | ... | ... | ... |

---

## 3. Reference Completeness

| Ref # | Missing Element | Current | Recommendation |
|-------|-----------------|---------|----------------|
| [N] | DOI | — | Add DOI: [suggested DOI if findable] |
| [N] | Page numbers | — | Add specific pages |
| [N] | Volume/Issue | — | Add volume and issue |
| [N] | All authors | "Smith et al." | List all authors (or verify et al. appropriate per style) |

---

## 4. DOI Report

| Ref # | DOI | Valid Syntax? | Resolves? |
|-------|-----|---------------|-----------|
| [N] | [DOI] | ✅ / ❌ | ✅ / ❌ / Unknown |
| [N] | — (missing) | — | ⚠️ Add DOI |

---

## 5. Self-Citation Analysis

| Self-Citations | [N] out of [N] total | [X]% |
|----------------|----------------------|-------|

**Self-cited papers**:
1. [Ref #] [Paper] — [Relationship to current work]
2. ...

**Assessment**: [Within normal range / Borderline high / Excessive — consider reducing]

---

## 6. Potential Missing Citations

*Based on the paper's topic and the literature collection provided*

| Paper | Reason It Should Be Cited | Urgency |
|-------|--------------------------|---------|
| [Paper] | Seminal work in this area | 🔴 High |
| [Paper] | Most similar prior work — reviewer will notice | 🔴 High |
| [Paper] | Recent SOTA method on same benchmark | 🟠 Medium |
| [Paper] | Introduced the dataset being used | 🟠 Medium |
| [Paper] | Recently published (last 6 months) | 🟡 Low |

---

## 7. Reference Age Distribution

```
Last 2 years:   [████████░░] [X]%
2-5 years:      [██████░░░░] [X]%
5-10 years:     [████░░░░░░] [X]%
10-20 years:    [███░░░░░░░] [X]%
> 20 years:     [█░░░░░░░░░] [X]%
```

**Assessment**: [Healthy distribution / Too few recent references / Over-reliance on old references / Too few seminal works]

---

## 8. Formatting Issues (Non-Style-Specific)

| Ref # | Issue | Recommendation |
|-------|-------|----------------|
| [N] | Inconsistent capitalization in title | Standardize to sentence case or title case |
| [N] | Journal name abbreviated inconsistently | Use standard abbreviation throughout |
| [N] | URL/access date for online resource missing | Add retrieval date and URL |
| [N] | "To appear" / "In press" without update | Check if now published; update reference |
| [N] | Preprint cited as published | Verify publication status; mark as preprint if still not published |

---

## 9. Reference List Ordering

- [ ] References numbered in order of appearance (IEEE, Vancouver styles)
- [ ] References alphabetical by first author surname (APA, ACM, Harvard styles)
- [ ] No duplicate references (same paper listed twice)
- [ ] No gaps in numbering (if numbered style)

**Issues found**: [List or "✅ Correctly ordered"]

---

## 10. Quick Fixes Summary

| Priority | Action | Ref # |
|----------|--------|-------|
| 🔴 Critical | [Fix] | [Refs] |
| 🟠 Important | [Fix] | [Refs] |
| 🟡 Minor | [Fix] | [Refs] |

---

## Final Checklist Before Submission

- [ ] All citations resolve to references ✓
- [ ] All references cited at least once ✓
- [ ] Reference format consistent and venue-compliant ✓
- [ ] DOIs included where available ✓
- [ ] No retracted or dubious references ✓
- [ ] Self-citation percentage acceptable ✓
- [ ] Key papers in the field cited ✓
- [ ] Recent work (last 2 years) adequately represented ✓
- [ ] Reference order correct per style ✓
- [ ] No duplicate references ✓
```

## Important Caveats

- **Missing citation detection is limited** to the literature collection provided to this skill — it cannot search databases
- **DOI resolution** requires external API access (Crossref, etc.) — the skill can flag missing DOIs but may not verify all of them
- **Retraction checking** is limited — for critical work, verify manually on Retraction Watch or publisher sites
- **Self-citation norms vary** by field and career stage — use judgment, not rigid thresholds
- **Reference format rules** vary between and within publishers — always verify against the specific venue's author guidelines

## Integration

- **Input from**: `related-work` (citations in related work section), `literature-discovery` (papers that should be cited), the full manuscript
- **Output to**: `reviewer` (reference check feeds into the references dimension of the review), `research-manager`
- Run this check after all citations are in place, as one of the final steps before submission
