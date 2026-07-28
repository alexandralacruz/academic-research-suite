---
name: methodology-designer
description: Designs rigorous research methodology sections for academic papers. Helps structure the method description, formalize problem definitions, design experimental protocols, select appropriate baselines and metrics, justify design choices, and plan ablation studies. Ensures reproducibility through detailed implementation specifications. Use when writing the methodology section of a paper, designing experiments, or planning a research project's technical approach.
---

# Methodology Designer

Designs rigorous, reproducible methodology sections for academic papers.

## When to Use

- Writing the methodology/proposed method section of a paper
- Designing experimental protocols before running experiments
- Justifying design choices with principled reasoning
- Ensuring reproducibility through comprehensive documentation
- Planning ablation studies to isolate contribution factors
- Reviewing a methodology for weaknesses before submission

## Input Requirements

1. **Problem description**: What is being solved?
2. **Proposed approach**: High-level description of the method
3. **Key innovation**: What is technically new?
4. **Target venue expectations**: What level of detail does this venue require?
5. **Existing baselines**: Methods to compare against
6. **Available resources**: Data, compute, time constraints

## Methodology Design Framework

### Component 1: Problem Formalization

Define the problem with mathematical precision:

```
- Input space: X = {x | description of valid inputs}
- Output space: Y = {y | description of valid outputs}
- Objective function: f: X → Y (or probability distribution, ranking, etc.)
- Training data (if applicable): D = {(x₁, y₁), ..., (xₙ, yₙ)}
- Assumptions: Explicit list of assumptions made
- Constraints: Real-world constraints that must be satisfied
```

### Component 2: Method Architecture

Describe the approach with increasing levels of detail:

1. **Conceptual overview**: 1 paragraph + 1 diagram explaining the key idea
2. **Pipeline/architecture**: Block diagram showing components and data flow
3. **Component details**: Each component described with math + intuition
4. **Training procedure** (if applicable): Loss function, optimization, hyperparameters
5. **Inference procedure**: How to use the trained model at test time

### Component 3: Design Justification

For each key design choice, answer:

- **What alternatives were considered?**
- **Why was this choice made?** (empirical evidence, theoretical reasoning, practical constraints)
- **What is the expected effect?**
- **What would happen if a different choice was made?**

### Component 4: Experimental Protocol

Design experiments that provide convincing evidence:

| Experiment Type | Purpose | Example |
|----------------|---------|---------|
| **Main comparison** | Show superiority to baselines | SOTA comparison on standard benchmarks |
| **Ablation study** | Prove each component matters | Remove one component at a time |
| **Sensitivity analysis** | Show robustness to hyperparameters | Vary key parameters and plot results |
| **Error analysis** | Understand failure modes | Qualitative examples of successes vs. failures |
| **Generalization test** | Show it works beyond training conditions | Out-of-distribution, different domains |
| **Efficiency study** | Show practical viability | Runtime, memory, FLOPs vs. baselines |
| **Statistical testing** | Rule out chance | t-test, Wilcoxon, bootstrap confidence intervals |

### Component 5: Reproducibility Checklist

Ensure the paper provides everything needed for reproduction:

- [ ] **Code**: Will it be released? URL placeholder?
- [ ] **Data**: Public datasets used? Preprocessing steps documented?
- [ ] **Hyperparameters**: All values specified (not just ranges)
- [ ] **Hardware**: GPU model, CPU, RAM specified
- [ ] **Software**: Library versions, random seeds documented
- [ ] **Evaluation protocol**: Exact metric implementations, number of runs
- [ ] **Statistical details**: Confidence intervals, significance tests, p-value corrections

## Output Format

