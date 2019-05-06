

# LIBRERIE ----------------------------------------------------------------


library(tidyverse)
library(haven)
library(xlsx)
library(sf)
library(tmap)


# UTILITY -----------------------------------------------------------------


wd <- getwd()
wd
setwd(wd)

rm(list = ls()[!(ls() %in% c("wd",
                             "comuni_2018_poligonali",
                             "pop_2014_2018",
                             "pop_2014_2018_prov",
                             "pop_2014_2018_tot",
                             "pop_2014_2018_wide",
                             "pop_2018"
))])

ls()

# {} ~


# DATI DA IMPORTARE -------------------------------------------------------


## Popolazione residente in Lombardia al 01/01 dal 2014 al 2018

pop_2014_2018 <- read_csv("dati/popolazione_residente_2014_2018.csv",
                          col_types = cols_only(ITTER107 = col_character(),
                                                TIME = col_integer(),
                                                Value = col_integer())) %>%
      rename(codice_Istat = ITTER107,
             anno = TIME,
             popolazione = Value)

glimpse(pop_2014_2018)

## Confini comuni lombardi al 01/01/2018

comuni_2018_poligonali <- st_read("dati/Comuni_2018_poligonali.shp") %>% st_transform(crs = 32632)

comuni_2018_poligonali %>% st_geometry() %>% plot()


# INTRODUZIONE A R --------------------------------------------------------


## Installare e caricare pacchetti

install.packages("esquisse")
library(esquisse)

## Muoversi in RStudio

ls()

x <- 1:10 
rm(x)

getwd()
setwd("dati/")
setwd(wd)

## Le funzioni di aiuto

?rm
hclust() # usare F1 con cursore sopra funzione e TAB fra le parentesi quando sono ancora vuote


# LE BASI DI R ------------------------------------------------------------


## Creare un oggetto

x <- 1:10
class(x)
str(x)
glimpse(x)
length(x)
names(x)
attributes(x)
is.integer(x)
is.logical(x)

rm(x)

## Oggetti base: vector e matrix

x_vect <- c(1,3,4)
y_vect <- c("a", "b", "c")
names(x_vect) <- y_vect
names(x_vect)
attributes(x_vect)

z_vect <- c(1, "a")
class(z_vect)

x_matr <- matrix(data = c(1:3,10:12), nrow = 3, ncol = 2)
dim(x_matr)
rownames(x_matr) <- y_vect
colnames(x_matr) <- c("var1", "var2")
attributes(x_matr)

x_vect2 <- 10:12
cbind(x_vect, x_vect2)
rbind(x_vect, x_vect2)

apply(X = x_matr, MARGIN = 2, FUN = mean)

rm(x_vect2, y_vect, z_vect)

## Oggetti complessi: data.frame e list

class(pop_2014_2018)
dim(pop_2014_2018)
glimpse(pop_2014_2018)

x_df <- data.frame(id = "1":"3",
                   sesso = c("maschio", "maschio", "femmina"),
                   altezza = rnorm(n = 3, mean = 178, sd = 5))
glimpse(x_df)

x_list <- list(id = "1":"3",
               sesso = c("maschio", "femmina"))
attributes(x_list)
x_list

lapply(X = x_list, FUN = function(x){x[1]})

## Operatori logici

2 == 2
2 > 3
2 != 3

x_vect2 <- c(1,3,4)
names(x_vect2) <- c("a", "b", "c")
x_vect == x_vect2
identical(x_vect, x_vect2)

x_vect > 3
x_vect != 3
x_vect %in% c(3, 4)

(x_vect == 3) & is.numeric(x_vect)
(x_vect == 3) | (x_vect == 1)

names(x_vect) <- NULL
which(x_vect != 3)

rm(x_vect2)

## Estrarre il contenuto degli oggetti R: subsetting

# subsetting con indici di posizione
x_vect[1]
x_vect[-1]
x_vect[c(1,3)]

# subsetting con operatori logici
x_vect[x_vect >= 3]
x_vect[c(FALSE, TRUE, TRUE)]
x_vect[x_vect %in% c(1, 4)]

# subsetting con i nomi degli elementi
names(x_vect) <- c("a", "b", "c")
x_vect[c("a", "c")]

