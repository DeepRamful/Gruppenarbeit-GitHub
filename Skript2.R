#Skript 2
#Funktionen

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




