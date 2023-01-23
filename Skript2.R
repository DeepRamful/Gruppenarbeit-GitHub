#Skript 2
#Funktionen

df <- read.csv("https://raw.githubusercontent.com/DeepRamful/Gruppenarbeit-GitHub/main/Data.csv")
#a)





#b)




#c)





#d)





#e)





#f)
# Choose 3 categorical Variables
threeVar <- table(df$Studienfach, df$Interesse_an_Mathematik, df$Mathe_LK)

# Create the Mosaic Plot
mosaicplot(threeVar, main = "Studienfach, Interesse an Mathe und Mathe-Lk Mosaic Plot",
           ylab = "Interesse an Mathe (7 = sehr hohes Interesse)",
           xlab = "Mathe LK(Ja/Nein)",
           col = c("blue","red"))



