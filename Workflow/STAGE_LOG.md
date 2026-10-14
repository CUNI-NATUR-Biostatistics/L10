# Stage Log

Use this file as the running history for lesson-production decisions and stage transitions.

## Entry format

| Date | Stage | Status | Key change | Record file | Branch / PR | Reviewer |
|---|---|---|---|---|---|---|
| YYYY-MM-DD | Stage X | started/in review/done | One sentence summary | `Workflow/records/...` | `branch-name` / #PR | Name |

## Current lesson log

| Date | Stage | Status | Key change | Record file | Branch / PR | Reviewer |
|---|---|---|---|---|---|---|
| 2026-10-12 | Stage 0 | done | Scope locked: distribution shape and normality of residuals, scale-preserving versus shape-changing transformations (z-score versus logarithm), and biologically motivated functional forms; skripta is the complete source and the presentation distils it | `Workflow/records/2026-10-12-stage-0-scope.md` | `lesson/l10-scope-data` / PR not opened | Ondřej Mottl |
| 2026-10-12 | Stage 1 | done (provisional) | Ten-example search across seven source families; Galápagos species-area (`faraway::galamiss`) locked with the raw species count kept, reproducible acquisition, provenance, README and release metadata; Coweeta trees declined to avoid repeating L09 | `Workflow/records/2026-10-12-stage-1-dataset.md` | `lesson/l10-scope-data` / PR not opened | Ondřej Mottl |
| 2026-10-12 | Stage 2 | in progress (story map approved by Ondřej Mottl) | 39-block learning-materials story map in five parts (distribution shape, what the linear model assumes, scale versus shape transformations, relationship shape, interpretation) and its knowledge-state ledger, checked against a numerical rerun on the Galápagos data | `Workflow/records/2026-10-12-stage-2-learning-materials.md` | `lesson/l10-skripta` / PR not opened | Ondřej Mottl |
| 2026-10-12 | Stage 3 | in review | Written materials drafted against the approved map (five candidate formulas recorded as a deviation), independent glossary and lesson-vision reviews completed and their findings resolved, HTML and 45-page PDF rendered; awaiting human review | `Workflow/records/2026-10-12-stage-2-learning-materials.md` | `lesson/l10-skripta` / PR not opened | Ondřej Mottl (pending) |
| 2026-10-14 | Stage 3 | done | Written materials approved after human review: callbacks to earlier lessons, residual histogram, earlier-models normality Extra, z-score mean 0 / SD 1, normal-distribution mean and SD with the 68/95/99.7 rule, transformation use cases, and narrative-flow fixes from an independent leakage review | `Workflow/records/2026-10-12-stage-2-learning-materials.md` | `lesson/l10-skripta` / PR not opened | Ondřej Mottl |