# subsetting matrix
x_matr[1, 1]
x_matr[c(1,3), 1]
x_matr[c(1,3), 1, drop = F]
x_matr[c(1,3), ]

x_matr[,1] > 1
x_matr[c(FALSE, TRUE, TRUE), ]
x_matr[x_matr[,1] > 1, ]

# subsetting data.frame
x_df[1,1]
x_df[c(1,3), c(1,2)]
x_df[c(1,3), ]
x_df[c(1,3), c("id", "sesso")]
x_df$sesso
x_df[x_df$sesso == "maschio", ]
head(pop_2014_2018, 10)
tail(pop_2014_2018, 15)
subset(pop_2014_2018, anno == 2018)

# subsetting list
x_list[1]
class(x_list[1])
x_list[[1]]
class(x_list[[1]])
x_list$sesso
class(x_list$sesso)
x_list$sesso[1]

rm(x_list, x_matr)

## Le variabili categoriali in R: factors

class(x_df$sesso)
str(x_df$sesso)
levels(x_df$sesso)
unclass(x_df$sesso)

# creare factor con factor()
x_df$esito <- factor(c("1", "1", "2"),
                     labels = c("positivo", "negativo"))
levels(x_df$esito)
unclass(x_df$esito)
table(x_df$esito)
x_df[x_df$esito == "positivo", ]
x_df[unclass(x_df$esito) == 1, ]

# creare factor con cut() a partire da variabili continue
altezze <- rnorm(n = 50, mean = 170, sd = 10)

altezze_fct <- cut(x = altezze,
                   breaks = c(-Inf, 160, 170, 180, Inf))
levels(altezze_fct)

altezze_fct_mylabs <- cut(x = altezze,
                          breaks = c(-Inf, 160, 170, 180, Inf),
                          labels = c("<= 160cm",
                                     "160cm - 170cm",
                                     "170cm - 180cm",
                                     ">180cm"))
levels(altezze_fct_mylabs)

head(data.frame(altezze, altezze_fct, altezze_fct_mylabs), 10)

rm(altezze, altezze_fct, altezze_fct_mylabs)

## I missing values in R: NA

set.seed(666)
altezze <- rnorm(n = 50, mean = 170, sd = 10)
altezze[altezze %in% (sample(x = altezze, size = 5))] <- NA 

summary(altezze)
mean(altezze)
mean(altezze, na.rm = TRUE)

is.na(altezze)
which(is.na(altezze))
altezze_no_missing <- altezze[!is.na(altezze)]
length(altezze_no_missing)
summary(altezze_no_missing)

rm(altezze, altezze_no_missing)

## Vectorized operation e riciclo degli elementi

names(x_vect) <- NULL
x_vect2 <- rep(3,3)
x_vect3 <- rep(c(3,5), each = 3)

x_vect
x_vect2
x_vect + x_vect2

x_vect
x_vect3
x_vect + x_vect3

rm(x_vect, x_vect2, x_vect3)


# LE POTENZIALITA' DI R ---------------------------------------------------


## Scrivere le proprie funzioni

my_func <- function(x, y) {
      
      x + y

}

my_func
my_func(2, 2)

lm

rm(my_func)

## For loop e if statement

for (i in 1:10) {
      
      print(i)
}


for (i in letters) {
      
      print(i)
}


for (i in letters) {
      
      if (i %in% c("a", "e", "i", "o", "u")) {
            
            print(paste(i, "è una vocale"))
      
      } else {
            
            print(paste(i, "è una consonante"))
      
      }
}

set.seed(666)
altezze <- rnorm(n = 50, mean = 170, sd = 10)
altezze_dicotom <- factor(ifelse(altezze > mean(altezze),
                                 "sopra la media",
                                 "in media o sotto")
                          )
head(data.frame(altezze, altezze_dicotom))

rm(altezze, altezze_dicotom)

## Un esempio pratico

pop_2014_2018_prov <- pop_2014_2018 %>% 
      mutate(provincia = recode(factor(str_sub(codice_Istat, 1, 3)),
                                "012" = "VA",
                                "013" = "CO",
                                "014" = "SO",
                                "015" = "MI",
                                "016" = "BG",
                                "017" = "BS",
                                "018" = "PV",
                                "019" = "CR",
                                "020" = "MN",
                                "097" = "LC",
                                "098" = "LO",
                                "108" = "MB")) %>% 
      group_by(provincia, anno) %>% 
      summarise(popolazione = sum(popolazione, na.rm = T)) %>% 
      ungroup()

