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
| 2026-10-14 | Stage 4 | in progress (story map, PollsLive questions and illustration plan approved by Ondřej Mottl) | 55-slide presentation story map in five parts with knowledge-state ledger, PollsLive L09 retrieval proposal (key C-A-D), and Galápagos illustration plan (title image and G1–G4) | `Workflow/records/2026-10-14-stage-4-presentation.md` | `lesson/l10-presentation` / PR not opened | Ondřej Mottl (pending) |
| 2026-10-14 | Stage 5 | in review | 55-slide deck drafted from the approved map with PollsLive L09 retrieval (key C-A-D), title image and G1–G4 integrated; independent vision review completed and credible findings resolved; clean offline render; awaiting human review and decisions on PollsLive overflow and a skripta trees-box correction | `Workflow/records/2026-10-14-stage-4-presentation.md` | `lesson/l10-presentation` / PR not opened | Ondřej Mottl (pending) |
| 2026-10-14 | Stage 5 | in review (revision) | Author review batch 1: PollsLive texts shortened, skripta trees box corrected, answers marked, Q–Q matching lines, Cook zoom, Závěr section; approved story-map revision implemented (Part B rebuilt, transformation gallery, R² note on AIC slide); 60 slides; gallery images and portrait title image pending generation | `Workflow/records/2026-10-14-stage-4-presentation.md` | `lesson/l10-presentation` / PR not opened | Ondřej Mottl |
| 2026-10-14 | Stage 5 | in review (revision) | Title image T2 and six gallery images integrated; normality-test slides removed at the author's request (dependent slides rephrased); gallery cards revealed one by one; 58 slides | `Workflow/records/2026-10-14-stage-4-presentation.md` | `lesson/l10-presentation` / PR not opened | Ondřej Mottl |
| 2026-10-14 | Stage 5 | in review (revision) | Independent review round 2 resolved; skripta aligned with the deck (line + residual decomposition, simulated residual bell before the normality MCQ, R² note in the AIC trap) and re-rendered | `Workflow/records/2026-10-14-stage-4-presentation.md` | `lesson/l10-presentation` / PR not opened | Ondřej Mottl |
