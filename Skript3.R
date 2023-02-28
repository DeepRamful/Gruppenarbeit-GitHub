# Skript 3
# In diesem Skript werden die Daten aus dem Skript 1
# mithilfe von allen Functionen in Skript 2 visualisiert

source("Funktionen-R-Skript 1.R")

# speichern alle Grafiken in pdf
pdf("Grafiken.pdf")

# Visualisierung fuer Punkt a
hist(Data$Alter,
     main = "Histogramm fuer Alter",
     xlab = "Alter",
     ylab = "Frequenz")
barplot(Data$Alter, main = "Boxplot fuer Alter")
# Visualisierung fuer Punkt b
barplot(table(Data$İnteresse_an_Mathematik), 
        xlab = "Interesse",
        ylab = "Frequenz",
        main = "Frequenz fuer Interresse an Mathematik")

barplot(table(Data$İnteresse_an_Programmieren), 
        xlab = "Interesse",
        ylab = "Frequenz",
        main = "Frequenz fuer Interresse an Programmieren")

# Visualisierung fuer Punkt c
#
#library(ggplot2)
#quantity2 <- 100
#ggplot(df, aes(fill=Interesse_an_Mathematik, y=quantity2, x=Studienfach)) + 
  #geom_bar(position="stack", stat="identity")

#ggplot(df, aes(fill=Interesse_an_Programmieren, y=quantity2, x=Studienfach)) + 
  #geom_bar(position="stack", stat="identity")

# Visualisierung fuer Punkt d

#library(ggplot2)
#quantity1 <- 100

#ggplot(df, aes(fill=Mathe_LK, y=quantity1, x=Interesse_an_Mathematik)) + 
  #geom_bar(position="stack", stat="identity")

#ggplot(df, aes(fill=Mathe_LK, y=quantity1, x=Interesse_an_Programmieren)) + 
  #geom_bar(position="stack", stat="identity")

# Visualisierung fuer Punkt e

quant.Mathe.Ineresse <- quantilbasierte_kategorisierung(df$Interesse_an_Mathematik)
quant.Prog.Ineresse <- quantilbasierte_kategorisierung(df$Interesse_an_Programmieren)

barplot(table(quant.Mathe.Ineresse),
        main = "Anzahl der Menschen nach Interesse an Mathematik",
        xlab="die Höhe von Interesse", ylab="Anzahl von Menschen")
barplot(table(quant.Prog.Ineresse), 
        main = "Anzahl der Menschen nach Interesse an Programmierung",
        xlab="die Höhe von Interesse", ylab="Anzahl von Menschen")

# Visualisierung fuer Punkt f

visualisierungKatVar(df)

dev.off()
