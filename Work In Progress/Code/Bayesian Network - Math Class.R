##Prep data for Bayesian Network creation

##We will make attributes G3.x, age and absences.x be cut into quantiles, so the attributes
##are discrete and are able to be plotted into a Bayesian Network

```{r}
cclass$tG3.x<-cut(cclass$G3.x, c(0,10,15,20,25), include.lowest=TRUE, labels=c(1:4))
cclass$tage<-cut(cclass$age, c(14,16,18, 20, 22, 24), labels=c(1:5))
cclass$tabsences.x<-cut(cclass$absences.x, c(0,25,50,75,100),include.lowest=TRUE,labels=c(1:4))
factoredcclass <- data.frame(lapply(cclass[,c(2,3,5, 8:11, 13:17, 19, 23:27, 29:30,33)], as.factor))
```

##Creation of a Bayesian Network with students in the math class 
##based on the important attributes found from the Feature Selection analysis
```{r}
dag <- empty.graph(nodes = c(r1))
learning_dag <- gs(cclass[,c(2,3,5, 8:11, 13:17, 19, 23:27, 29:30,33)])
plot(learning_dag)
##Testing with discrete variables - Error - not a lot of arcs
learning_dag2 <- iamb(factoredcclass)
(learning_dag2)
learning_dag_hc <- hc(factoredcclass, score = "aic")
plot(learning_dag_hc)
##Parameter testing
bn.mle <- bn.fit(dag, data = cclass[,c(1:6, 8:27, 29:30)], method = "mle")
```
