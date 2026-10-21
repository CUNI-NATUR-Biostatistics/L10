#----------------------------------------------------------#
#
#      L10 — Tvar rozdělení, transformace a nelinearita
#                 Praktické cvičení v R
#             Studenti biologie a ekologie
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

#----------------------------------------------------------#
# Příprava -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Jak získat a otevřít skript -----
#--------------------------------------------------#
# Ke cvičení potřebujete jen tento skript cviceni.R. Žádný datový soubor
# stahovat nemusíte: většinu dat si vytvoříte přímo v R a jedna tabulka
# je součástí každé instalace R.
#
# Kde skript najdete:
# V README lekce (soubor README.md v kořeni repozitáře L10) najděte část
# Materiály pro studenty a otevřete odkaz na R skript. Pokud se soubor
# otevře na GitHubu, stáhněte ho tlačítkem Download raw file nad obsahem
# souboru. Neukládejte stránku prohlížeče jako HTML.
# Po vydání cvičení bude skript také na webu kurzu:
# https://cuni-natur-biostatistics.github.io/L10/current/code/cviceni.R
#
# Jak skript uložit a otevřít:
# 1. Vytvořte si složku, například L10_praktikum, a uložte do ní
#    cviceni.R.
# 2. V RStudiu zvolte File > Open File a vyberte uložený cviceni.R.
# 3. Přes File > Save As si uložte vlastní kopii, například
#    cviceni_L10_prijmeni.R.

#--------------------------------------------------#
## Jak se skriptem pracovat -----
#--------------------------------------------------#
# Hlavní úlohy U01–U08 řešte v uvedeném pořadí, protože na sebe navazují.
# Úlohy navíc N01–N11 jsou dobrovolné. Slouží k dalšímu procvičování,
# klidně i po praktiku, a nemusíte je stihnout.
#
# Spouštění kódu:
# - Jeden příkaz spustíte tak, že do něj umístíte kurzor a stisknete
#   Ctrl + Enter.
# - Více příkazů najednou označte myší a stiskněte Ctrl + Enter.
# - Výsledky se vypisují v panelu Console, grafy v panelu Plots a vytvořené
#   objekty uvidíte v panelu Environment.
# - Starší grafy si v panelu Plots prohlédnete šipkami vlevo nahoře.
#
# Komentáře a odpovědi:
# - Řádky začínající znakem # jsou komentáře; R je nespouští.
# - Kód pište pod řádek "Vaše řešení". Slovní odpovědi pište jako komentáře.
# - Některé ukázky kódu jsou zakomentované. Zkopírujte je do svého řešení
#   a z každého řádku odstraňte úvodní #. Nejrychleji to uděláte tak, že
#   vložené řádky označíte a zvolíte Code > Comment/Uncomment Lines
#   (Ctrl + Shift + C).
#
# Když se něco pokazí:
# Pokud objekty v Environmentu neodpovídají skriptu, zvolte Session >
# Restart R. Restart smaže objekty z paměti, ale uložený skript zůstane.
# Potom znovu spusťte své hotové hlavní úlohy shora dolů.

#--------------------------------------------------#
## Výsledky učení a předpoklady -----
#--------------------------------------------------#
# Po cvičení byste měli umět:
# - popsat tvar rozdělení z histogramu a Q–Q grafu a posoudit, zda je
#   pro lineární model podstatný,
# - rozlišit transformace, které mění jen měřítko (jednotky, centrování,
#   z-skóre), od transformací, které mění tvar (odmocnina, logaritmus),
# - rozpoznat zakřivený vztah v grafu residuí a navrhnout jednoduché
#   řešení,
# - porovnat několik biologicky smysluplných tvarů vztahu,
# - vysvětlit koeficient modelu po logaritmické transformaci.
#
# Navazujeme na předchozí lekce: vektory, datové rámce, histogram, průměr
# a medián, lm(), coef(), confint(), predict(), residua, graf residuí,
# Q–Q graf a AIC. Nové funkce vysvětlujeme vždy u úlohy, kde je poprvé
# potřebujete.

#--------------------------------------------------#
## Technická kontrola -----
#--------------------------------------------------#
# Spusťte následující řádek. Vypíše verzi R. Očekávané výsledky ve skriptu
# platí pro R 3.6 a novější; ve starších verzích se mohou vygenerovaná
# čísla lišit.
R.version.string

#----------------------------------------------------------#
# Připomenutí z předchozích lekcí -----
#----------------------------------------------------------#
# Pokud se v grafech residuí a v AIC orientujete, můžete tento blok
# přeskočit.
#
# Graf residuí (osa x: odhadnuté hodnoty fitted(), osa y: residua
# residuals()) čteme takto:
# - vodorovný pás kolem nuly bez vzoru: přímka vztah vystihuje;
# - oblouk (tvar písmene U): vztah je zakřivený, přímka ho nevystihuje;
# - vějíř (rozptyl roste zleva doprava): odchylky jsou u velkých hodnot
#   větší než u malých.
#
# AIC porovnává kandidátní modely. Nižší AIC znamená lepší kompromis mezi
# shodou s daty a složitostí. Porovnávat smíme jen modely se stejnou
# odezvou na stejných pozorováních.

#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Sčítání, nebo násobení? -----
#--------------------------------------------------#
# V první části si data vytvoříme sami. Takovým datům říkáme simulovaná
# data. Výhoda: víme přesně, jak vznikla, a můžeme tak ověřit, co s nimi
# dělají grafy, transformace a modely.
#
# Nové funkce:
# - set.seed() nastaví výchozí bod generátoru náhodných čísel. Díky tomu
#   dostanete stejná „náhodná“ čísla jako ostatní a můžete porovnat své
#   výsledky s očekávanými. Spouštějte ho vždy těsně před generováním.
# - rnorm() vygeneruje n hodnot ze souměrného zvonu (normálního
#   rozdělení) se zadaným průměrem (mean) a směrodatnou odchylkou (sd).
#
# Ukázka: výška 200 rostlin (simulovaná data). Výšku ovlivňuje mnoho
# drobných vlivů (světlo, voda, živiny), které se k sobě SČÍTAJÍ.
# Součet mnoha drobných vlivů dává souměrný zvon. Proto výšku vytvoříme
# funkcí rnorm(): průměr 30 cm, směrodatná odchylka 5 cm.
# Označte všechny řádky ukázky a spusťte je Ctrl + Enter.
set.seed(seed = 900723)
vec_vyska_rostlin <-
  rnorm(
    n = 200,
    mean = 30,
    sd = 5
  )
