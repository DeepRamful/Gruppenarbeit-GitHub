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





#f)
# Choose 3 categorical Variables
threeVar <- table(df$Studienfach, df$Interesse_an_Mathematik, df$Mathe_LK)

# Create the Mosaic Plot
mosaicplot(threeVar, main = "Studienfach, Interesse an Mathe und Mathe-Lk Mosaic Plot",
           ylab = "Interesse an Mathe (7 = sehr hohes Interesse)",
           xlab = "Mathe LK(Ja/Nein)",
           col = c("blue","red"))



