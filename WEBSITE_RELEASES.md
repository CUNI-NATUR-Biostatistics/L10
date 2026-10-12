# Publikování materiálů na web kurzu

Soubor `website-release.yml` je explicitní seznam souborů, které smí být zveřejněny na studentském webu. Nic, co v tomto manifestu není uvedeno, release workflow do webového balíčku nepřidá.

Před prvním vydáním nové lekce upravte `lesson`, `academic_year`, `title` a `subtitle`. Sekce `learning` a `presentation` jsou povinné. Do seznamů `exercises`, `data` a `extras` přidávejte jen soubory určené studentům; interní poznámky, řešení a workflow záznamy se nezveřejňují.

Release vzniká tagem ve formátu `LWW-vMAJOR.MINOR.PATCH-YYYYMMDD[-moodle]`. Workflow ověří manifest a existenci souborů, vytvoří neměnný webový balíček, publikuje GitHub Pages dané lekce a pošle hlavnímu hubu požadavek na okamžitou aktualizaci. Renderování musí proběhnout lokálně před vytvořením tagu; workflow zdrojové QMD znovu nespouští.

Veřejné Pages cesty mají tvar:

- `/LWW/preview/` jako náhled posledních commitnutých HTML souborů z `main`
- `/LWW/releases/<tag>/learning/index.html`
- `/LWW/releases/<tag>/presentation/index.html`
- `/LWW/current/` jako alias nejnovějšího release nejvyššího akademického roku

Preview workflow se spouští po změně manifestu nebo commitnutých HTML souborů na `main`. Nevytváří release ani neaktualizuje hlavní studentský hub.

HUB je kanonický veřejný vstup pro studenty a odkazuje pouze na stabilní vydání. Moodle zůstává pro testy, odevzdávání, individuální výsledky, neveřejná zadání a oznámení pro zapsané studenty. Přípona `-moodle` pouze přidává ZIP; nemění veřejnost ani stabilitu vydání.

Před prvním vydáním zkontrolujte také celý repozitář, nejen manifest. Pokud má HUB nabízet odkaz na zdrojový repozitář, musí být repozitář veřejný a jeho strom i historie nesmí obsahovat osobní údaje, neveřejné hodnocení, přístupové údaje ani interní poznámky. Zahrnuté položky musí mít vyřešenou provenanci a práva k publikování. Licenční podmínky repozitáře shrnuje `LICENSE.md`; podmínky převzatých položek tím nejsou nahrazeny.

GitHub Pages je potřeba jednou nastavit na **Source: GitHub Actions**. Prostředí `github-pages` musí povolit větev `main` a tagy dané lekce, například `L01-v*`.

Pro okamžitou aktualizaci hubu musí organizace nastavit secrets `HUB_APP_ID` a `HUB_APP_PRIVATE_KEY` pro GitHub App oprávněnou odeslat `repository_dispatch` pouze do repozitáře `CUNI-NATUR-Biostatistics.github.io`. Bez těchto secrets release a lesson Pages proběhnou, ale hub je nutné obnovit ručně.