hist(
  x = vec_vyska_rostlin,
  breaks = 20,
  main = "Výška rostlin (simulovaná data)",
  xlab = "Výška rostliny (cm)",
  ylab = "Počet rostlin"
)
mean(x = vec_vyska_rostlin)
median(x = vec_vyska_rostlin)

# Hmotnost ryby vzniká jinak. Každý vliv (teplota, potrava, paraziti)
# hmotnost zvětší nebo zmenší o určité PROCENTO. Vlivy se tedy NÁSOBÍ.
# Takovou veličinu vytvoříme tak, že zvon z rnorm() vložíme do funkce
# exp(). Funkce exp() je opakem logaritmu; podrobně se k ní vrátíme
# v úloze U03. Zatím stačí recept: mean = log(x = 50) zajistí, že typická
# ryba bude vážit kolem 50 g.
#
# Ukázka: hmotnost 200 ryb v gramech (simulovaná data). Označte všechny
# řádky a spusťte je.
set.seed(seed = 900723)
vec_hmotnost_ryb <-
  exp(
    x = rnorm(
      n = 200,
      mean = log(x = 50),
      sd = 0.8
    )
  )

#----------------------------------------#
### Úloha | L10-U01 -----
#----------------------------------------#

# Zadání:
# Pracujte s vec_vyska_rostlin a vec_hmotnost_ryb z ukázek.
# 1. Nakreslete histogram vec_hmotnost_ryb s popisky os včetně jednotek.
# 2. Spočítejte průměr a medián hmotnosti ryb.
# 3. Nakreslete Q–Q graf výšky rostlin a Q–Q graf hmotnosti ryb, oba
#    s referenční přímkou.
# 4. Do komentáře popište tvar obou rozdělení slovy: je souměrné, nebo má
#    dlouhý chvost na jedné straně? Jak se to projevilo na vztahu průměru
#    a mediánu a v Q–Q grafu?

# Vaše řešení:


# Nápověda 1:
# Histogram nakreslíte stejně jako v ukázce s rostlinami. Pro Q–Q graf
# potřebujete dvě funkce: jedna kreslí body, druhá přidá referenční
# přímku.
#
# Nápověda 2:
# Q–Q graf nakreslíte qqnorm(y = ...) a přímku přidáte qqline(y = ...).
# Pro každý vektor spusťte obě funkce zvlášť: nejdřív obě pro rostliny,
# potom obě pro ryby.
#
# Očekávaný výsledek:
# Ryby váží asi od 6 do 453 g. Průměr je asi 68,9 g, medián asi 49,2 g.
# Histogram má dlouhý chvost vpravo (pravostranně šikmé rozdělení)
# a v Q–Q grafu se body vpravo nahoře zvedají vysoko nad přímku.
# U rostlin je průměr (30,2 cm) téměř stejný jako medián (29,9 cm)
# a body Q–Q grafu leží blízko přímky.
#
# Interpretace:
# Několik velmi těžkých ryb táhne průměr nahoru. Která hodnota, průměr,
# nebo medián, lépe popisuje „typickou“ rybu?

#--------------------------------------------------#
## Mění se tvar, když měníme jednotky? -----
#--------------------------------------------------#
# Tři transformace mění jen polohu a měřítko:
# - změna jednotek: hmotnost v kg dostaneme jako hmotnost v g / 1000;
# - centrování: od každé hodnoty odečteme průměr, takže nový průměr je 0;
# - z-skóre: po centrování ještě vydělíme směrodatnou odchylkou.
#   z-skóre říká, o kolik směrodatných odchylek leží hodnota nad
#   průměrem (kladné číslo), nebo pod ním (záporné číslo):
#
#     z = (x - mean(x)) / sd(x)
#
# Funkce scale(x = ...) spočítá z-skóre stejně, ale vrací ho jako
# tabulku s pomocnými údaji. Proto zde používáme výpočet podle vzorce.

#----------------------------------------#
### Úloha | L10-U02 -----
#----------------------------------------#

# Zadání:
# Pracujte s vec_hmotnost_ryb z U01.
# 1. Vytvořte vec_hmotnost_kg (hmotnost v kilogramech).
# 2. Vytvořte vec_hmotnost_z (z-skóre hmotnosti) podle vzorce výše.
# 3. Spočítejte rozsah vec_hmotnost_kg funkcí range().
# 4. Nakreslete histogram vec_hmotnost_z a porovnejte ho s histogramem
#    z U01.
# 5. Spočítejte průměr a směrodatnou odchylku vec_hmotnost_z.
# 6. Do komentáře zapište, co se změnilo a co zůstalo stejné.

# Vaše řešení:


# Nápověda 1:
# Každou transformaci zapíšete jedním řádkem: vezmete celý vektor
# a provedete s ním výpočet. R počítá s každou hodnotou vektoru zvlášť.
#
# Nápověda 2:
# Pro z-skóre použijte mean(x = vec_hmotnost_ryb) a
# sd(x = vec_hmotnost_ryb) přímo ve vzorci. Histogram nakreslíte hist()
# se stejnými argumenty jako v ukázce; změňte x a popisek osy x.
# Rozsah vypíše range(x = vec_hmotnost_kg).
#
# Očekávaný výsledek:
# Hmotnosti v kg leží asi od 0,006 do 0,453 kg. Histogram z-skóre má
# stejný tvar s dlouhým chvostem vpravo jako histogram z U01; změnila se
# jen čísla na ose x. Průměr z-skóre je prakticky 0. R ho může vypsat jako
# velmi malé číslo, například 4.3e-17. Zápis e-17 znamená × 10^-17, tedy
# prakticky nulu. Směrodatná odchylka z-skóre je přesně 1. Nejtěžší ryba
# má z-skóre asi 6,05: leží 6,05 směrodatné odchylky nad průměrem.
#
# Interpretace:
# Spolužák tvrdí: „Po převodu na z-skóre budou hmotnosti normálně
# rozdělené.“ Má pravdu? Odpovězte podle svých histogramů.

