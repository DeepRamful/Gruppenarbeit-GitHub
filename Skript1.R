#Skript 1
ID <- sample(120000:220000,size= 100,replace = FALSE,prob=NULL)
#1)
Alter <- round(rnorm(100, 25, 2))


#2)
Studienfach <- sample(c("Statistik","Data Science","Mathe","Informatik"),size=100,
                      replace=TRUE, prob=c(0.35,0.35,0.1,0.2))




#3)
values <- 1:7
Interesse_an_Mathematik <- sample(values, size = 100, replace = TRUE)



#4)
values <- 1:7
Interesse_an_Programmieren <- sample(values, size = 100, replace = TRUE)




#5)
values <- c("ja", "nein") 
eachProb <- c(0.5,0.5) 
Mathe_LK <-  sample(values, size = 100, replace = TRUE, prob = eachProb)

Data <- data.frame(ID,Alter,Studienfach,Interesse_an_Mathematik,Interesse_an_Programmieren,Mathe_LK)
write.csv(Data,"C:\\Users\\Quang Huy\\Desktop\\3.Semester\\W.Arbeit\\GitHub\\Gruppenarbeit-GitHub\\Data.csv",row.names=FALSE)

