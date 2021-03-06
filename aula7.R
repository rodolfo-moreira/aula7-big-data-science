#AUla 7


install.packages("party")
library(party)
install.packages("e1071")
library(e1071)
install.packages("randomForest")
library(randomForest)





#Regress�o Log�stica

t <- read.csv("train.csv")

#Tratamento dos dados
#Preenche as idades on os campos s�o nulos com a m�dia
t[is.na(t$Age),]$Age<-mean(t[!is.na(t$Age),]$Age)

set.seed(33)
va<-sample(891)
treino <- t[va[1:600],]
teste <- t[va[601:891],]
mod<-glm(Survived~Sex+Pclass+Age, data=treino, family=binomial())
pred <- predict(mod, newdata=teste)
pred<-ifelse(pred<.5,0,1)
cbind(pred, teste$Survived)
table(pred,teste$Survived )


#Random Forest

t <- read.csv("train.csv")

#Tratamento dos dados
#Preenche as idades on os campos s�o nulos com a m�dia
t[is.na(t$Age),]$Age<-mean(t[!is.na(t$Age),]$Age)
t$Survived_f<-as.factor(t$Survived)

set.seed(33)
va<-sample(891)
treino <- t[va[1:600],]
teste <- t[va[601:891],]
mod<-randomForest(Survived_f~Sex+Pclass+Age, data=treino)
pred <- predict(mod, newdata=teste)
#pred<-ifelse(pred<.5,0,1)
cbind(pred, teste$Survived)
table(pred,teste$Survived )



#SVM
library(e1071)
t <- read.csv("train.csv")

#Tratamento dos dados
#Preenche as idades on os campos s�o nulos com a m�dia
t[is.na(t$Age),]$Age<-mean(t[!is.na(t$Age),]$Age)
t$Survived_f<-as.factor(t$Survived)

set.seed(33)
va<-sample(891)
treino <- t[va[1:600],]
teste <- t[va[601:891],]
mod<-svm(Survived_f~Sex+Pclass+Age, data=treino)
pred <- predict(mod, newdata=teste)
#pred<-ifelse(pred<.5,0,1)
cbind(pred, teste$Survived)
table(pred,teste$Survived )




































