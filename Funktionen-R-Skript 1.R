#Skript 2
#Funktionen

df <- read.csv("https://raw.githubusercontent.com/DeepRamful/Gruppenarbeit-GitHub/main/Data.csv")
source("Funkionen-R-Skript 2.R")

#a)
#Die Funktion metfnc berechnet die verschiedene geeignete deskriptive Statistiken
#fuer metrische Variablen  
#INPUT:
# data - Vector mit metrischen Variablen
#OUTPUT:
# new data - Vector mit der Ergebnisse der Berechnungen von INPUT data

#Create the function
metfnc <- function(data){
  ar <- sprintf("Der Mittelwert: %g",mean(data$Alter))
  med <- sprintf("Der Median: %g",median(data$Alter))
  q1 <- sprintf("Das 0,25-Quantile: %1.0f",quantile(data$Alter,probs = 0.25))
  q3 <- sprintf("Das 0,75-Quantile: %1.0f",quantile(data$Alter,probs = 0.75))
  min <- sprintf("Der minimale Wert: %g",min(data$Alter))
  max <- sprintf("Der maximale Wert: %g",max(data$Alter))
  span<- sprintf("Die Spannweite:%g",max(data$Alter)-min(data$Alter))
  v <- sprintf("Der Varianz: %g",var(data$Alter))
  s <- sprintf("Die Standardabweichung: %g",sd(data$Alter))
  return(list(ar,med,q1,q3,min,max,span,v,s))
}

#-----------------------------------------------------------------------------------------------------------

#b)
#Die Funktion katfnc berechnet die verschiedene geeignete deskriptive Statistiken
#fuer kategoriale Variablen  
#INPUT:
# data - Vector mit kategorialen Variablen
#OUTPUT:
# new data - Vector mit der Ergebnisse der Berechnungen von INPUT data

#Create function
katfnc <- function(data){
  erg <- list()
  erg$freq <- table(data)
  e <- unique(data)
  erg$mod <- e[which.max(tabulate(match(data,e)))]
  return(erg)
}

#-----------------------------------------------------------------------------------------------------------

#c)
#kategorische Variablen --
#nominalskala: "Studienfach"
#ordinalskala: "Interesse_an_Mathematik" und "Interesse_an_Programmieren"

# Die Funktion kat liefert den Korrelationskoeffizienten
# zwischen 2 Paaren von kategorialen Variablen aus unserem Datensatz.
# Sie verwendet auch eine Hilfsfunktion 'correlation', die 
# in Funktionen-R-Skript 2.R
# INPUT :
# Parameter df (Unser Datensatz)
# OUTPUT :
# Korrelationskoeffizient sowie das Signifikanzniveau für jedes Paar

#Funktion erstellen
kat <- function(data){ 
  # Erstellung von Variable damit die globale Variable nicht beeinflußt wird
  Studienfach <- data$Studienfach

  #Kodierung in Studienfach
  Studienfach[which(Studienfach == "Mathe")] <- 1
  Studienfach[which(Studienfach == "Statistik")] <- 2
  Studienfach[which(Studienfach == "Data Science")] <- 3
  Studienfach[which(Studienfach == "Informatik")] <- 4
  
  #Korrelation zwischen "Studienfach" und "Interesse_an_Mathematik"
  data$Interesse_an_Mathematik <- as.numeric(data$Interesse_an_Mathematik)
  data$Interesse_an_Programmieren <- as.numeric(data$Interesse_an_Programmieren)
  Studienfach <- as.numeric(Studienfach)

  corsim<-correlation(data$Interesse_an_Mathematik,Studienfach)

  #Korrelation zwischen "Studienfach" und "Interesse_an_Programmieren"
  corsip<-correlation(Studienfach, data$Interesse_an_Programmieren)
  
  
  #korrelation zwischen "Interesse_an_Mathematik" und "Interesse_an_Programmieren"
  corin<-correlation(data$Interesse_an_Mathematik,data$Interesse_an_Programmieren)
  
  return(c(corsim, corsip,corin))
}

