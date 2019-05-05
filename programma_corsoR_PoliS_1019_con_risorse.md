Mattino – Le basi di R

Introduzione all’ambiente R
•	Caratteristiche di R, vantaggi (e svantaggi) del suo utilizzo, per cosa è utile (e per cosa non è utile) utilizzarlo.
•	La modularità dell’ambiente R: il pacchetto base e i pacchetti aggiuntivi.
o	install.packages.
o	library.
•	Introduzione a RStudio: le componenti dell’ambiente di lavoro (in particolare script, console).
•	La creazione di un progetto in RStudio e la sua organizzazione.
•	Come muoversi in R Studio utilizzando l’interfaccia grafica, le principali scorciatoie da tastiera e i comandi.
o	ls.
o	rm.
o	setwd e getwd.
•	Come utilizzare le funzioni di aiuto.
o	? e help.

Le basi di R
•	La creazione di un oggetto.
o	<-.
o	class.
o	str.
o	(is/as).(character/numeric/logical/...).
•	Oggetti base: vector e matrix.
o	c.
o	matrix.
o	cbind e rbind.
o	apply.
•	Oggetti complessi: data.frame e accenno alle list.
o	data.frame.
o	list e lapply.
•	Gli operatori logici.
o	==, &, |, !.
o	%in%.
o	identical.
o	which.
•	Estrarre il contenuto degli oggetti R: subsetting.
o	$, [ e [[.
o	head e tail.
o	subset.
•	Le variabili categoriali in R: factors.
o	factor.
o	levels.
o	cut.
•	I missing values in R: NA.
o	is.na.
•	Accenno a due concetti utili a capire il funzionamento di R: vectorized operation e riciclo degli elementi.

Accenno alle potenzialità di R rispetto ad altre soluzioni
•	Accenno alla possibilità di scrivere le proprie funzioni.
o	function.
•	Accenno alla possibilità di usare gli strumenti di un linguaggio di programmazione: i for loop e le if statement.
o	for.
o	If, else e ifelse.
•	Il vantaggio di lavorare in un unico ambiente.
 
Pomeriggio – L’analisi dati con R illustrata attraverso un esempio pratico

Importare e pulire i dati: pacchetto base e tidyverse
•	Importare dati in RStudio attraverso l’interfaccia grafica, i comandi e il pacchetto haven di tidyverse (lettura di dataset SPSS, SAS, Stata).
o	read_(csv/csv2/delim/…).
o	read_(sas/sav/stata).
•	La prima valutazione dei dati importati.
o	summary.
o	quantile.
o	table.
•	Riorganizzare un dataset con le funzioni base.
o	subset.
o	order.
•	Riorganizzazione un dataset con tidyverse.
o	filter, spread, gather, select, rename, arrange, mutate, group_by e summarise.
o	%>%.
•	Unire due dataset importati con tidyverse.
o	left_join, right_join e inner_join.
•	Esortare dati da RStudio attraverso l’interfaccia grafica, i comandi e il pacchetto haven di tidyverse (esportazione di dataset SPSS, SAS, Stata etc).
o	write_(csv/csv2/delim/…).
o	write_(sas/sav/stata).

Introduzione all’analisi dati con R attraverso alcuni esempi pratici
•	Le tabelle in R: creazione con i comandi base, creazione con tidyverse ed esportazione in Excel con write.xlsx.
o	table, prop_table e addmargins.
o	write.xlsx.
•	I grafici in R: pacchetto base e ggplot2.
o	plot, boxplot e hist.
o	ggplot, geom_point, geom_line, geom_boxplot, geom_hist, facet_grid e ggsave.
•	Le mappe in R: pacchetti sf e tmap.
o	read_sf.
o	tmap_mode, tm_shape, tm_polygon, tm_facets e tmap_save.
