##What attributes are important in this dataset by a rank

mathcontrol <- trainControl(method="repeatedcv", number=10, repeats=3)
mathmodelknn <- train(G3~., data=mathclass[,c(1:6, 8:27, 29:31, 33)], method="kknn", preProcess="scale", trControl=mathcontrol)
gbmIMPknn <- varImp(mathmodelknn, scale = FALSE)
print(gbmIMPknn)

#Analysis: One of the methods we used to to train and test is the KNN model, we are able to produce the top 20 attributes ranked by importance. However, what does other methods tell us? Same ranks or different?

mathcontrol <- trainControl(method="repeatedcv", number=10, repeats=3)
mathmodellm <- train(G3~., data=mathclass[,c(1:6, 8:27, 29:31, 33)], method="lm", preProcess="scale", trControl=mathcontrol)
gbmIMPlm <- varImp(mathmodellm, scale = FALSE)
print(gbmIMPlm)

#Analysis: Using kknn and lm methods show that the ranking of the attributes are the same.

##Feature Selection for Math Class

mathcontrol2 <- rfeControl(functions=rfFuncs, method="cv", number=10)
results <- rfe(mathclass[,c(1:6, 8:27, 29:31)], mathclass[,33], sizes=c(1:20), rfeControl = mathcontrol2)
r1 <-predictors(results)
print(r1)

#Analysis: Based on this Feature Selection method, we see that failures, absences, higher, schoolsup, goout, age, Mjob etc. are the attributes that are used in many combination models that perform with accuracy. Therefore these attributes will be used to create a Bayesian Network.