#--------------------------------------------------#
## Které transformace mění tvar? -----
#--------------------------------------------------#
# Odmocnina a logaritmus mění tvar rozdělení: malé hodnoty od sebe
# oddálí a velké k sobě přiblíží. Dlouhý chvost vpravo se tím zkrátí.
#
# Logaritmus převádí násobky na stejné kroky. Funkce log() počítá
# přirozený logaritmus a exp() je jeho opak. Spusťte ukázku:
# - každé zdvojnásobení (1, 2, 4, 8) přidá k logaritmu stejný krok 0,693;
# - exp() vrátí logaritmus zpět na původní hodnotu;
# - logaritmus nuly není konečné číslo (R vypíše -Inf), proto lze
#   logaritmovat jen kladné hodnoty.
log(x = c(1, 2, 4, 8))
exp(x = log(x = 8))
log(x = 0)

#----------------------------------------#
### Úloha | L10-U03 -----
#----------------------------------------#

# Zadání:
# Pracujte s vec_hmotnost_ryb z U01.
# 1. Vytvořte vec_hmotnost_odmocnina pomocí sqrt() a vec_hmotnost_log
#    pomocí log().
# 2. Nakreslete histogram každého z nich.
# 3. Nakreslete Q–Q graf vec_hmotnost_log s referenční přímkou.
# 4. Spočítejte průměr vec_hmotnost_log a porovnejte ho s log(x = 50),
#    tedy s hodnotou, kterou jsme zadali do receptu v ukázce před U01.
# 5. Převeďte průměr logaritmů zpět funkcí exp(). Kolik gramů vyšlo?
# 6. Do komentáře zapište, které transformace z U02 a U03 změnily tvar
#    rozdělení a které jen polohu a měřítko.

# Vaše řešení:


# Nápověda 1:
# V ukázce před U01 jsme zvon z rnorm() vložili do exp(). Co se stane, když na
# výsledek použijeme opačnou funkci?
#
# Nápověda 2:
# vec_hmotnost_log <- log(x = vec_hmotnost_ryb). Zpětný převod průměru:
# exp(x = mean(x = vec_hmotnost_log)).
#
# Očekávaný výsledek:
# Po odmocnině má histogram stále chvost vpravo, ale kratší. Po logaritmu je
# histogram přibližně souměrný a body Q–Q grafu leží blízko přímky.
# Průměr logaritmů je asi 3,948, log(x = 50) je 3,912. exp() vrátí asi
# 51,8 g, tedy hodnotu blízkou typické rybě z receptu (50 g). Tvar
# změnily odmocnina a logaritmus; jednotky a z-skóre změnily jen polohu
# a měřítko.
# Histogram logaritmu hmotnosti má stejný tvar jako histogram výšky
# rostlin z ukázky: oba vznikly se stejným set.seed() ze stejných
# náhodných čísel z rnorm(), jen s jiným průměrem a rozptylem.
#
# Interpretace:
# Veličině, která je po logaritmu souměrná, říkáme log-normální. Které
# biologické veličiny kolem vás vznikají spíš násobením než sčítáním?

#--------------------------------------------------#
## Co musí být normální? -----
#--------------------------------------------------#
# Lineární model předpokládá přibližně normální rozdělení residuí, nikoli
# odezvy nebo prediktoru. Ověříme si to na datech, u kterých víme, že
# přímka platí.
#
# Ukázka: 120 listů (simulovaná data). Plocha listu vzniká násobením,
# proto je pravostranně šikmá. Sušina listu je přesně přímka:
# 5 mg + 0,4 mg na každý cm² plochy, plus náhodná odchylka ze zvonu se
# směrodatnou odchylkou 3 mg. Označte všechny řádky a spusťte je.
set.seed(seed = 900723)
vec_plocha_listu <-
  exp(
    x = rnorm(
      n = 120,
      mean = log(x = 20),
      sd = 0.9
    )
  )
vec_susina_listu <-
  5 + 0.4 * vec_plocha_listu +
  rnorm(
    n = 120,
    mean = 0,
    sd = 3
  )
data_listy <-
  data.frame(
    plocha_cm2 = vec_plocha_listu,
    susina_mg = vec_susina_listu
  )
# Jeden řádek tabulky data_listy představuje jeden list.
#
# Shapiro–Wilkův test normality doplňuje Q–Q graf. Nulová hypotéza zní:
# hodnoty odpovídají normálnímu tvaru. Malá p-hodnota svědčí proti
# ní. Test čteme vždy až po Q–Q grafu a s ohledem na počet pozorování:
# u velkých výběrů odhalí i nepodstatnou odchylku, u malých přehlédne
# i velkou. Použití: shapiro.test(x = ...).

#----------------------------------------#
### Úloha | L10-U04 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_listy.
# 1. Nakreslete histogram plochy listu a histogram sušiny listu.
# 2. Vytvořte model mod_listy se sušinou jako odezvou a plochou jako
#    prediktorem.
# 3. Nakreslete histogram residuí a Q–Q graf residuí mod_listy.
# 4. Spusťte Shapiro–Wilkův test na sušině listu a na residuích
#    mod_listy.
# 5. Do komentáře odpovězte: co musí být u lineárního modelu přibližně
#    normální, a splňuje to mod_listy?

# Vaše řešení:


# Nápověda 1:
# Model vytvoříte jako v předchozích lekcích pomocí lm() s formula
# a data. Residua z modelu získáte funkcí, kterou jste používali v grafu
# residuí.
#
# Nápověda 2:
# Formule je susina_mg ~ plocha_cm2. Residua jsou
# residuals(object = mod_listy); vložte je do hist(), qqnorm(), qqline()
# a shapiro.test().
#
# Očekávaný výsledek:
# Plocha i sušina mají dlouhý chvost vpravo. Residua jsou přibližně
# souměrná a v Q–Q grafu leží blízko přímky. Test pro sušinu dává
# p < 0,001, pro residua p ≈ 0,56. Odhadnutý sklon je asi 0,41 mg
# na cm² (v receptu 0,4). Model je v pořádku, i když odezva normální není.
#
# Interpretace:
# Proč by bylo chybou sušinu logaritmovat jen proto, že test normality
# pro samotnou sušinu dal malou p-hodnotu?

