# Skript 3
# In diesem Skript werden die Daten aus dem Skript 1
# mithilfe von allen Functionen in Skript 2 visualisiert

library(ggplot2)
source("Funktionen-R-Skript 1.R")

# speichern alle Grafiken in pdf
pdf("Grafiken.pdf")

# Visualisierung fuer Punkt a
boxplot(df$Alter,
     main = "Boxplot fuer Alter",
     xlab = "Alter",
     ylab = "Frequenz")

# Visualisierung fuer Punkt b
stat_math <- katfnc(df$Interesse_an_Mathematik)
stat_prog <- katfnc(df$Interesse_an_Programmieren)

# Frequencen von Interesse an Mathe und Programmierung

barplot(stat_math$freq, 
        xlab = "Interesse",
        ylab = "Frequenz",
        main = "Frequenz fuer Interresse an Mathematik")

barplot(stat_prog$freq, 
        xlab = "Interesse",
        ylab = "Frequenz",
        main = "Frequenz fuer Interresse an Programmieren")

# Vergleich von Modalwerten

daten_vorbereitung <- table(c(stat_math$mod, stat_prog$mod))
#                            "Modalwert von Interesse an Mathe",
#                            "Modalwert von Interesse an Programmierung"))

barplot(c(stat_math$mod, stat_prog$mod), main="Modalwerte",
        ylab="Modalwert", xlab="Variablen",
        names = c("Interesse an Mathe",
                 "Interesse an Programmierung"))

# Visualisierung fuer Punkt c


quantity2 <- 100
ggplot(df, aes(fill=Interesse_an_Mathematik, y=quantity2, x=Studienfach)) + 
  geom_bar(position="stack", stat="identity")

ggplot(df, aes(fill=Interesse_an_Programmieren, y=quantity2, x=Studienfach)) + 
  geom_bar(position="stack", stat="identity")

correlation_kat_variablen <- kat(df)

correlation_kat_daten <- unlist(c(correlation_kat_variablen[1],
                            correlation_kat_variablen[3],
                            correlation_kat_variablen[5]))

print(correlation_kat_daten)

barplot(correlation_kat_daten, main="Korrelation zwischen Variablen",
        names=c("Mathe & Studienfach",
        "Prog. & Studienfach",
        "Prog. & Mathe"),
        ylab="Hoehe von Korrelation", xlab="Variablen")

# Visualisierung fuer Punkt d

quantity1 <- 100

ggplot(df, aes(fill=Mathe_LK, y=quantity1, x=Interesse_an_Mathematik)) + 
  geom_bar(position="stack", stat="identity")

ggplot(df, aes(fill=Mathe_LK, y=quantity1, x=Interesse_an_Programmieren)) + 
  geom_bar(position="stack", stat="identity")

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
