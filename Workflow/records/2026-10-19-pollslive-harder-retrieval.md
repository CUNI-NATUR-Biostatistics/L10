# L10 PollsLive retrieval quiz: harder replacement questions

- Date: 2026-10-19
- Branch: `pollslive-harder-retrieval`
- Workstream: focused post-presentation PollsLive revision
- Approver: Ondřej Mottl (human author)
- Decision: approved on 2026-10-19 in the authoring session.
- Requested revision: the first approved Q3 (AIC of a log-response model) duplicated the in-lecture L10 activity on comparing AIC across response scales (`Presentation/presentation.qmd`, the slides with `mod_c_mocninny` and `mod_d_kvadraticky`) and would have revealed its answer. The author chose the residual-arch remedy question instead.

Integration-map status: unchanged and approved. Exact-question status: approved.

## Dependency on the L09 rework

L09 is being reworked separately at the same time. These questions use the current L09 data (`data/allometrie_stromu.csv`, 63 trees), the three candidate models (Společná přímka, Posun mezi druhy, Různé sklony) and their AIC values. If the L09 rework changes the data, the candidate set, the model names or the residual figure, the options, explanations and evidence must be recomputed before synchronization.

## Reason for the revision

After teaching L03 the author judged the retrieval questions far easier than the Moodle self-tests. The previous L10 set displayed ΔAIC directly and asked what ΔAIC = 0 means. The new set asks students to compute ΔAIC, to predict how R² and adjusted R² react to a useless predictor, and to decide what to do about a residual arch.

## Integration map

The retrieval block keeps its approved position before `Výsledky učení`. No other slide changes.

| Position | Teaching move | Student knowledge used | Bridge |
|---|---|---|---|
| Q1 | Compute ΔAIC from AIC values | L09 AIC table of three candidates | — |
| Q2 | R² never decreases; adjusted R² penalises extra coefficients | L09 R² and adjusted R² table | Fit criteria compare only the candidates we offer. |
| Q3 | A residual arch is not repaired by choosing among straight-line candidates | L09 residuals of the shift model | L10 examines curved relationships and transformations. |

## Exact production questions

The canonical text is `pollslive/quiz.json`.

| Question ID | Correct option | Key | Distractors and the misconception each encodes |
|---|---|---|---|
| `delta-aic-ruzne-sklony` | 2,8 | D | 0 (ΔAIC of the best model); 3,2 (wrong row); −2,8 (reversed subtraction) |
| `nahodny-prediktor` | R² does not decrease, adjusted R² probably decreases | C | both decrease; R² decreases while adjusted R² increases; both increase and the model is better |
| `oblouk-co-s-tim` | add a candidate with a curved shape | B | pick the model with the highest R² (also straight lines); AIC already picked the best; delete trees with the largest residuals |

Checked numbers (fresh R session): AIC 398,64 / 395,44 / 398,27; ΔAIC of Různé sklony = 2,83. Adding a random predictor (seed 900723) to Různé sklony raised R² from 0,7967 to 0,7988 and lowered adjusted R² from 0,7789 to 0,7772.

## Evidence

| Asset | Source | SHA-256 |
|---|---|---|
| `l09-aic.png` | rendered by `R/render_pollslive_assets.R`; the previous AIC table without its ΔAIC column | `382eab2835c7954dbe6f6d09f55be922276cf51b32909ccc7d247567ea8d7d74` |
| `l09-r2-adjustovane.png` | unchanged from the previous quiz | `31ca63018d19bbca00ed132f4ed142b1382b8edc0cd0fe7ac6190703312c16aa` |
| `l09-oblouk-residui.png` | unchanged from the previous quiz (restored byte for byte from the committed file) | `4b7c8b29b1886b8f94879916e2090b16749d0b508a17391897cab64a5384ad20` |

The previous asset `l09-delta-aic.png` is removed.

## Answer key and course balance

L10 key: D C B. The course-wide table is in L04 `Workflow/records/2026-10-19-pollslive-harder-retrieval.md`.

## Validation

- `node pollslive/validate.mjs`: passed without credentials.
- `Rscript R/verify_pollslive_assets.R`: passed.
- Offline render: see the review section.

## Review

Independent read-only review: completed on 2026-10-19 by a separate reviewer subagent (canonical prompt `.ai/agents/vision-corrector.md`, scoped to the retrieval block of L04, L05, L06, L07, L08 and L10; a capable general-purpose model, chosen because the task is a focused content review of 18 short items). No blockers: every keyed answer was confirmed correct, every distractor wrong, and the course-wide key balance verified.

Should-fix, resolved: in Q2 only the correct option was hedged ("nejspíš"); all options now say "obvykle" where applicable. Q3's correct option was the longest; two distractors were lengthened. Minor, accepted: Q3 foreshadows the later L10 slide on the residual arch after a logarithm without revealing its outcome.

Focused re-check of these corrections by the same reviewer: pending.

## Operational boundary

No staging, commits, pushes, live PollsLive operations, response submissions or activation changes were made.
