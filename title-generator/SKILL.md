---
name: title-generator
description: Generates compelling, precise academic paper titles that convey novelty and attract readers. Analyzes the paper's contribution to propose multiple title options in different styles (IEEE, ACM, Nature, declarative, descriptive, interrogative), checks for similarity with existing titles, and provides scores for novelty impact, readability, and search engine discoverability. Use when finalizing a paper, preparing a preprint, or needing to choose between candidate titles.
---

# Title Generator

Generates and evaluates academic paper titles optimized for impact, clarity, and discoverability.

## When to Use

- Finalizing a paper and choosing the best title among options
- Ensuring the title accurately reflects the contribution
- Avoiding titles too similar to existing publications
- Optimizing for search engine and academic database discoverability
- Adapting a title to a specific journal/conference style

## Input Requirements

1. **Paper abstract or summary**: What is the paper about?
2. **Key contribution**: What is the primary novelty?
3. **Method/approach name** (if applicable): The name of the proposed method
4. **Target venue**: Journal or conference (influences style conventions)
5. **Existing titles to avoid** (optional): Known similar paper titles
6. **Keywords to include** (optional): Terms that must appear for discoverability

## Title Generation Methodology

### Step 1: Contribution Extraction

From the paper, extract:
- **Core problem**: What problem does this solve?
- **Key insight**: What is the novel idea?
- **Method name**: What is the proposed approach called?
- **Main result**: What is the headline finding?
- **Domain**: What field/application area?

### Step 2: Multi-Style Title Generation

Generate titles in these academic styles:

#### Declarative (states the finding)
> "[Method] Improves [Metric] by [X]% on [Task]"
> Example: "Graph Neural Networks Improve Node Classification Accuracy by 23% on Heterogeneous Graphs"

#### Descriptive (describes the content)
> "[Method]: A [Approach Type] for [Problem]"
> Example: "HetGNN: A Heterogeneous Graph Neural Network for Multi-Relational Node Classification"

#### Interrogative (poses a question — use sparingly)
> "Can [Approach] Solve [Problem]?"
> Example: "Can Attention Mechanisms Replace Recurrent Layers in Sequence Modeling?"

#### Method-focused
> "[Method]: [Brief description of technique]"
> Example: "BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding"

#### Problem-focused
> "Addressing [Problem] via [Key Insight]"
> Example: "Addressing Catastrophic Forgetting in Neural Networks via Elastic Weight Consolidation"

#### Result-focused
> "Achieving [Result] through [Approach]"
> Example: "Achieving Human-Level Performance on ImageNet via Vision Transformers"

#### Two-part (catchy phrase: descriptive subtitle)
> "[Catchy]: [Descriptive]"
> Example: "Attention Is All You Need: Transformer Networks for Sequence-to-Sequence Modeling"

#### Venue-specific styles
- **IEEE**: Technical, precise, often includes method name and quantitative results
- **ACM**: Broader, emphasizes conceptual contributions, often two-part
- **Nature/Science**: Short, punchy, accessible to broad audience, often declarative
- **Springer/Elsevier**: Formal, comprehensive, typically descriptive

### Step 3: Title Evaluation

Score each generated title on:

| Criterion | Scale | Description |
|-----------|-------|-------------|
| **Novelty reflection** | 1-10 | Does the title convey what is new? |
| **Impact projection** | 1-10 | Would the title attract readers at a conference/journal? |
| **Readability** | 1-10 | Is it clear and easy to parse on first read? |
| **Discoverability** | 1-10 | Does it include key search terms for academic databases? |
| **Accuracy** | 1-10 | Does it honestly reflect the paper's content? |
| **Length** | Optimal: 10-20 words | Too short (< 6 words) or too long (> 25 words)? |
| **Venue fit** | 1-10 | Does it match the conventions of the target venue? |

### Step 4: Similarity Check

For each top candidate title:
- Compare against known existing titles in the domain
- Flag high-similarity titles (> 70% word overlap with any single paper)
- Flag titles that could be confused with well-known papers

## Output Format

```markdown
# Title Proposals: [Paper Topic]
*Target Venue: [Journal/Conference] | Generated: [Date]*

---

## Top Recommendation

**[Title]**
- **Style**: [Declarative / Descriptive / Two-part / ...]
- **Why this title**: [2-3 sentences on why this works best]
- **Scores**: Novelty [X/10] | Impact [X/10] | Readability [X/10] | Discoverability [X/10] | Accuracy [X/10]

---

## All Candidates (Ranked)

| # | Title | Style | Novelty | Impact | Readability | SEO | Accuracy | Venue Fit |
|---|-------|-------|---------|--------|-------------|-----|----------|-----------|
| 1 | [Title] | ... | X/10 | X/10 | X/10 | X/10 | X/10 | X/10 |
| 2 | [Title] | ... | ... | ... | ... | ... | ... | ... |
| ... | ... | ... | ... | ... | ... | ... | ... | ... |

---

## Style Variants

### IEEE-Style Titles
1. [Title 1]
2. [Title 2]
3. [Title 3]

### ACM-Style Titles
1. [Title 1]
2. [Title 2]

### Nature/Science-Style Titles
1. [Title 1]
2. [Title 2]

### Two-Part Titles
1. [Catchy Phrase]: [Descriptive Subtitle]
2. [Catchy Phrase]: [Descriptive Subtitle]

---

## ⚠️ Similarity Warnings

*Titles with significant overlap to existing publications*

| Proposed Title | Similar Existing Title | Overlap | Risk |
|----------------|------------------------|---------|------|
| ... | ... | [%] | High/Medium |

---

## Keywords Coverage Analysis

*Do the proposed titles include important search terms?*

| Keyword | In Title 1? | In Title 2? | In Title 3? | Importance |
|---------|-------------|-------------|-------------|------------|
| [Term] | ✅ / ❌ | ✅ / ❌ | ✅ / ❌ | Essential / Recommended |

---

## Title Pitfalls to Avoid

*Common issues and whether they affect these proposals*

- [ ] **Buzzword overload**: Too many trendy terms without substance
- [ ] **Overselling**: Claims stronger than the paper supports
- [ ] **Generic framing**: Could apply to dozens of papers
- [ ] **Acronym-heavy**: Unfamiliar acronyms make titles opaque
- [ ] **Colon overload**: Multiple colons/subtitles feel cluttered
- [ ] **Question titles**: Often weaker than declarative (except in specific venues)

---

## Final Recommendation

**[Chosen title]**

**Justification**: [3-5 sentences explaining the final choice]

**Alternative (close second)**: [Alternative title if the primary is rejected by co-authors or taken]
```

## Quality Guidelines

- Titles must accurately reflect the paper — misleading titles damage credibility
- Avoid clickbait: "Revolutionary New Method..." is almost always inappropriate
- Omit "Novel", "New", "Improved" — let the content imply novelty
- Method name should be memorable but not forced
- Include the problem domain for discoverability
- Keep under 20 words for most venues
- Put the most distinctive terms first
- ⚠️ **Critical limitation**: This skill cannot perform live database searches to check title uniqueness. The similarity check is based on the literature provided. For thorough uniqueness verification, manual database searches (Crossref, Semantic Scholar, Google Scholar) are strongly recommended.

## Integration

- **Input from**: `novelty-analysis` (contribution framing), `literature-discovery` (existing titles to avoid)
- **Output to**: `abstract-writer` (title sets the abstract's opening), `research-manager`
- The title should be generated after the contribution is clearly defined (post `novelty-analysis`)
