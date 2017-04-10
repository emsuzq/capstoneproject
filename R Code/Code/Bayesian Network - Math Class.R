##Creation of a Bayesian Network for the Math Class 
##based on the important attributes found from the Feature Selection analysis

math_dag <- gs(mathclass[, c(r1,"G3")])
graphviz.plot(math_dag)

##Testing different Bayesian network methods
math_dag2 <- iamb(mathclass[, c(r1,"G3")])
graphviz.plot(math_dag2)

#Analysis: Based on the two results of the Bayesian Network, we can conclude that the attribute activities has no significant relationship with other attributes that we focused on. Given our prior analysis that we conducted in the Attribute ranking algorithm, the attribute activities was not listed in the top 20.

#Based on the Bayesian Network, we can see that the students final grades, G3, are affected by G1, and romantic. However, we see that using iamb method gives us G1, romantic and age.

##Casuality of Student final grades

suffStat <- list(C = cor(mathclass[, c(r1,"G3")]), n = nrow(mathclass[, c(r1,"G3")]))
skelpc.fit <- skeleton(suffStat, indepTest = gaussCItest, p = ncol(mathclass[, c(r1,"G3")]), alpha = 0.05)
pc.fit <- pc(suffStat, indepTest = gaussCItest, p = ncol(mathclass[, c(r1,"G3")]), alpha = 0.05)
plot(skelpc.fit, main = "Estimated Dag")
plot(pc.fit, main = "True Dag")

#Analysis: We are able to see that the two causes of the students final grading is romantic involvement and their first grading evaluation in the course.