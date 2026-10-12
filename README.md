# L10 — Tvar rozdělení, transformace a nelinearita

**Šikmá data a zakřivený vztah mezi plochou ostrova a počtem druhů**

Tento repozitář obsahuje desátou lekci kurzu [Biostatistika a plánování ekologických pokusů (MB120P163)](https://cuni-natur-biostatistics.github.io/) vyučovaného na Přírodovědecké fakultě Univerzity Karlovy.

Úplný přehled kurzu, rozvrh, pravidla hodnocení a materiály ostatních lekcí najdete na [veřejném HUBu kurzu](https://cuni-natur-biostatistics.github.io/).

## O této lekci

Proč mají větší ostrovy více druhů rostlin a jak rychle počet druhů s plochou ostrova roste? Lekce navazuje na porovnávání kandidátních lineárních modelů a zabývá se dvěma tvary, které jednoduchý lineární model předpokládá: tvarem rozdělení hodnot a tvarem vztahu mezi prediktorem a odezvou.

Výuková data popisují 30 ostrovů Galapág: počet druhů rostlin, plochu ostrova, nejvyšší bod a vzdálenosti k sousedním ostrovům. Většina těchto veličin je výrazně pravostranně šikmá a vztah počtu druhů k ploše ostrova není přímkový. Studenti popisují tvar rozdělení pomocí histogramu a Q–Q grafu, posuzují normalitu residuí, rozlišují transformace, které mění jen měřítko (například z-skóre), od transformací, které mění tvar (například logaritmus), a porovnávají několik biologicky zdůvodněných funkčních tvarů vztahu.

Důraz je na interpretaci: co transformace mění na biologickém tvrzení modelu a jak výsledek převést zpět do původních jednotek, například kolikrát více druhů lze čekat na dvakrát větším ostrově.

Práce s šikmými daty a zakřivenými vztahy je v biologii běžná a připravuje půdu pro modely, které respektují závislost pozorování nebo počítají přímo s početními daty.

## Výsledky učení

Po prostudování této lekce dokážete:

- popsat tvar rozdělení proměnné nebo residuí pomocí histogramu a Q–Q grafu a posoudit, zda je pro lineární model podstatný;
- rozlišit transformace, které mění jen polohu a měřítko (z-skóre, centrování, změna jednotek), od transformací, které mění tvar (logaritmus, odmocnina);
- rozpoznat nelineární vztah v datech a navrhnout jednoduché řešení;
- porovnat několik biologicky plausibilních funkčních tvarů;
- vysvětlit, jak transformace mění interpretaci modelu.

## Materiály pro studenty

Následující odkazy vedou vždy na nejnovější schválené vydání L10. Rozpracovaná verze ve větvi `main` může být novější, ale není určena jako závazná studijní verze.

| Materiál | Online verze | PDF |
| --- | --- | --- |
| Skripta | [Číst online](https://cuni-natur-biostatistics.github.io/L10/current/learning/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L10/current/learning/skripta.pdf) |
| Prezentace | [Otevřít slidy](https://cuni-natur-biostatistics.github.io/L10/current/presentation/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L10/current/presentation/presentation.pdf) |

Pro navazující praktické cvičení je připraven [R skript ke stažení](https://cuni-natur-biostatistics.github.io/L10/current/code/cviceni.R). Skript obsahuje úlohy a kód, se kterými budete pracovat během praktika.

- [HUB kurzu](https://cuni-natur-biostatistics.github.io/) je hlavní vstup ke všem veřejným studijním materiálům.
- [Moodle kurzu](https://dl2.cuni.cz/course/view.php?id=106) slouží zapsaným studentům pro oznámení, testy, zadání, odevzdávání a individuální výsledky.

## Pro vyučující a správce

### Zdrojové a vyrenderované soubory

- `Learning_materials/skripta.qmd` je zdroj skript; výsledky jsou `Learning_materials/skripta.html` a `Learning_materials/skripta.pdf`.
- `Presentation/presentation.qmd` je zdroj slidů; výsledky jsou `Presentation/presentation.html` a `Presentation/presentation.pdf`.
- `Exercises/cviceni.R` je studentský R skript pro praktické cvičení.
- `data/` obsahuje datové soubory specifické pro tuto lekci a popis jejich původu.
- `R/` obsahuje podporované renderovací a tematické nástroje a skript `prepare_galapagos_data.R` pro reprodukovatelnou přípravu výukových dat.
- `theme/` obsahuje synchronizovanou lokální kopii společné vizuální identity kurzu.
- `pollslive/` obsahuje neaktivní šablonu pro pozdější zapojení schváleného opakovacího kvízu; bez souborů `pollslive/config.json` a `pollslive/quiz.json` nijak nemění render lekce.
- `Workflow/` obsahuje záznamy rozhodnutí, kontrol a schválení během přípravy lekce; není součástí veřejného release balíčku.

### Reprodukovatelné prostředí

Repozitář používá `renv`. Po klonování otevřete `L10.Rproj` a v čerstvé R relaci spusťte:

```r
renv::restore()
renv::status()
```

Kompletní lokální render spustíte podporovaným wrapperem:

```r
source("R/render_all.R")
```

Samostatně lze použít `R/render_skripta.R` nebo `R/render_presentation.R`. Přímé volání `quarto render` obchází synchronizaci sdíleného tématu a nemá se používat pro release render.

### Publikování

`website-release.yml` je explicitní seznam souborů povolených ve veřejném balíčku. Větev `main` vytváří veřejný náhled, zatímco stabilní tag `L10-vMAJOR.MINOR.PATCH-YYYYMMDD` vytváří neměnné vydání a aktualizuje cestu `/L10/current/`. Před prvním vydáním nahraďte v manifestu i v tomto README všechny zástupné údaje skutečnými hodnotami.

Podrobný publikační postup je v [`WEBSITE_RELEASES.md`](WEBSITE_RELEASES.md). Postup tvorby a kontroly lekce je v [`Workflow/README.md`](Workflow/README.md).

Před vydáním je nutné zkontrolovat vyrenderované HTML a PDF, úplnost manifestu, provenanci a podmínky použití dat a médií a nepřítomnost neveřejných informací v celém repozitáři.

## Licence

Původní výukový obsah je licencován pod CC BY 4.0 a software pod licencí MIT. Přesné vymezení, doporučená citace a výjimky pro převzatá data, média, fonty, loga a další položky jsou v [`LICENSE.md`](LICENSE.md). Výuková data o ostrovech Galapág mají vlastní původ a podmínky popsané v [`data/README.md`](data/README.md).
