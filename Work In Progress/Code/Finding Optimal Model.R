##High correlation between each attribute will be removed

correlationMatrix <- cor(cclass[,1:33])
highlycorrelated <- findCorrelation(correlationMatrix, cutoff=0.5)
print(highlycorrelated)

##What attributes are important in this dataset by a rank

mathcontrol <- trainControl(method="repeatedcv", number=10, repeats=3)
mathmodel <- train(G3.x~., data=cclass[,c(1:6, 8:27, 29:30, 33)], method="gbm", preProcess="scale", trControl=mathcontrol)
gbmIMP <- varImp(mathmodel, scale = FALSE)
print(gbmIMP)

##Feature Selection for Math Class

mathcontrol2 <- rfeControl(functions=rfFuncs, method="cv", number=10)
results <- rfe(cclass[,c(1:6, 8:27, 29:30)], cclass[,33], sizes=c(1:20), rfeControl = mathcontrol2)
r1<-predictors(results)
