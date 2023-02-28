# Skript 3
# In diesem Skript werden die Daten aus dem Skript 1
# mithilfe von allen Functionen in Skript 2 visualisiert

library(ggplot2)
source("Funktionen-R-Skript 1.R")

# speichern alle Grafiken in pdf
pdf("Grafiken.pdf")

# Visualisierung fuer Alter
boxplot(df$Alter,
     main = "Boxplot fuer Alter",
     xlab = "Alter",
     ylab = "Frequenz")

#Für 1/4Q 3/4Q solche Werte, ist Boxplot eine gute Plot zu Zeigen.
# Visualisierung fuer frequencen von Interesse an Mathe und Programmierung

stat_math <- katfnc(df$Interesse_an_Mathematik)
stat_prog <- katfnc(df$Interesse_an_Programmieren)

barplot(stat_math$freq, 
        xlab = "Interesse",
        ylab = "Frequenz",
        main = "Frequenz fuer Interresse an Mathematik")

barplot(stat_prog$freq, 
        xlab = "Interesse",
        ylab = "Frequenz",
        main = "Frequenz fuer Interresse an Programmieren")
#Für Frequenzen ist barplot ein schöne Wahl.
# Vergleich von Modalwerten

barplot(c(stat_math$mod, stat_prog$mod), main="Modalwerte",
        ylab="Modalwert", xlab="Variablen",
        names = c("Interesse an Mathe",
                 "Interesse an Programmierung"))
#Zum Vergleich zwischen beiden Werten ist auch barplot gut zu zeigen.
# Visualisierung von Korrelationskoeefizienten von
# paaren von kategorialen Variablen

correlation_kat_variablen <- kat(df)
korrelation_met_kat <- mat(df)

correlation_kat_daten <- unlist(c(correlation_kat_variablen[1],
                            correlation_kat_variablen[3],
                            correlation_kat_variablen[5],
                            korrelation_met_kat[1]))

barplot(correlation_kat_daten, main="Korrelation zwischen Variablen",
        names=c("Mathe & Stud.",
        "Prog. & Stud.",
        "Prog. & Mathe",
        "Alter & Math_LK"),
        ylab="Hoehe von Korrelation", xlab="Variablen")

# Visualisierung von quntibasierte Kategorisierung von
# Interesse an Mathematik und Interesse an Programmierung

quant.Mathe.Ineresse <- quantilbasierte_kategorisierung(df$Interesse_an_Mathematik)
quant.Prog.Ineresse <- quantilbasierte_kategorisierung(df$Interesse_an_Programmieren)

barplot(table(quant.Mathe.Ineresse),
        main = "Anzahl der Menschen nach Interesse an Mathematik",
        xlab="die Höhe von Interesse", ylab="Anzahl von Menschen")
barplot(table(quant.Prog.Ineresse), 
        main = "Anzahl der Menschen nach Interesse an Programmierung",
        xlab="die Höhe von Interesse", ylab="Anzahl von Menschen")

# Mosaikdiagramm für 3 kategoriale Variablen

visualisierungKatVar(df)

dev.off()
