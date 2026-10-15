# L10 exercise blueprint

## Metadata and authoring gate

- Week: L10, Tvar rozdělení, transformace a nelinearita
- Date: 2026-10-15 (Europe/Prague)
- Author: Claude (Claude Code, Opus 5.5), working with Ondřej Mottl
- Presentation dependency: Ondřej Mottl explicitly approved the final L10 presentation (Stage 5) on 2026-10-15. Presentation PR #3 and PollsLive render PR #4 are merged.
- Branch: `lesson/l10-exercises`, created with explicit authorization on 2026-10-15
- Base: updated `main`, `1aeb62d`
- Human plan approval: Ondřej Mottl provisionally approved revision 3 on 2026-10-15 ("lets try to see how it will look. We may change it later"). The draft may change after he sees it; finished-exercise approval remains separate.
- Status: finished exercise explicitly approved by Ondřej Mottl on 2026-10-15; not yet committed or merged.

## Plan revision history

- Revision 1 (2026-10-15): nine core tasks on the Galápagos species–area data, with a closing transfer to `trees`.
- Ondřej Mottl, 2026-10-15:
  - the closing task uses `trees`;
  - build on the presentation's transformation gallery rather than repeat the island analysis.
- Revision 2 (2026-10-15): six real datasets, one per gallery card.
- Ondřej Mottl, 2026-10-15: make it simpler, use data generation, and do not limit the examples to those in the presentation.
- Revision 3 (this plan):
  - students simulate data with a known truth in new biological situations;
  - they transform the data and check whether the model recovers the truth;
  - one real dataset (`trees`) closes the practical;
  - no data files and no packages.

## Intended use

- Teacher-led route: 120-minute practical. Core tasks L10-U01 to L10-U08 in order, interleaved with short explanation pauses.
- Self-study route: the same script run top to bottom. Each task has `Zadání`, an expected result and two staged hints.
- Core direct-work budget:
  - Author estimate after the review trim: about 85 minutes (target 85–95 under `exercises.md`). Students no longer type the U01 simulation.
  - The independent reviewer estimated 105–125 minutes for a typical novice group before the trim.
  - A timed novice trial is still needed. If a trial overruns, move U07 (larvae) to the optional bank first. Its outcomes 3–4 are also covered by U05 and U08.
- The metabolism block is split into U05 (shape and candidates) and U06 (exponent), so each task has one goal.
- Optional-practice scale: 11 tasks, about 95 minutes across later sessions.

## Design idea

When students generate the data themselves, they know the truth, so every transformation and model can be checked against it:

- a bell made by adding small influences versus a right tail made by multiplying them;
- a log transform that returns the bell they started from;
- a fitted exponent compared with the 0.75 they built in;
- an estimated optimum compared with 24 °C.

This makes the lesson's causal story visible and removes data-import overhead. The biological situations are new: none is the islands, the mammal masses or the presentation's gallery examples. Every simulated block is labelled `simulovaná data` in the script. The closing task returns to real measurements (`trees`), where the truth is unknown and only biology and diagnostics can guide the choice.

New R functions for generating data, introduced in the first worked example with their meaning:

- `set.seed()`: the same random numbers for everyone, so expected results can be checked;
- `rnorm()`: values from a normal bell, with a given mean and SD;
- `runif()`: evenly spread values between a minimum and a maximum (introduced before U05);
- `exp()`: the inverse of `log()`.

## Data probe (R 4.5.1, `--vanilla`)

- Every simulation uses the course seed `set.seed(seed = 900723)` (`student-facing-r.md`), reset immediately before each block, so the blocks are independent of run order.
- Results are reproducible in R ≥ 3.6 (default random-number generator), and the script states expected results as approximate values.
- The leaf sample is 120 rather than 100. With the course seed, the n = 100 draw gave residual skewness 0.57 and Shapiro–Wilk p = 0.056, which blurs the task's intended contrast. N02 shows the test's sample-size dependence explicitly.

