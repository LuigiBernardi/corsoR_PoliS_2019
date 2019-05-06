## Materiali giornata di formazione su R - PoliS Lombardia - 8 Maggio 2019

### Cartella principale
Materiali da copiare nella cartella principale del progetto in RStudio.

* [programma_corsoR_PoliS_2019_con_risorse.md](programma_corsoR_PoliS_2019_con_risorse.md) - Elenco degli argomenti trattati e delle relative funzioni R. Link alle risorse per l'approfondimento.

* [script_corsoR_PoliS_2019.R](script_corsoR_PoliS_2019.R) - Script con i comandi utilizzati.

### Cartella [dati](dati)
Dati da caricare nel progetto in RStudio.

* [Comuni_2018_poligonali.zip](dati/Comuni_2018_poligonali.zip) - Archivio .zip con lo shapefile dei confini comunali lombardi al 1° Gennaio 2018.

* [popolazione_residente_2014_2018.csv](dati/popolazione_residente_2014_2018.csv) - File .csv con la popolazione residente nei comuni lombardi al 1° Gennaio dal 2014 al 2018.

Per utilizzare i dati in RStudio è necessario scaricarli nella sotto-cartella dati del progetto (NB la sotto-cartella va creata), scompattare l'archivio ed eseguire le seguenti istruzioni (NB le istruzioni si trovano anche nello script con i comandi).
```R
require(tidyverse)
pop_2014_2018 <- read_csv("dati/popolazione_residente_2014_2018.csv",
                          col_types = cols_only(ITTER107 = col_character(),
                                                TIME = col_integer(),
                                                Value = col_integer())) %>%
                          rename(codice_Istat = ITTER107,
                                 anno = TIME,
                                 popolazione = Value)

require(sf)            
comuni_2018_poligonali <- st_read("dati/Comuni_2018_poligonali.shp") %>% st_transform(crs = 32632)
```

