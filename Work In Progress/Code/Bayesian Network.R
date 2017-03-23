##Prep data for Bayesian Network creation

cclass$g3.xcat<-cut(cclass$G3.x, c(0,5,10,15,20,25), include.lowest=TRUE, labels=c(1:5))
cclass$agecat<-cut(cclass$age, c(14,16,18, 20, 22, 24), labels=c(1:5))
cclass$abs.xcat<-cut(cclass$absences.x, c(0,25,50,75,100),include.lowest=TRUE,labels=c(1:4))
factoredcclass <- data.frame(lapply(cclass[c(2,5, 8:11, 13:17, 19, 23:27, 29,54,55,56)], as.factor))

##Creation of a Bayesian Network based on the important attributes found from the Feature Selection analysis

dag <- empty.graph(nodes = c(r1))
learning_dag <- gs(cclass[,c(2,3,5, 8:11, 13:17, 19, 23:27, 29:30,33)])
learning_dag_hc <- hc(factoredcclass, score = "aic")
bn.mle <- bn.fit(dag, data = cclass[,c(1:6, 8:27, 29:30)], method = "mle")