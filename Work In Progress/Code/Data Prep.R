## Import student datasets who are enrolled in Portugese and Math Class. Based on the two dataset I found students that were enrolled both classes and will only use these students to conduct analysis.

mathclass=read.csv(file="/Users/suzannechung/Desktop/student-mat.csv",sep=";",header=TRUE)
portclass=read.csv(file="/Users/suzannechung/Desktop/student-por.csv",sep=";",header=TRUE)

cclass=merge(mathclass,portclass,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))


##Data Preparation 

cclass[1:53]<- lapply(cclass[1:53], as.numeric)
mathclass[1:33] <- lapply(mathclass[1:33], as.numeric)