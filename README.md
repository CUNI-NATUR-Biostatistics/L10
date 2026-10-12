<!--
Po vytvoření nového lekčního repozitáře:
1. Nahraďte všechny výskyty LXX skutečným číslem lekce.
2. Doplňte název, podnázev, veřejný přehled lekce a ověřené výsledky učení.
3. Zkontrolujte všechny odkazy a názvy souborů podle website-release.yml.
4. Odstraňte tento komentář a všechny zbývající texty DOPLŇTE.
5. Běžné odstavce v Markdownu ručně nezalamujte na pevnou šířku.
-->

# LXX — DOPLŇTE název lekce

**DOPLŇTE stručný podnázev lekce**

Tento repozitář obsahuje DOPLŇTE pořadí lekce kurzu [Biostatistika a plánování ekologických pokusů (MB120P163)](https://cuni-natur-biostatistics.github.io/) vyučovaného na Přírodovědecké fakultě Univerzity Karlovy.

Úplný přehled kurzu, rozvrh, pravidla hodnocení a materiály ostatních lekcí najdete na [veřejném HUBu kurzu](https://cuni-natur-biostatistics.github.io/).

## O této lekci

DOPLŇTE hlavní biologickou nebo ekologickou otázku, kterou lekce řeší, a jednou větou vysvětlete její místo v návaznosti kurzu.

DOPLŇTE dva až tři krátké odstavce srozumitelné i člověku, který tento repozitář našel samostatně na internetu. Představte hlavní dataset nebo datový příběh, statistické pojmy a způsob uvažování, kterými lekce prochází. Nepopisujte historii vývoje repozitáře, interní větve, schvalovací stav ani nahrazené datasety.

DOPLŇTE závěrečnou větu vysvětlující, proč je lekce důležitá pro další části kurzu nebo pro práci s biologickými daty.

## Výsledky učení

Po prostudování této lekce dokážete:

- DOPLŇTE pozorovatelnou studentskou činnost;
- DOPLŇTE pozorovatelnou studentskou činnost;
- DOPLŇTE pozorovatelnou studentskou činnost;
- DOPLŇTE pozorovatelnou studentskou činnost;
- DOPLŇTE pozorovatelnou studentskou činnost.

## Materiály pro studenty

Následující odkazy vedou vždy na nejnovější schválené vydání LXX. Rozpracovaná verze ve větvi `main` může být novější, ale není určena jako závazná studijní verze.

| Materiál | Online verze | PDF |
| --- | --- | --- |
| Skripta | [Číst online](https://cuni-natur-biostatistics.github.io/LXX/current/learning/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/LXX/current/learning/skripta.pdf) |
| Prezentace | [Otevřít slidy](https://cuni-natur-biostatistics.github.io/LXX/current/presentation/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/LXX/current/presentation/presentation.pdf) |

Pro navazující praktické cvičení je připraven [R skript ke stažení](https://cuni-natur-biostatistics.github.io/LXX/current/code/cviceni.R). Skript obsahuje úlohy a kód, se kterými budete pracovat během praktika.

- [HUB kurzu](https://cuni-natur-biostatistics.github.io/) je hlavní vstup ke všem veřejným studijním materiálům.
- [Moodle kurzu](https://dl2.cuni.cz/course/view.php?id=106) slouží zapsaným studentům pro oznámení, testy, zadání, odevzdávání a individuální výsledky.

## Pro vyučující a správce

### Zdrojové a vyrenderované soubory

- `Learning_materials/skripta.qmd` je zdroj skript; výsledky jsou `Learning_materials/skripta.html` a `Learning_materials/skripta.pdf`.
- `Presentation/presentation.qmd` je zdroj slidů; výsledky jsou `Presentation/presentation.html` a `Presentation/presentation.pdf`.
- `Exercises/cviceni.R` je studentský R skript pro praktické cvičení.
- `data/` obsahuje datové soubory specifické pro tuto lekci.
- `R/` obsahuje podporované renderovací a tematické nástroje.
- `theme/` obsahuje synchronizovanou lokální kopii společné vizuální identity kurzu.
- `pollslive/` obsahuje neaktivní šablonu pro pozdější zapojení schváleného opakovacího kvízu; bez souborů `pollslive/config.json` a `pollslive/quiz.json` nijak nemění render lekce.
- `Workflow/` obsahuje záznamy rozhodnutí, kontrol a schválení během přípravy lekce; není součástí veřejného release balíčku.

### Reprodukovatelné prostředí

Repozitář používá `renv`. Po klonování otevřete `LXX.Rproj` a v čerstvé R relaci spusťte:

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

`website-release.yml` je explicitní seznam souborů povolených ve veřejném balíčku. Větev `main` vytváří veřejný náhled, zatímco stabilní tag `LXX-vMAJOR.MINOR.PATCH-YYYYMMDD` vytváří neměnné vydání a aktualizuje cestu `/LXX/current/`. Před prvním vydáním nahraďte v manifestu i v tomto README všechny zástupné údaje skutečnými hodnotami.

Podrobný publikační postup je v [`WEBSITE_RELEASES.md`](WEBSITE_RELEASES.md). Postup tvorby a kontroly lekce je v [`Workflow/README.md`](Workflow/README.md).

Před vydáním je nutné zkontrolovat vyrenderované HTML a PDF, úplnost manifestu, provenanci a podmínky použití dat a médií a nepřítomnost neveřejných informací v celém repozitáři.

## Licence

Původní výukový obsah je licencován pod CC BY 4.0 a software pod licencí MIT. Přesné vymezení, doporučená citace a výjimky pro převzatá data, média, fonty, loga a další položky jsou v [`LICENSE.md`](LICENSE.md).
