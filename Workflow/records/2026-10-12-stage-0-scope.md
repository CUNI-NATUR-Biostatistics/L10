# Stage 0 - Scope lock

## Metadata

- Week: L10
- Date: 2026-10-12
- Author: Claude (Claude Code), working with Ondřej Mottl
- Reviewer: Ondřej Mottl
- Status: approved and locked (revision 2 with decisions applied)
- Human approval: Ondřej Mottl, 2026-10-12

## Git checkpoint

- Stage group: Stages 0-1 planning
- Repository: `CUNI-NATUR-Biostatistics/L10`, created from `_L-template` as a public repository on 2026-10-12 with explicit authorization from Ondřej Mottl (consistent with the other public lesson repositories)
- Branch: `lesson/l10-scope-data`
- Base branch and commit: `main` at `de78260` (template initial commit)
- `git status --short` reviewed: [x] (clean before branch creation)
- Previous-stage PR merged: N/A
- Planning PR: not created
- Note: this record was drafted before the repository existed and moved into `Workflow/records/` on the planning branch after creation.

## Scope revision history

- Revision 1 (2026-10-12): nonlinearity and transformations of the functional form only, mapped to the original three L10 outcomes.
- Revision 2 (2026-10-12): Ondřej Mottl requested that L10 also cover distributions in detail — normal versus non-normal distributions, distribution shape overall, skewness — and transformations including the z-transformation. The canonical L10 entry in `_internal/osnova_lekci.md` was updated accordingly (new title, model core, and five outcomes); that `_internal` edit is uncommitted and part of this approval.
- Decisions (2026-10-12, Ondřej Mottl): revision 2 and the revised `osnova_lekci.md` entry approved; numerical skewness as an Extra; a normality test in the main route (usage and interpretation only, not its calculation); log-normal named only as "symmetric after taking logarithms"; repository created as public; the new-dataset rule from L09 applies.
- Artifact balance (2026-10-12, Ondřej Mottl): the presentation does not need to cover everything. `Learning_materials/skripta.qmd` is the main and complete source of information for all five outcomes; the presentation may select and distil the most important blocks.

## Topic sentence

A simple linear model makes claims about two shapes: the shape of the distribution of residuals and the shape of the relationship between predictor and response. Students learn to describe distribution shape (symmetry, skewness, heavy tails, several peaks, bounded values), to see why many biological quantities are right-skewed, and to check normality where the model actually assumes it — in the residuals. They then separate transformations that only change location and scale (unit change, centring, z-score) from those that change shape (logarithm, square root). The logarithm becomes the bridge between the two halves: the same transformation that makes a multiplicative, right-skewed quantity symmetric can also straighten a power-law or exponential relationship. Finally, students compare a small set of biologically motivated functional forms — straight line, log transformation, quadratic term — as candidate models in the L09 sense, and interpret the transformed coefficients in original biological units.

## Weekly outcomes (mapped)

Canonical source: `_internal/osnova_lekci.md`, section **L10 – Tvar rozdělení, transformace a nelinearita** (revised 2026-10-12).

1. Popsat tvar rozdělení proměnné nebo residuí (souměrnost, šikmost, těžké konce, vícevrcholovost) pomocí histogramu a Q–Q grafu a posoudit, zda je pro lineární model podstatný.
2. Rozlišit lineární transformace (z-skóre, centrování, změna jednotek) od transformací měnících tvar (logaritmus, odmocnina) a vysvětlit, co každá z nich mění.
3. Rozpoznat nelineární vztah v datech a navrhnout jednoduché řešení.
4. Porovnat několik biologicky plausibilních funkčních tvarů.
5. Vysvětlit, jak transformace mění interpretaci modelu.

## What students already know (prerequisite audit of L01-L09)