#--------------------------------------------------#
## Kolikrát víc energie spotřebuje dvakrát těžší zvíře? -----
#--------------------------------------------------#
# U savců roste klidový metabolismus s tělesnou hmotností přibližně jako
# hmotnost^0,75. Zvíře dvakrát těžší tedy nespotřebuje dvakrát víc
# energie, ale jen 2^0,75 ≈ 1,68krát víc.
#
# Ukázka: 80 savců od 10 g do 100 kg (simulovaná data). Funkce runif()
# vygeneruje hodnoty rovnoměrně rozložené mezi min a max. Hmotnosti
# rozložíme rovnoměrně na logaritmické škále, aby byla zastoupena malá
# i velká zvířata. Metabolismus ve wattech je 3 × hmotnost^0,75, násobený
# náhodnou odchylkou zhruba o třicet procent nahoru nebo dolů.
# Označte všechny řádky a spusťte je.
set.seed(seed = 900723)
vec_hmotnost_zvirat <-
  exp(
    x = runif(
      n = 80,
      min = log(x = 0.01),
      max = log(x = 100)
    )
  )
vec_metabolismus <-
  3 * vec_hmotnost_zvirat^0.75 *
  exp(
    x = rnorm(
      n = 80,
      mean = 0,
      sd = 0.3
    )
  )
data_metabolismus <-
  data.frame(
    hmotnost_kg = vec_hmotnost_zvirat,
    metabolismus_w = vec_metabolismus
  )
# Jeden řádek tabulky data_metabolismus představuje jedno zvíře.
#
# Zakřivený vztah lze popsat i lineárním modelem. „Lineární“ znamená
# lineární v koeficientech, nikoli přímka v grafu. Do formule proto
# můžeme dát i log() nebo druhou mocninu prediktoru. Druhou mocninu
# zapíšeme jako I(hmotnost_kg^2). Funkce I() říká R, aby výraz uvnitř
# spočítal jako obyčejnou druhou mocninu.

#----------------------------------------#
### Úloha | L10-U05 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_metabolismus.
# 1. Nakreslete bodový graf metabolismu (osa y) proti hmotnosti (osa x)
#    s popisky os včetně jednotek.
# 2. Vytvořte mod_metab_primka (metabolismus ~ hmotnost) a nakreslete
#    jeho graf residuí s vodorovnou čárou v nule.
# 3. Dříve než odhadnete další modely, zapište do komentáře, co
#    biologicky tvrdí tito dva kandidáti:
#
#      mod_metab_kvadraticky:
#        metabolismus_w ~ hmotnost_kg + I(hmotnost_kg^2)
#      mod_metab_mocninny:
#        log(metabolismus_w) ~ log(hmotnost_kg)
#
# 4. Vytvořte mod_metab_kvadraticky a nakreslete jeho graf residuí.
# 5. Spočítejte AIC přímky a kvadratického modelu. Do komentáře zapište,
#    proč do tohoto srovnání nesmíme přidat AIC mocninného modelu.

# Vaše řešení:


# Nápověda 1:
# Kvadratický člen dovoluje, aby křivka postupně zrychlovala nebo
# zpomalovala, případně se obrátila. Mocninný vztah tvrdí, že každé
# zdvojnásobení hmotnosti vynásobí metabolismus stejným číslem.
#
# Nápověda 2:
# Graf residuí: plot(x = fitted(object = ...), y = residuals(object = ...))
# a potom abline(h = 0). AIC spočítáte AIC(object = ...) pro každý model
# zvlášť.
#
# Očekávaný výsledek:
# Většina zvířat je v bodovém grafu namačkaná vlevo dole. V grafu residuí
# přímky mají nejmenší zvířata residua mírně záporná a rozptyl residuí
# doprava výrazně roste (vějíř). Kvadratický model má nižší AIC (asi
# 550,3 proti 557,5), ale vějíř v jeho residuích zůstává. Mocninný model
# má jinou odezvu (logaritmus metabolismu), proto jeho AIC nelze
# porovnat s modely pro metabolismus ve wattech.
#
# Interpretace:
# Kvadratický model „vyhrál“ nad přímkou. Stačí to k tomu, abychom ho
# použili?

#--------------------------------------------------#
## Najde model exponent, který jsme zadali? -----
#--------------------------------------------------#
# V mocninném modelu log(metabolismus) ~ log(hmotnost) je sklon přímo
# exponentem z receptu: pokud model funguje, měl by vyjít blízko 0,75.
# Zvíře 2krát těžší má metabolismus 2^sklon krát vyšší.

#----------------------------------------#
### Úloha | L10-U06 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_metabolismus.
# 1. Nakreslete bodový graf log(metabolismus_w) proti log(hmotnost_kg).
# 2. Vytvořte mod_metab_mocninny podle formule z U05. Nakreslete jeho
#    graf residuí a Q–Q graf residuí.
# 3. Vypište jeho koeficienty a 95% intervaly spolehlivosti. Obsahuje
#    interval pro sklon hodnotu 0,75 z receptu?
# 4. Spočítejte 2^sklon a interpretujte ho jednou větou o zvířatech.
# 5. Převeďte intercept zpět funkcí exp() a porovnejte ho s číslem 3
#    z receptu.

# Vaše řešení:


# Nápověda 1:
# Sklon najdete v řádku s log(hmotnost_kg). Intercept je metabolismus
# na logaritmické škále pro zvíře, jehož log(hmotnost) je 0, tedy pro
# zvíře o hmotnosti 1 kg.
#
# Nápověda 2:
# Koeficienty: coef(object = mod_metab_mocninny); sklon je druhý prvek,
# například coef(object = mod_metab_mocninny)[2]. Intervaly vypíše
# confint(). Mocninu zapíšete jako 2^číslo.
#
# Očekávaný výsledek:
# Na logaritmických osách leží body podél přímky. Residua tvoří
# vodorovný pás bez vějíře a v Q–Q grafu leží blízko přímky. Sklon je asi
# 0,743, interval asi 0,719 až 0,766, takže obsahuje 0,75. 2^sklon je
# asi 1,67: zvíře dvakrát těžší má asi o 67 % vyšší metabolismus. exp()
# z interceptu je asi 3,00.
#
# Interpretace:
# U skutečných dat exponent předem neznáme. Co z této úlohy plyne pro
# důvěru v interval spolehlivosti?