| Task | Simulation (synthetic) | Key numbers |
| --- | --- | --- |
| U01 | Plant height `rnorm(n = 200, mean = 30, sd = 5)` cm. Fish mass `exp(x = rnorm(n = 200, mean = log(x = 50), sd = 0.8))` g | Height: mean 30.23, median 29.90, skewness 0.16. Mass: 5.9–453 g; mean 68.9, median 49.2; skewness 3.00 |
| U02 | Same fish mass: g → kg and z-score | kg range 0.006–0.453. The skewness coefficient stays 3.00. The z-score has mean 4.3e-17 (effectively 0) and SD 1; the heaviest fish has z = 6.05 |
| U03 | Same fish mass: `sqrt()` and `log()` | Skewness 1.49 after the square root and 0.16 after the log. The mean of `log(mass)` is 3.948, against log(50) = 3.912; back-transformed 51.8 g. Shapiro–Wilk p < 0,001 for mass and 0.53 for log mass |
| U04 | Leaf area `exp(x = rnorm(n = 120, mean = log(x = 20), sd = 0.9))` cm². Dry mass = 5 + 0.4 × area + `rnorm(n = 120, sd = 3)` mg | Skewness 3.61 for the predictor, 3.20 for the response, 0.25 for the residuals. Shapiro–Wilk p < 0,001 for the response and 0.56 for the residuals. Slope 0.408 (truth 0.4) |
| U05–U06 | Body mass `exp(x = runif(n = 80, min = log(x = 0.01), max = log(x = 100)))` kg. Metabolic rate = 3 × mass^0.75 × `exp(x = rnorm(n = 80, sd = 0.3))` W (about ±30 % scatter) | For the line, mean residuals by fitted quartile are −2.40, −1.59, +0.72, +3.28, and the SD rises from 0.16 to 14.7 (a fan). AIC: line 557.5 versus quadratic 550.3 (same response); the quadratic keeps the fan. Log–log: exponent 0.743 (95% CI 0.719–0.766, contains 0.75); exp(intercept) = 3.00; ×1.67 per doubling; log–log AIC 26.1 is not comparable |
| U07 | Temperature `runif(n = 60, min = 10, max = 35)` °C. Growth = −12 + 2.4 t − 0.05 t² + `rnorm(n = 60, sd = 1.5)` mg per day | The line and the log–log model both leave an arch; the quadratic leaves a band. AIC: line 296.6 versus quadratic 218.3. Optimum 23.7 °C (truth 24) |
| U08 | Real data: `trees` (base R; Ryan, Joiner & Ryan 1976), 31 black cherry trees, converted to cm, m and m³ (0.0283 m³ per ft³) | Volume 0.29–2.18 m³; mean 0.85, median 0.68; skewness 1.01. The line leaves a U-shaped residual pattern (+0.040, +0.005, −0.098, +0.028 m³). AIC: quadratic −53.5 versus line −39.4. Log–log residuals form a band. Exponent 2.20 (95% CI 2.02–2.38), which just excludes 2; ×4.6 per doubling |

## Outcomes-to-task map

Weekly outcomes from `_internal/osnova_lekci.md` (L10):

1. Describe distribution shape and judge whether it matters for the linear model.
2. Distinguish linear from shape-changing transformations.
3. Recognise nonlinearity and propose a simple solution.
4. Compare several biologically plausible functional forms.
5. Explain how a transformation changes interpretation.

