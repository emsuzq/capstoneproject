## How many of the students' mothers and fathers attended schooling. With cclass dataset

barplot(table(cclass$Medu), names.arg = c("none", "primary", "middle", "secondary", "higher"),
        xlab = "Mothers Education",
        main = "Mother's with Education")

barplot(table(cclass$Fedu), names.arg = c("none", "primary", "middle", "secondary", "higher"),
        xlab = "Father Education",
        main = "Fathers with Education")

##Find the outliers in Math class

ggplot(cclass, aes(x=Medu, y=G3.x, group=Medu))+geom_boxplot()+geom_jitter()+ xlab("Mothers Eduation")+ylab("Math Final Grades")+ggtitle("Mothers Education vs Math Student Performance")

ggplot(cclass, aes(x=Fedu, y=G3.x, group=Fedu))+geom_boxplot()+geom_jitter()+ xlab("Fathers Eduation")+ylab("Math Final Grades")+ggtitle("Fathers Education vs Math Student Performance")

##Find the outliers in Portugese class

ggplot(cclass, aes(x=Medu, y=G3.y, group=Medu))+geom_boxplot()+geom_jitter()+ xlab("Mothers Eduation")+ylab("Portugese Final Grades")+ggtitle("Mothers Education vs Portugese Student Performance")

ggplot(cclass, aes(x=Fedu, y=G3.y, group=Fedu))+geom_boxplot()+geom_jitter()+ xlab("Fathers Eduation")+ylab("Portugese Final Grades")+ggtitle("Fathers Education vs Portugese Student Performance")

##Mother education status support students' school in Math class?

cclass %>% group_by(Medu,famsup.x) %>% summarise(n=n()) %>%
  ddply("Medu",transform,percent=n/sum(n)*100) %>%
  ggplot(aes(x=Medu,y=percent,fill=famsup.x))+
  geom_bar(stat="identity")+ggtitle("Family Support(%) and education level of the mother")


##Father education status support students' school in Math class?

cclass %>% group_by(Fedu,famsup.x) %>% summarise(n=n()) %>%
  ddply("Fedu",transform,percent=n/sum(n)*100) %>%
  ggplot(aes(x=Fedu,y=percent,fill=famsup.x))+
  geom_bar(stat="identity")+ggtitle("Family Support(%) and education level of the father")

##Mother education status support students' school in Portugese class?

cclass %>% group_by(Medu,famsup.y) %>% summarise(n=n()) %>%
  ddply("Medu",transform,percent=n/sum(n)*100) %>%
  ggplot(aes(x=Medu,y=percent,fill=famsup.y))+
  geom_bar(stat="identity")+ggtitle("Family Support(%) and education level of the mother")


##Father education status support students' school in portugese class?

cclass %>% group_by(Fedu,famsup.y) %>% summarise(n=n()) %>%
  ddply("Fedu",transform,percent=n/sum(n)*100) %>%
  ggplot(aes(x=Fedu,y=percent,fill=famsup.y))+
  geom_bar(stat="identity")+ggtitle("Family Support(%) and education level of the father")

## student commitment to studying related to amount of failures?
  
ggplot(cclass, aes(x=studytime.x, fill=failures.x)) +
  geom_histogram(position="identity", alpha=0.4,binwidth=1.0)

ggplot(cclass, aes(x=studytime.y, fill=failures.y)) +
  geom_histogram(position="identity", alpha=0.4,binwidth=1.0)