#--------------------------------------------------#
## Má růst larev teplotní optimum? -----
#--------------------------------------------------#
# Larvy hmyzu rostou nejrychleji při určité teplotě. Za chladu je
# metabolismus pomalý, za horka se larvy přehřívají. Takový vztah má
# vrchol (optimum). Logaritmus ho nevystihne, protože jen ohýbá rostoucí
# křivku, ale nedokáže ji otočit dolů. Vrchol umí popsat kvadratický
# člen.
#
# Ukázka: 60 larev chovaných při teplotách 10–35 °C (simulovaná data).
# Denní přírůstek hmotnosti v mg je parabola s vrcholem ve 24 °C plus
# náhodná odchylka. Označte všechny řádky a spusťte je.
set.seed(seed = 900723)
vec_teplota <-
  runif(
    n = 60,
    min = 10,
    max = 35
  )
vec_rust <-
  -12 + 2.4 * vec_teplota - 0.05 * vec_teplota^2 +
  rnorm(
    n = 60,
    mean = 0,
    sd = 1.5
  )
data_larvy <-
  data.frame(
    teplota_c = vec_teplota,
    rust_mg = vec_rust
  )
# Jeden řádek tabulky data_larvy představuje jednu larvu.
#
# Vrchol paraboly odezva = a + b × x + c × x² leží v bodě x = -b / (2c).
# Koeficient b je u prediktoru, c u jeho druhé mocniny.

#----------------------------------------#
### Úloha | L10-U07 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_larvy.
# 1. Nakreslete bodový graf růstu (osa y) proti teplotě (osa x).
# 2. Vytvořte tři modely a ke každému nakreslete graf residuí:
#
#      mod_larvy_primka:      rust_mg ~ teplota_c
#      mod_larvy_kvadraticky: rust_mg ~ teplota_c + I(teplota_c^2)
#      mod_larvy_log:         log(rust_mg) ~ log(teplota_c)
#
# 3. Který model odstranil oblouk v residuích? Porovnejte AIC přímky
#    a kvadratického modelu.
# 4. Z koeficientů kvadratického modelu spočítejte teplotní optimum
#    a porovnejte ho s 24 °C z receptu.

# Vaše řešení:


# Nápověda 1:
# Optimum spočítáte ze dvou koeficientů kvadratického modelu: z koeficientu
# u teplota_c (b) a u I(teplota_c^2) (c). Pořadí koeficientů vypíše
# coef().
#
# Nápověda 2:
# Uložte vec_koef <- coef(object = mod_larvy_kvadraticky). Prvek [1] je
# intercept, [2] je b a [3] je c. Do vzorce -b / (2c) dosaďte
# vec_koef[2] a vec_koef[3].
#
# Očekávaný výsledek:
# Přímka i logaritmický model nechávají v residuích výrazný oblouk;
# kvadratický model nechává vodorovný pás. AIC: přímka asi 296,6,
# kvadratický model asi 218,3. AIC logaritmického modelu do srovnání
# nepatří, protože má jinou odezvu. Optimum vychází asi 23,7 °C.
#
# Interpretace:
# U metabolismu pomohl logaritmus, u larev ne. Co rozhoduje o tom, jaký
# tvar vztahu zvolit?

#--------------------------------------------------#
## Jak rychle roste objem dřeva s průměrem kmene? -----
#--------------------------------------------------#
# Teď skutečná data, u kterých správný tvar předem neznáme. Tabulka trees
# je součástí každé instalace R. Obsahuje 31 pokácených třešní pozdních
# (Prunus serotina) z USA (zdroj: Ryan, Joiner a Ryan, 1976). Jeden řádek
# představuje jeden strom. Sloupce jsou v amerických jednotkách:
# - Girth  ... průměr kmene ve výšce 4,5 stopy, v palcích (název sloupce
#              je zavádějící, jde o průměr, ne o obvod);
# - Height ... výška stromu ve stopách;
# - Volume ... objem dřeva v krychlových stopách.
# Převodní konstanty: 1 palec = 2,54 cm; 1 stopa = 0,3048 m;
# 1 krychlová stopa = 0,0283 m³.
head(
  x = trees,
  n = 6
)
#
# Kmen se podobá válci nebo kuželi. Jeho objem roste s plochou průřezu
# a ta roste s druhou mocninou průměru.

#----------------------------------------#
### Úloha | L10-U08 -----
#----------------------------------------#

# Zadání:
# 1. Ještě před výpočty zapište do komentáře, jaký exponent očekáváte
#    ve vztahu objem ~ průměr^exponent, a proč.
# 2. Vytvořte data_tresne se sloupci prumer_cm, vyska_m a objem_m3
#    převedenými z tabulky trees.
# 3. Nakreslete histogram objemu a porovnejte průměr s mediánem.
# 4. Nakreslete bodový graf objemu proti průměru kmene. Vytvořte
#    mod_tresne_primka (objem_m3 ~ prumer_cm) a nakreslete graf residuí.
# 5. Vytvořte mod_tresne_kvadraticky (s I(prumer_cm^2)) a porovnejte AIC
#    přímky a kvadratického modelu.
# 6. Vytvořte mod_tresne_mocninny (log–log) a nakreslete jeho graf
#    residuí.
# 7. Vypište koeficienty a 95% intervaly mocninného modelu. Porovnejte
#    exponent se svým očekáváním z bodu 1 a spočítejte 2^exponent.
# 8. Napište závěr ve třech až čtyřech větách: jak objem roste s průměrem
#    kmene, jak jistí si jsme a jedno omezení těchto dat.

# Vaše řešení:


