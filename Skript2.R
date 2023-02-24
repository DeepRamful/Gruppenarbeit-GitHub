#Skript 2
#Funktionen

#a)
#Create the function
metfnc <- function(data){
  ar <- mean(data$Alter)
  g <- prod(data$Alter)^(1/length(data$Alter))
  min <- min(data$Alter)
  max <- max(data$Alter)
  v <- var(data$Alter)
  s <- sd(data$Alter)
  return(list(ar,g,min,max,v,s))
}
  


#b)
#Create function
katfnc <- function(data){
  med <- median(data$Interesse_an_Programmieren)
  q1 <- quantile(data$Interesse_an_Programmieren,probs = 0.25)
  q3 <- quantile(data$Interesse_an_Programmieren,probs = 0.75)
  v <- var(data$Interesse_an_Programmieren)
  s <- sd(data$Interesse_an_Programmieren)
  e <- unique(data$Interesse_an_Programmieren)
  mod <- e[which.max(tabulate(match(data$Interesse_an_Programmieren,e)))]
  return(list(med,q1,q3,v,s,mod))
}


#c)





#d)





#e)





#f)




