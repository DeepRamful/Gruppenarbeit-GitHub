# Helferfunktion für Funktion (c) und (d) in Funktionen-R-Skript 1.
# Function correlation berechnet die Korrelation zwischen daten1 und daten2
# und ergibt die und correlation Test
correlation <- function(daten1, daten2) {
  cor <- cor(daten1, daten2)
  cor_test <- cor.test(daten1, daten2)
  return(c(cor, cor_test))
}