- L01: histogram, boxplot, mean versus median and SD versus IQR for "asymmetrická" data, logarithmic axis as a display device only. Skewness is not named.
- L03: residual-versus-fitted plot, residual histogram, Q–Q plot with quantiles, informal "souměrné zvonovité (normální) rozdělení" as reference; explicit statement that `lm` does not require a normal response. Transformation deferred.
- L04-L05: sampling distributions, reference t-distribution; t-statistic as "standardizovaná vzdálenost" (useful bridge to z-score).
- L06, L09: Q–Q plots reused as diagnostics; L09 tree allometry ended with a residual arch and the explicit bridge to nonlinearity and transformation.
- Not yet taught: the word šikmost, named distribution shapes beyond the informal normal bell, z-score/standardization as a data transformation, centring, logarithmic transformation in a model, quadratic terms.
- Glossary: slugs `rozdeleni`, `transformace`, `nelinearita`, `qq-graf`, `kvantil` exist. Missing candidates for Stage 2: normal distribution, skewness, z-score/standardization, centring, logarithmic transformation, quadratic term, scaling exponent (to be added in `slovnik` via its own workflow).

## Inspiration consulted

- Authoring problem to solve: integrate a distribution-shape block with a functional-form block in one 90-minute lecture without turning the lesson into two unrelated topics, and prevent the two classic beginner errors — "data must be normal before any analysis" and "transform until the test says normal".
- Relevant sources from the course inspiration hub (L10-L12 block recommends Modern Statistics with R, CUNY Biostatistics, genomicsclass):
  - [Modern Statistics with R, regression chapter](https://www.modernstatisticswithr.com/regression.html): diagnostics for nonlinear residual patterns, transformations of the response, prediction with back-transformation, quadratic terms via `I(x^2)`, centring of explanatory variables.
  - [CUNY Biostatistics book, linear model extensions](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Linear_model_extensions.html): "fit the model before transforming", transformations as "sometimes" rather than default, right-skewed data and log/root transformations, biological power-law example (whelk length-mass).
- Patterns worth borrowing:
  - Diagnose from the residuals of the fitted model before proposing any remedy (MSwR, CUNY).
  - Explain skewness through the biology that generates it (growth and multiplication, lower bound at zero) rather than as an abstract coefficient.
  - Let the biology propose the shape: power law suggests log-log; constant relative change suggests log response; an optimum suggests a quadratic term.
  - Translate predictions back to the original units before interpretation.
- Patterns explicitly rejected:
  - Box-Cox, ladders of power transformations, and choosing a transformation by fit statistics or normality-test p-values alone.
  - Normality tests as a gatekeeping step before analysis or as a replacement for reading the Q–Q plot.
  - Nonlinear least squares, GAMs/splines, high-order polynomials, and non-biological examples such as `mtcars`.
- Gaps the lesson must fill itself:
  - Neither source contrasts linear transformations (z-score) with shape-changing ones as a central idea; the side-by-side "same histogram shape after z-score, different shape after log" comparison is our own design.
  - Neither source warns that R² and AIC are not directly comparable between a model for `y` and a model for `log(y)`; this connects to the L09 "same response, same observations" rule.
- Why the selected pattern fits this course: it reuses the L01 asymmetry vocabulary, the L03 Q–Q plot, the L05 "standardized distance" idea, and the L09 candidate-model habit, and it fulfils the L09 bridge ("Co když žádný lineární kandidát nestačí?").

## Concrete student actions

1. Describe the shape of a distribution or of model residuals from a histogram and a Q–Q plot (symmetric, right- or left-skewed, heavy-tailed, several peaks, bounded) and decide whether that shape matters for the linear model at hand — recognising that a skewed response or predictor alone is not a violation, while skewed residuals may be.
2. Apply a z-score and a logarithm to the same skewed variable and explain, using the histograms and the original units, why the z-score changes only location and scale while the logarithm changes the shape; state when each is useful (comparing variables in different units versus multiplicative variation or relationships).
3. Use the scatter plot, the biological question, and the residual-versus-fitted plot of a straight-line model to recognise a systematic bend, then translate biological expectations into a small set of candidate `lm()` formulas — straight line, `log()` of predictor and/or response, quadratic term with `I(x^2)` — before looking at comparison metrics.
4. Compare those candidates through original-scale predictions and residual diagnostics, use AIC or adjusted R² only among models with the same response on the same scale, and interpret a transformed coefficient in biological units (relative change, change per doubling, scaling exponent, or a slope that changes along a quadratic curve).

## Proposed lesson spine (orientation only; not the Stage 2 story map)

1. Biological question with a strongly right-skewed measured quantity and a curved relationship.
2. Shape of a distribution: vocabulary, why biology produces skew, the normal distribution as a reference shape, Q–Q plot revisited.
3. What the linear model actually assumes: residuals, not raw variables (misconception checkpoint).
4. Transformations that keep the shape versus transformations that change it: unit change, centring, z-score versus logarithm and square root.
5. Shape of the relationship: residual arch, candidate functional forms, quadratic term.
6. Comparing and interpreting candidate forms on the original scale; AIC caveat across response scales.
7. Conditional conclusion and bridge to L11 (dependence) and L12 (responses where transformation is not the right tool).

## Out of scope this week

- Formal probability density functions, parameters of named distributions beyond the intuitive normal reference, and a catalogue of distribution families (log-normal may be named as "symmetric after logarithm"; Poisson and binomial wait for L12).
- Kurtosis coefficients; a skewness coefficient in the main route (it appears only as an Extra) or as a threshold rule; the computation of normality-test statistics; normality tests as a mandatory gate; Box-Cox or other data-driven transformation searches.
- Nonlinear least squares (`nls()`), mechanistic curves fitted directly, GAMs, splines, loess as a model, and polynomials above second order.
- Logit, arcsine-square-root, and other transformations of proportions or counts; link functions (L12).
- Repeated measures, sites, blocks, and pseudoreplication (L11).
- Bias-corrected back-transformation, smearing estimators, Jacobian-corrected likelihood comparisons across response scales, and orthogonal polynomials.
- Removing observations or transforming solely to obtain a "normal" result without a corresponding biological claim.

## Formal depth boundary

### Core and student-visible

- Vocabulary of distribution shape: symmetric, right-skewed (pravostranně šikmé), left-skewed, heavy tails, several peaks, bounded at zero; recognised from histograms and Q–Q plots, with mean-versus-median as a familiar skew indicator from L01.
- The normal distribution as a symmetric bell-shaped reference used by the linear model for its residuals; normality of the response or predictors is not required.
- A normality test (Shapiro–Wilk, `shapiro.test()` on model residuals) in the main route, taught as usage and interpretation only: its null hypothesis (residuals compatible with a normal shape), reading the p-value with the L05 logic, and its dependence on sample size (large samples flag negligible deviations, small samples miss large ones). It complements, and never replaces, the Q–Q plot. How the statistic is calculated is out of scope.
- Log-normal named only as a right-skewed distribution that becomes approximately symmetric after taking logarithms.
- z-score as "distance from the mean in standard deviations", shown with the text-only → concrete numbers → symbols progression, `scale()` or the explicit `(x - mean(x)) / sd(x)` in visible base R; it preserves shape and enables comparison of variables in different units.
- Centring as a special case (subtracting the mean) that changes the meaning of the intercept.
- Natural logarithm turning equal ratios into equal steps; reuse of the L01 logarithmic axis as the visual bridge; log and square root reduce right skew.
- Curvature as a scatter-plot pattern and as an arch or U-shape in residuals versus fitted values; a model linear in its coefficients can describe a curve with `log(x)`, `log(y)`, or `I(x^2)`.
- Interpretation: log-response coefficient as a relative (percentage) change, log-predictor coefficient as change per doubling, log-log coefficient as a scaling exponent, quadratic slope changing along the curve with an optimum or turning point read from predictions.
- L09 same-response rule applied to transformed candidates; interpretation on the original scale.

### Extra (written materials only, clearly marked)

- A numerical skewness coefficient as a descriptive number with sign and rough meaning, explicitly not as a threshold rule.

### Intuitive only

- Why multiplicative processes produce right skew and why sums of many small influences tend towards a symmetric bell shape (no central limit theorem by name).
- Standardized regression coefficients as a possible use of z-scores for comparing predictors measured in different units (link to L07), without making them a decision tool.
- Back-transformed predictions from a log-response model describe a typical (median-like) value rather than the arithmetic mean.
- Transformations also change how variability is described (constant relative spread rather than constant absolute spread).
- Extrapolation beyond the observed range is especially risky for quadratic models.

### Deferred

- Probability density formulas, distribution parameters and families, formal derivations of logarithm rules, bias-corrected back-transformation, likelihood comparisons across response scales, polynomial collinearity remedies, nonlinear and smooth models.

## Risks and dependencies

- Risk: scope overload. Five outcomes and two shape topics may not fit a 90-minute lecture with the required interaction cadence. Mitigation (approved): `skripta.qmd` is the complete, self-contained source for all five outcomes; the presentation selects and distils the most important blocks rather than covering everything. The logarithm acts as a single bridge used in both halves and one dataset carries both. The Stage 4 story map will record which written-material blocks are intentionally left to self-study.
- Risk: "data must be normal" misconception is reinforced by spending time on distributions, and a normality test in the main route may be read as a pass/fail gate. Mitigation: an explicit early checkpoint that the model assumption concerns residuals, with an example where a skewed predictor is harmless; the test is always shown after the Q–Q plot and interpreted together with sample size and the biological consequence of the deviation.
- Risk: students treat transformation as a ritual to fix residuals or to pass a test. Mitigation: every candidate transformation must carry a biological claim before fitting; z-score shown explicitly as a transformation that cannot fix skewness.
- Risk: comparing R² or AIC between `y` and `log(y)` models gives a misleading verdict. Mitigation: misconception checkpoint linked to the L09 rule.
- Risk: logarithms are threatening to beginners. Mitigation: start from the L01 logarithmic axis and doubling/halving language; formula only after intuition and concrete numbers.
- Risk: quadratic fits extrapolate implausibly. Mitigation: predictions only within the observed range; extrapolation named as a limitation.
- Dependency: L09 materials approved, merged, and released (satisfied).
- Dependency: glossary terms listed above must be added through the `slovnik` workflow before or during Stage 2; this is a separate repository change.
- Dependency: the canonical L10 entry in `_internal/osnova_lekci.md` was revised on 2026-10-12 at the human's request; the `_internal` change requires its own commit authorization.
- Confirmed constraint (Ondřej Mottl, 2026-10-12): the main dataset must be genuinely new and not reuse any L01-L09 primary dataset. The L09 tree allometry and its residual arch may still serve as retrieval evidence in the Stage 4 PollsLive block.

## Resolved decisions

1. Numerical skewness: graphical description plus mean-versus-median in the main route; a skewness coefficient only as an Extra. Approved by Ondřej Mottl, 2026-10-12.
2. Normality test: included in the main route as usage and interpretation (Shapiro–Wilk on residuals, null hypothesis, p-value, sample-size sensitivity, always alongside the Q–Q plot), not its calculation. Decided by Ondřej Mottl, 2026-10-12, overriding the Extra-only recommendation.
3. Named distributions: normal as the reference; log-normal named only as "symmetric after taking logarithms"; Poisson and binomial deferred to L12. Approved by Ondřej Mottl, 2026-10-12.

## Preliminary dataset needs for Stage 1 (not a dataset decision)

- One strictly positive, clearly right-skewed continuous response (for example a size, mass, concentration, or abundance) with a biologically explainable multiplicative origin.
- A numeric predictor with a visible, biologically motivated bend (power-law scaling, constant relative change, or an optimum), so candidates can be argued before fitting; ideally one more variable in different units to motivate the z-score comparison.
- Roughly 50-300 independent observations, documented provenance, explicit reuse terms, little missingness, no strong hierarchical or phylogenetic structure.
- At least two plausible candidate shapes on the same response scale, plus one log-response candidate, so both the L09 comparison habit and its limitation can be shown honestly.
- A possible second, small contrasting variable (left-skewed or bimodal) may be needed for the distribution-shape gallery; prefer taking it from the same dataset.

## Decision

- [x] Human reviewer approved this scope (revision 2)
- [x] Human reviewer approved the revised `osnova_lekci.md` L10 entry
- [x] Open decisions 1-3 resolved
- [x] Scope locked for implementation
- [x] Continue Stage 1 research on this same planning branch
- Notes: Drafted on 2026-10-12 before the L10 repository existed. Ondřej Mottl approved revision 2, resolved decisions 1-3, and authorized creation of the public repository and the planning branch on 2026-10-12. The `_internal/osnova_lekci.md` change still needs its own commit authorization in the `_internal` repository.