grafici_pop_prov <- list()

for (i in unique(pop_2014_2018_prov$provincia)) {
      
      grafici_pop_prov[[i]] <- ggplot(data = filter(pop_2014_2018_prov, provincia == i),
                                      aes(x = anno, y = popolazione)) +
            geom_line() +
            geom_point(aes(size = popolazione), color = "steelblue") +
            labs(title = paste("Provincia:", i),
                 x = "") +
            theme_minimal() +
            theme(legend.position = "none",
                  text = element_text(size = 11),
                  plot.title = element_text(hjust = 0.5),
                  panel.grid.major.x = element_blank(),
                  panel.grid.minor.x = element_blank())
}

grafici_pop_prov
grafici_pop_prov[["MI"]]

dir.create(file.path(wd, "dati", "grafici_pop_prov"))

for(i in names(grafici_pop_prov)) {
      
      ggsave(file.path(wd, "dati", "grafici_pop_prov", paste(i, ".jpg", sep = "")),
             plot = grafici_pop_prov[[i]],
             device = "jpeg",
             width = 17,
             height = 12,
             units = "cm",
             dpi = 500)
}

rm(grafici_pop_prov)

# IMPORTARE E PULIRE I DATI -----------------------------------------------


## Importare dati in RStudio attraverso l’interfaccia grafica, i comandi
## e il pacchetto haven di tidyverse (lettura di dataset SPSS, SAS, Stata)

read_csv()
read_csv2()
read_delim()
read_fwf()
read_sas()
read_spss()
read_sav()
read_stata()
read_dta()

# esempio con read_csv() utilizzato in precedenza
# pop_2014_2018 <- read_csv("dati/popolazione_residente_2014_2018.csv",
#                           col_types = cols_only(ITTER107 = col_character(),
#                                                 TIME = col_integer(),
#                                                 Value = col_integer()))

## La prima valutazione dei dati importati

pop_2018 <- pop_2014_2018 %>% 
      filter(anno == 2018)

View(pop_2018)

summary(pop_2018)

quantile(pop_2018$popolazione, probs = c(0, 0.25, 0.5, 0.75, 1))
quantile(pop_2018$popolazione, probs = seq(0, 1, 0.1))

pop_2018$classi_popolazione <- cut(pop_2018$popolazione,
                                   breaks = c(-Inf, 5000, 25000, 75000, Inf),
                                   labels = c("<= 5.000",
                                              "5.000 - 25.000",
                                              "25.000 - 75.000",
                                              "> 75.000"))
table(pop_2018$classi_popolazione)

## Riorganizzare un dataset con le funzioni di base

subset(pop_2018,
       subset = classi_popolazione == "> 75.000",
       select = c(codice_Istat, popolazione))

order(pop_2018$popolazione)
pop_2018$popolazione[946]
min(pop_2018$popolazione)
pop_2018[order(pop_2018$popolazione), ]
pop_2018[order(-pop_2018$popolazione), ]

with(pop_2018, pop_2018[order(-popolazione), ])

## Riorganizzare un dataset con tidyverse

# selezionare osservazioni/righe: filter
filter(pop_2014_2018, anno == 2018)

pop_2014_2018 %>% filter(anno == 2018)

# estendere o raccogliere dati in stile tabella pivot: spread e gather
pop_2014_2018_wide <- pop_2014_2018 %>%
      spread(key = anno, value = popolazione, sep = "_")
pop_2014_2018_wide

pop_2014_2018_wide %>% gather(key = "anno", value = "popolazione", -codice_Istat)
pop_2014_2018_wide %>% gather(key = "anno", value = "popolazione", -codice_Istat) %>% 
      mutate(anno = as.integer(str_replace(anno, "anno_", "")))


# selezionare variabili/colonne: select
pop_2018 %>% select(codice_Istat, classi_popolazione)
pop_2014_2018_wide %>% select(codice_Istat, anno_2016:anno_2018)
pop_2014_2018_wide %>% select(-anno_2014)
pop_2014_2018_wide %>% select(-anno_2014:-anno_2018)

# rinominare variabili/colonne: rename
pop_2018 %>% rename(codIstat = codice_Istat)

