---
name: literature-discovery
description: Discovers and maps scientific literature for a research topic. Searches recent publications (configurable 5-10 year window), prioritizes Q1/Q2 journals and top conferences, identifies seminal papers, groups by research clusters, detects trends, and maps leading authors, institutions, datasets, tools, and evaluation metrics. Use when starting a new research project, conducting a systematic literature review, or exploring a new research domain.
---

# Literature Discovery

Systematic literature discovery and research landscape mapping for academic research.

## When to Use

- Starting a new research project and need to understand the field
- Conducting a systematic literature review
- Exploring a new research domain before committing to a direction
- Preparing the foundation for a State of the Art analysis
- Identifying potential collaborators, datasets, or benchmarks

## Input Requirements

Collect from the researcher before proceeding:

1. **Research topic/domain**: Precise description of the area
2. **Time window**: Publication years to include (default: last 7 years, configurable 5-10)
3. **Quality threshold**: Minimum journal/conference tier (default: Q1-Q2, Q3 optional)
4. **Subfields of interest**: Specific aspects to focus on (optional)
5. **Known seminal papers**: Starting points the researcher already knows (optional)

## Methodology

### Phase 1: Broad Search Strategy

1. Define search queries systematically:
   - Core terms and synonyms for the research domain
   - Boolean combinations (AND, OR, NOT)
   - Field-specific searches (title, abstract, keywords)
   - Citation-based forward/backward search from known seminal papers

2. Source hierarchy (in priority order):
   - **Tier 1**: Top journals (Q1, high impact factor) and A*/A conferences
   - **Tier 2**: Q2 journals and B+ conferences
   - **Tier 3** (optional): Q3 journals, workshop papers, preprints (clearly labeled as such)
   - **Preprints**: Differentiate clearly (arXiv, SSRN, etc.) — mark with ⚠️ "not yet peer-reviewed"

3. Deduplication and filtering:
   - Remove duplicates across sources
   - Filter by relevance to the specific research question
   - Flag paywalled vs. open access

### Phase 2: Source Evaluation

For each paper, evaluate:

- **Peer review status**: Confirmed peer-reviewed vs. preprint vs. workshop
- **Venue quality**: Journal quartile (Q1-Q4), conference tier (A*, A, B, C), impact factor
- **Citation count**: As proxy for influence (normalize by years since publication)
- **Recency**: Prioritize within the configured time window
- **Methodological rigor**: Experimental design, reproducibility, statistical validity
- **Author/institution track record** in the specific subfield

### Phase 3: Research Landscape Mapping

Organize findings into the following structured output:

## Output Format

```markdown
# Research Landscape: [Topic/Domain]
*Generated: [Date] | Time Window: [Years] | Quality: [Threshold]*

---

## 1. Top Journals
*Most frequent and influential venues in this domain*

| Journal | Quartile | Impact Factor | # Papers | Key Topics |
|---------|----------|---------------|----------|------------|
| ... | Q1 | ... | ... | ... |

## 2. Top Conferences
*When relevant to the domain*

| Conference | Tier | Acceptance Rate | # Papers | Key Topics |
|------------|------|-----------------|----------|------------|
| ... | A* | ... | ... | ... |

## 3. Leading Authors
*Researchers with sustained contributions to this domain*

| Author | Institution | # Publications | H-index | Key Contributions | Active Since |
|--------|-------------|---------------|---------|-------------------|---------------|
| ... | ... | ... | ... | ... | ... |

## 4. Leading Institutions
*Research groups and labs producing significant work*

| Institution | Country | # Publications | Notable Authors | Research Focus |
|-------------|---------|---------------|-----------------|----------------|
| ... | ... | ... | ... | ... |

## 5. Research Clusters
*Major lines of investigation within the domain*

### Cluster 1: [Name]
- **Description**: [2-3 sentences]
- **Key papers**: [3-5 most representative]
- **Methods used**: [List]
- **Datasets**: [List]
- **Maturity**: [Emerging / Growing / Mature / Declining]

### Cluster 2: [Name]
...

## 6. Emerging Trends
*Direction in which the field is moving (last 2-3 years)*

| Trend | Evidence | Momentum | Opportunity Level |
|-------|----------|----------|-------------------|
| ... | [Papers, funding, industry adoption] | High/Med/Low | ... |

## 7. Seminal Papers
*Foundational works that shaped the domain*

| Paper | Year | Citations | Contribution | Why Seminal |
|-------|------|-----------|--------------|-------------|
| ... | ... | ... | ... | ... |

## 8. Key Datasets
*Datasets commonly used for experimentation*

| Dataset | Size | Domain | Task | Availability | Limitations |
|---------|------|--------|------|--------------|-------------|
| ... | ... | ... | ... | Public/Restricted | ... |

## 9. Key Tools & Frameworks
*Software, libraries, platforms used in the domain*

| Tool | Type | Language | License | Adoption | Maturity |
|------|------|----------|---------|----------|----------|
| ... | Library/Framework/Platform | ... | ... | ... | ... |

## 10. Evaluation Metrics
*Standard metrics used to measure performance*

| Metric | Task | Interpretation | Limitations | Prevalence |
|--------|------|----------------|-------------|------------|
| ... | ... | Higher/Lower is better | ... | Universal/Common/Niche |

## 11. Open Problems
*Challenges acknowledged by the community*

- [Problem description with references]
- ...

## 12. Research Opportunities
*Promising directions identified from the landscape*

| Opportunity | Rationale | Difficulty | Impact Potential |
|-------------|-----------|------------|------------------|
| ... | ... | Low/Med/High | ... |

## 13. Search Methodology
*Transparency on how this landscape was built*

- **Search queries used**: [List exact queries]
- **Sources consulted**: [Crossref, Semantic Scholar, DBLP, etc.]
- **Inclusion criteria**: [Explicit criteria]
- **Exclusion criteria**: [Explicit criteria]
- **PRISMA flow**: Papers found → screened → eligible → included
- **Limitations of this search**: [e.g., language bias, database coverage gaps]
```

## Quality Criteria

- Every claim must be supported by specific references
- Clearly distinguish between established consensus and emerging speculation
- Acknowledge limitations of the search methodology
- Mark preprints explicitly: ⚠️ "Not yet peer-reviewed"
- Note when information is inferred rather than confirmed
- Update the landscape when new significant papers emerge

## Integration

This skill produces the foundation for:
- `state-of-the-art`: Synthesizes findings into a narrative section
- `research-gap`: Uses identified open problems to find gaps
- `novelty-analysis`: Compares a new idea against the landscape
- `research-manager`: Orchestrator that chains these skills