# Nápověda 1:
# Postupujte jako u metabolismu v U05–U06, jen napřed převeďte jednotky:
# každý sloupec trees vynásobte jeho převodní konstantou.
#
# Nápověda 2:
# data_tresne <- data.frame(prumer_cm = trees$Girth * 2.54, ...) a stejně
# doplňte výšku a objem. Formule mocninného modelu je
# log(objem_m3) ~ log(prumer_cm).
#
# Očekávaný výsledek:
# Objem je 0,29–2,18 m³, průměr (0,85 m³) je vyšší než medián (0,68 m³).
# Residua přímky tvoří oblouk: kladná u tenkých i tlustých stromů,
# záporná uprostřed. Kvadratický model má nižší AIC (asi -53,5 proti
# -39,4). AIC mocninného modelu do srovnání nepatří, protože má jinou
# odezvu; jeho residua tvoří vodorovný pás. Exponent je asi 2,20
# (interval asi 2,02 až 2,38). Je blízko očekávané hodnotě 2, ale
# interval ji těsně nezahrnuje; vysvětlení hledejte v interpretaci. Strom
# s dvojnásobným průměrem má asi 4,6krát víc dřeva. Omezení: jeden druh,
# 31 stromů a průměry jen 21–52 cm.
#
# Interpretace:
# Exponent vyšel o něco vyšší než 2. Napadá vás biologický důvod?
# Pomůže pohled na sloupec vyska_m.

#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#
# Úlohy navíc jsou dobrovolné. Každá uvádí, které objekty z hlavních úloh
# nebo z ukázky těsně před ní potřebuje. Nové objekty pojmenujte jinak,
# než se jmenují objekty z hlavních úloh, abyste je nepřepsali.

#--------------------------------------------------#
## Tvar rozdělení a velikost výběru -----
#--------------------------------------------------#

# Ukázka: dva výběry ze stejného souměrného zvonu (simulovaná data),
# jeden s 20 a druhý s 2000 hodnotami. Recept je stejný jako u výšky
# rostlin, mění se jen počet hodnot. Označte všechny řádky a spusťte je.
set.seed(seed = 900723)
vec_zvon_20 <-
  rnorm(
    n = 20,
    mean = 30,
    sd = 5
  )
set.seed(seed = 900723)
vec_zvon_2000 <-
  rnorm(
    n = 2000,
    mean = 30,
    sd = 5
  )

#----------------------------------------#
### Úloha navíc | L10-N01 -----
#----------------------------------------#

# Zadání:
# Pracujte s vec_zvon_20 a vec_zvon_2000 z ukázky.
# 1. Nakreslete histogram obou vektorů.
# 2. Do komentáře popište, zda v každém z nich poznáte souměrný zvon.

# Vaše řešení:


# Nápověda 1:
# Oba vektory pocházejí ze stejného receptu. Liší se jen počtem hodnot,
# a tedy tím, kolik hodnot připadne na každý sloupec histogramu.
#
# Nápověda 2:
# Použijte hist() jako v ukázce s rostlinami. U malého výběru zkuste
# breaks = 10, u velkého breaks = 30.
#
# Očekávaný výsledek:
# Histogram 20 hodnot je zubatý a zvon v něm skoro nepoznáte, i když
# hodnoty pocházejí ze souměrného zvonu. Histogram 2000 hodnot zvon
# ukazuje zřetelně.
#
# Interpretace:
# Co z toho plyne pro posuzování tvaru z histogramu residuí u malých
# datových souborů?

# Ukázka: dva výběry se stejným mírně pravostranně šikmým tvarem
# (simulovaná data), 20 a 2000 hodnot. Recept je stejný jako u hmotnosti
# ryb, jen s jinými čísly. Označte všechny řádky a spusťte je.
set.seed(seed = 900723)
vec_mirne_20 <-
  exp(
    x = rnorm(
      n = 20,
      mean = 0,
      sd = 0.25
    )
  )
set.seed(seed = 900723)
vec_mirne_2000 <-
  exp(
    x = rnorm(
      n = 2000,
      mean = 0,
      sd = 0.25
    )
  )

#----------------------------------------#
### Úloha navíc | L10-N02 -----
#----------------------------------------#

# Zadání:
# Pracujte s vec_mirne_20 a vec_mirne_2000 z ukázky výše.
# 1. Na oba vektory použijte shapiro.test().
# 2. Nakreslete jejich Q–Q grafy s referenční přímkou.
# 3. Do komentáře porovnejte p-hodnoty a Q–Q grafy obou výběrů.

# Vaše řešení:


# Nápověda 1:
# Oba výběry vznikly stejným receptem, takže mají stejně mírnou šikmost.
# Liší se jen počtem hodnot, se kterým test pracuje.
#
# Nápověda 2:
# shapiro.test(x = vec_mirne_20) a totéž pro vec_mirne_2000. Q–Q graf
# nakreslíte qqnorm(y = ...) a qqline(y = ...).
#
# Očekávaný výsledek:
# Pro 20 hodnot je p asi 0,21, pro 2000 hodnot je p < 0,001, přestože
# obě skupiny vznikly stejným receptem se stejnou mírnou šikmostí.
#
# Interpretace:
# Proč výsledek testu normality vždy čteme spolu s Q–Q grafem a počtem
# pozorování?

#----------------------------------------#
### Úloha navíc | L10-N03 -----
#----------------------------------------#

# Zadání:
# Koeficient šikmosti je průměr třetích mocnin z-skóre:
#
#   mean(x = ((x - mean(x)) / sd(x))^3)
#
# Kladné číslo znamená chvost vpravo, záporné chvost vlevo a číslo blízko
# nuly souměrný tvar. Nejde o pravidlo s pevnou hranicí, jen o popis.
# Spočítejte koeficient šikmosti pro vec_vyska_rostlin, vec_hmotnost_ryb
# a vec_hmotnost_log z hlavních úloh.

# Vaše řešení:


# Nápověda 1:
# Uvnitř vzorce poznáte z-skóre z U02.
#
# Nápověda 2:
# Pro ryby můžete použít přímo vec_hmotnost_z:
# mean(x = vec_hmotnost_z^3).
#
# Očekávaný výsledek:
# Rostliny asi 0,16, ryby asi 3,00, logaritmus hmotnosti ryb asi 0,16.
# Rostliny a logaritmus hmotnosti mají stejnou šikmost, protože vznikly
# ze stejných náhodných čísel (viz U03).
#
# Interpretace:
# Proč by bylo chybou rozhodovat o transformaci jen podle toho, zda
# koeficient šikmosti překročí nějakou hranici?

#--------------------------------------------------#
## Další biologické situace -----
#--------------------------------------------------#