# riodinare un dataset: arrange
pop_2014_2018_wide %>% arrange(codice_Istat)
pop_2014_2018_wide %>% arrange(desc(codice_Istat))

# calcolare nuove variabili: mutate
pop_2018 <- pop_2018 %>% 
      mutate(provincia = recode(factor(str_sub(codice_Istat, 1, 3)),
                                "012" = "VA",
                                "013" = "CO",
                                "014" = "SO",
                                "015" = "MI",
                                "016" = "BG",
                                "017" = "BS",
                                "018" = "PV",
                                "019" = "CR",
                                "020" = "MN",
                                "097" = "LC",
                                "098" = "LO",
                                "108" = "MB")) %>% 
      select(codice_Istat, provincia, anno:classi_popolazione)
pop_2018

# raggruppare un dataset e creare riepiloghi di gruppo: group_by e summarise
pop_2018 %>% group_by(provincia) %>% 
      summarise(num_comuni = n(),
                pop_totale = sum(popolazione, na.rm = TRUE),
                pop_mediana = median(popolazione, na.rm = TRUE)) %>% 
      arrange(desc(pop_totale))

## Unire due dataset importati con tidyverse

comuni_2018_poligonali <- comuni_2018_poligonali %>% 
      mutate(codice_Istat = str_replace(COD_ISTATN, "03", ""))

comuni_2018_poligonali <- comuni_2018_poligonali %>% 
      left_join(pop_2018, by = "codice_Istat")

colSums(is.na(pop_2018))
colSums((is.na(comuni_2018_poligonali)))
comuni_2018_poligonali %>% filter(is.na(popolazione)) %>% select(NOME_COM)

right_join()
inner_join()

## Esportare dati da RStudio attraverso i comandi
## e il pacchetto haven di tidyverse (scrittura di dataset SPSS, SAS, Stata)

getwd()
setwd("dati/")
write_csv2(pop_2014_2018, "pop_2014_2018_prova_export.csv", na = "")
setwd(wd)

write_sav()
write_sas()
write_dta()


# ANALIZZARE I DATI -------------------------------------------------------


## Le tabelle in R: creazione con i comandi base, creazione con tidyverse
## ed esportazione in Excel con write.xlsx

# base
table(pop_2018$classi_popolazione)
addmargins(table(pop_2018$classi_popolazione, useNA = "ifany"))
data.frame(addmargins(table(pop_2018$classi_popolazione)))

my_table <- table(pop_2018$provincia, pop_2018$classi_popolazione)
my_table
addmargins(table(pop_2018$provincia, pop_2018$classi_popolazione), margin = c(1,2))

addmargins(prop.table(my_table, 1)*100, margin = 2)
round(addmargins(prop.table(my_table, 1)*100, margin = 2), 1)

rm(my_table)

# tidyverse
pop_2018 %>% group_by(classi_popolazione) %>% 
      count()

my_tidy_table <- pop_2018 %>% group_by(classi_popolazione) %>%
      summarise(N = n()) %>% 
      mutate(perc = round(N / sum(N) * 100, 1))
my_tidy_table

pop_2018 %>% group_by(classi_popolazione) %>%
      summarise(N = n(),
                pop_totale = sum(popolazione, na.rm = T),
                pop_media = mean(popolazione, na.rm = T)) %>% 
      mutate(perc = round(N / sum(N) * 100, 1)) %>% 
      select(classi_popolazione, N, perc, pop_totale, pop_media)

pop_2018 %>% group_by(provincia, classi_popolazione) %>%
      summarise(N = n()) %>% 
      spread(key = classi_popolazione, value = N, fill = 0)


# esportare in excel
getwd()
setwd("dati/")
write.xlsx(my_tidy_table, "tabella_prova_export.xlsx", sheetName = "prova_export")
setwd(wd)

rm(my_tidy_table)


## I grafici in R: pacchetto base e ggplot2

# pacchetto base
x <- rnorm(100, 10, 2)
y <- 2 * x + rnorm(100, 10, 2)
plot(x,y)

boxplot(x)

hist(x)

rm(x,y)

# ggplot 2

pop_2014_2018_tot <- pop_2014_2018 %>% group_by(anno) %>%
      summarise(popolazione = sum(popolazione, na.rm = T))
pop_2014_2018_tot

