# Skript 3
# In diesem Skript werden die Daten aus dem Skript 1
# mithilfe von allen Functionen in Skript 2 visualisiert

source("Skript2.R")

# speichern alle Grafiken in pdf
pdf("Grafiken.pdf")

# Visualisierung fuer Punkt a


# Visualisierung fuer Punkt b


# Visualisierung fuer Punkt c


# Visualisierung fuer Punkt d

library(ggplot2)
quantity1 <- sum(df$Mathe_LK)

ggplot(df, aes(fill=Mathe_LK, y=quantity1, x=Interesse_an_Mathematik)) + 
  geom_bar(position="stack", stat="identity")

ggplot(df, aes(fill=Mathe_LK, y=quantity1, x=Interesse_an_Programmieren)) + 
  geom_bar(position="stack", stat="identity")
# Visualisierung fuer Punkt e

barplot(table(quant.Mathe.Ineresse))
barplot(table(quant.Prog.Ineresse))

# Visualisierung fuer Punkt f


dev.off()
