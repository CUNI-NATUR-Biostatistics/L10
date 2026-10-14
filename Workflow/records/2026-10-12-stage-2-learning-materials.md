# Stages 2-3 - Learning Materials and Human Review

## Metadata

- Week: L10
- Date: 2026-10-12
- Author: Claude (Claude Code), working with Ondřej Mottl
- Reviewer: Ondřej Mottl

## Git checkpoint

- Stage group: Stages 2-3 written materials
- Branch: `lesson/l10-skripta` (created with explicit authorization from Ondřej Mottl, 2026-10-12)
- Base branch and commit: `main` at `3b0acf6` (merged Stages 0-1 PR #1)
- Stages 0-1 PR merged: [x]
- Branch created from updated default branch: [x]
- `git status --short` reviewed before editing: [x] (clean)
- Written-materials PR: not created

## Inspiration consulted

- Relevant sources from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: [Modern Statistics with R, regression](https://www.modernstatisticswithr.com/regression.html) and [CUNY Biostatistics, linear model extensions](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Linear_model_extensions.html), as already recorded in Stage 0.
- Structural pattern borrowed: fit the familiar model first → let residuals show what is wrong → let biology propose candidate shapes → compare predictions on the original scale → interpret transformed coefficients in biological units (MSwR, CUNY). Explain skew through the biology that creates it (CUNY).
- Adaptation to this course: one dataset (30 Galápagos islands) carries both halves; the logarithm is the single bridge between distribution shape and relationship shape. Visible code stays in base R and Czech variable names. Candidate formulas are frozen before scores, as in L09. Every equation follows text → concrete numbers (with a value table) → symbols.
- Intentionally not reused: Box-Cox and ladders of powers, choosing a transformation by p-values or AIC alone, `nls()`, GAMs, splines, high-order polynomials, non-biological examples, and normality tests used as an entry gate.

## Mandatory story map

- Artifact: Learning materials (`Learning_materials/skripta.qmd`)
- Granularity: one row per major section or concept block
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-10-12
- Approval decision and requested revisions: Ondřej Mottl approved the 39-block story map and knowledge-state ledger without revisions on 2026-10-12. Open choices resolved: (1) the shape gallery uses generated (simulated, labelled) reference shapes, alongside the real Galápagos histograms and the L04 Old Faithful callback; (2) centring is shown on area in the raw straight-line model (block 22); (3) the opening uses a real photograph of the archipelago, not a map-tile illustration, with a reusable licence.

`Internal role` and `Speaker note` are backstage planning text. `Student-facing heading` holds only the exact proposed rendered heading; no full student-facing prose has been drafted. Proposed H1 parts are marked **Part**; they group the blocks for self-study and later for the Stage 4 section dividers.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Opening biological question | Proč mají větší ostrovy více druhů rostlin? | Pose the species-area question with a map of the archipelago (real geography, no generated image). Keep the "how fast?" part open; it is answered in block 31. |
| 2 | Retrieval of the L09 bridge | Co prozradil oblouk v residuích stromů? | Show the L09 residual arch of the tree model as recall evidence and restate the open L09 question: what if no straight-line candidate fits? Individual prompt with an immediate answer. |
| 3 | Learning outcomes | Co se v této lekci naučíte | Five outcomes in student language. Terms such as šikmost, z-skóre and logaritmická transformace appear only as destinations. |
| 4 | **Part A** divider | Tvar rozdělení | Part heading only. |
| 5 | Source, observation unit and reproducibility | Jeden řádek tabulky představuje jeden ostrov | Johnson & Raven (1973), `faraway::galamiss`, 30 islands, variables and units. Collapsed Extra with the complete preparation route from `R/prepare_galapagos_data.R`. |
| 6 | Data inspection habit | Co v tabulce chybí a co je neobvyklé? | Visible `str()`, `summary()`, `colSums(is.na())`. Six missing elevations; Santa Cruz has distance 0 to itself; one island has 0 endemics; area from 0.01 to 4669 km². These zeros matter again in block 22. |
| 7 | First visual and noticing task | Jak vypadají počty druhů a plochy ostrovů? | Histograms of species and area. Ask where most islands lie and what the few largest islands do to the picture before naming anything. |
| 8 | Shape vocabulary | Jak popsat tvar rozdělení slovy? | Symmetric, right-skewed, left-skewed, heavy tails, several peaks, bounded at zero. A labelled gallery of simulated reference shapes (marked as synthetic) next to the real Galápagos histograms; Old Faithful from L04 as a real two-peak callback. Mean versus median from L01 as a familiar skew signal (species: mean 85 vs median 42). |
| 9 | Optional numerical summary | Doplňující: Jak šikmost vyjádřit jedním číslem? | Collapsed Extra: a skewness coefficient as a descriptive number with sign and rough meaning; explicitly no threshold rule. Nothing later depends on it. |
| 10 | Biological origin of skew | Proč je tolik biologických veličin pravostranně šikmých? | Lower bound at zero plus multiplicative growth produce a long right tail; many small additive influences tend towards a symmetric bell (intuition only, no CLT name). Log-normal is not named yet because the logarithm has not been introduced. |
| 11 | Normal distribution as a reference | K čemu slouží normální rozdělení? | Recall the informal bell from L03 and the t-distribution from L04-L05. The normal shape is a reference used by the model for residuals, not a default property of biological data. |
| 12 | Q–Q plot as shape reader | Jak se tvar rozdělení projeví v Q–Q grafu? | Histogram and Q–Q plot side by side for the same reference shapes: right skew bends upward at the right end, heavy tails bend at both ends, two peaks give a step. Retrieve quantiles from L03. |
| 13 | **Part B** divider | Co lineární model předpokládá | Part heading only. |
| 14 | Retrieve the one-model workflow | Jak počet druhů popíše přímka? | Scatter plot and `lm(pocet_druhu ~ plocha_km2)`. Isabela and the other large islands dominate the picture; most islands are squeezed near zero. |
| 15 | Misconception checkpoint | Co přesně má být u lineárního modelu normální? | Self-check MCQ: response, predictor, or residuals? The model assumes approximately normal residuals; a skewed response or predictor alone is not a violation. |
| 16 | Residual diagnostics of the line | Co ukazují residua přímky? | Residuals versus fitted values and residual Q–Q: systematic bend, growing spread and strong skew. Interpret each pattern before naming remedies. |
| 17 | Skewed predictor and influence | Jak jeden velký ostrov ovlivní celou přímku? | A skewed predictor is not an assumption violation but creates leverage: Isabela has Cook's distance about 113 (callback to L07/L09). Contrast "not an assumption problem" with "still a practical problem". |
| 18 | Normality test: usage and reading | Co říká test normality residuí? | `shapiro.test(residuals(...))`; null hypothesis = residuals compatible with a normal shape; read p with L05 logic. Shown after the Q–Q plot, never instead of it. No calculation of the statistic. |
| 19 | Test and sample size | Proč výsledek testu závisí na počtu pozorování? | Hidden simulation figure: the same mild deviation is ignored with n = 30 and flagged with a large n; a strong deviation can pass with a tiny n. Conclusion: the graph and the biological consequence carry the decision. |
| 20 | **Part C** divider | Transformace: měřítko, nebo tvar? | Part heading only. |
| 21 | Change of units | Změní se tvar rozdělení, když plochu převedeme na hektary? | km² → ha: identical histogram, relabelled axis. First example of a transformation that changes only scale. |
| 22 | Centring | Co se změní, když od plochy odečteme průměr? | Shifted axis, same shape. Refit the straight line on centred area: slope unchanged, intercept becomes the expected species number for an island of average area. |
| 23 | z-score built from numbers | Jak daleko od průměru leží ostrov? | Text → concrete numbers for one island (area and elevation of Fernandina, with a value table) → symbols `(x - mean(x)) / sd(x)`, then `scale()`. Callback to the L05 t-statistic as a standardized distance. |
| 24 | z-score for different units | Je Fernandina výjimečnější plochou, nebo výškou? | Compare z-scores of variables in km² and m: Fernandina lies only 0.43 SD above the mean area but 2.36 SD above the mean elevation. Brief note that standardized coefficients make predictors comparable (link to L07), without making them a decision tool. |
| 25 | Misconception: z-score cannot fix skew | Odstraní z-skóre šikmost? | Histograms of area before and after `scale()`: identical shape (skewness 4.65 both times). Self-check prediction before the reveal. |
| 26 | Logarithm as equal steps for equal ratios | Jak logaritmus převádí násobky na stejné kroky? | From the L01 logarithmic axis: 1, 10, 100, 1000 km² become equal steps. Value table first, then `log()`. Natural log is used in models; log10 only for reading axes. log(0) is undefined (block 6 zeros). |
| 27 | Logarithm changes shape | Co logaritmus udělá s tvarem rozdělení? | Main anchor: three histograms of area (original, z-score, log). Log area and log species are roughly symmetric. Name log-normal only as "symmetric after taking logarithms". Square root as a milder shape-changing option. |
| 28 | Synthesis table | Které transformace mění jen měřítko a které i tvar? | Table: unit change, centring, z-score, log, square root; what each changes; when each is useful. |
| 29 | **Part D** divider | Tvar vztahu | Part heading only. |
| 30 | Relationship on log axes | Jak vypadá vztah plochy a počtu druhů na logaritmických osách? | The same islands on original and on log-log axes: the bend straightens. Ask what that means biologically before naming a power law. |
| 31 | Candidate shapes from biology | Jaké tvary vztahu dávají biologický smysl? | Four claims, frozen before any score: the same number of species per km² (line); the same number added per doubling of area (`log(x)`); the same multiple per doubling (log-log, power law); rise and fall (`I(x^2)`). Explain that `lm()` can draw a curve when the formula contains `log()` or `I(x^2)`. Count response: note that a model made for counts comes in a later lesson. |
| 32 | Fitted candidates on original scale | Jak se kandidátní křivky shodují s ostrovy? | All candidate predictions back on the original axes plus their residual plots. Point out that the raw-scale quadratic peaks near 2,770 km² and predicts fewer species for any island larger than that, a claim no biologist would make; it reaches Isabela only because Isabela pulls it (Cook's distance ≈ 142). |
| 33 | Cross-scale comparison trap | Můžeme porovnat AIC modelu pro počet druhů a pro jeho logaritmus? | No: L09 rule of the same response on the same observations. On the raw scale the quadratic has the lowest AIC despite bad residuals and implausible shape; on the log(species) scale log-log is best and adding a log-area² term does not help. |
| 34 | Diagnostics of the favoured model | Pomohl logaritmus také residuím? | Residual plots, Q–Q and Shapiro–Wilk (p ≈ 0.59) for the log-log model; max Cook's distance ≈ 0.14. Read together with n = 30. Contrast that closes the block-15 checkpoint: the raw species count is strongly skewed (Shapiro–Wilk p < 0.001), yet the residuals of `pocet_druhu ~ log(plocha_km2)` look acceptable (p ≈ 0.15). The response can be skewed while the residuals are fine. |
| 35 | **Part E** divider | Interpretace po transformaci | Part heading only. |
| 36 | Interpreting the exponent | Kolikrát víc druhů má dvakrát větší ostrov? | Slope ≈ 0.39 (95% CI 0.30–0.47): doubling area multiplies species by ≈ 1.31, tenfold by ≈ 2.45. Back-transformed predictions describe a typical (median-like) island, not the mean. |
| 37 | Other transformed coefficients | Jak číst koeficient, když logaritmujeme jen jednu stranu? | `y ~ log(x)`: species added per doubling of area; `log(y) ~ x`: percentage change per unit. Quadratic: slope changes along the curve; any turning point is read from predictions, and extrapolation beyond the islands we have is risky. |
| 38 | Answer to the opening question | Jak rychle roste počet druhů s plochou ostrova? | Conditional evidence card: power law with exponent ≈ 0.39 supported by shape, residuals and biology; limitations: 30 islands, a count response (later lesson), islands of one archipelago are not fully independent. |
| 39 | Reusable workflow and bridge | Kdy transformaci použít a kdy ne? | Question → plot → model → residuals → biological claim → transformation as a new candidate, never as a ritual to pass a test. Bridge to L11 (are 30 islands of one archipelago 30 independent pieces of information?) and L12 (models made for counts and proportions). |

## Numerical check of the story map (2026-10-12)

Rerun of the Stage 1 probe on `data/druhy_galapagy.csv` in a vanilla R session (scratch script, not part of the repository). Every number quoted in the story map comes from this check.

- Skewness, raw → log (population formula, as in the Stage 1 probe): species 1.80 → -0.28; area 4.65 → 0.18; elevation 1.53 → -0.10; area after `scale()` 4.65. Square root of area 2.85 (milder change). The rendered Extra uses the SD-based formula taught there and therefore shows 1.71 (species), 4.42 (area) and 1.44 (elevation); the story-map rows quoting 4.65 refer to the probe, the document computes every value inline.
- Mean versus median: species 85.2 vs 42; area 261.7 vs 2.59 km².
- Shapiro–Wilk p: raw species 2.5e-6, log species 0.28; residuals of `pocet_druhu ~ plocha_km2` 5.8e-6.
- Candidates (R², AIC, residual SW p, max Cook's distance). Raw scale: line 0.382 / 360.2 / 5.8e-6 / 113.3 (Isabela); `log(x)` 0.616 / 345.9 / 0.15 / 0.67; quadratic 0.755 / 334.5 / 2.8e-4 / 141.8, turning point ≈ 2,766 km². log(species) scale: line 0.184 / 110.8; quadratic 0.433 / 101.9 / – / 3931; log-log 0.757 / 74.5 / 0.59 / 0.14; log-log + square 0.758 / 76.3.
- Log-log slope 0.389 (95% CI 0.303–0.474): ×1.31 per doubling, ×2.45 per tenfold. Typical predictions at 1, 10, 100, 1000 km²: 18, 45, 109, 267 species.
- `pocet_druhu ~ log(plocha_km2)`: +17.8 species per doubling of area. `log(pocet_druhu) ~ plocha_km2`: about +8% species per 100 km².
- Centring area: slope 0.082 unchanged; intercept 63.8 → 85.2 (mean species at average area).
- Fernandina z-scores: area 0.43, elevation 2.36.

## Active-learning plan

The learning materials use individual self-study prompts. Every prompt is followed by a short payoff or a collapsed solution. Partner work and PollsLive belong to the separately approved presentation story map.

| Story-map block | Student task | Self-study implementation | Teaching purpose |
|---|---|---|---|
| 2 | Name what the L09 residual arch said about the straight line. | Answer revealed below. | Retrieve the open question this lesson answers. |
| 7 | Describe where most islands lie and what the largest islands do to the histograms. | Short payoff text. | Notice the shape before vocabulary. |
| 8 | Match four histograms to the shape words. | Collapsed solution. | Practise the vocabulary. |
| 12 | Match histograms to their Q–Q plots. | Collapsed solution. | Read shape from Q–Q plots. |
| 15 | Choose what must be approximately normal in a linear model. | MCQ with an explanation for every option. | Fix the central misconception. |
| 16 | Name two patterns visible in the residuals of the straight line. | Payoff below the figure. | Interpret before remedies. |
| 19 | Predict whether a larger sample makes the test more or less likely to flag the same deviation. | Simulation figure reveals the answer. | Read tests together with sample size. |
| 23 | Calculate one z-score from supplied mean and SD. | Worked answer. | Make the formula concrete. |
| 25 | Predict whether `scale()` removes skew. | Figure reveal. | Separate scale from shape. |
| 27 | Predict which of the three histograms will change shape. | Anchor figure reveal. | Main contrast of the lesson. |
| 31 | Write one sentence of biological claim for each candidate formula. | Candidate cards follow. | Biology before scores. |
| 33 | Decide whether two given AIC values on different scales can be compared. | Explained answer. | Apply the L09 same-response rule. |
| 36 | Calculate the multiple for a tenfold larger island from the exponent. | Worked answer. | Interpret in biological units. |
| 38 | Write a two-sentence conclusion with one limitation. | Model answer. | Conditional defence. |

## Knowledge-state ledger

Read each row as the state before and after its matching story-map block. A question may point forward, but an answer may use only evidence already shown.

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| 1 — Question | Islands, area, species are everyday ideas. | Lesson question; "how fast" left open. | Power law, logarithm, any model. | Map and question. |
| 2 — L09 retrieval | L09 residual arch, candidate models, AIC on the same response. | The open question "what if no line fits?" | Transformation as the answer. | L09 figure. |
| 3 — Outcomes | Course workflow. | Destinations named. | Their meaning. | Outcome list. |
| 5-6 — Data | Observations, variables, `NA` (L01-L09). | Source, unit, missing elevation, zeros, range of area. | Shape vocabulary. | Visible inspection code. |
| 7 — Histograms | Histograms (L01). | Most islands small; long right tail. | The word šikmost. | Two histograms. |
| 8 — Vocabulary | Mean vs median for asymmetric data (L01). | Symmetric, right/left skewed, heavy tails, several peaks, bounded. | Normal distribution as a term; Q–Q readings of these shapes. | Gallery + real data. |
| 9 — Extra skewness | Block 8. | A descriptive number for skew. | Any threshold. | Collapsed Extra. |
| 10 — Biology of skew | Block 8. | Zero bound and multiplication create right skew; sums of small influences tend to a bell. | Logarithm, log-normal. | Verbal growth example. |
| 11 — Normal reference | Informal bell (L03), t-distribution (L04-L05). | Normal distribution as a reference shape. | Which part of a model it applies to. | Reference curve over a histogram. |
| 12 — Q–Q | Q–Q plot and quantiles (L03, L06, L09). | Q–Q signatures of each shape. | Normality test. | Paired panels. |
| 14 — Line | `lm()`, fitted values (L02-L03). | First model for this lesson's data. | That it is adequate. | Scatter + line. |
| 15 — What must be normal | Residuals (L03); blocks 11-12. | Assumption concerns residuals. | How to test it. | MCQ. |
| 16 — Residual diagnostics | Residual plots (L03, L09). | Bend, growing spread, skew in residuals. | Remedies. | Two diagnostic plots. |
| 17 — Influence | Cook's distance (L07, L09). | A skewed predictor creates leverage without breaking an assumption. | Transformations. | Influence plot. |
| 18 — Test | Null hypothesis and p-value (L05). | Shapiro–Wilk usage and reading. | Its calculation. | R output. |
| 19 — Sample size | Block 18; precision grows with n (L04). | Test sensitivity depends on n. | — | Simulation figure. |
| 21 — Units | Unit conversion. | Linear rescaling keeps shape. | z-score. | Two histograms. |
| 22 — Centring | Intercept meaning (L02). | Centring shifts and changes intercept meaning only. | z-score. | Refitted line. |
| 23 — z-score | Mean, SD (L01); t as standardized distance (L05). | z-score from numbers to symbols; `scale()`. | Shape effect of z-score. | Value table. |
| 24 — Comparing units | Block 23. | z-scores compare variables in different units. | Standardized coefficients as a decision rule. | Fernandina example. |
| 25 — z keeps skew | Blocks 8, 23. | Linear transformations cannot change shape. | Logarithm. | Before/after histograms. |
| 26 — Logarithm | Log axis as display (L01). | Equal ratios → equal steps; `log()`; log(0) undefined. | Its effect on shape or models. | Value table. |
| 27 — Log changes shape | Blocks 8, 26. | Log reduces right skew; log-normal named; square root milder. | Its use inside a model. | Three-histogram anchor. |
| 28 — Synthesis | Blocks 21-27. | Scale versus shape classification. | — | Table. |
| 30 — Log axes | Blocks 26-27; scatter plots. | The bend straightens on log-log axes. | The name power law; candidate set. | Paired scatter plots. |
| 31 — Candidates | L09 candidate habit; `lm()` formulas. | Four biological claims; `log()` and `I(x^2)` in formulas; power law named. | Their scores. | Candidate cards. |
| 32 — Fitted candidates | Block 31. | Back-transformed predictions on original axes. | A ranking. | Common-axis panels. |
| 33 — AIC trap | AIC, same response rule (L09). | AIC cannot compare `y` with `log(y)`; within each scale it can. | — | Two AIC tables. |
| 34 — Diagnostics | Blocks 15-19. | Log-log residuals look compatible with the model. | — | Diagnostic plots + test. |
| 36 — Exponent | Blocks 26, 31. | Multiple per doubling; CI from `confint()` (L05); typical value. | Bias-corrected means. | Worked numbers. |
| 37 — Other forms | Block 36. | Per-doubling, percentage and changing-slope readings; extrapolation risk. | — | Short worked examples. |
| 38 — Conclusion | All blocks. | Conditional answer with limitations. | Count models, dependence models. | Evidence card. |
| 39 — Bridge | All blocks. | Transformation as a candidate model, not a ritual. | L11-L12 content. | Workflow list + two open questions. |

## Glossary coverage plan

Existing slugs to use: `rozdeleni`, `transformace`, `nelinearita`, `qq-graf`, `kvantil`, `residuum`, `aic`, `cookova-vzdalenost`, `heteroskedasticita`, `diagnostika-modelu`. Candidates to add through the `slovnik` workflow (separate repository and authorization): normal distribution, skewness, z-score / standardization, centring, logarithmic transformation, quadratic term, normality test, power law / scaling exponent.

## Open choices for the human reviewer

1. Shape gallery: simulated reference shapes (labelled synthetic) plus the real Galápagos histograms and the L04 Old Faithful callback, because the Galápagos data contain no left-skewed or two-peak variable. Alternative: simulated shapes only.
2. Block 22 (centring) refits the raw straight line. Alternative: centre log(area) in the log-log model in Part E.
3. Opening map: a real map of the archipelago (to be sourced with a reusable licence) or no image.

## Stage 2A - Structural draft

- Story map completed and explicitly human-approved before full prose: [x]
- Section order complete: [x] (all 39 approved headings rendered in order; block 1 is the document title)
- First visual/table included: [x]
- First interpretation prompt included: [x]
- Misconception checkpoint included: [x]
- Bridge to next concept included: [x]

### Structural draft notes

- Opening biological question: how fast does the number of plant species grow with island area? Opened with the NASA MODIS satellite photograph (public domain) and a personal tenfold-area prediction that the reader checks at the end.
- First data moment: visible `head()`, `str()`, `colSums(is.na())`, `range()` inspection; six missing elevations and two genuine zeros flagged for the logarithm block.
- Where the model-based framing first appears: block 14 (straight line), and the block-15 checkpoint ties every distribution question to model residuals.
- The structural draft and development pass were written in one pass on 2026-10-12 because the approved map already fixed the visual anchor and prompt of every block.

### Deviations from the approved story map

- Block 31 freezes **five** candidate formulas instead of four: `log(pocet_druhu) ~ plocha_km2` (the same percentage per km²) was added because block 37 interprets a log-response coefficient and block 33 needs a second same-response candidate on the log scale. Headings and block order are unchanged.
- The L09 tree table (`data/allometrie_stromu.csv`, CC0, unchanged copy) was added so that the block-2 retrieval figure is computed rather than copied. The L04 Old Faithful table was **not** copied because its reuse terms are still unverified (open L04 issue); Old Faithful appears only as a one-sentence callback in block 8.

## Stage 2B - Development pass

- Major concept blocks have visual anchors: [x] (centring figure added after review; blocks 37 and 38 rely on equations, a summary table and an evidence box)
- Interpretation prompts expanded: [x] (prompts added for blocks 17, 22, 23, 34 and 37 after review)
- Explanatory payoff text improved: [x]
- Transitions revised for self-study readability: [x]
- Glossary markup checked where relevant: [x]

### Development pass notes

- Which concept block improved most: block 24 (Fernandina). The first version drew a misleading conclusion from the z-score of a strongly skewed variable; it now contrasts z-scores with ranks and turns the failure into the motivation for shape-changing transformations.
- Which visual or comparison became the main anchor: the four-panel histogram of area (km², z-score, square root, logarithm) for the scale-versus-shape contrast, and the five-candidate figure on the original axes for the functional-form comparison.
- Where the lesson still feels thin: block 37 (one-sided log interpretations) is equation-heavy; blocks 10, 11, 21 and 28 have figure plus payoff without a separate prompt.

### Revision: callbacks to earlier lessons (requested by Ondřej Mottl, 2026-10-12)

Ondřej asked for more callbacks to moments in L01-L09 where an explanation had been postponed or simplified, either directly in the text or as Extras. They were added inside existing blocks; no heading or block order changed, so the approved story map still holds.

| Block | Earlier lesson and what was postponed or simplified | Callback in L10 | Form |
|---|---|---|---|
| 2 | L09: residual arch left as an open question | pointer to the answer at the end of Part D | direct |
| 8 | L01: body mass called "výrazně asymetrická"; L05: t-distribution with "těžší chvosty" | named as right skew and heavy tails | direct |
| 12 | L03: iris Q–Q ends bending in opposite directions; L04: Old Faithful residuals in two groups | read with the new shape vocabulary (slight heavy tails; Old Faithful groups centred on zero, so no step in the Q–Q plot) | direct |
| 15 | L03: "lm does not require a normal response" | stated again and demonstrated on Galápagos data | direct |
| 19 | L03: large samples make tiny deviations "statistically detectable"; L05: power | the simulation shows the effect; named "síla testu" | direct |
| 24 | L02: Pearson correlation as a "number without units" | correlation = mean product of z-scores; unchanged by unit change | Extra |
| 26 | L01: log axis "changes only spacing" | the logarithm is now applied to the values | direct |
| 27 | L01: 11 mammals flagged as outliers in kg | none flagged after the logarithm; outlier status depends on the scale | Extra |
| 30 | L02: Spearman stays high on a curved panel | Pearson 0.62 → 0.87 after logs, Spearman unchanged | direct |
| 34 | L06: diagnostics are not an automatic command to transform | fan removed because biology predicts multiplicative change | direct |
| end of Part D | L09: "what if no straight-line candidate fits?" | trees refitted with `log(prumer_kmene_cm)`: arch strongly flattened (smallest trees still underestimated), AIC 395 → 351; quadratic lower AIC but turns down for the widest trees | visible box |
| 36 | L01: the median recommended for asymmetric data | geometric mean as the back-transformed typical value | direct |

The callbacks were checked by the same independent vision reviewer (Sonnet): 11 of 12 were faithful to the earlier lessons; the Old Faithful Q–Q claim and the overstated trees conclusion were corrected, and six LOW wording points were fixed. The trees refit uses the same response as L09, so AIC is comparable. Mammal data come from `ggplot2::msleep` (already in the lesson environment); no new data file was needed.

### Revision: human notes and knowledge-leakage review (Ondřej Mottl, 2026-10-12)

Requested by Ondřej Mottl after reading the draft:

- Histogram bins now use the first lesson's term "šířka koše" (*bin width*).
- Block 16 gained a histogram of the straight-line residuals (block 34 got the same for consistency).
- Block 15 gained the Extra "Doplňující: měly modely z předchozích lekcí přibližně normální residua?". It has worked Q–Q checks for the iris model (built-in `iris`) and the L09 trees, plus a self-check table for the Old Faithful, crabs-latitude, penguins, knotweed and crabs-sex models, based on what each lesson actually checked.
- The z-score section now states and demonstrates that z-scores of a whole variable have mean 0 and SD 1.

Knowledge-leakage review: a fresh independent read-only subagent (Sonnet, balanced effort, chosen for whole-lesson chronological reasoning) found no HIGH issues and ten MEDIUM issues. Changes made:

- The shape gallery is relabelled 1–5, because A–E is reserved for the candidate models.
- The trees box moved after the island answer, so it no longer uses the per-doubling reading before that reading is taught.
- The model-B "skewed response, fine residuals" box moved next to the candidate residual grid.
- The Pearson/Spearman callback became a collapsed Extra, and the standardized-coefficient paragraph moved into the correlation Extra.
- `exp()` is introduced in the logarithm section, and the doubling step is shown numerically.
- A false reference to an Extra was corrected, a dangling transition replaced, and bridge and re-entry sentences added around Parts C and D.
- Story-map headings and block order are unchanged. The trees box is not a heading, and it now sits at the end of block 38.

### Repository scope decisions (Ondřej Mottl, 2026-10-13)

- Brand sync included in this written-materials PR. The standard render (`R/render_skripta.R` → `R/generate_theme.R`) synchronised the lesson from the canonical `_brand` repository at `028b292` ("Presentation theme: add reusable illustrated title layout"; clean working tree). Content changes are limited to `theme/semantic-boxes.lua`, `theme/presentation_components.scss`, `R/Functions/render_glossary_term.R`, `R/Functions/render_presentation_outputs.R` and `theme/brand_manifest.json`; the remaining theme and R files differ only in line endings, which Git normalises.
- `renv.lock` adds the packages needed to render the written materials (`glossary`, `showtext`, `sysfonts`, `kableExtra` and their dependencies) and drops the unused template dependency `palmerpenguins`; no existing package version changed.
- Old Faithful Q–Q reasoning stays as one line in the collapsed earlier-models Extra (option 1 of three offered).
- Lesson length (56 PDF pages) accepted.

### Revision: mean and SD of the normal distribution; when to transform (Ondřej Mottl, 2026-10-14)

- The block 11 normal-distribution section now explains how the mean sets the centre and the SD the width of the bell. It has two figures (two bells, and SD bands), a prediction prompt, the 68/95/99.7 % rule (computed with `pnorm()` and checked on the simulated sample), a callback to the 95 % interval spanning about two standard errors, and the island-area contrast (mean − SD is negative; the 68 % rule fails for skewed data).
- The z-score section links z between −2 and 2 to the 95 % rule.
- Each transformation has a "when do we use it" box with biological examples: unit change, centring (with a callback to the crab-sex coefficient at 0 mm in the interaction lesson), z-score, and logarithm/square root (including when not to transform).
- Scope note: Stage 0 excluded formal density functions and distribution parameters beyond the intuitive normal reference. The 68/95/99.7 rule is taught as an intuitive property of the bell with no density formula, so it stays inside that boundary.
- The same independent vision reviewer checked these additions: no HIGH findings; one MEDIUM (the "two standard errors" callback mixed data values with the spread of an estimate; it now explains the t critical value and what a 95 % interval does and does not cover) and five LOW items (a quadratic term mentioned before candidates are introduced, box cross-references, the tree example, tight axis labels) were fixed and re-rendered.

## Quality check notes

- What improved most: statistical honesty of the conclusions (AIC only within one response scale, "three arguments from the same islands", z-scores of skewed variables).
- What remains weak: PDF pagination occasionally separates a box title from its body and leaves white space before large figures (Typst layout); the document is long (45 PDF pages) because all five outcomes are covered for self-study.
- What needs reviewer focus: pacing for beginners in Parts C-E, whether the shape gallery and the test-power simulation are clear enough, and whether five candidate formulas are too many.

### Glossary follow-ups (separate `slovnik` workflow)

Terms used as plain text because no slug exists yet: šikmost, normální rozdělení, test normality, centrování, z-skóre, logaritmická transformace, mocninný vztah, kvadratický člen. The source `TODO` comments were removed from `skripta.qmd` so that they do not reach the published HTML; this list is the record of the follow-up.

## Stage 3 - Human review gate

- Finished headings and transitions compared with the story map: [x] (all 39 headings match)
- Heading-strip, visible-copy, and first-use audits completed: [x] (process-narration sentences such as "Nejprve…" rewritten)
- Lesson-vision review completed: [x] Independent read-only subagent (Sonnet, balanced effort, chosen as a capable general model for a complete-lesson review) using `.ai/agents/vision-corrector.md`, 2026-10-12. Result: no HIGH findings; nine MEDIUM findings (misleading z-score conclusion, overclaimed evidence, caption spoiling a prediction, garbled model-B box, $z$ symbol collision, residual Q–Q wording, hardcoded counts in captions and prose, missing centring figure and z-score task, rounding clash) and several LOW items. All were addressed; see the verification note below.
- Glossary-coverage review completed: [x] Independent read-only subagent (Haiku, chosen as an economical model for a bounded markup check) using `.ai/agents/glossary-coverage-reviewer.md`, 2026-10-12. No wrong slugs; many first-in-section occurrences unwrapped. 127 first-occurrence wraps were added by a scripted pass restricted to prose; two misapplied "průměr" wraps (trunk diameter, adverbial "v průměru") were reverted by hand.
- Human review completed: [x] Ondřej Mottl reviewed the rendered skripta over 2026-10-12 to 2026-10-14 and requested the revisions recorded above.
- Credible findings resolved: [x] The same vision reviewer verified the corrections on 2026-10-12: all nine MEDIUM findings resolved; remaining LOW items (clipped hectare axis, one sequencing word, one clumsy prompt, β/b symbol mix) were then fixed and re-rendered. Known cosmetic limitation: Typst sometimes splits a box title from its body across pages.
- HTML/PDF rendered and checked: [x] `R/render_skripta.R`, exit 0, 45-page PDF inspected page by page after each revision
- Reviewer decision: approved by Ondřej Mottl, 2026-10-14

## Decision

- [x] Written materials are review-ready and approved (Ondřej Mottl, 2026-10-14)
- [x] Story-map status is `complete`
- [x] Human story-map approval is `approved` and recorded
- [ ] Diff contains only Stages 2-3 sources, records, and corresponding outputs
- [ ] Written-materials PR ready to merge
- Notes:
