install.packages("ggplot2")
install.packages("glmulti")
install.packages("randomForest")
install.packages("plyr")
install.packages("dplyr")
install.packages("caret")

library(ggplot2)
library(glmulti)
library(plyr)
library(dplyr)
library(caret)
library(mlbench)
library(randomForest)
library(bnlearn)
library(pcalg)

##Installing source for plotting graphics (will be used for Bayesian Network)
source("https://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")
library(bnlearn)
library(Rgraphviz)