```markdown
# Methodology Design: [Paper Title]

---

## 1. Problem Formalization

### Notation
| Symbol | Meaning |
|--------|---------|
| [symbol] | [definition] |

### Formal Definition
**Input**: [Formal description of input space]
**Output**: [Formal description of output space]
**Objective**: [Mathematical objective function]
**Assumptions**:
1. [Assumption 1 with justification]
2. [Assumption 2 with justification]
**Constraints**:
1. [Constraint 1]
2. [Constraint 2]

---

## 2. Proposed Method: [Method Name]

### 2.1 Conceptual Overview
[1 paragraph describing the key idea at a high level]

[Placeholder: Figure 1 — Architecture overview diagram]

### 2.2 [Component 1]: [Name]
- **Purpose**: [What this component does]
- **Design**: [Mathematical description with intuition]
- **Justification**: [Why designed this way, alternatives considered]

### 2.3 [Component 2]: [Name]
...

### 2.4 Training Procedure
- **Loss function**: [Formula + intuition for each term]
- **Optimization**: [Optimizer, learning rate schedule, batch size, epochs]
- **Regularization**: [Methods used to prevent overfitting]
- **Initialization**: [How parameters are initialized]

### 2.5 Inference Procedure
[How the model is used at test time]

### 2.6 Complexity Analysis (optional)
| Component | Time Complexity | Space Complexity |
|-----------|----------------|------------------|
| ... | O(...) | O(...) |

---

## 3. Design Rationale

| Design Choice | Alternatives Considered | Chosen Because | Expected Effect |
|---------------|------------------------|----------------|-----------------|
| [Choice 1] | [Alt A, Alt B] | [Reasoning] | [What this achieves] |
| [Choice 2] | ... | ... | ... |

---

## 4. Experimental Design

### 4.1 Research Questions
*Each experiment should answer a specific question*

| RQ# | Question | Experiment | Success Criterion |
|-----|----------|------------|-------------------|
| RQ1 | Does our method outperform SOTA? | Main comparison | Statistically significant improvement |
| RQ2 | Does each component contribute? | Ablation study | Performance drops when component removed |
| RQ3 | Is the method robust to [X]? | Sensitivity analysis | Stable performance across parameter range |
| RQ4 | Where does the method fail? | Error analysis | Identified failure modes |

### 4.2 Datasets
| Dataset | Size | Task | Why Chosen | License |
|---------|------|------|------------|---------|
| ... | ... | ... | ... | ... |

### 4.3 Baselines
| Baseline | Type | Why Included | Expected Performance |
|----------|------|-------------|---------------------|
| [SOTA method 1] | Strong baseline | Current SOTA | Top competitor |
| [Classic method] | Traditional | Show improvement over pre-deep-learning | Lowest bar |
| [Simple baseline] | Sanity check | Show problem is non-trivial | Floor |
| [Our method - X] | Ablation | Isolate component X | Should be worse |

### 4.4 Metrics
| Metric | Formula/Rationale | Why This Metric? | Limitations |
|--------|-------------------|-----------------|-------------|
| ... | ... | ... | ... |

### 4.5 Implementation Details
| Detail | Value |
|--------|-------|
| Framework | PyTorch 2.x / TensorFlow 2.x / JAX |
| GPU | [Model], [VRAM] |
| Random seed | [42 or multiple seeds] |
| Runs per experiment | [N] |
| Statistical test | [t-test / Wilcoxon / bootstrap] |

### 4.6 Ablation Study Design
| Configuration | Description | What It Tests |
|---------------|-------------|---------------|
| Full model | All components | Upper bound |
| - [Component A] | Remove A | Importance of A |
| - [Component B] | Remove B | Importance of B |
| Only [Component A] | Isolated A | Standalone contribution of A |

---

## 5. Threats to Validity

### Internal Validity
- [Could implementation bugs affect results?]
- [Are hyperparameters fairly tuned for baselines?]

### External Validity
- [Do datasets represent real-world conditions?]
- [Would results generalize to other domains?]

### Construct Validity
- [Do metrics capture what we care about?]
- [Are there important aspects not measured?]

### Conclusion Validity
- [Are statistical tests appropriate and correctly applied?]
- [Could results be explained by alternative hypotheses?]

---

## 6. Reproducibility Checklist

- [ ] Code repository URL prepared (private during review)
- [ ] All hyperparameters documented
- [ ] Random seeds specified
- [ ] Hardware and software versions documented
- [ ] Data preprocessing steps fully described
- [ ] Evaluation metric implementations specified
- [ ] Statistical significance testing described
- [ ] README with reproduction instructions drafted

---

## 7. Methodology Section Draft Structure

### [N]. Proposed Method

**[N].1 Problem Formulation**
[Mathematical definition]

**[N].2 Overview**
[Conceptual description + Figure X]

**[N].3 [Component 1]**
[Detailed description]

**[N].4 [Component 2]**
...

**[N].5 Training and Inference**
...

### [N+1]. Experimental Setup
...

### [N+2]. Results
...
```

## Design Principles

1. **Justify don't just describe**: Every design choice needs a reason
2. **Math + Intuition**: Each equation accompanied by plain-language explanation
3. **Reproducibility as first-class concern**: Design experiments to be reproducible from the start
4. **Honest baselines**: Tune baselines fairly; don't handicap them to look better
5. **Negative results are results**: Report what didn't work and why
6. **Ablations prove causality**: Without ablations, can't claim any component matters

## Integration

- **Input from**: `paper-outline` (section plan), `research-gap` (what gap is being addressed), `state-of-the-art` (existing methods to compare against)
- **Output to**: `paper-outline` (detailed methodology section plan), `reviewer` (methodology quality assessment)
- Design the methodology before running experiments (not after!)
