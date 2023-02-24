getwd()
setwd(getwd())
data = read.csv("data.csv",header = TRUE, fileEncoding = "latin1")
data

data$Alter <- as.numeric(data$Alter)
data$Interesse_an_Programmieren <- as.numeric(data$Interesse_an_Programmieren)
data$Interesse_an_Mathematik<- as.numeric(data$Interesse_an_Mathematik)
data$ID<- as.numeric(data$ID)

cov(data$Alter, data$Interesse_an_Programmieren)
cor(data$Alter, data$Interesse_an_Programmieren)
cor.test(data$Alter, data$Interesse_an_Programmieren)

cov(data$Alter, data$Interesse_an_Mathematik)
cor(data$Alter, data$Interesse_an_Mathematik)
cor.test(data$Alter, data$Interesse_an_Mathematik)

cov(data$Alter, data$ID)
cor(data$Alter, data$ID)
cor.test(data$Alter, data$ID)
