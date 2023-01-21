#Skript 1
#1)
Alter <- rnorm(100, 25, 5)


#2)
Studienfach <- sample(c("Statistik","Data Science","Mathe","Informatik"),100,
                      replace=TRUE, prob=c(0.35,0.35,0.1,0.2))




#3)
values <- 1:7
Interesse_an_Mathematik <- sample(values, size = 100, replace = TRUE)



#4)
Datensatz$InteresseProgammierung <- sample(1:7,100,replace=TRUE,prob=NULL)
Datensatz$InteresseProgammierung[Datensatz$Studienfach=='Informatik']<-6:7
Datensatz$InteresseProgammierung[Datensatz$Studienfach=='Data Science']<-4:6
Datensatz$InteresseProgammierung[Datensatz$Studienfach=='Mathe']<-2:3
Datensatz$InteresseProgammierung[Datensatz$Studienfach=='Statistik']<-1:2





#5)
Datensatz$MatheLK<- sample(c("ja","nein"),100,replace=TRUE,prob=NULL)
Datensatz$MatheLK[Datensatz$InteresseMathematik <= 4]<-"nein"
Datensatz$MatheLK[Datensatz$InteresseMathematik >= 5]<-"ja"