| Task | Heading | Student action | Outcomes | Min |
| --- | --- | --- | --- | ---: |
| L10-U01 | Sčítání, nebo násobení? | Worked examples generate plant height (a sum of small influences) and fish mass (a product of influences). The student draws a histogram and both Q–Q plots, compares mean and median, and describes both shapes in words | 1 | 10 |
| L10-U02 | Mění se tvar, když měníme jednotky? | The student converts fish mass to kg (checking the range) and to z-scores by the formula (`scale()` explained but not required), draws a histogram of the z-scores, and checks mean 0 and SD 1 | 2 | 8 |
| L10-U03 | Které transformace mění tvar? | A worked example shows `log()` on doublings, `exp()` and `log(0)`. The student takes the square root and log of fish mass, draws a Q–Q plot of the log, compares mean(log) with log(50), back-transforms with `exp()`, and says which transformations changed the shape | 2 | 9 |
| L10-U04 | Co musí být normální? | Supplied leaf simulation; Shapiro–Wilk explained before use. The student draws histograms of predictor and response, fits `mod_listy`, draws a histogram and Q–Q plot of the residuals, runs `shapiro.test()` on the response and the residuals, and states what the model needs | 1 | 12 |
| L10-U05 | Kolikrát víc energie spotřebuje dvakrát těžší zvíře? | Supplied metabolism simulation; `runif()` and `I()` explained before use. The student draws the scatterplot, fits the line and reads its residuals, writes the claims of the quadratic and log–log candidates before fitting, fits the quadratic, and compares AIC for the line and quadratic only | 3, 4 | 10 |
| L10-U06 | Najde model exponent, který jsme zadali? | The student draws the log–log scatterplot, fits `mod_metab_mocninny`, draws its residual and Q–Q plots, checks that the CI contains 0.75, interprets 2^b, and back-transforms the intercept | 3, 5 | 9 |
| L10-U07 | Má růst larev teplotní optimum? | Supplied larvae simulation; the vertex formula −b/(2c) is given before the task. The student fits the line, the quadratic and the log–log model with residual plots, compares AIC for the line and quadratic, and computes the optimum. Extrapolation moved to N11 | 3, 4 | 11 |
| L10-U08 | Jak rychle roste objem dřeva s průměrem kmene? (closing) | Real `trees`; conversion factors and the geometric hint are given. The student states an expectation first, converts units, draws a histogram, a scatterplot and the line's residual plot, compares the quadratic by AIC, fits the log–log model with its residual plot, interprets the exponent against 2 and 2^b, and writes a conditional conclusion with one limitation | 1–5 | 16 |

Core total: about 85 minutes (author estimate).

Main typing bottlenecks: U07 and U08. Every simulation in the script (core and optional) is supplied as executable code in a worked example, at the author's request, so students never write simulation code and spend their time on models, diagnostics and interpretation.

## Assumed knowledge and prerequisite refreshers

- R already established (L01–L09):
  - vectors and `c()`, `data.frame()`, `$`, indexing `x[2]` and `x[2, ]` (L03–L04);
  - `mean()`, `median()`, `sd()`, `range()`, `hist()`, `plot()`, `abline()`;
  - `lm()`, `coef()`, `confint()`, `fitted()`, `residuals()`, `qqnorm()`/`qqline()`, `AIC()`, `predict()`;
  - `rep()` (L09);
  - the Code > Comment/Uncomment Lines shortcut.

  `set.seed()` appeared once in L08 and is explained again here.
- New in L10 exercises (explained at first use): `set.seed()`, `rnorm()`, `runif()`, `log()`, `exp()`, `sqrt()`, `scale()` (explicit formula first), `I()` in a formula, `shapiro.test()` as a complement to the Q–Q plot, and, in optional tasks only, `rpois()` and `0:12`/`length()`.
- Statistics: residual plots (L03), Q–Q plot, p-value (L05), candidate models and the AIC same-response rule (L09); L10 concepts from the approved skripta and deck.
- Prerequisite refresher: a short skippable block on reading a residual plot (band, fan, arch) and the AIC rule. It is permanent, marked as skippable, and no task needs objects created inside it.

## Data and dependencies

