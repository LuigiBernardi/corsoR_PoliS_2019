## Giornata di formazione su R - PoliS Lombardia - 8 Maggio 2019

In questo repository si trovano i materiali utilizzati nel corso della giornata di formazione su R dell'8 Maggio 2019. Nella cartella principale si trovano due file:

* [programma_corsoR_PoliS_2019_con_risorse.md](programma_corsoR_PoliS_2019_con_risorse.md) contiene l'elenco degli argomenti trattati nel corso della giornata insieme alle rispettive funzioni R e ai link ad alcune risorse esterne che consentono l'approfondimento degli argomenti trattati.

* [script_corsoR_PoliS_2019.R](script_corsoR_PoliS_2019.R) è lo script con tutti comandi utilizzati per illustrare gli argomenti trattati.

Nella cartella [dati](dati) ci sono i materiali da caricare nel progetto in RStudio:

* [Comuni_2018_poligonali.zip](dati/Comuni_2018_poligonali.zip) è l'archivio compresso con i componenti dello shapefile dei confini comunali lombardi al 1 Gennaio 2018.

* [popolazione_residente_2014_2018.csv](dati/popolazione_residente_2014_2018.csv) è un file .csv con la popolazione residente in Lombardia al 1 Gennaio dal 2014 al 2018 a livello comunale.

Per caricare i due file in R è necessario scaricarli nella sotto-cartella dati del progetto RStudio (la sotto-cartella va creata) ed eseguire le seguenti istruzioni che si possono trovare anche nello script.
```R
require(tidyverse)
pop_2014_2018 <- read_csv("dati/popolazione_residente_2014_2018.csv",
                          col_types = cols_only(ITTER107 = col_character(),
                                                TIME = col_integer(),
                                                Value = col_integer())) %>%
                          rename(codice_Istat = ITTER107,
                                 anno = TIME,
                                 popolazione = Value)

library(sf)            
comuni_2018_poligonali <- st_read("dati/Comuni_2018_poligonali.shp") %>% st_transform(crs = 32632)
```

