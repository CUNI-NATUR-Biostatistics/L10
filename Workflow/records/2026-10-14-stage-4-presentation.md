# Stages 4-5 - Slide Storyboard, Build, and Human Review

## Metadata

- Week: L10
- Date: 2026-10-14
- Author: Claude Code (Opus 5.5), working with Ondřej Mottl
- Reviewer: Ondřej Mottl (story map, ledger, PollsLive questions and illustration plan approved 2026-10-14)

## Git checkpoint

- Stage group: Stages 4-5 presentation
- Branch: `lesson/l10-presentation` (created with explicit authorization from Ondřej Mottl, 2026-10-14)
- Base branch and commit: `main` at `5c6f4e2` (merged Stages 2-3 PR #2)
- Stages 2-3 PR merged: [x] (#2)
- Branch created from updated default branch: [x] (`git fetch` showed `main` level with `origin/main`)
- `git status --short` reviewed before editing: [x] (clean)
- Presentation PR: not created

## Inspiration consulted

- Relevant sources from `_internal/obecne/nove/biostatistics_course_inspiration_hub.md`: [Modern Statistics with R, regression](https://www.modernstatisticswithr.com/regression.html) and [CUNY Biostatistics, linear model extensions](https://jsgosnell.github.io/cuny_biostats_book/content/chapters/Linear_model_extensions.html). These are the sources recorded in Stage 0 and used for the approved skripta.
- Visual or data-storytelling pattern worth borrowing: one anchor histogram of island area that returns in every scale (km², hectares, centred, z-score, square root, log); one anchor scatterplot of area and species on fixed original axes; candidates frozen as biological claims before any score; a personal estimate at the opening that the data answer at the end.
- How the pattern is adapted to this course's slide rules: every block opens with a data moment or prediction, names the concept only after the encounter, and interprets on the same or the next slide. Fit statistics appear only after the biological claims and the original-scale curves.
- What from the source is intentionally not being reused: Box-Cox, ladders of powers, choosing a transformation by test p-values or AIC alone, `nls()`, GAMs, splines and high-order polynomials.

## Presentation vision

One question carries the deck: **Jak rychle roste počet druhů rostlin s plochou ostrova?** Students commit to a personal estimate for a ten-times-larger island on slide 2. Before they can answer, they need words for the shape of a distribution (Part A). They then need to know where the linear model actually demands a normal shape, which is in the residuals (Part B). The straight line fails on the islands, so they sort transformations into those that change only the scale and those that change the shape (Part C). The logarithm, which reshapes a skewed variable, also straightens the species–area relationship. Five biologically motivated candidates are compared on the original scale, with one AIC trap (Part D). The deck closes by reading the exponent in biological units: a ten-times-larger island has about 2,5 times more species. That answers the opening estimate and the L09 tree arch, then hands over to L11 (are islands of one archipelago independent?).

The slides distil the approved 39-block skripta, which Stage 0 made the complete source. The presentation selects the most important blocks and introduces no core concept that the skripta lacks. Deliberately left to the skripta:

- block 9, the numerical skewness Extra;
- the earlier-models normality Extra;
- the correlation and standardized-coefficient Extra;
- the Pearson/Spearman and mammal-outlier callbacks;
- the "log(area)²" addition on the log scale (one speaker-note sentence only).

## Mandatory story map

- Artifact: Presentation (`Presentation/presentation.qmd`)
- Granularity: one row per slide, including section dividers and PollsLive slides
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-10-14
- Approval decision and requested revisions: Ondřej Mottl explicitly approved, without revisions, three separate items on 2026-10-14: (1) the 55-slide story map and knowledge-state ledger; (2) the PollsLive integration map and the three exact questions (key C–A–D); (3) the generated illustration plan (title image T and G1–G4).

`Internal role` and `Speaker note` are backstage. `Student-facing heading` is the exact proposed visible title. No full slide copy has been drafted. Numbers in speaker notes come from the Stage 2 numerical check and from a 2026-10-14 rerun of the L09 metrics. On the slides, every value will be computed inline from the model objects.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Question-first title (title image T) | Jak rychle roste počet druhů rostlin s plochou ostrova? | `.course-title` arrival screen: L10, formal title "Tvar rozdělení, transformace a nelinearita", course link, lesson-derived title image (slot until generated). |
| 2 | Visual hook plus personal estimate | Kolikrát víc druhů rostlin má desetkrát větší ostrov? | NASA MODIS satellite photograph of the archipelago (public domain, footer credit). Show of hands on four equal cards: about 1,5× / about 2,5× / about 5× / 10×. Do not reveal; the data answer arrives on slide 48. Ask students to remember their choice. |
| 3 | PollsLive collection | Co si pamatujete z minulé lekce? | Generated by the PollsLive include: QR/link plus three self-paced L09 retrieval questions. |
| 4 | Retrieval Q1 (generated) | Proč model Různé sklony nemá nejvyšší adjustované R², přestože má nejvyšší R²? | Exact text under *PollsLive retrieval proposal*. |
| 5 | Retrieval Q2 (generated) | Model Posun mezi druhy má ΔAIC = 0. Co to znamená? | As above. |
| 6 | Retrieval Q3 (generated) | Co prozrazuje oblouk v residuích modelu Posun mezi druhy? | Spoken bridge: L09 ended with "Co když žádná přímka nestačí?" Islands show the same problem more strongly, and this lesson answers it. The trees return on slide 50. |
| 7 | Learning outcomes | Výsledky učení | Five incremental bullets matching the skripta outcomes. Shape, scale-versus-shape transformations, recognising a curved relationship, comparing biologically sensible shapes, interpreting coefficients after transformation. Terms appear only as destinations. |
| 8 | Section divider | Tvar rozdělení | Minimal H1. |
| 9 | Observation unit and variables (generated illustration G1) | Jeden řádek tabulky představuje jeden ostrov | G1 `ostrovy_pruzkum.png` left. Right: a short variable list (island, number of plant species, area in km², highest elevation in m, …) with units. Footer: Johnson & Raven (1973), `faraway::galamiss`. |
| 10 | Data inspection habit | Co v tabulce chybí a co je neobvyklé? | Code left (`read.csv`, `str()`, `colSums(is.na())`, `range()`), output right. Quick question to the room: which of these values could cause trouble later? Fragment card, computed inline: 30 islands, 6 missing elevations, area from 0,01 to 4 669 km², genuine zeros elsewhere in the table. |
| 11 | First data moment, think–pair–share | Jak vypadají počty druhů a plochy ostrovů? | Two histograms (species, area), using the L01 term "šířka koše" if bins are mentioned. Prompt: where do most islands lie, and what do the few largest islands do to each picture? No vocabulary yet. |
| 12 | Interpretation and naming | Dlouhý ocas vpravo táhne průměr od mediánu | Same histograms plus graphite median and orange mean markers (species 85 vs 42; area 261,7 vs 2,59 km², inline). Body names "pravostranně šikmé rozdělení (right-skewed)" after the observation; L01 callback: the median is recommended for asymmetric data. |
| 13 | Shape vocabulary, matching task | Které slovo patří ke kterému tvaru? | Gallery of five simulated shapes labelled 1–5, with a visible "simulovaná data" marker. Word bank: souměrné, pravostranně šikmé, levostranně šikmé, těžké konce, dva vrcholy. Pairs match; answers appear as fragment badges under the panels. Brief callbacks: heavy tails of the t-distribution (L05), Old Faithful two groups (L04). |
| 14 | Biological origin of skew | Proč je tolik biologických veličin pravostranně šikmých? | Prompt first: area cannot be negative, but how large can it be? Then the two simulated growth histograms (additive versus multiplicative growth) as a fragment. Takeaway: a lower bound at zero plus multiplication produces a long right tail; many small additive influences give a bell. |
| 15 | Prediction vote on the bell | Kolik hodnot leží do jedné směrodatné odchylky od průměru? | Simulated bell with the mean and ±1 SD marked (L01 terms). Vote: about half / about two thirds / about 95 %. Fragment: the 68/95/99,7 % rule (computed with `pnorm()`). Name "normální rozdělení (normal distribution)", the bell students met informally in L03. |
| 16 | Contrast with real skewed data | Platí pravidlo 68 % i pro plochy ostrovů? | Island-area histogram with mean ± SD band; mean − SD is negative (inline). Pair question: what is wrong with this band? Takeaway strip: the normal shape is a reference, not a property that biological data must have. |
| 17 | Q–Q signatures, matching | Jak se dlouhý ocas pozná v Q–Q grafu? | Five Q–Q plots for the gallery shapes, shuffled and unlabelled. Pairs match them to histograms 1–5. Fragment: right skew bends up at the right end, heavy tails bend at both ends, two peaks give a step. Callback: quantiles and Q–Q plots from L03. |
| 18 | Section divider | Co lineární model předpokládá | Minimal H1. |
| 19 | Familiar model on the new data | Jak počet druhů popíše přímka? | Visible `lm(pocet_druhu ~ plocha_km2)` left; anchor scatterplot (original axes, fixed for slides 19, 40, 41 and 48) with the purple line right. Prompt: where do most islands lie in this graph, and which island steers the line? Isabela labelled. |
| 20 | Misconception MCQ (blank heading) | *(prázdný nadpis)* | Blank-heading MCQ box: "Co musí být u lineárního modelu přibližně normální?" A: počet druhů (odezva); B: plocha (prediktor); C: residua; D: odezva i prediktor. Partner convince, then circle C. Fragment explanation recalls L03: `lm()` does not require a normal response. Slide 45 returns to this question. |
| 21 | Residual evidence, pair prompt | Co ukazují residua přímky? | Three panels: residuals versus fitted values, residual histogram, residual Q–Q plot. Pairs name two patterns before any fragment. Fragment annotations: systematic bend, spread growing with the fitted value, long right tail. Remedies are not named yet. |
| 22 | Influence (L07/L09 callback) | Jak jeden velký ostrov ovlivní celou přímku? | Cook's distance plot, Isabela far above the others (≈ 113, inline). Two contrasted panels: "skewed predictor ≠ broken assumption" and "still a practical problem: one island steers the line". |
| 23 | Normality test, usage only | Co říká test normality residuí? | Visible `shapiro.test(residuals(mod_primka))` left, output right. Reading via L05: null hypothesis = residuals compatible with a normal shape, small p = evidence against it. Strip: the test follows the Q–Q plot, never replaces it. No calculation of the statistic. |
| 24 | Prediction vote, then simulation reveal | Odhalí test stejnou mírnou odchylku v malém i ve velkém vzorku? | Vote: yes in both / mainly in the small sample / mainly in the large sample. Fragment: simulation figure (labelled simulated) showing that the same mild deviation is rarely flagged at n = 30 and almost always at large n, while a strong deviation can pass at tiny n. Takeaway: the graph and the biological consequence decide; the test depends on sample size (L05 power callback). |
| 25 | Spine return (mid-lecture) | Co už o ostrovech víme? | `.box-question` repeats the title question verbatim. Left `.panel-result`: species and area are right-skewed; the line misses most islands; the residuals bend, fan out and are skewed; Isabela steers the line. Right `.panel-question`: how to describe islands from 0,01 to 4 669 km² in one model? Can changing the variables help, and which change? |
| 26 | Section divider | Transformace: měřítko, nebo tvar? | Minimal H1. "Transformace" is the course glossary word for changing a variable's values; students have just asked whether changing the variables can help. |
| 27 | Prediction, then evidence | Změní se tvar rozdělení, když plochu převedeme na hektary? | Quick prediction by show of hands; fragment shows the two histograms (km², ha) with identical shapes and only the axis relabelled. First chip: "mění jen měřítko". |
| 28 | Centring, pair interpretation | Co se změní, když od plochy odečteme průměr? | Centred-area histogram (same shape, shifted axis) plus the refitted line: slope unchanged (0,082, inline), intercept 63,8 → 85,2 (inline). Pair question: what does the intercept mean now? Answer: the expected species number for an island of average area. Short "when we use it" line (L08 callback: the crab-sex coefficient at 0 mm). |
| 29 | z-score from numbers to symbols | Jak daleko od průměru leží Fernandina? | Value table: Fernandina's elevation, mean, SD. Students compute z themselves (given numbers), then a fragment with the result (2,36, inline). Then the general `(x − průměr) / SD` and the visible `scale()` call. Callback: the L05 t-statistic as a standardized distance. Name "z-skóre (z-score)"; z-scores of a whole variable have mean 0 and SD 1. |
| 30 | Prediction then twist | Je Fernandina výjimečnější plochou, nebo výškou? | Vote from z-scores (area 0,43 vs elevation 2,36, inline): "výškou" / "plochou" / "stejně". Fragment: ranks of Fernandina by area and by elevation (inline) show that it is exceptional in both. `.box-warning`: z-scores of a strongly skewed variable mislead, because Isabela inflates the SD. |
| 31 | Prediction vote, then reveal | Odstraní z-skóre šikmost? | Vote: yes / partly / no. Fragment: the area histogram before and after `scale()`, identical shape, only the axis changes. Name "lineární transformace": multiply and/or add the same number, so the shape stays. |
| 32 | Logarithm as equal steps | Jak logaritmus převádí násobky na stejné kroky? | Value table of doubling areas (1, 2, 4, 8, … km²) with `log()`; one row left blank for students to predict the next step. Callback: the L01 logarithmic axis changed only the spacing; here the logarithm changes the values themselves. Fragment notes: `exp()` returns the original value; `log(0)` is not a finite number (the zeros from slide 10). |
| 33 | Prediction vote | Které histogramy plochy změní tvar? | Four labelled scale cards with no figures: km² · z-skóre · odmocnina · logaritmus. Vote: which will look different from the km² histogram? |
| 34 | Main anchor reveal | Stejné ostrovy ve čtyřech měřítkách | Four-panel histogram of area (km², z-score, square root, log) on the same layout. Fragment interpretation: z-score identical; square root milder; log roughly symmetric. A variable that is symmetric after taking logarithms is called "log-normální". |
| 35 | Synthesis rule plus metaphor (generated illustration G2) | Které transformace mění jen měřítko a které i tvar? | G2 `ostrovy_hlina.png` left (about 40 %). Right: a compact table with unit change, centring, z-score, logarithm and square root; what each changes; one typical use. Chips: "mění jen měřítko" (graphite) vs "mění tvar" (orange). Closing line: only a shape-changing transformation can shorten a long tail. |
| 36 | Section divider | Tvar vztahu | Minimal H1. |
| 37 | Prediction, then same islands on log axes | Jak vypadá vztah plochy a počtu druhů na logaritmických osách? | Prompt: what will the logarithm do to the bend? The two scatterplots side by side (original; log–log) appear as a fragment: the bend straightens. Pair: what would a straight line on these axes mean for the islands? No "power law" name yet. |
| 38 | Candidate claims, pair evaluation | Jaké tvary vztahu dávají biologický smysl? | Five equal claim cards A–E with stable names (Přímka, Logaritmus plochy, Mocninný vztah, Kvadratický člen, Logaritmus odezvy) and one biological sentence each, no formulas yet. Pair prompt: which claim sounds least plausible for an island of 0,01 km² and for one of 4 000 km²? Fragment adds each card's formula; the C card names "mocninný vztah (power law)". |
| 39 | Visible fitting | Všech pět kandidátů odhadne funkce `lm()` | Five short `lm()` calls with the same data. Highlight `log()` and `I(plocha_km2^2)`. One strip: "lineární" means linear in the coefficients, not necessarily a straight line. A small footer note says that models made for counts come in a later lesson. |
| 40 | Evidence on the original scale, pair prompt | Jak se kandidátní křivky shodují s ostrovy? | Five small multiples on common original axes (grey islands, purple curve per facet; no category colours). Pair: which curve makes a claim that a biologist would not accept? |
| 41 | Interpretation of the implausible curve (generated illustration G3) | Proč by měl větší ostrov mít méně druhů? | Zoomed panel D with the turning point near 2 770 km² (inline), and the islands beyond it named (inline). Cook's distance of Isabela under D ≈ 142 (inline). G3 `ostrovy_parabola.png` right. Takeaway: a parabola must turn back; it reaches Isabela only because Isabela pulls it. |
| 42 | Misconception MCQ (blank heading) | *(prázdný nadpis)* | Evidence card: candidate D, `pocet_druhu`, AIC 334,5; candidate C, `log(pocet_druhu)`, AIC 74,5 (both inline). Question: "Je mocninný vztah C podle AIC mnohem lepší než kvadratický člen D?" A: yes, AIC is about 260 lower; B: no, the models predict different responses, so their AIC cannot be compared; C: yes, because it has fewer coefficients; D: no, because AIC can never be compared between two models. Partner convince, then circle B. Applies the L09 same-response rule. |
| 43 | Comparison within each scale | Které modely smíme porovnat pomocí AIC? | Two small tables split by response. Raw count: A 360,2 · B 345,9 · D 334,5. Logarithm of the count: E 110,8 · C 74,5 (inline). Fragment strip: on the raw scale the lowest AIC belongs to D, the curve rejected on slide 41. AIC alone does not decide; biology and residuals do too. |
| 44 | Diagnostics of the favoured model, pair | Pomohl logaritmus také residuím? | The same three-panel diagnostic layout as slide 21, for candidate C (Shapiro–Wilk p ≈ 0,59; max Cook's distance ≈ 0,14; inline). Pair: what changed compared with the straight line? Fragment reading, with the caution of n = 30. |
| 45 | Return to the MCQ on slide 20 | Může být odezva šikmá, a residua přesto v pořádku? | Two panels: the raw species histogram (strongly skewed; test p < 0,001) and the residual Q–Q plot of B `pocet_druhu ~ log(plocha_km2)` (p ≈ 0,15). The response is the same raw count in both. Takeaway: the assumption concerns the residuals, which closes slide 20. |
| 46 | Section divider | Interpretace po transformaci | Minimal H1. |
| 47 | Coefficient table, words → numbers | Kolikrát víc druhů má dvakrát větší ostrov? | Coefficient table from `broom::tidy(conf.int = TRUE)` for C (slope 0,389; 95 % CI 0,30–0,47, inline). Words, then the substitution 2^0,389 ≈ 1,31 as a fragment. Pair task: compute the multiple for a ten-times-larger island. |
| 48 | Answer to the opening estimate | Desetkrát větší ostrov má asi 2,5krát víc druhů | 10^0,389 ≈ 2,45 with its interval (inline). Back-transformed curve on the original anchor axes with typical predictions at 1, 10, 100 and 1 000 km² (inline). Callback to slide 2: compare with your estimate. Fragment note: back-transformed values describe a typical island (geometric mean, median-like), not the mean. |
| 49 | Matching readings to models | Jak číst koeficient, když logaritmujeme jen jednu stranu? | Three reading cards (shuffled): "+17,8 druhu na každé zdvojnásobení plochy", "asi +8 % druhů na každých 100 km²", "sklon se mění podél křivky". Pairs match them to B, E and D. Fragment reveals the matches. Extrapolation warning for D. |
| 50 | Return to the L09 trees, prediction | Zmizí oblouk v residuích stromů po logaritmu průměru kmene? | Prediction first. Fragment: residuals of the L09 additive model with `prumer_kmene_cm` vs with `log(prumer_kmene_cm)`. The arch is strongly flattened (the smallest trees are still underestimated). AIC 395 → 351 is comparable because the response is the same. Closes retrieval Q3. |
| 51 | Silent write, then pair | Odpovězte na úvodní otázku dvěma větami | 40 s silent write with stems: "Počet druhů roste s plochou …, protože …" and "Omezením je …". Then compare with a neighbour. |
| 52 | Spine answer | Jak rychle roste počet druhů s plochou ostrova? | `.box-result`: power law with exponent ≈ 0,39 (×1,31 per doubling, ×2,45 per tenfold). Support: biology, shape on log axes, residuals. Limits: 30 islands; the response is a count (models for counts come later); islands of one archipelago may not be independent. |
| 53 | Reusable workflow plus warning | Kdy transformaci použít a kdy ne? | Workflow strip: question → graph → model → residuals → biological claim → transformation as a new candidate model. `.box-warning`: do not transform just to make a normality test pass. |
| 54 | Key-ideas summary | Co si odnést | 4–5 one-line takeaways with semantic highlights. |
| 55 | Closing question and L11 bridge (generated illustration G4) | Jsou ostrovy jednoho souostroví nezávislá pozorování? | G4 `ostrovy_propojeni.png` left; question right. Seeds and birds travel between neighbouring islands. Do 30 islands give 30 independent pieces of information? Not answered; it hands over to L11. Speaker note: counts as a response come in L12. |

Planned totals: 55 visible slides, including 5 H1 dividers (8, 18, 26, 36, 46), 4 PollsLive-generated slides (3–6), 2 blank-heading MCQs (20, 42), 4 in-deck generated illustrations (9, 35, 41, 55) and the title image (1).

## Knowledge-state ledger

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| 1 — Hook, retrieval, outcomes (1–7) | L09 candidate comparison: R², adjusted R², AIC and ΔAIC with the same-response, same-observations rule; the residual arch of the tree models; L09 closing question. | Lesson question; a personal tenfold estimate; retrieved L09 ideas (penalty for complexity, AIC is relative, the arch means a curved relationship). | Any shape vocabulary, transformation or the island data. | Satellite photograph, show of hands, three L09 evidence-reading questions. |
| 2 — Data (8–10) | Observations, variables, `NA`, `str()` (L01–L09). | Source, unit (island), variables and units, missing elevations, extreme area range, zeros. | Shape words. | G1, variable list, visible inspection code and output. |
| 3 — Shape words (11–14) | Histogram, mean, median (L01); t-distribution "těžší chvosty" (L05); Old Faithful two groups (L04). | Right skew named after the histograms; symmetric, left-skewed, heavy tails, two peaks; zero bound plus multiplication creates right skew. | Logarithm, normal distribution as a name for a reference shape, Q–Q signatures. | Two real histograms with mean and median, simulated gallery (labelled), growth simulation. |
| 4 — Normal reference and Q–Q (15–17) | Informal bell (L03), mean and SD (L01), quantiles and Q–Q plots (L03, L06, L09). | Normal distribution named; 68/95/99,7 % rule; the rule fails for skewed data; Q–Q signatures of each shape. | Which part of a model must be normal. | Bell with SD bands, island-area band, five Q–Q plots. |
| 5 — What the model assumes (18–25) | `lm()`, residuals, residual plots, Cook's distance (L03, L07, L09); null hypothesis and p-value, power (L05). | First island model; the assumption concerns residuals; bend, fan and skew in residuals; leverage of Isabela; Shapiro–Wilk usage and reading; test sensitivity depends on n; spine accounting. | Remedies, transformations, candidates. | Code and scatterplot, MCQ, three diagnostic panels, Cook's distance, test output, simulation figure, spine card. |
| 6 — Scale versus shape (26–35) | Unit conversion; intercept meaning (L02); t as standardized distance (L05); log axis as a display (L01). | Unit change and centring keep the shape; centring changes the intercept meaning; z-score from numbers to symbols and `scale()`; z-scores mislead for skewed variables; linear transformations keep the shape; logarithm turns ratios into equal steps; `exp()`; log(0) undefined; logarithm and square root change shape; log-normal; synthesis. | Logarithm inside a model; candidate shapes of a relationship. | Paired histograms, refitted line, value tables, Fernandina ranks, four-panel anchor, G2 beside the synthesis table. |
| 7 — Relationship shape (36–45) | Block 6; L09 candidate habit and AIC same-response rule; diagnostics (block 5). | Bend straightens on log–log axes; five biological claims; power law named; `log()` and `I(x^2)` inside `lm()`; "linear in coefficients"; original-scale comparison; implausible parabola; AIC cannot compare `y` with `log(y)`; within-scale comparison; diagnostics of C; skewed response with acceptable residuals. | Interpreting the exponent; count models. | Paired scatterplots, claim cards, five `lm()` calls, small multiples, zoomed D with G3, MCQ, two AIC tables, diagnostic panels, contrast panels. |
| 8 — Interpretation and answer (46–53) | Logarithm and `exp()` (block 6); confidence intervals (L05); `broom` coefficient tables (L09); candidates (block 7). | Multiple per doubling and per tenfold; typical (median-like) back-transformed value; per-doubling and percentage readings; changing slope; the tree arch flattened by a log predictor; conditional answer with limitations; workflow. | Bias-corrected means; models for counts; models for dependent observations. | Coefficient table, worked numbers, back-transformed curve, reading-matching task, tree residual panels, written answer, evidence card, workflow strip. |
| 9 — Close (54–55) | Complete lesson. | Key ideas; open question about independence of islands. | L11 hierarchy and dependence, L12 count models. | Summary and closing question beside G4. |

## PollsLive retrieval proposal

This block needs **its own explicit approval** (integration map plus exact questions) in addition to the story map, per `.ai/authoring/pollslive.md`.

### Integration map

- Placement: slides 3–6, after the hook (slide 2) and before `Výsledky učení` (slide 7), via `{{< include ../pollslive/generated/active.qmd >}}`. In the deck this block replaces the skripta's callback (skripta block 2, the L09 tree arch), which becomes retrieval Q3.
- Retrieves: approved and merged L09 material. Q1 covers the complexity penalty in adjusted R². Q2 covers AIC as a relative criterion and ΔAIC. Q3 covers the residual arch and L09's closing question.
- Bridge (spoken): L09 ended with "Co když žádná přímka nestačí?" The islands show the same problem; the trees return on slide 50.
- Scheduled lecture: 2026-12-07 (from `_internal/pollslive/activation-2026-27.json`).
- Evidence assets: deterministically rendered from `data/allometrie_stromu.csv`, which the Stage 2 record documents as an unchanged CC0 copy of the L09 teaching data. Source and asset SHA-256 go into provenance, following L09. Candidate names and their order are the stable L09 names: Společná přímka, Posun mezi druhy, Různé sklony. Explanations contain no hardcoded numbers.
- Values verified on 2026-10-14 from that file (63 trees; 19/22/22 per species): k = 2/4/6; R² 0,768/0,793/0,797; adjusted R² 0,764/0,782/0,779; AIC 398,64/395,44/398,27; ΔAIC 3,20/0/2,83.
- Adapter: L10 has only the template files (`config.template.json`, `quiz.template.json`, `validate.mjs`, workflow). After approval, `config.json`, `quiz.json`, the assets and their render script are added from the current merged `_L-template` contract (client repository `_pollslive`, as in L09). Lesson-reader GitHub App access for L10 must be verified.

### Exact questions

#### 1. Complexity penalty

- ID: `extra-slopes-not-worth-it`
- Text: `Proč model Různé sklony nemá nejvyšší adjustované R², přestože má nejvyšší R²?`
- Options:
  1. A `adjusted-is-accuracy`: `Adjustované R² udává podíl správně předpovězených stromů, ne shodu modelu s daty.`
  2. B `different-trees`: `Model Různé sklony byl odhadnut z jiných stromů než ostatní dva modely.`
  3. C `gain-too-small`: `Dva sklony navíc zlepšily shodu s daty tak málo, že to nevyváží dva koeficienty navíc.` **Correct**
  4. D `always-lower`: `Adjustované R² je u modelu s více koeficienty vždy nižší než u jednoduššího modelu.`
- Explanation: `Koeficienty navíc R² nikdy nesníží. Adjustované R² za každý koeficient navíc penalizuje, takže vzroste jen tehdy, když se shoda s daty zlepší dostatečně. Že nejde o pravidlo „složitější je vždy horší“, ukazuje model Posun mezi druhy: má víc koeficientů než Společná přímka, a přesto vyšší adjustované R².`
- Evidence: L09 metric table for the three candidates (k, R², adjusted R²) computed from the tree models; no AIC column, so the question is only about the penalty.
- Alt: `Tabulka tří kandidátních modelů pro výšku stromů s počtem koeficientů, R² a adjustovaným R². Model Různé sklony má nejvyšší R², model Posun mezi druhy nejvyšší adjustované R².`
- Distractor logic: A misreads R² as accuracy; B misreads comparability; D overgeneralises the penalty and is refuted by the table itself.

#### 2. AIC is relative

- ID: `delta-aic-zero`
- Text: `Model Posun mezi druhy má ΔAIC = 0. Co to znamená?`
- Options:
  1. A `lowest-in-set`: `Má nejnižší AIC z těchto tří kandidátů odhadnutých ze stejných 63 stromů.` **Correct**
  2. B `zero-error`: `Jeho residua jsou nulová, takže model předpovídá výšky bez chyby.`
  3. C `true-model`: `Je to pravdivý model růstu stromů.`
  4. D `compare-anything`: `Jeho AIC můžeme porovnat i s AIC modelu odhadnutého z jiných dat.`
- Explanation: `ΔAIC je rozdíl od nejnižšího AIC v sadě kandidátů. Nula označuje nejlépe podporovaného kandidáta z této sady. Neříká nic o pravdivosti modelu ani o nulových residuích a AIC porovnáváme jen u modelů se stejnou odezvou odhadnutých ze stejných pozorování.`
- Evidence: L09 ΔAIC table (AIC and ΔAIC for the three candidates), computed from the tree models.
- Alt: `Tabulka AIC a ΔAIC tří kandidátních modelů pro výšku stromů; model Posun mezi druhy má ΔAIC rovné nule.`

#### 3. Residual arch

- ID: `residual-arch`
- Text: `Co prozrazuje oblouk v residuích modelu Posun mezi druhy?`
- Options:
  1. A `mean-zero-fine`: `Model je v pořádku, protože residua jsou v průměru nulová.`
  2. B `species-structure`: `Stromy jednoho druhu jsou si podobnější než stromy různých druhů.`
  3. C `delete-trees`: `Některé stromy jsou chybně změřené a je potřeba je vyřadit.`
  4. D `curved-relationship`: `Přímky nezachycují tvar vztahu: u nejmenších a největších stromů model výšku přeceňuje, uprostřed ji podceňuje.` **Correct**
- Explanation: `Residua pod nulou znamenají, že model výšku přeceňuje. Systematický oblouk ukazuje, že vztah průměru kmene a výšky je zakřivený, zatímco model předpokládá přímky. Vyřazení stromů tento vzor neodstraní, protože jde o tvar vztahu, ne o několik odlehlých stromů.`
- Evidence: residuals versus fitted values of the L09 shift model with a smoothed curve, as in L09 slide 49 and skripta block 2.
- Alt: `Bodový graf residuí modelu Posun mezi druhy proti odhadnuté výšce stromu s vyhlazenou křivkou. Residua nízkých a vysokých stromů leží převážně pod nulou, středních nad nulou.`

### Correct-answer balance

- Proposed key: Q1 C, Q2 A, Q3 D (three distinct positions; this key is not used in any earlier lesson).
- Course four-option retrieval totals before L10 (L02–L09, 24 questions): A 6, B 6, C 6, D 6. Per slot: Q1, Q2 and Q3 each have A 2, B 2, C 2, D 2.
- After L10: A 7, B 6, C 7, D 7 (25 % ± 1). Q1 C 3, Q2 A 3, Q3 D 3; every slot differs by at most one. No locked or image-constrained positions: the evidence images contain no option letters.

### Retrieval-block knowledge state

| Step | May assume before | Retrieved here | Must not assume yet | Evidence |
|---|---|---|---|---|
| Q1 | R² and adjusted R² of the three tree candidates (L09). | Adjusted R² penalises extra coefficients and can fall. | AIC, anything about transformations. | Metric table. |
| Q2 | AIC, ΔAIC and the comparability rule (L09). | AIC is relative to the candidate set and comparable only for the same response and observations. | That this rule matters for `log(y)` (taught on slide 42). | ΔAIC table. |
| Q3 | Residual plots and the smoothed curve (L08–L09); L09 closing question. | An arch means a curved relationship that straight lines miss. | How to model curvature. | Residual plot. |
| Bridge | L09 closing question. | "What if no straight line fits?" is open. | Logarithms, candidate shapes. | Spoken bridge to the islands. |

## Active-learning cadence

| Minute (approx.) | Slide | Activity | Evidence of learning |
|---|---|---|---|
| 2 | 2 | Personal estimate, show of hands | Commitment checked on slide 48 |
| 4–11 | 3–6 | PollsLive retrieval | Read L09 evidence |
| 15 | 10–11 | Quick question; think–pair–share on histograms | Notice the shape before the vocabulary |
| 19 | 13 | Pair matching: shape words | Use the vocabulary |
| 23 | 15 | Prediction vote: share within 1 SD | Intuition before the 68 % rule |
| 26 | 17 | Pair matching: Q–Q plots | Read shape from a Q–Q plot |
| 30 | 20 | MCQ with partner convince | Assumption concerns residuals |
| 33 | 21 | Pair: two residual patterns | Interpret before remedies |
| 38 | 24 | Prediction vote: test and sample size | Test sensitivity depends on n |
| 44 | 28 | Pair: new intercept meaning | Centring changes only the interpretation |
| 47 | 29–30 | Compute a z-score; prediction vote | Standardized distance; skew misleads z |
| 52 | 31–33 | Prediction votes; fill the log table | Scale versus shape |
| 61 | 37–38 | Prediction; pair evaluation of claims | Biology before scores |
| 67 | 40 | Pair: which curve is implausible? | Original-scale reasoning |
| 71 | 42 | MCQ with partner convince | AIC comparability across scales |
| 75 | 44 | Pair: what changed in the residuals? | Diagnostics of the favoured model |
| 79 | 47 | Pair calculation: tenfold multiple | Exponent in biological units |
| 82 | 49–50 | Matching readings; prediction for trees | Transfer of interpretation |
| 85 | 51 | Silent write, then pair | Conditional answer |
| 89 | 55 | Closing question | Bridge to L11 |

The longest stretch without an interaction is about 7 minutes (slides 33–37).

## Visual vocabulary (planned)

- **Area-histogram anchor:** the island-area histogram uses the same bin logic and panel size whenever it reappears (slides 11, 16, 27, 28, 31, 34), so that only the scale changes.
- **Scatter anchor:** area versus species on fixed original axes on slides 19, 40, 41 and 48; the log–log version appears on slide 37 beside the original.
- **Semantic colour:** observed islands and histograms grey; model lines, fitted curves and model-derived values purple; residuals and the current focus (Isabela, Fernandina, the mean marker on slide 12) orange; reference lines (zero residual line, Q–Q reference line, median, ±SD bands) graphite dashed. Text highlights follow the same mapping (`.text-hgl-graphite`, `.text-hgl-indigo_velvet`, `.text-hgl-orange`).
- **Scale-versus-shape chips:** "mění jen měřítko" (graphite) and "mění tvar" (orange). They appear on slides 27, 28, 31, 34 and 35 only.
- **Candidate identity:** letters and stable names A Přímka · B Logaritmus plochy · C Mocninný vztah · D Kvadratický člen · E Logaritmus odezvy, always in this order. Small multiples avoid categorical colours, so purple stays the model colour.
- **Simulated-data marker:** every simulated figure (slides 13, 14, 15, 17, 24) carries the same small "simulovaná data" label.
- **Response-scale cue:** every model card and AIC row shows its response (`pocet_druhu` or `log(pocet_druhu)`), which prepares slides 42–43.
- **Interaction cue:** prompts use `.panel-question` or a bold minimal question. Votes use equal option cards, and the correct option is marked only with `.rn-circle-orange` after commitment. Slides 20 and 42 are the two blank-heading MCQs.
- **Generated illustrations:** title image T and G1–G4 share one cast and style (below), carry Czech alt text and the caption "Ilustrace vytvořená pomocí AI.", and carry no statistical evidence.

## Generated illustration plan

### Shared visual language

- Style: warm storybook natural-history watercolour/gouache with gentle academic humour and natural anatomy, per `presentation.md`. `_brand` palette accents only. Deck semantics stay free: no strong purple or orange areas.
- Recurring cast: a Galápagos giant tortoise field botanist with a plain field notebook and a satchel, and a Darwin's finch assistant. Both appear in every image and on the title image.
- Setting: Galápagos volcanic islands, lava rock, sparse to lush vegetation, ocean.
- Global constraints: no text, letters, numbers, axes, tick marks, charts, logos or watermarks. No image implies a numerical result or the answer to the opening estimate.
- Storage and provenance: `Presentation/Materials/<name>.png` and `Presentation/Materials/GENERATED_IMAGES.md` (slide, teaching role, exact prompt, Czech alt text, status, tool, date, file name, SHA-256). Every planned slide gets an `include_optional_figure()` slot that shows nothing (and no caption) until the file exists.

### G1 — `ostrovy_pruzkum.png` (slide 9)

- Teaching role: make the observation unit (one island) and the two key variables (area, number of plant species) concrete before the data appear.
- Alt: `Želva botanička a pěnkava počítají druhy rostlin na malém skalnatém ostrůvku; v pozadí leží velký sopečný ostrov s pestrou vegetací.`
- Prompt core: the tortoise and the finch on a tiny rocky islet with a handful of different plants; the finch points at one plant, the tortoise writes in a blank notebook. Behind them, across the water, rises a large volcanic island with visibly more kinds of vegetation.
- Acceptance: the islet and the large island are clearly different in size; the notebook shows no marks or numbers; no implied ratio.

### G2 — `ostrovy_hlina.png` (slide 35)

- Teaching role: a metaphor for scale versus shape. Moving and zooming a picture keeps its long tail; only reshaping changes the shape.
- Alt: `Želva si prohlíží hliněnou figurku leguána s velmi dlouhým ocasem přes lupu, takže je větší, ale stejného tvaru; pěnkava vedle hlínu přemodelovává, aby ocas byl kratší.`
- Prompt core: on a field-station table, a clay figurine of a marine iguana with an absurdly long tail. Left: the tortoise looks at it through a large magnifying glass, and the magnified figure has exactly the same proportions. Right: the finch gently remodels a second, identical figurine so the tail is shorter and the figure balanced.
- Acceptance: the magnified view keeps the proportions exactly; the remodelled figurine is visibly reshaped; no text. The word "ocas" matches the slides' "dlouhý ocas vpravo".

### G3 — `ostrovy_parabola.png` (slide 41)

- Teaching role: a memorable picture of the implausible quadratic extrapolation: a curve that turns down where the biggest island should have the most species.
- Alt: `Kamenný most stoupá přes řadu stále větších ostrovů, ale nad tím největším a nejzelenějším začne klesat; želva na vrcholu mostu se nechápavě dívá dolů.`
- Prompt core: an arched stone footbridge links a row of islands of increasing size. The bridge rises over the small and middle islands and then descends towards the largest, lushest island. The tortoise stands puzzled at the top of the arch; the finch hovers, pointing at the lush island below.
- Acceptance: the island size increase is clear; the bridge's downturn is gentle but unmistakable; no numbers or axes. Placed after the evidence on slide 40, so it reveals no answer.

### G4 — `ostrovy_propojeni.png` (slide 55)

- Teaching role: an open-question bridge to L11: neighbouring islands exchange seeds and animals, so they may not be independent observations.
- Alt: `Ptáci a mořské proudy přenášejí semena mezi sousedními ostrovy souostroví; želva botanička je pozoruje ze břehu.`
- Prompt core: three or four neighbouring islands. A seabird carries a seed head, a raft of vegetation drifts on a current between two islands, and finches fly between them. The tortoise watches from the shore with the notebook closed.
- Acceptance: links between islands are visible without arrows or lines; the image reads as a question.

### T — title image (slide 1)

- Reference assets: the satellite photograph (`Learning_materials/images/galapagy-satelit-2002.jpg`, NASA, public domain), the log–log island scatterplot from slide 37 (shape only, no axes, to be redrawn as a texture or landscape motif), and G1 for the cast.
- Teaching role: introduce the islands, their very different sizes and the cast. It must not show the exponent or any result.
- Generated after G1–G4, per `presentation.md`; provenance in `GENERATED_IMAGES.md`.

### Generation route and boundary

This Claude Code session has no image-generation tool. During drafting, the full prompts will go into `GENERATED_IMAGES.md` and every slot into the deck. Generation then runs with an available image tool (L08 and L09 used OpenAI built-in image generation), with targeted edits until each acceptance check passes. The human author may reject any image independently of the story-map approval. A missing title image blocks public release; missing G1–G4 do not.

## Story-map audits before human approval

- **Heading strip:** the title question leads to a tenfold estimate and L09 retrieval, then outcomes. Part A: one island per row, what is missing, the histograms, the long tail, matching shapes, why skew is biological, the 68 % rule and its failure, Q–Q signatures. Part B: the line, the MCQ, its residuals, one big island, the test, the test and n, then the spine accounting. Part C: hectares, centring, Fernandina's distance, area or elevation, z-score and skew, log steps, four scales and the synthesis. Part D: log axes, plausible shapes, five fits, the curves, the turning parabola, the AIC MCQ, comparing within a scale, the residuals of C, skewed response with fine residuals. Part E: per doubling, the tenfold answer, one-sided logs, the trees, the written answer, the spine answer, when to transform, the summary and the closing question. The strip reads as a content narrative. No heading uses the banned sequencing words (nejdřív, potom, teď, dnes, znovu, nakonec, teprve).
- **Data story first:** every concept block opens with a data moment, prediction or question before its term. "Pravostranně šikmé" is named on 12 after the histograms on 11. "Normální rozdělení" is named on 15 after the vote, and the bell is familiar from L03. "Z-skóre" is named on 29 after the hand calculation. "Lineární transformace" is named on 31 after the reveal. "Mocninný vztah" is named on 38 after the log–log scatterplot on 37. The only headings containing a term are the conclusions on 12 and 34 and the questions on 23, 31 and 49, each about something already seen.
- **First use:** Q–Q signatures (17) come before residual Q–Q reading (21). The residual assumption (20) comes before the test (23). `log()` and `exp()` (32) come before log axes (37) and log formulas (38–39). The L09 AIC rule is retrieved on slide 5 and applied on slide 42. The exponent reading (47) comes before the one-sided readings (49). The power-law name arrives on 38, not on 37.
- **No leakage:** slide 25 poses changing the variables as an open question without naming the logarithm. Slides 40–41 use no fit statistic. The PollsLive questions use only L09 content; Q2's explanation states the L09 same-response rule but not its consequence for `log(y)`.
- **Opening order:** title → hook (2) → retrieval (3–6) → outcomes (7) → first data moment (9–11), as `AGENTS.md` requires.
- **Spine:** the title question returns at 25 (mid-lecture accounting), 48 (the answer to the estimate) and 52 (the conditional answer).
- **Inline values:** every number in slide copy, headings and annotations will be computed from the island and tree model objects. The rounded "2,5krát" in the slide-48 heading will be computed inline as 10 raised to the fitted slope.
- **Illustrations:** G1 grounds the variables only. G2 and G3 are metaphors attached to ideas already earned (scale versus shape; the turning parabola). G4 poses the closing question. None appears on a prediction or MCQ slide, and none carries a result.

## Risks and fixes

- **Pacing risk:** 55 slides with about 20 interactions in 90 minutes. Part C (10 slides) is the densest. Trim candidates if needed: merge 27 into 28, fold 33 into 34 as a fragment, drop 49, or shorten 50 to a single reveal.
- **Content risk:** students may read "log-normální" as a new distribution to memorise. It is named only as "souměrné po zlogaritmování", in one fragment.
- **Content risk:** the z-score twist on slide 30 may feel like a trick. The speaker note frames it as the motivation for shape-changing transformations, as the approved skripta does.
- **Visual rhythm risk:** Part C has many histogram slides in a row. Fix: alternate them with a value table (32), cards without figures (33) and the illustrated synthesis (35); audit the 3-in-5 component threshold.
- **Dependency:** the L10 PollsLive adapter, assets and render script must be added from the current `_L-template` contract, and lesson-reader App access for L10 verified. Synchronized rendering needs the quiz inputs committed and pushed (separate authorization).

## Stage 4 drafting notes (2026-10-14)

- `Presentation/presentation.qmd` was drafted from the approved story map, replacing the template gallery. All 55 headings and their order follow the map.
- Deviations within the map:
  - Slide 48 heading reads „Desetkrát větší ostrov má asi 2,45krát víc druhů“. The value is computed inline as 10^slope, and 10^0,389 rounds to 2,4 at one decimal, so two decimals are shown instead of the planned rounded 2,5.
  - Slide 42 gives the AIC difference inline in option A.
  - Slide 35 places the table left and G2 right, so that the table keeps its width while the image slot is empty.
- Fixed original axes for every anchor scatterplot of the islands: 0–4 800 km² and 0–680 species (slides 19, 37, 40, 41, 48). The upper limit keeps the parabola's vertex (≈ 629 species) visible on slides 40–41.
- Shared hidden helpers in the setup chunk:
  - `skala_y_pocty` and `skala_x_plocha` (whole-number counts, Czech number format, three area breaks);
  - `format_p()`;
  - semantic colour aliases.
  `vykreslit_diagnostiku()` is defined on slide 21, where it is first used, and reused on slide 44.
- Copied helpers:
  - `R/Functions/format_cz.R` from L09;
  - `include_optional_figure.R` and `ai_disclosure.R` from L07.
- Generated illustrations: the title image T and G1–G4 have reserved slots, and full prompts, alt text and acceptance checks are in `Presentation/Materials/GENERATED_IMAGES.md`. None is generated yet, because this session has no image tool. The satellite photograph was copied to `Presentation/Materials/` (public domain).
- PollsLive adapter added following the approved proposal:
  - `pollslive/quiz.json` holds the three approved questions verbatim, dated 2026-12-07, key C–A–D;
  - `R/render_pollslive_assets.R` renders the three evidence PNGs from `data/allometrie_stromu.csv` (normalised SHA-256 verified; same content as L09 at `1723cb5`);
  - `R/verify_pollslive_assets.R` pins the asset hashes, as in L09;
  - `pollslive/config.json`, `pollslive/validate.mjs` and `.github/workflows/pollslive.yml` were adapted from merged L09 (`_pollslive` client at `17a62da`, correct-position guard);
  - `node pollslive/validate.mjs` passes.
- Template staleness: `_L-template` still pins the old `_internal` client and its validator lacks the correct-position guard. L10 therefore took the adapter from merged L09 rather than the template, and the template needs a separate maintenance fix (`_L-template` repository).
- Offline render: canonical `R/render_presentation.R` with `POLLSLIVE_RENDER_MODE=offline`. The pinned client cache was copied from L09's local cache at the same revision; the cache is gitignored. The render gives 55 slides, a 55-page PDF, and `docs/index.html` identical to `Presentation/presentation.html`.
- Theme sync: the wrapper re-synced `_brand` at `028b292`; `theme/` differences are line endings only.
- Open issue for the author: the generated PollsLive slides 4–6 overflow at the bottom when the answer and explanation are shown. The approved question texts, options and explanations are longer than L09's, and L09's slides fit. Shortening them changes approved wording, so this needs a decision.

## Independent review round 1 (2026-10-14)

Reviewer: a separate read-only subagent following `.ai/agents/vision-corrector.md`. Model: Sonnet at medium effort, chosen as a capable general model for a complete-deck review. It inspected the source and all 55 full-canvas screenshots, with fragments in their final state.

**HIGH**

- Slides 4–6, PollsLive overflow: open author decision, see the drafting notes.
- Slide 28, "teď" in a prompt: fixed. The same pass also removed "právě" on slide 43 and "později" on slide 10.
- Slides 42–43, AIC object locality: fixed. `aic_a`, `aic_b` and `aic_e` moved to slide 43.

**MEDIUM — fixed**

- Slide 50 misdescribed the remaining pattern. Verified: after the log transform, trees with fitted height 10–20 m have mean residuals of −5,0 and −3,5 m (overestimated); the lowest group is about +1,0 m. Copy, alt text and speaker note now say this. **Author note:** the approved skripta (end of Part E, the trees box) says "nejmenší stromy model podhodnocuje"; this is only true for fitted heights below about 10 m and should be revisited.
- Slide 45: candidate B is now named "nevybíráme" because its residuals fan out. The Q–Q title no longer shows raw object names.
- Slide 24: a visible interpretation sentence was added after the simulation.
- Colour roles:
  - residual-pattern highlights on slide 44 are orange, matching slide 21;
  - the intercept diamond on slide 28 is purple, matching its text.
- Slide 42: the option lengths are equalised, so the correct option is no longer the only long one.
- Hardcoded values:
  - the slide 38 areas are inline (`plocha_min`, `plocha_max`);
  - the x-axis limit is derived from the data;
  - the y-axis limit of 680 is kept as a documented graphical constant, needed to show the parabola's vertex.
- Slide 32: a visible line now covers `exp()` and `log(0)`.
- Slide 51: changed to a plain prompt, which breaks the component run 49–53.

**MEDIUM — not changed, reported**

- Run 22–25 (four component-dominated slides).
- Top-heavy canvases on slides 20, 25, 33, 38 and 43.
- Slide 28 density.
- Orange used both for the ±1 SD focus band (slides 15–16) and for the current focus. The planned vocabulary said graphite for ±SD bands; orange was kept deliberately because the band is the prediction focus.

**LOW — fixed**

- Slide 16: "měřítko" became "vzor pro srovnání".
- Slide 30: the reveal now maps onto option A.
- Slide 23: the p-value reading is now conditional on normal residuals.
- Slide 22: a one-line Cook's distance reminder was added.
- Slide 47: table width.
- Slide 48: label offset.
- Slide 50: panel spacing.
- Slide 55: speaker note.

**LOW — open**

- Slide 35 chips wrap; to be re-checked now that G2 exists.

Rendered state after the fixes:

- Another session generated G1–G4 (10:33–10:36) and the title image T (11:00, with `Presentation/Materials/title_references/`). Their provenance is in `GENERATED_IMAGES.md`. That session also changed `presentation.qmd` by one byte at 10:48 (not identified); all review fixes were verified to be present afterwards.
- Ondřej Mottl confirmed that the other session had stopped. A clean canonical offline render then passed: 55 slides, 55-page PDF, `docs/index.html` identical to `Presentation/presentation.html`.
- All 55 slides were re-inspected as full canvases after the render. Slide 24 needed one more fit fix: shorter option cards, a smaller figure and fewer y breaks.
- The title image and G1–G4 display in their slots with AI disclosure.
- Polish items left for human review:
  - the title image sits high and small in its region;
  - the slide 35 chips still wrap;
  - slide 24 is tight at the bottom.
- `node pollslive/validate.mjs` and `R/verify_pollslive_assets.R` pass.

## Author review batch 1 (Ondřej Mottl, 2026-10-14)

Done on this branch:

- **PollsLive overflow:** shortened as instructed. Explanations for Q1–Q3 were shortened; Q1's four options were also shortened, because the slide still overflowed. Correct answers, IDs and the key C–A–D are unchanged. `node pollslive/validate.mjs` passes, and slides 4–6 now fit.
- **Skripta trees box corrected:** text and fig-alt now say that trees with fitted height of about 10–20 m are still overestimated and taller trees sit near zero. The skripta was re-rendered (`R/render_skripta.R`, exit 0).
- **Answers marked with `.rn-circle-orange`:** slides 15 (B), 24 (C), 30 (C, with option C reworded to „v obou“), 31 (C) and 33 (odmocnina, logaritmus). Where evidence must come first, `fragment-index` orders evidence → mark → rule. Roughnotation runs only live, so static screenshots cannot show it.
- **Q–Q slide:** histograms and Q–Q plots are now separate panels in two rows. An orange set of matching lines appears as a fragment.
- **Cook's distance slide:** a second panel shows the other islands on a zoomed axis.
- **H1 divider „Závěr“** added before the written answer. The writing task now has an evidence card. The deck has 56 slides and 6 H1 dividers.

Story-map revision approved by Ondřej Mottl on 2026-10-14:

1. **Part B rebuilt from what students can see.**
   - Divider renamed „Sedí na ostrovy přímka?“.
   - New slide „Z čeho se skládá počet druhů jednoho ostrova?“: one island = line estimate + residual.
   - New slide „Jak by vypadala residua, kdyby přímka seděla?“: prediction, then simulated residuals forming a bell. Only then is the residual assumption named.
   - The islands' residuals follow. The MCQ moves after them as a check.
2. **Transformation gallery** after the synthesis table.
   - „Kde transformace v biologii pomáhají?“: six cards with generated illustrations (slots).
   - Real example: L01 mammal masses in kg and after the logarithm (`ggplot2::msleep`).
3. **AIC slide:** an added note that R² cannot replace AIC across response scales, with a pointer to original-scale curves and residuals.
4. **Title slide:** option (a), regenerate the title image as a portrait composition for the 36 % illustration column. The `_brand` layout is not changed.

Implementation of the approved revision (2026-10-14):

- **Part B** is now:
  - divider „Sedí na ostrovy přímka?“;
  - line;
  - „Z čeho se skládá počet druhů jednoho ostrova?“ (Santa Cruz = line estimate + residual, values computed inline);
  - „Jak by vypadala residua, kdyby přímka seděla?“ (pair sketch; 300 simulated residuals with the islands' residual SD; the assumption named after the reveal);
  - the islands' residuals, compared with the bell;
  - the MCQ as a check;
  - Cook's distance;
  - the test;
  - the test and n;
  - the spine card.
- **Gallery:** after the synthesis table, „Kde transformace v biologii pomáhají?“ with six cards and reserved image slots (`galerie_*.png`; prompts in `GENERATED_IMAGES.md`). Then „Stejní savci v kilogramech a po logaritmu“, using real `ggplot2::msleep` data: 11 possible outliers in kg, 0 after the logarithm, both computed inline.
- **AIC slide:** a fragment explains why R² cannot replace AIC across response scales.
- **Title T2:** the portrait prompt is recorded in `GENERATED_IMAGES.md`. It keeps the same file name, so the slot needs no source change.
- **Deck size:** 60 slides with 6 H1 dividers (Tvar rozdělení, Sedí na ostrovy přímka?, Transformace, Tvar vztahu, Interpretace po transformaci, Závěr).
- **Validation:** clean offline render; HTML identical to `docs/index.html`; changed slides inspected. Slide 38 must be rechecked after the gallery images exist (text is tiny until then).
- **Knowledge-state note:** normal distribution (named in Part A) and residuals (L03) are both earned before the assumption is named. The MCQ now tests something already explained.

## Visual workflow checks

- Story map completed and explicitly human-approved before full slide copy: [x] (approved 2026-10-14)
- Text-light slides (no dense walls): [x]
- Staged reveal via fragments/incremental: [x]
- Figures generated locally near slide blocks: [x] (locality fixed after review round 1)
- Immediate interpretation after key visuals: [x]
- Interaction cadence present: [x]

## Slide-role rhythm

- Main interaction slide form used: prediction votes on equal cards (2, 15, 24, 30, 31, 33), two blank-heading MCQs (20, 42), pair matching (13, 17, 49), and pair prompts beside figures (11, 21, 28, 38, 40, 44).
- Main evidence reveal form used: same anchor in a new scale (27, 31, 34), code plus output (10, 19, 23, 39), and small multiples (40).
- Main interpretation form used: graph plus takeaway (12, 16, 41), contrasted panels (22, 45), and the spine card (25, 52).
- Where the bridge to the next concept happens: 25 (to transformations), 35 (to relationship shape), 45 (to interpretation), 55 (to L11).

## Stage 5 - Human review gate

- Finished slide headings compared with the story map: [x] (55/55 match; slide 48 deviation recorded)
- Heading-strip, visible-copy, and first-use audits completed: [x]
- Lesson-vision review completed: [x] (independent round 1, 2026-10-14)
- Human review completed: [ ]
- Credible findings resolved: [ ] (resolved except the PollsLive overflow, which awaits an author decision, and the reported MEDIUM layout items)
- Presentation rendered and checked: [x] (clean offline render, full-canvas inspection)
- Reviewer decision:

## Decision

- [x] Slides ready for human review (open decisions listed above)
- [x] Story-map status is `complete`
- [x] Human story-map approval is `approved` and recorded
- [x] PollsLive integration map and exact questions approved and recorded (Ondřej Mottl, 2026-10-14)
- [x] Generated illustration plan (T, G1–G4) approved (Ondřej Mottl, 2026-10-14)
- [ ] Diff contains only Stages 4-5 sources, records, and corresponding outputs
- [ ] Presentation PR ready to merge
- Notes:

## Title image T2 and gallery spacing (2026-10-14)

- **Title image:** Ondřej Mottl supplied the portrait title image T2 (`ostrovy_titulni.png`; SHA-256 `2bfdd5f9…7458`, matching the provenance row in `GENERATED_IMAGES.md`). After a clean offline render (60 slides, HTML identical to `docs/index.html`), the title slide fills the illustration column with the cast and islands clearly visible, and the AI caption and course link are intact. Checked in the HTML screenshot; the PDF page was not rasterised (no PDF rasteriser on this machine).
- **Gallery slide spacing:** centred vertically, card text one size larger, a spacer between the rows, and image width capped at 32 % for the square images. It was tested with temporary stand-in images, which were removed afterwards. It must be rechecked when the six real gallery images exist.
- **Gallery images (2026-10-14):** Ondřej Mottl added the six gallery images. All six SHA-256 hashes match `GENERATED_IMAGES.md`. Final layout: no spacer, image width 45 %. Both rows and the AI disclosure fit, and the slide was checked in the rendered HTML (60 slides, HTML identical to `docs/index.html`). All planned illustrations (T, G1–G4, six gallery images) now exist.

## Author request: shorter deck, gallery fragments (Ondřej Mottl, 2026-10-14)

- Removed the two normality-test slides („Co říká test normality residuí?“ and „Odhalí test stejnou mírnou odchylku v malém i ve velkém vzorku?“). Normality tests and their dependence on sample size stay in the skripta (blocks 18–19).
- Knowledge-order follow-ups:
  - „Pomohl logaritmus také residuím?“ and „Může být odezva šikmá, a residua přesto v pořádku?“ now read the residuals from the graphs instead of Shapiro–Wilk p-values;
  - „Transformace není rituál“ no longer mentions the p-value of a normality test;
  - the unused `format_p()` helper was removed.
- The six gallery cards appear one by one as fragments; the AI disclosure line stays visible.
- Deck: 58 slides, 6 H1 dividers. Clean offline render; HTML identical to `docs/index.html`; affected slides inspected.

## Independent review round 2 (2026-10-14)

Reviewer: a fresh separate read-only subagent following `.ai/agents/vision-corrector.md`. Model: Sonnet at medium effort, a capable general model for a complete-deck review. It inspected the full source, the record, the quiz, the image record and all 58 final-state frames. Verdict: no HIGH findings. Part B is chronologically sound, and removing the normality tests left no dangling references.

Fixed:

- **Slide 47:** the claim „Kandidáta B přesto nevybíráme…“ had no evidence on the slide and moved to the speaker note.
- **Slide 17:** the hint now appears before the matching lines (`fragment-index` 1 → 2).
- **Slide 19:** Isabela is highlighted only as a fragment after the question.
- **Slide 21:** the rule box no longer states the MCQ answer („o tvaru odezvy ani prediktoru…“), so the MCQ on slide 23 again tests application.
- **Slide 45:** compare „vzory v residuích (ne jejich velikost)“.
- **Slide 46:** „vějíř“ became „rostoucí rozptyl“, consistent with slide 22.
- **Slide 36:** the mammal card gained its reason („liší o řády“).
- **Slide 35:** the column is „Mění“ with chips „měřítko“ / „tvar“, so they no longer wrap.
- **Slide 37:** species names not shown on the slide were dropped, and a speaker note was added.
- **Slide 55:** „později“ became „v jedné z dalších lekcí“.
- **Slide 6:** Q3's correct option and explanation were shortened under the author's shorten-to-fit instruction. The meaning, ID and key are unchanged; `validate.mjs` passes.
- **`GENERATED_IMAGES.md`:** stale status and slide positions updated.

Not changed, reported to the author:

- **Top-heavy canvases (slides 23, 25, 33, 49, 54, 55):** `.layout-center-y` is limited by the shared min-height.
- **Component run 22–25.**
- **Gallery details:**
  - the AI disclosure is visible before the first card;
  - the logarithm cards use the indigo card class;
  - there is no pair prompt on the gallery slide.
- **Slides 20–21 (decomposition and simulated bell) exist only in the deck.** The skripta could gain a short matching paragraph in a separate skripta edit.

Validation: clean offline render with 58 slides; HTML identical to `docs/index.html`; changed slides inspected. Review gaps: fragment states and roughnotation were judged from source only, and the PDF was not rasterised.

## Skripta aligned with the deck (approved by Ondřej Mottl, 2026-10-14)

- **Block 15, „Co přesně má být u lineárního modelu normální?“:** now builds the assumption before asking about it.
  - Santa Cruz is decomposed into line estimate + residual (444 = 138 + 306, inline), with a figure and the substituted equation.
  - A prompt asks what the residuals would look like if the line fitted, followed by a figure of 300 simulated residuals (the islands' residual SD) with the normal curve.
  - The assumption is then named.
  - The existing MCQ becomes a self-check („Ověřte si…“). Its solution, the warning box and the earlier-models Extra are unchanged.
- **AIC trap (block 33):** after „Stejné omezení platí pro R²“, one sentence says what R² describes on each scale and what to compare across scales instead: original-scale curves and residual patterns, not residual size.
- **Glossary:** the new prose uses existing slugs (`residuum`, `odezva`, `prediktor`); no new terms.
- **Validation:** `R/render_skripta.R` exit 0. Both new figures and the inline values were checked in the rendered HTML; the PDF was not rasterised. Earlier simulations reset `set.seed()` themselves, so their results are unchanged.
