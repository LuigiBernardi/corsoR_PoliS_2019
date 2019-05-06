# Mattino – Le basi di R


## Introduzione all’ambiente R


* Caratteristiche di R, vantaggi (e svantaggi) del suo utilizzo, per cosa è utile (e per cosa non è utile) utilizzarlo

* La modularità dell’ambiente R: il pacchetto base e i pacchetti aggiuntivi
```R
install.packages()
library()
```

* Introduzione a RStudio: le componenti dell’ambiente di lavoro (in particolare script, console)

* La creazione di un progetto in RStudio e la sua organizzazione

* Come muoversi in R Studio utilizzando l’interfaccia grafica, le principali scorciatoie da tastiera e i comandi
```R
ls()
rm()
setwd()
getwd()
```

* Come utilizzare le funzioni di aiuto
```R
?
help()
```

#### Per approfondire

https://www.r-project.org/

https://www.rstudio.com/

https://www.statmethods.net/interface/index.html

https://www.r-bloggers.com/

https://www.rdocumentation.org/

https://stackoverflow.com/questions/tagged/r


## Le basi di R


* La creazione di un oggetto
```R
<-
class()
str()
glimpse()
length()
names()
attributes()
is.character()
as.character()
# (is/as).(character/numeric/logical/...)
```

* Oggetti base: vector e matrix
```R
c()
matrix()
dim()
rownames()
colnames()
cbind()
rbind()
apply()
```

* Oggetti complessi: data.frame e list
```R
data.frame()
list()
lapply()
```

* Gli operatori logici
```R
# ==, &, |, !
%in%
identical()
which()
```

* Estrarre il contenuto degli oggetti R: subsetting
```R
# $, [, [[
head ()
tail ()
subset()
```

* Le variabili categoriali in R: factors
```R
factor()
levels()
cut()
```

* I missing values in R: NA
```R
is.na()
```

* Due concetti utili a capire il funzionamento di R: vectorized operation e riciclo degli elementi

#### per approfondire

https://www.statmethods.net/r-tutorial/index.html

http://adv-r.had.co.nz/Data-structures.html

http://adv-r.had.co.nz/Subsetting.html

http://www.sthda.com/english/wiki/r-basics-quick-and-easy

http://www.r-tutor.com/r-introduction


## Le potenzialità di R rispetto ad altre soluzioni


* La possibilità di scrivere le proprie funzioni
```R
function()
```

* La possibilità di usare gli strumenti di un linguaggio di programmazione: i for loop e le if statement
```R
for()
if()
else()
ifelse()
```

* Il vantaggio di lavorare in un unico ambiente


# Pomeriggio – L’analisi dati con R illustrata attraverso un esempio pratico


## Importare e pulire i dati: pacchetto base e tidyverse


* Importare dati in RStudio attraverso l’interfaccia grafica, i comandi e il pacchetto haven di tidyverse (lettura di dataset SPSS, SAS, Stata)
```R
read_csv()
read_csv2()
# read_(delim/fwf/…)
# read_(sas/sav/stata)
```

* La prima valutazione dei dati importati
```R
summary()
quantile()
table()
```

* Riorganizzare un dataset con le funzioni base
```R
subset()
order()
```

* Riorganizzazione un dataset con tidyverse
```R
%>%
filter()
spread()
gather()
select()
rename()
arrange()
mutate()
group_by()
summarise()
```

* Unire due dataset importati con tidyverse
```R
left_join()
right_join()
inner_join()
```

* Esportare dati da RStudio attraverso l’interfaccia grafica, i comandi e il pacchetto haven di tidyverse (esportazione di dataset SPSS, SAS, Stata etc)
```R
write_csv()
write_csv2()
# write_delim()
# write_(sas/sav/stata)
```


## Introduzione all’analisi dati con R attraverso alcuni esempi pratici

* Le tabelle in R: creazione con i comandi base, creazione con tidyverse ed esportazione in Excel con write.xlsx
```R
table()
prop_table()
addmargins()
write.xlsx()
```

* I grafici in R: pacchetto base e ggplot2
```R
plot()
boxplot()
hist()
ggplot()
geom_point()
geom_line()
geom_boxplot()
geom_hist()
facet_grid()
ggsave()
```

* Le mappe in R: pacchetti sf e tmap
```R
read_sf()
tmap_mode()
tm_shape()
tm_polygon()
tm_facets()
tmap_save()
```

#### per approfondire

* analisi di base

https://www.statmethods.net/stats/index.html

http://www.r-tutor.com/elementary-statistics/qualitative-data

http://www.r-tutor.com/elementary-statistics/quantitative-data

https://r4ds.had.co.nz/

* grafici

https://www.r-graph-gallery.com/

https://ggplot2.tidyverse.org/index.html

https://www.statmethods.net/graphs/index.html

https://www.statmethods.net/advgraphs/index.html

http://www.cookbook-r.com/Graphs/

http://www.sthda.com/english/wiki/data-visualization

https://github.com/dreamRs/esquisse

* mappe

https://github.com/r-spatial/sf

https://geocompr.robinlovelace.net/

https://cran.r-project.org/web/packages/tmap/vignettes/tmap-getstarted.html




