#Skript 2
#Funktionen

df <- read.csv("https://raw.githubusercontent.com/DeepRamful/Gruppenarbeit-GitHub/main/Data.csv")
#a)
#Geometrisches Mittel berechnen:
#Create the function
gmittel <- function(a,b){
  x <- prod(a)^(1/b)
  return(x)
}

#Add the variable to the function
gmittel(df$Alter,length(df$Alter))

#b)
#Modus berechnen:
#Create function
modus <- function(x){
  y <- unique(x)
  z <- y[which.max(tabulate(match(x,y)))]
  return(z)
}

#Add the variable to the function
modus(df$Studienfach)


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