# Ukázka: bakterie se v kultuře množí tak, že za každou hodinu přibude
# stejné PROCENTO buněk. Kód vytvoří počty buněk měřené každou hodinu
# od 0 do 12, pokaždé třikrát (simulovaná data). Za hodinu se počet
# vynásobí exp(0.35) ≈ 1,419, tedy přibude asi 41,9 %.
# V kódu je 0:12 řada celých čísel od 0 do 12 a rep(each = 3) zopakuje
# každé z nich třikrát. length() vrátí počet prvků vektoru.
# Označte všechny řádky a spusťte je.
set.seed(seed = 900723)
vec_hodina <-
  rep(
    x = 0:12,
    each = 3
  )
vec_bakterie <-
  1000 * exp(x = 0.35 * vec_hodina) *
  exp(
    x = rnorm(
      n = length(x = vec_hodina),
      mean = 0,
      sd = 0.15
    )
  )
data_bakterie <-
  data.frame(
    hodina = vec_hodina,
    pocet_bunek = vec_bakterie
  )
# Jeden řádek tabulky data_bakterie představuje jedno měření.

#----------------------------------------#
### Úloha navíc | L10-N04 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_bakterie z ukázky výše.
# 1. Nakreslete bodový graf počtu buněk proti hodině a potom graf
#    logaritmu počtu buněk proti hodině.
# 2. Vytvořte mod_bakterie: log(pocet_bunek) ~ hodina.
# 3. Převeďte sklon na procento za hodinu: 100 * (exp(sklon) - 1).
#    Totéž udělejte s oběma hranicemi 95% intervalu spolehlivosti.

# Vaše řešení:


# Nápověda 1:
# Je-li logaritmovaná jen odezva, exp(sklon) udává, kolikrát se odezva
# vynásobí, když prediktor vzroste o 1.
#
# Nápověda 2:
# 100 * (exp(x = coef(object = mod_bakterie)[2]) - 1) a stejný výpočet
# pro confint(object = mod_bakterie)[2, ].
#
# Očekávaný výsledek:
# Počty rostou stále rychleji, logaritmus počtu roste po přímce. Sklon
# je asi 0,349, tedy asi 41,8 % za hodinu (interval asi 39,9 až 43,8 %).
# Skutečná hodnota z receptu 41,9 % leží v intervalu.
#
# Interpretace:
# Proč by přímka bez logaritmu popsala růst kultury špatně?

# Ukázka: počet chycených brouků ve 100 pastech (simulovaná data). Počet
# brouků je celé číslo a často je nula. Funkce rpois() vygeneruje celé
# počty (0, 1, 2, …) kolem zadaného průměru lambda; zde je to průměrně
# jeden brouk na past. Označte oba řádky a spusťte je.
set.seed(seed = 900723)
vec_brouci <-
  rpois(
    n = 100,
    lambda = 1
  )

#----------------------------------------#
### Úloha navíc | L10-N05 -----
#----------------------------------------#

# Zadání:
# Pracujte s vec_brouci z ukázky výše.
# 1. Spočítejte, kolik pastí je prázdných.
# 2. Vypočítejte log(x = vec_brouci) a sqrt(x = vec_brouci) a podívejte
#    se, co vyšlo u prázdných pastí.
# 3. Nakreslete histogram počtů a histogram jejich odmocniny.

# Vaše řešení:


# Nápověda 1:
# Logická podmínka vec_brouci == 0 vrací TRUE pro prázdné pasti; TRUE se
# při sčítání počítá jako 1.
#
# Nápověda 2:
# sum(vec_brouci == 0). Hodnoty u prázdných pastí uvidíte například
# pomocí log(x = vec_brouci)[vec_brouci == 0].
#
# Očekávaný výsledek:
# Prázdných je 36 pastí. Logaritmus u nich dává -Inf, takže ho nelze
# použít. Odmocnina nuly je 0 a histogram odmocniny má kratší chvost vpravo.
#
# Interpretace:
# Pro počty s mnoha nulami existují vhodnější modely, ke kterým se
# dostaneme v jedné z dalších lekcí. Proč nestačí prázdné pasti z dat
# vyřadit?

#--------------------------------------------------#
## Prohloubení hlavních úloh -----
#--------------------------------------------------#

# Ukázka: stejná simulace metabolismu jako před U05, se stejným
# set.seed(), ale s exponentem 1 místo 0.75 (simulovaná data).
# Označte všechny řádky a spusťte je.
set.seed(seed = 900723)
vec_hmotnost_iso <-
  exp(
    x = runif(
      n = 80,
      min = log(x = 0.01),
      max = log(x = 100)
    )
  )
vec_metabolismus_iso <-
  3 * vec_hmotnost_iso^1 *
  exp(
    x = rnorm(
      n = 80,
      mean = 0,
      sd = 0.3
    )
  )
data_metabolismus_iso <-
  data.frame(
    hmotnost_kg = vec_hmotnost_iso,
    metabolismus_w = vec_metabolismus_iso
  )

#----------------------------------------#
### Úloha navíc | L10-N06 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_metabolismus_iso z ukázky výše.
# 1. Vytvořte mocninný model mod_metab_iso:
#
#      log(metabolismus_w) ~ log(hmotnost_kg)
#
# 2. Vypište jeho koeficienty a 95% intervaly spolehlivosti. Obsahuje
#    interval spolehlivosti sklonu hodnotu 1?

# Vaše řešení:


# Nápověda 1:
# Postupujte stejně jako u mod_metab_mocninny v U06, jen s jinou
# tabulkou.
#
# Nápověda 2:
# lm() s formulí z bodu 1 a data = data_metabolismus_iso, potom coef()
# a confint().
#
# Očekávaný výsledek:
# Sklon je asi 0,993 (interval asi 0,969 až 1,016) a obsahuje 1. Model
# sleduje exponent, který jsme do dat vložili.
#
# Interpretace:
# Exponent 1 znamená, že metabolismus roste stejně rychle jako hmotnost.
# Co by to znamenalo pro spotřebu energie na 1 kg těla u malých a velkých
# zvířat?

#----------------------------------------#
### Úloha navíc | L10-N07 -----
#----------------------------------------#

# Zadání:
# Porovnejte tři „typické“ hodnoty hmotnosti ryb z U01: průměr, medián
# a exp(průměr logaritmů).

