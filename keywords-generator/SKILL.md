---
name: keywords-generator
description: Generates optimized academic keywords for research papers to maximize discoverability. Produces keyword sets aligned with target journal/conference taxonomies, checks keyword coverage of the paper's core topics, and suggests keyword strategies for database indexing, search engine optimization, and reviewer matching systems. Use when finalizing a paper submission or preparing metadata for preprint servers.
---

# Keywords Generator

Generates optimized keyword sets for academic papers to maximize discoverability and proper indexing.

## When to Use

- Finalizing a paper and selecting keywords for submission
- Ensuring the paper reaches the right audience through academic search engines
- Matching keywords to journal/conference subject taxonomies
- Optimizing for reviewer assignment systems (e.g., conference bidding)
- Preparing metadata for arXiv, SSRN, or institutional repositories

## Input Requirements

1. **Paper title and abstract**: Core content to extract keywords from
2. **Target venue**: Journal or conference (to match their keyword taxonomy)
3. **Existing keyword candidates** (optional): Keywords the authors are considering
4. **Target audience**: Specific sub-communities to reach

## Keyword Strategy

Effective keywords serve four distinct purposes:

| Purpose | Description | Example |
|---------|-------------|---------|
| **Indexing** | Match paper to database categories | ACM CCS → "Computing methodologies → Machine learning" |
| **Discovery** | Help researchers find the paper via search | "graph neural networks", "node classification" |
| **Reviewer matching** | Route to appropriate reviewers | Specific enough for domain experts |
| **Trend alignment** | Signal relevance to current research trends | Current hot topics in the field |

## Keyword Selection Methodology

### Step 1: Extract Candidate Keywords

From the paper, extract terms at multiple levels:

- **Problem domain**: What area does this belong to?
- **Method/technique**: What is the approach called?
- **Task**: What specific task is addressed?
- **Data type**: What kind of data is used?
- **Application area**: Where is this applied?
- **Theoretical foundation**: What theory underpins the work?

### Step 2: Keyword Tier Classification

| Tier | Type | Count | Description | Examples |
|------|------|-------|-------------|----------|
| **Tier 1** | Core domain | 2-3 | The broad research area | "Machine Learning", "Computer Vision" |
| **Tier 2** | Specific technique | 2-3 | The method used | "Graph Neural Networks", "Contrastive Learning" |
| **Tier 3** | Task/problem | 1-2 | What is being solved | "Node Classification", "Link Prediction" |
| **Tier 4** | Distinctive | 1-2 | Terms unique to this paper | Proposed method name, novel problem variant |

### Step 3: Venue Taxonomy Matching

Map keywords to the target venue's official taxonomy:

- **ACM CCS**: [ACM Computing Classification System](https://dl.acm.org/ccs)
- **IEEE**: IEEE Thesaurus terms
- **Elsevier**: Scopus subject areas
- **arXiv**: arxiv.org subject classifications
- **MSC**: Mathematics Subject Classification (for math-heavy papers)

### Step 4: Keyword Evaluation

Score candidate keywords:

| Criterion | Good Keyword | Poor Keyword |
|-----------|-------------|--------------|
| **Specificity** | "Variational Autoencoders" | "Deep Learning" (too broad) |
| **Search volume** | Terms researchers actually search for | Obscure or non-standard terms |
| **Disambiguation** | "Transformer (attention mechanism)" | "Transformer" (ambiguous) |
| **Longevity** | Terms that will remain relevant | Ephemeral buzzwords |
| **Venue alignment** | Matches venue's keyword tradition | Terms the venue never uses |

## Output Format

```markdown
# Keyword Proposals: [Paper Title]
*Target Venue: [Journal/Conference] | Max Keywords: [N]*

---

## Recommended Keyword Set

**Primary Keywords** (for submission form):
1. [Keyword 1]
2. [Keyword 2]
3. [Keyword 3]
4. [Keyword 4]
5. [Keyword 5]
6. [Keyword 6]
7. [Keyword 7]
8. [Keyword 8]

---

## Keyword Strategy Breakdown

### Tier 1: Core Domain (2-3 keywords)
*These place the paper in its broad research area*

| Keyword | Rationale | Search Volume | Competition |
|---------|-----------|---------------|-------------|
| [Term] | Why this captures the domain | High/Med/Low | High/Med/Low |

### Tier 2: Specific Technique (2-3 keywords)
*These help domain experts find the paper*

| Keyword | Rationale |
|---------|-----------|
| [Term] | ... |

### Tier 3: Task/Problem (1-2 keywords)
*These connect to researchers working on the same problem*

| Keyword | Rationale |
|---------|-----------|
| [Term] | ... |

### Tier 4: Distinctive Terms (1-2 keywords)
*These are unique to this paper and establish a searchable identity*

| Keyword | Rationale |
|---------|-----------|
| [Term] | ... |

---

## Venue Taxonomy Mapping

| Our Keyword | [Venue] Taxonomy Term | Match Type |
|-------------|----------------------|------------|
| [Keyword] | [Closest taxonomy category] | Exact / Close / None |

### Missing Taxonomy Coverage
*Topics in our paper not well covered by the venue's taxonomy*

- [Topic]: [Suggested taxonomy term to request or closest approximation]

---

## Alternative Keyword Sets

### Minimal Set (5 keywords)
*For venues with strict limits*

1. ...
2. ...
3. ...
4. ...
5. ...

### Expanded Set (10+ keywords)
*For preprint servers and personal websites*

1-10. ...

---

## Keyword Quality Checklist

- [ ] **No duplication**: Each keyword adds new information
- [ ] **No title repetition**: Keywords complement the title, not repeat it
- [ ] **No overly broad terms**: "Computer Science" is useless as a keyword
- [ ] **No overly narrow terms**: Terms only 5 people would search for
- [ ] **Acronyms expanded**: Include both acronym and full form: "GNN (Graph Neural Network)"
- [ ] **Venue taxonomy alignment**: At least 60% of keywords map to venue categories
- [ ] **Competitor paper alignment**: Keywords overlap with top papers in the field (good for discoverability)
- [ ] **Avoid stop words**: Most databases ignore common words

---

## Keywords to Avoid

| Keyword | Reason to Avoid |
|---------|-----------------|
| [Term] | Too generic — millions of results |
| [Term] | Not a standard term in this field |
| [Term] | Already fully covered by another keyword |

---

## Search Optimization Tips

1. **Use the exact phrasing** researchers type into search engines
2. **Include both acronym and full term** to catch both search patterns
3. **Front-load important terms** in the abstract (not just keywords section)
4. **Match reviewer assignment keywords** for conferences with bidding systems
5. **Check competitor keywords**: What keywords do the top 5 papers in your area use?
```

## Quality Criteria

- Keywords must be specific enough to distinguish the paper from thousands of others
- Venue taxonomy mapping should be verified — don't guess
- Consider what a reviewer would search for when looking for papers to review
- Balance between following trends (for visibility) and being precise (for accuracy)
- Keywords should be terms the community actually uses (not invented terminology)

## Integration

- **Input from**: `title-generator` (title), `abstract-writer` (abstract), `literature-discovery` (field terminology)
- **Output to**: `journal-selector` (keywords help match to journal scope), `research-manager`
- Keywords should be finalized after the abstract is written
