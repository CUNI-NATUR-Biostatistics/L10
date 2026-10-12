# Výuková data L10

Soubor `druhy_galapagy.csv` obsahuje údaje o 30 ostrovech Galapág. Jeden řádek představuje jeden ostrov. Tabulka zahrnuje název ostrova, počet druhů rostlin, počet endemických druhů, plochu ostrova (km²), nejvyšší bod ostrova (m n. m.), vzdálenost k nejbližšímu ostrovu (km), vzdálenost k ostrovu Santa Cruz (km) a plochu sousedního ostrova (km²).

Údaje pocházejí z článku M. P. Johnson a P. H. Raven (1973): Species number and endemism: The Galapagos Archipelago revisited. *Science* 179: 893–895. Tabulka je převzata z datasetu `galamiss` v balíčku [`faraway` 1.0.9](https://cran.r-project.org/package=faraway) (J. Faraway), který je šířen pod licencí GPL. Používáme verzi `galamiss`, která zachovává původní chybějící hodnoty: u šesti ostrovů chybí nejvyšší bod. Verze `gala` ze stejného balíčku tyto hodnoty pro pohodlí doplňuje, a proto ji nepoužíváme.

Reprodukovatelnou přípravu provádí skript `R/prepare_galapagos_data.R`. Skript stáhne připnutý zdrojový balíček z CRAN, ověří jeho otisk SHA-256 a načte z něj tabulku bez instalace balíčku. Názvy ostrovů převede z názvů řádků na čitelný text, převede názvy proměnných do češtiny a počty uloží jako celá čísla. Řádky ani hodnoty nefiltruje a nemění.

SHA-256 souboru `druhy_galapagy.csv`: `a60499f4070e59dfe729035bdb2d14fb84ca6c2db5fee3694ceca1ce84c98fb2`.

Na tato převzatá data se nevztahuje licence původního výukového obsahu v kořenovém `LICENSE.md`; při dalším použití uveďte původní zdroj a balíček `faraway`.
