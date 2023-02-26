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

#b)
#Create function
katfnc <- function(data){
  variable = list(data$Interesse_an_Programmieren,data$Interesse_an_Mathematik)
  for (i in variable){
    med <- sprintf("Der Median: %g",median(i))
    q1 <- sprintf("Das 0,25-Quantile: %1.0f",quantile(i,probs = 0.25))
    q3 <- sprintf("Das 0,75-Quantile: %1.0f",quantile(i,probs = 0.75))
    v <- sprintf("Der Varianz: %g",var(i))
    s <- sprintf("Die Standardabweichung: %g",sd(i))
    e <- unique(i)
    mod <- sprintf("der Modalwert: %g",e[which.max(tabulate(match(i,e)))])
    print(list(med,q1,q3,v,s,mod))
  }
}

#Die Funktion katfnc berechnet die verschiedene geeignete deskriptive Statistiken
#für kategoriale Variablen  
#INPUT:
# data - Vector mit kategorialen Variablen
#OUTPUT:
# new data - Vector mit der Ergebnisse der Berechnungen von INPUT data


#c)





#d)
df$Mathe_LK<-ifelse(df$Mathe_LK=="ja",1,0)

cor(df$Interesse_an_Programmieren,df$Mathe_LK)
cor.test(df$Interesse_an_Mathematik,df$Mathe_LK)


library(ggplot2)

quantity1 <- sum(df$Mathe_LK)


cor(df$Interesse_an_Mathematik,df$Mathe_LK)
cor.test(df$Interesse_an_Programmieren,df$Mathe_LK)



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


#f)
visualisierungKatVar <- function(data){
  # Choose 3 categorical Variables
  threeVar <- table(data$Studienfach, data$Interesse_an_Mathematik, data$Mathe_LK)
  # Create the Mosaic Plot
  mosaicplot(threeVar, main = "Studienfach, Interesse und Mathe and Mathe Lk Mosaic Plot",
           ylab = "Interesse an Mathe (7 = sehr hohes Interesse)",
           xlab = "Mathe LK(Ja/Nein)",
           col = c("blue","red"))
}



