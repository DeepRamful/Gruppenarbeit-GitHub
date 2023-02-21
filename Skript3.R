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


# Visualisierung fuer Punkt e

barplot(table(quant.Mathe.Ineresse))
barplot(table(quant.Prog.Ineresse))

# Visualisierung fuer Punkt f


dev.off()
