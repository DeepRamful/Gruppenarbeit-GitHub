#Skript 2
#Funktionen

df <- read.csv("https://raw.githubusercontent.com/DeepRamful/Gruppenarbeit-GitHub/main/Data.csv")
#a)
#Create the function
metfnc <- function(a,b){
  ar <- mean(a)
  g <- prod(a)^(1/b)
  min <- min(a)
  max <- max(a)
  v <- var(a)
  s <- sd(a)
  return(list(ar,g,min,max,v,s))
}
  
#Add the variable to the function
metfnc(df$Alter,length(df$Alter))  
  

#b)
#Create function
katfnc <- function(x){
  med <- median(x)
  q1 <- quantile(x,probs = 0.25)
  q3 <- quantile(x,probs = 0.75)
  v <- var(x)
  s <- sd(x)
  e <- unique(x)
  mod <- e[which.max(tabulate(match(x,e)))]
  return(list(med,q1,q3,v,s,mod))
}

#Add the variable to the function
katfnc(df$Interesse_an_Programmieren)


#c)





#d)





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
# Choose 3 categorical Variables
threeVar <- table(df$Studienfach, df$Interesse_an_Mathematik, df$Mathe_LK)

# Create the Mosaic Plot
mosaicplot(threeVar, main = "Studienfach, Interesse an Mathe und Mathe-Lk Mosaic Plot",
           ylab = "Interesse an Mathe (7 = sehr hohes Interesse)",
           xlab = "Mathe LK(Ja/Nein)",
           col = c("blue","red"))