kat(df)

#-----------------------------------------------------------------------------------------------------------

#d)
# Die Funktion mat gibt den Korrelationskoeffizienten
# zwischen einer metrischen und einer kategorialen Variable.
# Sie verwendet auch eine Hilfsfunktion 'correlation', die 
# in Funktionen-R-Skript 2.R
# INPUT :
# Parameter df (Unser Datensatz)
# OUTPUT :
# Korrelationskoeffizient sowie das Signifikanzniveau.

mat <- function(df){
  df$Mathe_LK <-ifelse(df$Mathe_LK=="ja",1,0)

  #Korrelation zwsischen Mathe LK und "Interesse an Mathematik"
  cor_mathe <- correlation(df$Interesse_an_Mathematik,df$Mathe_LK)
    
  #Korrelation zwsischen Mathe LK und "Interesse an Programmieren"
  cor_prog <- correlation(df$Interesse_an_Programmieren,df$Mathe_LK) 

  return(list(cor_mathe, cor_prog))
}

#Add the variable to the function
mat(df) 

#-----------------------------------------------------------------------------------------------------------

#e)
# Function quantilbasierte_kategorisierung Kategorisiert Variable
# nach "niedrig", "mittel", "hoch", wo
# - "niedrig" - 1, 2
# - "mittel" - 3, 4, 5
# - "hoch" - 6, 7
# INPUT: 
#   data - Vector mit Merkmalauspraegungen in [1, 7]
# OUTPUT:
#   new_data - Vector mit Merkmalauspraegungen in ["niedrig", "mittel", "hoch"]

quantilbasierte_kategorisierung <- function(data) {
  new_data = rep("", length(data))
  new_data[which(data == 1)] = "niedrig"
  new_data[which(data == 2)] = "niedrig"
  new_data[which(data == 3)] = "mittel"
  new_data[which(data == 4)] = "mittel"
  new_data[which(data == 5)] = "mittel"
  new_data[which(data == 6)] = "hoch"
  new_data[which(data == 7)] = "hoch"
  return(new_data)
}

#-----------------------------------------------------------------------------------------------------------

#f)
# Die Funktion visualisierungKatVar erstellt ein Mosaikdiagramm 
# für 3 kategoriale Variablen, die aus unserem Datensatz ausgewählt wurden.
# Einmal bezüglich des Interesses an Programmieren und einmal 
# bezüglich des Interesses an der Mathematik
# INPUT :
#   Parameter data (Unser Datensatz)
# OUTPUT :
#   Mosaikplot für die 3 ausgewählten kategorischen Variablen
#   d.h. Studienfach, Interesse_an_Mathematik, Mathe_LK

visualisierungKatVar <- function(data){
  
  # 3 kategorische Variablen auswählen
  threeVar <- table(data$Studienfach, data$Interesse_an_Mathematik, data$Mathe_LK)
  # Mosaikplot erstellen (bzgl Interesse an Mathe)
  mosaicplot(threeVar, main = "Studienfach, Interesse an Mathe und Mathe Lk Mosaic Plot",
           ylab = "Interesse an Mathe (7 = sehr hohes Interesse)",
           xlab = "Mathe LK(Ja/Nein)",
           col = c("blue","red"))
  
  # 3 kategorische Variablen auswählen
  threeVar <- table(data$Studienfach, data$Interesse_an_Programmieren, data$Mathe_LK)
  # Mosaikplot erstellen (bzgl Interesse an Programmieren)
  mosaicplot(threeVar, main = "Studienfach, Interesse an Prog und Mathe Lk Mosaic Plot",
           ylab = "Interesse an Prog (7 = sehr hohes Interesse)",
           xlab = "Mathe LK(Ja/Nein)",
           col = c("blue","red"))
  
  
 }

visualisierungKatVar(df)



