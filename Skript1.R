#Skript 1
#Assigning a unique ID number to each student
ID <- sample(120000:220000, size= 100, replace = FALSE,prob=NULL)

#1)
# Simulating the age(integer value) of 100 persons with Normal Distribution
Alter <- round(rnorm(100, 25, 2))


#2)
# Randomly selecting subjects for 100 persons and the subjects have different probabilities 
# of being chosen.
Studienfach <- sample(c("Statistik","Data Science","Mathe","Informatik"),size=100,
                      replace=TRUE, prob=c(0.35,0.35,0.1,0.2))



#3)
# Define the set of possible values for the variable "Interesse_an_Mathematik" 
values <- 1:7
# Randomly assign values from 1 to 7 to 100 students 
Interesse_an_Mathematik <- sample(values, size = 100, replace = TRUE)



#4)
# Define the set of possible values for the variable "Interesse_an_Programmieren" 
values <- 1:7
# Randomly assign values from 1 to 7 to 100 students
Interesse_an_Programmieren <- sample(values, size = 100, replace = TRUE)




#5)
# Define the set of possible values for the variable "Mathe-LK" 
values <- c("ja", "nein") 
# Assign probability for each value 
eachProb <- c(0.5,0.5) 
# Randomly assign "yes" or "no" to 100 students
Mathe_LK <-  sample(values, size = 100, replace = TRUE, prob = eachProb)


#Create a data frame to store all these variables
Data <- data.frame(ID,Alter,Studienfach,Interesse_an_Mathematik,Interesse_an_Programmieren,Mathe_LK)
#Save this data frame as a csv file
write.csv(Data,"C:\\Users\\Quang Huy\\Desktop\\3.Semester\\W.Arbeit\\GitHub\\Gruppenarbeit-GitHub\\Data.csv",row.names=FALSE)

