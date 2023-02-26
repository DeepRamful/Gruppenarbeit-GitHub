# Skript 3
# In diesem Skript werden die Daten aus dem Skript 1
# mithilfe von allen Functionen in Skript 2 visualisiert

source("Funkionen-R-Skript 2.R")

# speichern alle Grafiken in pdf
pdf("Grafiken.pdf")

# Visualisierung fuer Punkt a


# Visualisierung fuer Punkt b

#___________________________________________________________________________________________________________________
# Visualisierung fuer Punkt c
#
#library(ggplot2)
#quantity2 <- 100
#ggplot(df, aes(fill=Interesse_an_Mathematik, y=quantity2, x=Studienfach)) + 
  #geom_bar(position="stack", stat="identity")

#ggplot(df, aes(fill=Interesse_an_Programmieren, y=quantity2, x=Studienfach)) + 
  #geom_bar(position="stack", stat="identity")
#___________________________________________________________________________________________________________________

# Visualisierung fuer Punkt d

#library(ggplot2)
#quantity1 <- 100

#ggplot(df, aes(fill=Mathe_LK, y=quantity1, x=Interesse_an_Mathematik)) + 
  #geom_bar(position="stack", stat="identity")

#ggplot(df, aes(fill=Mathe_LK, y=quantity1, x=Interesse_an_Programmieren)) + 
  #geom_bar(position="stack", stat="identity")
#___________________________________________________________________________________________________________________
# Visualisierung fuer Punkt e

barplot(table(quant.Mathe.Ineresse))
barplot(table(quant.Prog.Ineresse))
#___________________________________________________________________________________________________________________
# Visualisierung fuer Punkt f


dev.off()
#___________________________________________________________________________________________________________________