ggplot(pop_2014_2018_tot, aes(x = anno, y = popolazione)) +
      geom_line()

ggplot(pop_2014_2018_tot, aes(x = anno, y = popolazione)) +
      geom_line() +
      geom_point()

ggplot_temp <- ggplot(pop_2014_2018_tot, aes(x = anno, y = popolazione)) +
      geom_line()
ggplot_temp + geom_point()
rm(ggplot_temp)

pop_2018 %>%  filter(popolazione < 10000) %>%
      ggplot(aes(x = popolazione)) + 
      geom_histogram()
      
pop_2018 %>% filter(popolazione < 10000) %>% 
      ggplot(aes(x = provincia, y = popolazione)) +
      geom_boxplot(aes(fill = provincia))

pop_2014_2018 <- pop_2014_2018 %>% 
      mutate(provincia = recode(factor(str_sub(codice_Istat, 1, 3)),
                                "012" = "VA",
                                "013" = "CO",
                                "014" = "SO",
                                "015" = "MI",
                                "016" = "BG",
                                "017" = "BS",
                                "018" = "PV",
                                "019" = "CR",
                                "020" = "MN",
                                "097" = "LC",
                                "098" = "LO",
                                "108" = "MB")) %>% 
      select(codice_Istat, provincia, anno, popolazione)

my_plot <- pop_2014_2018 %>% filter(popolazione < 5000 &
                               provincia %in% c("PV", "LO", "CR", "MN") &
                               anno %in% c(2014, 2018)) %>% 
      ggplot(aes(x = provincia, y = popolazione)) +
      geom_boxplot(aes(fill = provincia)) +
      facet_grid(cols = vars(anno)) +
      labs(x = "Provincia",
           y = "Popolazione residente",
           title = "Popolazione residente al 01/01",
           subtitle = "Province di Pavia, Cremona, Mantova e Lodi. Anni 2014 e 2018",
           caption = "Fonte: Istat") +
      scale_fill_viridis_d() +
      theme(text = element_text(size = 9),
            legend.position = "none",
            panel.grid.major.x = element_blank())
my_plot

getwd()
setwd("dati/")
ggsave("grafico_prova_export.jpeg",
       plot = my_plot,
       device = "jpeg",
       width = 17,
       height = 12,
       units = "cm",
       dpi = 500)
setwd(wd)

rm(my_plot)

# un'interfaccia grafica per ggplot2: esquisse

esquisser(pop_2018)

## Le mappe in R: pacchetti sf e tmap

st_read()

# esempio con st_read() utilizzato in precedenza
# comuni_2018_poligonali <- st_read("dati/Comuni_2018_poligonali.shp") %>% st_transform(crs = 32632)
comuni_2018_poligonali %>% st_geometry() %>% plot()

tmaptools::palette_explorer()

tmap_mode("plot")

my_map <- tm_shape(comuni_2018_poligonali) +
      tm_polygons(col = "popolazione",
                  n = 5,
                  style = "quantile",
                  palette = "Blues", border.col = "white", lwd = 0.75,
                  title = "Classi popolazione",
                  showNA = F) +
      tm_layout(frame = F,
                legend.title.size = 1.3, legend.text.size = 0.9)
my_map

getwd()
setwd("dati/")
tmap_save(my_map,
          filename = "prova_export_mappa.jpeg",
          units = "cm", width = 17.5, height = 17.5, dpi = 500)
setwd(wd)

rm(my_map)

tmap_mode(mode = "view")

tm_shape(comuni_2018_poligonali) +
      tm_polygons(col = "popolazione",
                  n = 5,
                  style = "quantile",
                  palette = "Blues", border.col = "white", lwd = 0.75,
                  title = "Classi popolazione",
                  showNA = F,
                  alpha = 0.3) +
      tm_layout(frame = F,
                legend.title.size = 1.3, legend.text.size = 0.9)

tmap_mode("plot")

tm_shape(comuni_2018_poligonali) +
      tm_polygons(col = "popolazione",
                  n = 5,
                  style = "quantile",
                  palette = "Blues", border.col = "white", lwd = 0.75,
                  title = "Classi popolazione",
                  showNA = F) +
      tm_layout(frame = F,
                legend.title.size = 1.3, legend.text.size = 0.9) +
      tm_facets(by = "provincia",
                showNA = F)