- Simulated data are generated in the script with the course seed and labelled as synthetic. The biological parameters are plausible but invented: the exponent 0.75 follows the known metabolic scaling, but the coefficient 3 and the noise levels are illustrative.
- Real data: `trees`, preloaded in base R `datasets`, with its source in one line. Its documentation notes that "Girth" is actually diameter.
- Packages: none. Files: only `cviceni.R`. Setup is download, save and open; no `data` folder or RStudio Project is needed.
- Release metadata: `website-release.yml` already lists `Exercises/cviceni.R`, and the README student section already links the script. The island CSV remains listed as lesson data for the written materials.
- Observational units, stated at each first use: a plant or fish (U01–U03), a leaf (U04), an animal (U05–U06), a larva (U07) and a tree (U08).
- No internet, GUI-only or private-helper dependence, and no `par()`.
- Core objects:
  - `vec_vyska_rostlin`, `vec_hmotnost_ryb`, `vec_hmotnost_kg`, `vec_hmotnost_z`, `vec_hmotnost_odmocnina`, `vec_hmotnost_log`;
  - `data_listy`, `mod_listy`;
  - `data_metabolismus`, `mod_metab_primka`, `mod_metab_kvadraticky`, `mod_metab_mocninny`;
  - `data_larvy`, `mod_larvy_primka`, `mod_larvy_kvadraticky`, `mod_larvy_log`;
  - `data_tresne`, `mod_tresne_primka`, `mod_tresne_kvadraticky`, `mod_tresne_mocninny`.

## Optional practice plan

Each optional task uses named core objects or data simulated by a supplied worked example placed directly before it. No core object is overwritten; N08 works on a copy of `data_larvy`.

| ID | Purpose | Requires | Min |
| --- | --- | --- | ---: |
| L10-N01 | How much can a histogram of 20 values mislead? The same bell recipe at n = 20 and n = 2 000 | none | 7 |
| L10-N02 | Normality test and sample size: one mildly skewed recipe at n = 20 (p = 0.21) and n = 2 000 (p < 0,001) | none | 8 |
| L10-N03 | Skewness coefficient (skripta Extra) for the bell (0.16), fish mass (3.00) and log fish mass (0.16); descriptive only, no threshold | U01–U03 | 6 |
| L10-N04 | Bacterial growth over 12 hours: `log(pocet_bunek) ~ hodina` gives 41.8 % per hour (CI 39.9–43.8 %; truth 41.9 %) | none | 10 |
| L10-N05 | Counts with zeros (`rpois(n = 100, lambda = 1)`, 36 empty traps): why `log()` fails and what `sqrt()` does (skewness 1.68 → 0.07) | none | 9 |
| L10-N06 | Change the truth: regenerate the U05 recipe with exponent 1; the estimate is 0.993 (CI 0.969–1.016) | U05 recipe | 7 |
| L10-N07 | Typical versus mean value after back-transformation: `exp(mean(log(mass)))` = 51.8 g, against the median of 49.2 g and the mean of 68.9 g | U01 | 6 |
| L10-N08 | Centring inside a model: temperature centred at 20 °C; the intercept becomes the growth at 20 °C (16.23 mg per day); the quadratic coefficient and fitted values are unchanged | U07 | 8 |
| L10-N09 | Trees with height added: exponents 1.98 (CI 1.83–2.14) and 1.12 (CI 0.70–1.54), versus geometric 2 and 1. This explains why the U08 exponent is just above 2 | U08 | 10 |
| L10-N10 | Correct four misleading conclusions with evidence from U02, U04, U05 and U07 | Core outputs | 10 |
| L10-N11 | Extrapolation: the larvae quadratic predicts −12.9 mg per day at 0 °C and −19.7 at 50 °C | U07 | 6 |

Purposes:

- Repetition: N03, N07.
- Transfer: N04, N05, N09.
- Integrated challenges: N06, N08.
- Debugging or reflection: N01, N02, N10, N11.

## Teacher facilitation (internal only; not in the public script)

Short explanation pauses:

- 4 min before U01: what simulation is and why a seed matters.
- 3 min before U04: residuals, not the response, carry the assumption.
- 4 min before U05: candidates first, AIC only on the same response.
- 3 min before U08: there is no known truth now.

Discussion time:

- 5 min after U04: "what must be normal".
- 4 min after U07: which transformation fits which biology, and why the logarithm could not create an optimum.
- 4 min after U08: compare the trees with U05–U07.

The remaining minutes go to recovery.

## Out of scope

