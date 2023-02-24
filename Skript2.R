#Skript 2
#Funktionen

#a)
#Create the function
metfnc <- function(data){
  ar <- sprintf("Der Mittelwert ist: %g",mean(data$Alter))
  g <- sprintf("Das Geometrisches Mittel ist: %g",prod(data$Alter)^(1/length(data$Alter)))
  min <- sprintf("Der minimale Wert ist: %g",min(data$Alter))
  max <- sprintf("Der maximale Wert ist: %g",max(data$Alter))
  v <- sprintf("Der Varianz ist: %g",var(data$Alter))
  s <- sprintf("Die Standardabweichung: %g",sd(data$Alter))
  return(list(ar,g,min,max,v,s))
}

#Die Funktion metfnc berechnet die verschiedene geeignete deskriptive Statistiken
#für metrische Variablen  
#INPUT:
# data - Vector mit metrischen Variablen
#OUTPUT:
# new data - Vector mit der Ergebnisse der Berechnungen von INPUT data

#b)
#Create function
katfnc <- function(data){
  med <- sprintf("Der Median ist: %g",median(data$Interesse_an_Programmieren))
  q1 <- sprintf("Das 0,25-Quantile ist: %1.0f",quantile(data$Interesse_an_Programmieren,probs = 0.25))
  q3 <- sprintf("Das 0,75-Quantile ist: %1.0f",quantile(data$Interesse_an_Programmieren,probs = 0.75))
  v <- sprintf("Der Varianz ist: %g",var(data$Interesse_an_Programmieren))
  s <- sprintf("Die Standardabweichung: %g",sd(data$Interesse_an_Programmieren))
  e <- unique(data$Interesse_an_Programmieren)
  mod <- sprintf("der Modalwert ist: %g",e[which.max(tabulate(match(data$Interesse_an_Programmieren,e)))])
  return(list(med,q1,q3,v,s,mod))
}

#Die Funktion katfnc berechnet die verschiedene geeignete deskriptive Statistiken
#für kategoriale Variablen  
#INPUT:
# data - Vector mit kategorialen Variablen
#OUTPUT:
# new data - Vector mit der Ergebnisse der Berechnungen von INPUT data


#c)





#d)





#e)





#f)




