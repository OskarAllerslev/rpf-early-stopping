# Research question (draft)

**Working question.** Can the residual-based early stopping rule of Miftachov & Reiß (2025)
be extended to random planted forests (Hiabu, Mammen & Meyer, 2023), and which oracle
inequality / convergence rate does the early-stopped estimator achieve?

## Sub-questions (to refine)
- What is the natural iteration index for a planted forest (number of splits per tree)?
- Does the planted-tree fitting procedure (leaves kept after splitting, backfitting-type
  updates, averaging over trees) still form a projection/regularisation flow? If not, what
  replaces it?
- What role does the interaction bound $r$ (`max_interaction`) play? Is $r = 1$ (additive)
  the tractable first case?
- How should the threshold $\kappa$ be chosen in practice (noise variance estimate)?

## Status
Not yet agreed. Update this file as the question sharpens.