- Probability-distribution theory: `rnorm()` and `runif()` are used as recipes, and `rpois()` appears only in N05.
- Box-Cox and data-driven transformation searches.
- Choosing a transformation from p-values.
- How the Shapiro–Wilk statistic is calculated.
- `log(x + 1)` and count models (L12).
- Repeated measures (L11).
- `nls()`, splines, GAMs and polynomials above second order.
- Bias-corrected back-transformation.
- Simulation-based inference (repeating a simulation many times).

## Risks

- **Simulation syntax is new in exercises.** A single worked example introduces `set.seed()`, `rnorm()` and `exp()`, and later recipes reuse the same pattern.
- **Different R versions could change random numbers.** Mitigations:
  - default RNG since R 3.6;
  - expected results are stated approximately;
  - the conclusions do not depend on the exact value.
- **"Data I made myself" may feel artificial.** Answered by the closing real-data task, and by framing: simulation shows what each transformation does when we know the truth.
- **Core-route length.** The reviewer's novice estimate exceeds the budget; see "Intended use" for the trim already made and the fallback.
- **Trees again.** L09 used conifer allometry. `trees` is a different dataset with a different question and an a priori geometric expectation. The author chose `trees` on 2026-10-15.

## Validation and review record

### First draft (2026-10-15)

- **Parse and clean session:** passed (R 4.5.1, `--vanilla`, empty temporary directory, null graphics device).
- **Reference harness:**
  - all 18 tasks were solved in an untracked harness in the session scratchpad, outside the repository;
  - the supplied simulations are identical to the harness objects;
  - 32 diagnostic PNGs were generated and the key residual plots inspected.
- **UTF-8 and pattern checks:** passed.

### Independent exercise review (2026-10-15)

A separate read-only subagent followed `.ai/agents/exercise-reviewer.md`. Model: Sonnet at medium effort, a capable general model for a complete-exercise review.

The reviewer:

- independently re-ran every simulation and the `trees` models;
- confirmed every tested expected value and the first-use coverage;
- found no leaked solutions, teacher cues or out-of-scope concepts.

Verdict: ready for human review conditionally, with one medium finding and eight low findings. All were resolved:

1. **Medium, core-route timing.** The reviewer's novice estimate was 105–125 minutes.
   - U02 no longer asks for a kg histogram; students check the range instead.
   - U07 predictions moved to the new optional task N11 (extrapolation).
   - U08 compares the quadratic by AIC without its own residual plot.
   - The re-estimate and the fallback are recorded under "Intended use".
2. **Low.** The U05 noise wording now says "zhruba o třicet procent".
3. **Low.** All `log()`/`exp()` calls in recipes and code are written with named arguments (`log(x = 50)`, `exp(x = rnorm(...))`).
4. **Low.** All seeds switched to the course seed 900723. Every expected value was regenerated, and the leaf sample was raised to 120 (see "Data probe").
5. **Low.** U02 now explains e-notation ("e-17 znamená × 10^-17").
6. **Low.** N04 now explains `0:12`, `rep(each = 3)` and `length()`.
7. **Low.** N08 wording was clarified ("kopii tabulky data_larvy pod názvem data_larvy_centrovane").
8. **Low.** The U08 expected result states that the CI just excludes 2 and points to the interpretation; N09 resolves this with height.
9. **Low.** Blueprint inconsistencies (task numbering, review status) were corrected in this revision.

### Revalidation after the revisions

- **Parse, encoding and clean session:** passed again (UTF-8 without BOM, no CR).
- **Reference harness:**
  - rerun with seed 900723 and n = 120;
  - the supplied objects are identical to the harness;
  - every numeric claim in the expected results was compared with the harness output and matches. One mismatch found during this check (the N05 empty-trap count) was corrected to 36.
- **Hint constructions:** run as written (optimum, extrapolation, N04, N06, N08).
- **Plots:** the new-seed diagnostics were re-inspected. The leaf residual Q–Q plot lies on the line; the metabolism line and quadratic fan out; log–log gives a band; the larvae line and log model show an arch.
- **Structure and patterns:** 19 unique task IDs with complete anatomy; no prohibited patterns; no line longer than 80 characters.
- **Timing:** author estimate about 87 minutes; no novice trial.

