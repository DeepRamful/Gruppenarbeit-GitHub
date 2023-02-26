#Skript 2
#Funktionen

df <- read.csv("https://raw.githubusercontent.com/DeepRamful/Gruppenarbeit-GitHub/main/Data.csv")

#a)
#Create the function
metfnc <- function(data){
  ar <- sprintf("Der Mittelwert: %g",mean(data$Alter))
  g <- sprintf("Das Geometrisches Mittel: %g",prod(data$Alter)^(1/length(data$Alter)))
  min <- sprintf("Der minimale Wert: %g",min(data$Alter))
  max <- sprintf("Der maximale Wert: %g",max(data$Alter))
  v <- sprintf("Der Varianz: %g",var(data$Alter))
  s <- sprintf("Die Standardabweichung: %g",sd(data$Alter))
  return(list(ar,g,min,max,v,s))
}

#Die Funktion metfnc berechnet die verschiedene geeignete deskriptive Statistiken
#für metrische Variablen  
#INPUT:
# data - Vector mit metrischen Variablen
#OUTPUT:
# new data - Vector mit der Ergebnisse der Berechnungen von INPUT data

#-----------------------------------------------------------------------------------------------------------

#b)
#Create function
katfnc <- function(data){
  med <- sprintf("Der Median: %g",median(data$Interesse_an_Programmieren))
  q1 <- sprintf("Das 0,25-Quantile: %1.0f",quantile(data$Interesse_an_Programmieren,probs = 0.25))
  q3 <- sprintf("Das 0,75-Quantile: %1.0f",quantile(data$Interesse_an_Programmieren,probs = 0.75))
  v <- sprintf("Der Varianz: %g",var(data$Interesse_an_Programmieren))
  s <- sprintf("Die Standardabweichung: %g",sd(data$Interesse_an_Programmieren))
  e <- unique(data$Interesse_an_Programmieren)
  mod <- sprintf("der Modalwert: %g",e[which.max(tabulate(match(data$Interesse_an_Programmieren,e)))])
  return(list(med,q1,q3,v,s,mod))
}

#Die Funktion katfnc berechnet die verschiedene geeignete deskriptive Statistiken
#für kategoriale Variablen  
#INPUT:
# data - Vector mit kategorialen Variablen
#OUTPUT:
# new data - Vector mit der Ergebnisse der Berechnungen von INPUT data

#-----------------------------------------------------------------------------------------------------------

#c)
#kategorische Variablen --
#nominalskala: "Studienfach"
#ordinalskala: "Interesse_an_Mathematik" und "Interesse_an_Programmieren"

#Funktion erstellen

kat <- function(data){ 
  #Kodierung in Studienfach
  df$Studienfach <- 

#Zusammenhang also Korrelation berechnen
 df
  #Korrelation zwischen "Studienfach" und "Interesse_an_Mathematik"
corsim1<-cor(df$Interesse_an_Mathematik,df$Studienfach)
corsim2<-cor.test(df$Interesse_an_Mathematik,df$Studienfach)
  
  #Korrelation zwischen "Studienfach" und "Interesse_an_Programmieren"
corsip1<-cor(df$Studienfach,df$Interesse_an_Programmieren)
corsip2<-cor.test(df$Studienfach,df$Interesse_an_Programmieren)
  
  
  #korrelation zwischen "Interesse_an_Mathematik" und "Interesse_an_Programmieren"
corin1<-cor(df$Interesse_an_Mathematik,df$Interesse_an_Programmieren)
corin2<-cor.test(df$Interesse_an_Mathematik,df$Interesse_an_Programmieren)
  
  return(list(corsim1,corsim2,corsip1,corsip2,corin1,corin2))
}
  
#Diese Variable in die Funktion hinzufügen
  kat(df$Studienfach)
 












#-----------------------------------------------------------------------------------------------------------

#d)
mat<- function(data){
 df$Mathe_LK<-ifelse(df$Mathe_LK=="ja",1,0)
df

#Korrelation zwsischen Mathe LK und "Interesse an Mathematik"
corma1<-cor(df$Interesse_an_Mathematik,df$Mathe_LK)
corma2<-cor.test(df$Interesse_an_Mathematik,df$Mathe_LK)
#Korrelation zwsischen Mathe LK und "Interesse an Programmieren"
corpro1<-cor(df$Interesse_an_Programmieren,df$Mathe_LK)
corpro2<-cor.test(df$Interesse_an_Programmieren,df$Mathe_LK)
return(list(corma1,corma2,corpro1,corpro2))
}

#Add the variable to the function
mat(df$Mathe_LK) 

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

quant.Mathe.Ineresse <- quantilbasierte_kategorisierung(df$Interesse_an_Mathematik)
quant.Prog.Ineresse <- quantilbasierte_kategorisierung(df$Interesse_an_Programmieren)

#-----------------------------------------------------------------------------------------------------------

#f)
visualisierungKatVar <- function(data){
  # 3 kategorische Variablen auswählen
  threeVar <- table(data$Studienfach, data$Interesse_an_Mathematik, data$Mathe_LK)
  # Mosaikplot erstellen
  mosaicplot(threeVar, main = "Studienfach, Interesse und Mathe and Mathe Lk Mosaic Plot",
           ylab = "Interesse an Mathe (7 = sehr hohes Interesse)",
           xlab = "Mathe LK(Ja/Nein)",
           col = c("blue","red"))
}

visualisierungKatVar(df)
# Die Funktion visualisierungKatVar erstellt ein Mosaikdiagramm 
# für 3 kategoriale Variablen, die aus unserem Datensatz ausgewählt wurden.
# INPUT :
#   Parameter data (Unser Datensatz)
# OUTPUT :
#   Mosaikplot für die 3 ausgewählten kategorischen Variablen
#   d.h. Studienfach, Interesse_an_Mathematik, Mathe_LK