# Vaše řešení:


# Nápověda 1:
# Průměr logaritmů jste už počítali v U03.
#
# Nápověda 2:
# exp(x = mean(x = log(x = vec_hmotnost_ryb))).
#
# Očekávaný výsledek:
# Průměr asi 68,9 g, medián asi 49,2 g, exp(průměr logaritmů) asi 51,8 g.
# Zpětně převedený průměr logaritmů leží blízko mediánu a blízko 50 g
# z receptu, nikoli blízko aritmetického průměru.
#
# Interpretace:
# Když model s logaritmem odezvy převedeme zpět funkcí exp(), popisuje
# odhad průměrnou, nebo spíš typickou hodnotu?

#----------------------------------------#
### Úloha navíc | L10-N08 -----
#----------------------------------------#

# Zadání:
# Intercept kvadratického modelu larev z U07 popisuje růst při 0 °C,
# kde žádná larva nebyla. Vytvořte kopii tabulky data_larvy pod názvem
# data_larvy_centrovane a přidejte do ní sloupec teplota_od_20 (teplota
# minus 20 °C). Vytvořte stejný kvadratický model s tímto sloupcem místo
# teplota_c a porovnejte koeficienty s mod_larvy_kvadraticky.

# Vaše řešení:


# Nápověda 1:
# Centrování na zvolenou hodnotu je odečtení té hodnoty od celého
# sloupce.
#
# Nápověda 2:
# data_larvy_centrovane$teplota_od_20 <- data_larvy_centrovane$teplota_c
# - 20; formule rust_mg ~ teplota_od_20 + I(teplota_od_20^2).
#
# Očekávaný výsledek:
# Nový intercept je asi 16,23 mg za den, což je odhadnutý růst při 20 °C.
# Koeficient u druhé mocniny se nezmění (asi -0,053) a odhadnuté hodnoty
# obou modelů jsou totožné. Centrování změnilo význam interceptu, ne
# tvar křivky.
#
# Interpretace:
# Proč je intercept pro 20 °C užitečnější než intercept pro 0 °C?

#----------------------------------------#
### Úloha navíc | L10-N09 -----
#----------------------------------------#

# Zadání:
# Objem válce je úměrný průměru na druhou krát výšce. Do mocninného
# modelu třešní z U08 přidejte logaritmus výšky:
#
#   log(objem_m3) ~ log(prumer_cm) + log(vyska_m)
#
# Model uložte jako mod_tresne_vyska. Porovnejte oba exponenty
# s geometrickým očekáváním 2 a 1.

# Vaše řešení:


# Nápověda 1:
# Logaritmus součinu je součet logaritmů, proto se výška do modelu
# přidává znaménkem +.
#
# Nápověda 2:
# lm() s formulí výše a data = data_tresne, potom confint().
#
# Očekávaný výsledek:
# Exponent průměru je asi 1,98 (interval 1,83 až 2,14), exponent výšky
# asi 1,12 (interval 0,70 až 1,54). Oba intervaly obsahují geometrické
# očekávání.
#
# Interpretace:
# Jak tento výsledek vysvětluje, proč byl exponent v U08 o něco vyšší
# než 2?

#----------------------------------------#
### Úloha navíc | L10-N10 -----
#----------------------------------------#

# Zadání:
# Následující shrnutí je záměrně chybné. Opravte každou větu a ke každé
# opravě uveďte doklad z některé hlavní úlohy:
#
#   „Sušina listů nebyla normálně rozdělená, proto byl model chybný.
#   Převod na z-skóre šikmost odstraní. Mocninný model metabolismu má
#   nejnižší AIC ze všech tří, proto je nejlepší. Logaritmus narovná
#   každý zakřivený vztah.“

# Vaše řešení:


# Nápověda 1:
# Každá věta se týká jiné hlavní úlohy: U02, U04, U05 a U07.
#
# Nápověda 2:
# Hledejte v těchto úlohách konkrétní graf nebo číslo, které tvrzení
# vyvrací, například histogram residuí nebo graf residuí logaritmického
# modelu larev.
#
# Očekávaný výsledek:
# Opravy: normální mají být residua (U04); z-skóre nemění tvar (U02);
# AIC mocninného modelu nelze porovnat s modely jiné odezvy (U05);
# logaritmus nevystihne vztah s optimem (U07).
#
# Interpretace:
# Která z oprav by u skutečné studie nejvíc změnila závěr?

#----------------------------------------#
### Úloha navíc | L10-N11 -----
#----------------------------------------#

# Zadání:
# Larvy z U07 byly chovány jen při 10–35 °C. Pomocí predict()
# a kvadratického modelu mod_larvy_kvadraticky odhadněte denní růst při
# 0 °C a při 50 °C.

# Vaše řešení:


# Nápověda 1:
# predict() potřebuje tabulku nových hodnot se sloupcem pojmenovaným
# stejně jako prediktor v modelu.
#
# Nápověda 2:
# Vytvořte data.frame(teplota_c = c(0, 50)) a předejte ho do predict()
# jako argument newdata.
#
# Očekávaný výsledek:
# Při 0 °C model predikuje asi -12,9 mg za den a při 50 °C asi -19,7 mg
# za den. Obě teploty leží mimo naměřený rozsah, kde parabola nemá oporu
# v datech.
#
# Interpretace:
# Proč těmto odhadům nevěříme, i když model v rozsahu 10–35 °C sedí
# dobře?

#----------------------------------------------------------#
# Ohlédnutí a vlastní kontrola -----
#----------------------------------------------------------#
# Zkuste bez kódu odpovědět na tyto otázky:
# 1. Proč je veličina vzniklá násobením mnoha vlivů pravostranně šikmá?
# 2. Které transformace mění jen polohu a měřítko a které i tvar rozdělení?
# 3. Co musí být u lineárního modelu přibližně normální?
# 4. Jak v grafu residuí poznáte zakřivený vztah?
# 5. Kdy pomůže logaritmus a kdy kvadratický člen?
# 6. Proč nelze porovnat AIC modelu pro y a modelu pro log(y)?
# 7. Jak zní interpretace sklonu v modelu log(y) ~ log(x)?
# Pokud si nejste jistí, vraťte se k úlohám U01–U03, U04, U05–U07 a U08.