### Remaining gaps

- No timed novice trial.
- RStudio GUI actions (Comment/Uncomment, the Plots arrows, Session > Restart) were not exercised interactively.
- The course URL in the script is the post-release path and cannot be checked before release.

### Reviewer re-check of the revisions (2026-10-15)

The same read-only reviewer re-ran all simulations with seed 900723.

- **Numbers:** every expected value matches, including N02, N04, N05 (36), N06, N08 and N11.
- **Corrections:** all nine findings are resolved, and the edited tasks (U02, U07, U08, N08, N11) read coherently.
- **Verdict:** ready for human review.

Notes:

- **Shared seed.** Because every block uses the same seed, the plant heights and the log fish masses come from the same random numbers, so their shapes and skewness are identical. This is now stated as a learning point in the U03 expected result and in N03.
- **Line lengths.** The reviewer flagged lines 685, 718 and 869 as too long. Counted in characters they are 77–79; the reviewer's count was in bytes, inflated by diacritics. The longest line is 79 characters.
- **Timing.** The reviewer's novice estimate after the trim is 95–110 minutes, against the author's 87. The timing therefore remains unresolved until a timed novice trial, with the U07 fallback recorded under "Intended use".

The final parse and clean-session run passed after these comment-only edits.

### Author review: task-field order (Ondřej Mottl, 2026-10-15)

- **Request:** hints should come before the expected result. Ondřej Mottl asked for this fix in L10 only and will handle the earlier lessons in a separate agent session.
- **Change:** every task now reads Zadání → Vaše řešení → Nápověda 1 → Nápověda 2 → Očekávaný výsledek → Interpretace. A stuck student now reaches both hints before seeing the answer.
- **Scope:** all 19 tasks were reordered by script. The set of lines is unchanged, and no text referred to the old order.
- **Validation:** parse and clean-session run passed.
- **Open course-wide follow-up:** `exercises.md` (which lists the fields in the old order without mandating it), the `_L-template` exercise, and L06–L09 still use the old order. They are outside this branch.

### Author review: supplied simulations (Ondřej Mottl, 2026-10-15)

- **Request:** data simulation should always be written in advance; students should not write it themselves.
- **Change:** every simulation is now executable code in a worked example, labelled as simulated data, with the course seed. That covers:
  - core: plant height, fish mass, leaves, metabolism and larvae;
  - optional: N01 (two bell samples), N02 (two mildly skewed samples), N04 (bacteria), N05 (beetle counts) and N06 (metabolism with exponent 1, as `data_metabolismus_iso`).
- **Task wording:** each affected task now starts from the named object ("Pracujte s … z ukázky"). The steps and hints that asked students to type `set.seed()` or a recipe were removed or rewritten. U03 now refers to the fish recipe as "v ukázce před U01".
- **Values:** the recipes and seeds are unchanged, so every expected value is unchanged. This was confirmed from the objects the sourced script creates: fish, N01–N02, N04–N06, the U03 log mean, and the shared random draws of plants and fish.
- **Validation:**
  - parse and clean session passed;
  - 12 seeded simulation blocks, all `set.seed(seed = 900723)`;
  - 19 tasks in the new field order;
  - no prohibited patterns; no line longer than 80 characters.
- **Not repeated:** independent review, because only the location of the generation code and task wording changed. The reviewer can recheck on request.

### Human review

- Approver: Ondřej Mottl
- Date: 2026-10-15
- Decision: approved ("i approve the excercise"). This is the finished-exercise approval, separate from the provisional plan approval. It covers the worksheet as it stands after the two author-review changes (task-field order and supplied simulations).
- Requested revisions: none beyond the two author-review changes recorded above.
- Noted at approval:
  - the independent reviewer did not recheck the last change (supplied simulations), which moved code and rewrote task wording without changing any value;
  - the core-route timing is still unmeasured in a novice group; the U07 fallback stands.
