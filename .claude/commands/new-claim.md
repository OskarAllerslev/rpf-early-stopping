---
description: Create a new claim folder in proofs/ from the template
argument-hint: <short-name> <statement in words>
---

Create a new claim from: $ARGUMENTS

1. Pick the next free ID (C01, C02, ...) by looking at `proofs/`.
2. Copy `proofs/_template/claim.md` to `proofs/<ID>-<short-name>/claim.md` (do not copy the
   attempt/review templates).
3. Write a precise mathematical statement in the notation of `plan/notation.md`, with explicit
   assumptions and dependencies. Ask me if the statement is ambiguous.
4. Add a row with status `open` to `proofs/STATUS.md`.
