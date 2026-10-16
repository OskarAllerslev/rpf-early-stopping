# Project: early stopping for random planted forests

Read `README.md` for layout and workflow. Before substantive work, read the latest
entries of `plan/log.md`, plus `plan/question.md` and `plan/notation.md`.

## Mathematics
- Use the notation in `plan/notation.md`. If a new symbol is needed, add it there first.
- Never mark a claim as proved. Claude may set the statuses `open`, `attempted`, `reviewed`
  and `checked`; only the humans set `understood`.
- Show every step. Label any gap, heuristic or unverified step explicitly as **GAP**.
- State all assumptions at the top of an attempt. Be explicit about the probability measure,
  what is conditioned on (design, noise, forest randomness) and which norm is used
  (empirical norm vs. L²).
- When using a result from a paper, cite paper + theorem/lemma number and check that its
  assumptions hold in our setting.
- Attempts and reviews are separate files (`attempt-X.md`, `review-X.md`). Never overwrite
  an existing attempt; create a new letter instead.
- Math in Markdown uses `$...$` and `$$...$$` (GitHub renders it).

## Code
- R package in `rpfstop/`: devtools layout, roxygen2 docs, testthat tests.
  Run `devtools::test("rpfstop")` after changes.
- Experiments go in `experiments/YYYY-MM-DD-short-name/` with a `README.md` stating the
  question, setup and conclusion. Set seeds. Save results, not just plots.
- Write C++ only when profiling shows R is too slow.

## Housekeeping
- Update `proofs/STATUS.md` when a claim's status changes.
- Paper PDFs live in `literature/pdf/` (git-ignored). Never commit them.
