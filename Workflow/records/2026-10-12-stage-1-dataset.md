# Stage 1 - Dataset research and decision

## Metadata and Git checkpoint

- Week: L10
- Date: 2026-10-12
- Author: Claude (Claude Code), working with Ondřej Mottl
- Reviewer: Ondřej Mottl
- Branch: `lesson/l10-scope-data`, based on `main` at `de78260`; Stage 0 committed at `f0feddd`
- `git status --short` reviewed before research: [x] (clean)
- Stage 0 record is on this branch: [x]
- Decision status: **approved and locked (provisional; a larger change may follow later)**
- Human approval: Ondřej Mottl, 2026-10-12 — Galápagos `galamiss` selected instead of the recommended Coweeta trees
- Planning PR: not created

## Inspiration consulted

- Relevant sources from the inspiration hub: [Modern Statistics with R, regression](https://www.modernstatisticswithr.com/regression.html) and [CUNY Biostatistics, linear model extensions](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Linear_model_extensions.html).
- Dataset-selection pattern worth borrowing: CUNY's whelk length-mass example — a measured biological size relationship whose curvature is predicted by geometry (mass grows roughly with length cubed), so the shape can be argued before fitting.
- What to avoid from those sources: `mtcars` and other non-biological examples (MSwR); `nls()` and GAM fits as the main route (CUNY).

## Exclusion audit

Primary datasets of L01-L09 are excluded (confirmed constraint from Stage 0): `ggplot2::msleep` (L01), Palmer Penguins (L02, L06), `iris` (L03), Old Faithful 2024 eruptions (L04), *Minuca pugnax* salt-marsh crabs (L05), Japanese knotweed and climate (L07), `MASS::crabs` (L08), `lgrdata::allometry` conifer allometry (L09). None of these is shortlisted. `MASS::Animals` was not considered because it repeats the L01 body-mass story.

## Dataset requirements

Derived from the five approved outcomes:

- one strictly positive, clearly right-skewed continuous response with a biological, multiplicative explanation for the skew;
- a numeric predictor with a curved relationship whose shape biology can predict before fitting;
- residuals of the straight line that are visibly non-normal or fan-shaped, and that change meaningfully after a shape-changing transformation (so the normality test in the main route has something honest to show);
- a second relationship with the **same response scale** for comparing straight line, `log(x)`, and quadratic candidates with AIC;
- several variables in different units for the z-score comparison, and at least one roughly symmetric variable as a contrast in the distribution-shape gallery;
- 50-300 independent observations, documented provenance, explicit reuse terms, little missingness, no structure that would pull L11 or L12 forward.

## Broad discovery gate

- Independent source families consulted: CRAN `lgrdata` (with Coweeta LTER / EDI as primary repository); CRAN `FSAdata`; CRAN `faraway` (Johnson & Raven 1973); base R `datasets`; CRAN `gapminder` (Gapminder Foundation); CUNY Biostatistics book and its GitHub data; Dryad (insect thermal-performance data).
- Credible examples reviewed: 10 (the two fish datasets are counted as one example family).
- Established course/tutorial examples included: [x] (CUNY whelk, `faraway::gala`, `airquality`, `trees`, Gapminder)
- Primary dataset documentation or domain repositories included: [x] (EDI Coweeta LTER package, Dryad, Science 1973 source of `gala`)
- Minimum of 8 examples from at least 4 independent source families reached without padding: [x]
- Search path note: Czech public-life sources (ČSÚ, volby.cz) were considered first by the preferred order, but no public-life variable offers a biologically predicted functional form; the natural Czech candidate (municipality size versus turnout) has a bounded proportion as response (L12 territory) and municipalities nested in districts (L11). It was not probed numerically.

All probes below use complete cases. "Curvature p" tests a quadratic term in residuals versus fitted values of the straight line; SW is the Shapiro–Wilk p-value of model residuals; skewness is the sample skewness (`moments::skewness`).

| Source | Dataset / example | Variables and model | Unit and sampling story | Probe | Useful pattern | Main complication | Decision |
|---|---|---|---|---|---|---|---|
| `lgrdata` / Coweeta LTER (EDI `knb-lter-cwt.4004.20`) | `coweeta` | total biomass ~ DBH; height ~ DBH; plus age, elevation, foliage mass, SLA, species, site | 87 trees of 10 deciduous species, Coweeta Hydrologic Laboratory, NC; Martin et al. 1998, *Can. J. For. Res.* 28: 1648-1659 | biomass skew 1.76 → -0.60 on log; log-log R² 0.986, exponent 2.66; SW lin 1e-4 → log-log 0.32; height~DBH: AIC lin 489, log(x) 465, quadratic 471 | power law predicted by biology, fan-shaped spread fixed by log, second same-response comparison | tree topic follows the L09 conifer allometry; species and site grouping; original EDI license not machine-readable | **finalist 1** |
| `faraway` (Johnson & Raven 1973, *Science* 179: 893-895) | `gala` / `galamiss` | plant species number ~ island area; + elevation, distances | 30 Galápagos islands | area skew 4.65; Cook's distance 113 for the straight line; log-log R² 0.757, z = 0.39 (CI 0.30-0.47); SW lin 6e-6 → log-log 0.59 | classic species-area power law; extreme predictor skew and leverage | n = 30; response is a count (L12); `gala` has imputed values, `galamiss` has 6 missing elevations | **finalist 2** |
| `FSAdata` (D. H. Ogle) | `InchLake2`, bluegill | weight ~ total length | 210 bluegills from 32 net sets, Inch Lake WI, May 2007-2008 | weight skew 0.70; log-log R² 0.977, exponent 3.17; quadratic AIC 1567 vs line 2059; SW log-log 1.5e-13 | weight ≈ length³ geometry, isometric-growth discussion | lengths in inches; residuals stay non-normal after log (4 small-fish outliers, two years and many nets) | **finalist 3** |
| `FSAdata` (NTL-LTER) | `CiscoTL` | weight ~ length per year | 8,594 cisco, Trout Lake WI, 1981-2006 | 1981: log-log R² 0.986, exponent 3.05; 2004: n = 33 | same as above | strong year structure; per-year subsets either small or arbitrary | reject (variant of the fish family) |
| CUNY Biostatistics book, GitHub `whelk.csv` (Gosnell et al. 2023, *J. Shellfish Res.* 42: 501-506) | Kellet's whelk | mass ~ shell length; location, sex | 412 complete whelks, San Diego and Santa Barbara | Santa Barbara n = 313: skew 0.70 → -0.37; exponent 2.86; SW lin 2.5e-7 → log-log 0.74 | the CUNY teaching pattern itself | GitHub repository has no license; raw data not deposited in a repository | reject (reuse terms) |
| `lgrdata` (Nancy Howell, U Toronto TSpace) | `howell` | weight ~ height, weight ~ age | 783 !Kung San people, all ages | all ages: weight~age curvature p 1e-169, quadratic AIC 5124 vs line 5892; adults only: relationships nearly flat | rich distribution gallery (skewed age, left-skewed height) | curvature is driven by mixing children and adults; census data of an Indigenous community raise representation concerns for a playful lesson | reject |
| base R `datasets` (Chambers et al. 1983) | `airquality` | ozone ~ temperature, ozone ~ wind | 116 days with ozone, New York, May-Sept 1973 | ozone skew 1.23 → -0.56; SW lin 1e-7 → log-log 0.07 | skewed concentration response | not biological; daily time-series dependence; 37 missing ozone values | reject |
| base R `datasets` (Ryan et al. 1976) | `trees` | volume ~ girth | 31 felled black cherry trees | log-log exponent 2.20; SW already fine on raw scale | volume geometry | n = 31; residuals already normal, so the normality story is empty | reject |
| CRAN `gapminder` (Gapminder Foundation, CC BY) | `gapminder`, 2007 | life expectancy ~ GDP per capita | 142 countries | GDP skew 1.21; log(x) R² 0.654 vs line 0.461 | public-life log predictor, left-skewed response | not biological; countries are not independent (regions); log-log residuals worse (SW 2e-8) | reject |
| Dryad, *Pieris napi* development (doi:10.5061/dryad.gtht76hm5) and related insect thermal-performance data | development rate ~ temperature | larvae at 8 constant temperatures | optimum-shaped response suits a quadratic term | not probed numerically | only 8 predictor levels, individuals nested in families, mechanistic TPC models are the literature standard | reject (teaching pattern noted) |

## Finalist comparison

| Finalist | Learning-outcome fit | Student relevance | Interpretability | Stepwise buildability | Practical feasibility | Main risks | Rank |
|---|---|---|---|---|---|---|---|
| Coweeta tree biomass | All five outcomes in one dataset: skewed biomass, foliage mass, SLA and age versus symmetric height; residual normality fails then passes; z-score on variables in cm, m, years, m a.s.l.; power law plus a same-response concave relationship | How much does a tree weigh, and how do foresters estimate forest carbon without felling every tree? | Diameter, height, mass — all tangible; exponent 2.66 has a clear meaning ("doubling diameter multiplies biomass by about 6.3") | histogram → scatter → straight line → residual fan → log scale → log-log line → back on original scale; height~DBH for candidate comparison | 87 rows, 9 columns, CC0 package copy, no missing values except 3 implausible ages | topic repeat of L09 trees; species and site structure; original-license check | 1 |
| Galápagos species-area | Strong for skewed predictor, leverage, power law and the classic log-log versus semi-log debate | Island biogeography is memorable | Very clear story, but "species number" is a count | strong visual sequence | only 30 islands; imputed values in `gala` | small n weakens diagnostics; count response belongs to L12 | 2 |
| Inch Lake bluegill | Clean length-weight power law with a known expected exponent (3) | fish are familiar; fisheries relevance | very clear geometry | strong for log-log | 210 rows, GPL package | inches; persistent non-normal residuals after log; net and year structure | 3 |

## Numerical and practical feasibility probes

### Finalist 1: Coweeta tree biomass (`lgrdata::coweeta`)

- Provenance, reuse conditions, and stable access: distributed in CRAN `lgrdata` 0.1.x under CC0 by R. Duursma, citing Martin, Kloeppel, Schaefer, Kimbler & McNulty (1998). Primary repository: EDI package `knb-lter-cwt.4004.20`, "Aboveground biomass and nitrogen allocation of ten deciduous southern Appalachian tree species at the Coweeta Hydrologic Laboratory in 1997" (B. D. Kloeppel; DOI 10.6073/pasta/d1d7450d417884bf5f55ebbf00293405). **Open check:** the EDI portal and PASTA API refused automated access, so the original intellectual-rights statement and the field method (felled and weighed versus estimated) could not be read; both must be confirmed in a browser before locking. Coweeta LTER packages are normally released under CC0 or CC BY.
- Observational unit, intended population, and sampling story: one mature tree; 87 trees of 10 deciduous species (4-11 per species) sampled at 11 sites in a southern Appalachian forest to build allometric equations.
- Variables: species, site, elevation (m), age (yr), DBH (cm), height (m), foliage mass (kg), SLA (cm² g⁻¹), total biomass (kg; unit implied by the paper, not stated in the package).
- Missingness and data check: no `NA` values, but three flowering dogwoods (`cofl`) have age 0 — almost certainly unknown age coded as 0. A genuine, small data-check moment.
- Distribution gallery (skewness): biomass 1.76, SLA 2.10, foliage mass 1.72, age 1.26, DBH 0.57, height -0.02. Biomass mean 550 versus median 264.
- Main model: straight line `biomass ~ DBH` R² 0.848, residual spread grows with the fitted value (correlation of |residual| with fitted 0.33), residual curvature p = 3.8e-23, Shapiro–Wilk p = 1.1e-4. Log-log `log(biomass) ~ log(DBH)` R² 0.986, exponent 2.66 (95% CI 2.59-2.73), spread correlation 0.03, Shapiro–Wilk p = 0.32, max Cook's distance 0.11.
- Response versus residual normality: Shapiro–Wilk on raw biomass p = 1e-10, on log biomass p = 0.016, on log-log residuals p = 0.32 — the response itself is not normal even after the log, while the model residuals are. This directly supports the Stage 0 misconception checkpoint.
- Transformation interpretation: doubling DBH multiplies predicted biomass by 6.33; a 10% wider trunk means about 29% more biomass. The exponent is close to the value 8/3 discussed in metabolic scaling theory — an optional biological aside, not a claim the lesson must make.
- Same-response candidate comparison: `height ~ DBH` is concave (diminishing height gain): AIC line 489, quadratic 471, `log(DBH)` 465. Residuals are already roughly normal (SW 0.28), so this second relationship isolates the functional-form question from the distribution question.
- z-score: skewness of DBH is 0.574 before and after `scale()`, demonstrating that standardization does not change shape; standardized predictors give comparable coefficients (log DBH 1.51 versus height 0.18 on the log-biomass scale).
- Hidden structure: adding species to the log-log model lowers AIC from -28 to -65 (R² 0.992). The lesson can mention species as an extra known predictor (L06-L09 skills) without making it central. Sites are unevenly sampled (1-24 trees); dependence is a natural forward link to L11, not a main-route complication.
- Teaching opportunities and complications: an ideal single dataset for all outcomes. The main risk is didactic repetition — L09 also used tree allometry (conifer height versus diameter). Mitigation: change the question (mass and carbon rather than height), the species (deciduous broadleaves) and the setting, and use the L09 residual arch only as retrieval evidence.

### Finalist 2: Galápagos plant species and island area (`faraway::galamiss`)

- Provenance, reuse conditions, and stable access: Johnson & Raven (1973), distributed in CRAN `faraway` (GPL). `gala` fills missing values "for convenience"; `galamiss` keeps the original values with 6 missing elevations. Facts from a published table; redistribution of the numbers is low-risk, but the GPL package licence should be cited.
- Observational unit and sampling story: one island; 30 islands of the archipelago.
- Numerical probe: area skewness 4.65, species 1.80; straight line R² 0.382 with Cook's distance 113 for the largest island; `log(Species) ~ log(Area)` R² 0.757, z = 0.39 (CI 0.30-0.47), SW 0.59. Same-response comparison on species: AIC line 360, `log(Area)` 346, quadratic 334 — the quadratic "wins" by bending to one huge island, a useful cautionary case.
- Teaching opportunities and complications: superb for skewed predictors, leverage, and the biological power law, but n = 30 and a count response (properly a Poisson GLM in L12) limit it as the lesson backbone. Could serve as a short second example in the written materials.

### Finalist 3: Inch Lake bluegill (`FSAdata::InchLake2`)

- Provenance, reuse conditions, and stable access: Derek H. Ogle's personal collection, CRAN `FSAdata` (GPL ≥ 2). Inch Lake, Wisconsin, May 2007 and 2008.
- Observational unit and sampling story: one fish; 210 bluegills from 32 net sets.
- Numerical probe: weight skew 0.70, length -0.49; straight line R² 0.810, curvature p = 3e-116; quadratic AIC 1567 versus 2059; log-log R² 0.977, exponent 3.17 (3.24 without four small-fish outliers). Log-log residuals remain strongly non-normal (SW 1.5e-13, still 2e-11 after removing |standardized residual| > 3).
- Teaching opportunities and complications: the clearest geometric story (mass ∝ length³), but the residual-normality block would end with "the transformation did not fix it", lengths are in inches, and net/year structure is present.

## Approved decision

Ondřej Mottl reviewed the recommendation below on 2026-10-12 and chose **finalist 2, `faraway::galamiss`**, because he does not want to use trees again directly after L09. He first proposed storing the species number already log-transformed in the prepared data. After the trade-off was discussed, he chose to keep the raw count in the data (option a) and to apply the logarithm visibly in the lesson. He described the decision as provisional: a larger change may still follow.

- **Approved dataset:** `faraway::galamiss` 1.0.9 (Johnson & Raven 1973), prepared as `data/druhy_galapagy.csv` by `R/prepare_galapagos_data.R`.
- **Approved response:** number of plant species on an island (`pocet_druhu`), stored as the raw count. The lesson shows its right skew and the failed residual diagnostics of the straight line, then takes `log()` openly as a modelling choice; candidate functional forms are compared on the log(species) scale.
- **Key predictor:** island area in km² (`plocha_km2`); maximum elevation and distances (m, km) serve the distribution gallery, the z-score comparison, and a correlated-predictor callback.
- **Main biological question:** Why do larger islands hold more plant species, and how fast does the number of species grow with island area?
- **Why it fits despite ranking second:** it supports all five outcomes and avoids repeating the L09 tree allometry. Its weaknesses are recorded below and must be handled in Stage 2.

### Numerical probe for the approved design (option a)

| Candidate on the log(species) scale | R² | AIC | Shapiro–Wilk p (residuals) | Max Cook's distance |
|---|---:|---:|---:|---:|
| `log(species) ~ area` | 0.184 | 110.8 | 0.19 | 54.6 |
| `log(species) ~ area + area²` | 0.433 | 101.9 | 0.14 | 3931 |
| `log(species) ~ log(area)` | 0.757 | 74.5 | 0.59 | 0.14 |
| `log(species) ~ log(area) + log(area)²` | 0.758 | 76.3 | 0.50 | 0.10 |

| Candidate on the raw species scale | R² | AIC | Shapiro–Wilk p (residuals) | Max Cook's distance |
|---|---:|---:|---:|---:|
| `species ~ area` | 0.382 | 360.2 | < 0.001 | 113.3 |
| `species ~ log(area)` | 0.616 | 345.9 | 0.15 | 0.67 |
| `species ~ area + area²` | 0.755 | 334.5 | < 0.001 | 141.8 |

- Power-law exponent z = 0.39 (95% CI 0.30-0.47): doubling island area multiplies the expected number of species by about 1.31, a tenfold area by about 2.45 (back-transformed; a typical rather than mean value).
- On the raw scale the quadratic has the lowest AIC despite clearly non-normal residuals and extreme influence — the cross-scale AIC trap planned in Stage 0 can be shown honestly only because the raw count is kept.
- A quadratic term in log(area) adds nothing (R² 0.757 → 0.758, higher AIC) — a direct callback to the L09 complexity argument.
- Skewness of raw variables 1.5-4.7 (area 4.65 before and after `scale()`), of log-transformed variables -0.3 to 0.3. No naturally left-skewed variable exists; a short contrasting example may be needed in the written materials.
- Data-check moments: 6 missing elevations; distance to Santa Cruz is 0 for Santa Cruz itself, so `log()` is undefined there; endemic count is 0 for one island.
- Correlated predictors: log(area) and log(elevation) correlate at 0.89 (n = 24 complete islands); adding log(elevation) does not improve AIC.

### Risks carried into Stage 2

- Only 30 islands (24 with elevation): Q–Q plots and histograms are noisy, and the Shapiro–Wilk test has low power. This supports the approved "read the test with sample size" message but must not make diagnostics look arbitrary.
- The response is a count. The written materials will state briefly that a model for counts follows in a later lesson, without introducing GLM here.
- Islands of one archipelago are not fully independent; this is a forward link to L11, not a main-route complication.
- No second, independently curved relationship comparable to tree height versus diameter; the functional-form comparison happens within the species-area relationship.
- Island names are stored without Spanish accents to avoid encoding problems in student CSV import.

## Original recommendation (superseded by the approved decision above)

- **Recommended dataset:** `lgrdata::coweeta` (Coweeta LTER tree biomass, Martin et al. 1998), prepared as a Czech teaching table under `data/` with a reproducible acquisition script, as in L09.
- **Response:** total aboveground tree biomass (kg).
- **Key predictor:** trunk diameter at breast height (cm); height (m) as the second response for the same-scale candidate comparison; age, elevation, foliage mass and SLA for the distribution gallery and z-scores.
- **Main biological question:** How much does a tree weigh, and can its mass be estimated from something as easy to measure as trunk diameter?
- **Why it is best for this week:** one real, compact, complete dataset carries all five outcomes — skewed and symmetric variables side by side, residual normality that fails for the straight line and holds after a biologically motivated log-log transformation, a z-score demonstration, a power-law exponent with an intuitive interpretation, and a second concave relationship for a same-response candidate comparison.
- **First figure idea:** histograms of tree height (symmetric) and tree biomass (strongly right-skewed) side by side, with the question "Proč vypadají tak odlišně, když jde o stejné stromy?".
- **Bridge to the next lesson:** trees come from 11 sites with very unequal numbers; are 87 trees really 87 independent pieces of information? That question opens L11.
- **Alternatives kept:** Galápagos species-area as an optional short second example in the written materials; bluegill as a fallback if the Coweeta reuse terms prove restrictive.

## Why the approved dataset matches the project filter

- Supports model-first teaching: every distribution question is asked about a fitted `lm()` and its residuals; transformations are candidate models compared on one response scale.
- Understandable for biology beginners: island size and number of plant species are immediately interpretable, and the species-area relationship is a classic ecological pattern.
- Uses real data appropriately: published values with genuine missingness and a genuine zero that limits the logarithm.
- Avoids unnecessary tooling or syntax burden: base-R `read.csv()`, `log()`, `scale()`, `I(x^2)`, `hist()`, `qqnorm()`, `shapiro.test()` and `lm()` cover the main route; students never need the `faraway` package.

## Acquisition and provenance

- `R/prepare_galapagos_data.R` downloads `faraway_1.0.9.tar.gz` from CRAN (current URL, with the CRAN Archive as fallback), verifies SHA-256 `1074ed85a0cf018fc2fd3e2a48bed666b2fa06b8461b7a3820aeb67b34a52d5d`, and reads `data/galamiss.rda` without installing the package. This keeps `faraway` and its modelling dependencies (`lme4`, `nlme`) out of the lesson `renv` environment.
- The script only converts row names to readable island names, translates column names into Czech, and stores counts as integers. All 30 rows and every value, including the 6 missing elevations, are unchanged.
- Output SHA-256 of `data/druhy_galapagy.csv`: `a60499f4070e59dfe729035bdb2d14fb84ca6c2db5fee3694ceca1ce84c98fb2`, identical when the script was run with and without `faraway` installed.
- Reuse: published values from Johnson & Raven (1973), distributed in the GPL `faraway` package; `data/README.md` attributes both and excludes the data from the course licence.
- Rejected-alternative note: the Coweeta EDI rights question no longer blocks the lesson.

## Decision checklist

- [x] At least 4 independent source families were consulted
- [x] At least 8 credible examples were reviewed without padding trivial variants
- [x] L01-L09 primary datasets were explicitly excluded
- [x] Three finalists were compared and numerically probed
- [x] Provenance, access, reuse, missingness, and modelling risks were checked proportionally for the approved dataset
- [x] Human reviewer approved the selected dataset (Galápagos `galamiss`, raw count kept; provisional)
- [x] Dataset locked for implementation
- [x] README and release metadata updated to the approved public data story
- [ ] Planning PR ready for human review
- Notes: Exploratory probes ran in an untracked scratch R library outside the lesson repository. The approved table is reproduced by `R/prepare_galapagos_data.R` inside the restored project environment without adding packages to `renv.lock`. Coweeta and bluegill remain documented alternatives if the provisional decision is revisited.
