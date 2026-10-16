# Early stopping for Random Planted Forests

Research project on data-driven early stopping rules for random planted forests
(Hiabu, Mammen & Meyer, 2023), building on the early-stopping theory for regression
trees of Miftachov & Reiß (2025).

Contributors: Oskar Allerslev, Markus Baltzer.

## Core references
- Hiabu, Mammen, Meyer. *Random Planted Forest: A Directly Interpretable Tree Ensemble.* [arXiv:2012.14563](https://arxiv.org/abs/2012.14563)
- Miftachov, Reiß. *Early Stopping for Regression Trees.* [arXiv:2502.04709](https://arxiv.org/abs/2502.04709)

The PDFs are not committed (arXiv license). Download them into `literature/pdf/`, which is git-ignored.

## Repository layout

| Folder | Purpose |
|---|---|
| `plan/` | What we are doing: research question, shared notation, dated log |
| `literature/` | Structured summaries of the papers and `references.bib` |
| `learning/` | Background notes and exercises to get us up to speed |
| `proofs/` | The theory: one folder per claim, tracked in `proofs/STATUS.md` |
| `rpfstop/` | Our R package: early-stopping methods for random planted forests |
| `experiments/` | Simulation studies using `rpfstop`, one folder per study |
| `paper/` | The LaTeX write-up |
| `.claude/` | Claude Code agents and slash commands |

## Workflow

### 1. Claims
Every result we want to prove is a **claim** with its own folder in `proofs/`.
A claim moves through these statuses, recorded in `proofs/STATUS.md`:

| Status | Meaning |
|---|---|
| `open` | Statement written in `claim.md` |
| `attempted` | At least one `attempt-*.md` exists |
| `reviewed` | A referee review found no fatal error in some attempt |
| `checked` | The key inequalities hold numerically (`check.R`) |
| `understood` | One of us can explain the proof without notes |

Only `understood` claims go into `paper/`. A proof is never considered done just
because it looks convincing.

### 2. Starting a new claim
1. Copy `proofs/_template/` to `proofs/CXX-short-name/` (or run `/new-claim`).
2. Fill in `claim.md`: precise statement, assumptions, which claims it depends on.
3. Add a row to `proofs/STATUS.md`.

### 3. Attempts and reviews
- Each proof attempt is its own file: `attempt-A.md`, `attempt-B.md`, ...
  Write each attempt in a fresh session, ideally with a different strategy, so the
  attempts are independent (`/attempt CXX`). Keep failed attempts; they document what doesn't work.
- Each attempt gets a review in another fresh session, `review-A.md`, written by a
  referee whose job is to find errors (`/review CXX A`).
- `check.R` tests the key inequalities of a proof numerically on simulated data.

### 4. Experiments before proofs
Before investing in a proof, check in `experiments/` that the claim is plausible
in simulations. If simulations contradict it, revise or drop the claim.

### 5. Log
After each work session, add a short dated entry at the top of `plan/log.md`:
what was done, what was decided, what's next (`/log` drafts it). Read the log
first when you come back to the project.

## Claude Code
- `CLAUDE.md` holds the project rules Claude follows in every session.
- Agents (`.claude/agents/`): `prover`, `referee`, `numerics-checker`, `explainer`.
- Commands (`.claude/commands/`): `/new-claim`, `/attempt`, `/review`, `/log`.
- Use Opus for proofs and reviews (`/model opus`).

## R package
```r
# randomPlantedForest is not on CRAN; R-universe has a prebuilt binary (no Rtools needed)
install.packages("randomPlantedForest",
                 repos = c("https://plantedml.r-universe.dev", "https://cloud.r-project.org"))
# install.packages("devtools")
devtools::install("rpfstop")
devtools::test("rpfstop")
```

## Paper
```sh
cd paper
latexmk -pdf main.tex
```
