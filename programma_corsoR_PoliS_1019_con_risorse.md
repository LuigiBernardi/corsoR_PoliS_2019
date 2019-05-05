# Mattino – Le basi di R


## Introduzione all’ambiente R


* Caratteristiche di R, vantaggi (e svantaggi) del suo utilizzo, per cosa è utile (e per cosa non è utile) utilizzarlo.
* La modularità dell’ambiente R: il pacchetto base e i pacchetti aggiuntivi.
```R
install.packages()
library()
```

* Introduzione a RStudio: le componenti dell’ambiente di lavoro (in particolare script, console).

* La creazione di un progetto in RStudio e la sua organizzazione.

* Come muoversi in R Studio utilizzando l’interfaccia grafica, le principali scorciatoie da tastiera e i comandi.
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
https://www.rstudio.com/

## Le basi di R

* La creazione di un oggetto.
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

* Oggetti base: vector e matrix.
```R
c()
matrix()
rownames()
colnames()
cbind()
rbind()
apply()
```

* Oggetti complessi: data.frame e list.
```R
data.frame()
list()
lapply()
```

* Gli operatori logici.
==, &, |, !.
%in%.
identical.
which.
* Estrarre il contenuto degli oggetti R: subsetting.
$, [ e [[.
head e tail.
subset.
* Le variabili categoriali in R: factors.
factor.
levels.
cut.
* I missing values in R: NA.
is.na.
* Accenno a due concetti utili a capire il funzionamento di R: vectorized operation e riciclo degli elementi.

Accenno alle potenzialità di R rispetto ad altre soluzioni
* Accenno alla possibilità di scrivere le proprie funzioni.
function.
* Accenno alla possibilità di usare gli strumenti di un linguaggio di programmazione: i for loop e le if statement.
for.
If, else e ifelse.
* Il vantaggio di lavorare in un unico ambiente.
 
Pomeriggio – L’analisi dati con R illustrata attraverso un esempio pratico

Importare e pulire i dati: pacchetto base e tidyverse
* Importare dati in RStudio attraverso l’interfaccia grafica, i comandi e il pacchetto haven di tidyverse (lettura di dataset SPSS, SAS, Stata).
read_(csv/csv2/delim/…).
read_(sas/sav/stata).
* La prima valutazione dei dati importati.
summary.
quantile.
table.
* Riorganizzare un dataset con le funzioni base.
subset.
order.
* Riorganizzazione un dataset con tidyverse.
filter, spread, gather, select, rename, arrange, mutate, group_by e summarise.
%>%.
* Unire due dataset importati con tidyverse.
left_join, right_join e inner_join.
* Esortare dati da RStudio attraverso l’interfaccia grafica, i comandi e il pacchetto haven di tidyverse (esportazione di dataset SPSS, SAS, Stata etc).
write_(csv/csv2/delim/…).
write_(sas/sav/stata).

Introduzione all’analisi dati con R attraverso alcuni esempi pratici
* Le tabelle in R: creazione con i comandi base, creazione con tidyverse ed esportazione in Excel con write.xlsx.
table, prop_table e addmargins.
write.xlsx.
* I grafici in R: pacchetto base e ggplot2.
plot, boxplot e hist.
ggplot, geom_point, geom_line, geom_boxplot, geom_hist, facet_grid e ggsave.
* Le mappe in R: pacchetti sf e tmap.
read_sf.
tmap_mode, tm_shape, tm_polygon, tm_facets e tmap_save.
