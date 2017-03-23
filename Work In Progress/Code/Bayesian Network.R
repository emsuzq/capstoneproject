##Prep data for Bayesian Network creation



##Creation of a Bayesian Network based on the important attributes found from the Feature Selection analysis

dag <- empty.graph(nodes = c(r1))
learning_dag <- gs(cclass[,c(2,3,5, 8:11, 13:17, 19, 23:27, 29:30,33)])
learning_dag_hc <- hc(cclass[,c(2,3,5, 8:11, 13:17, 19, 23:27, 29:30,33)], score = "aic")
bn.mle <- bn.fit(dag, data = cclass[,c(1:6, 8:27, 29:30)], method = "mle")
