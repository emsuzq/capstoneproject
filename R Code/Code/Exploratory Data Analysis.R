## What are the parents education history? How many received higher education (university/college)?

barplot(table(cclass$Medu), names.arg = c("none", "primary", "middle", "secondary", "higher"), xlab = "Mothers Education", main = "Mother's with Education")
barplot(table(cclass$Fedu), names.arg = c("none", "primary", "middle", "secondary", "higher"), xlab = "Father Education",  main = "Fathers with Education")

#Analysis: Majority of the mothers received either middle education or higher. Whereas the Fathers education seem to be high in all educational classes.

##Find the outliers in Math class in relation to Parent's Education and Final grades

ggplot(cclass, aes(x=Medu, y=G3.x, group=Medu))+geom_boxplot()+geom_jitter()+ xlab("Mothers Eduation")+ylab("Math Final Grades")+ggtitle("Mothers Education vs Math Student Performance")
ggplot(cclass, aes(x=Fedu, y=G3.x, group=Fedu))+geom_boxplot()+geom_jitter()+ xlab("Fathers Eduation")+ylab("Math Final Grades")+ggtitle("Fathers Education vs Math Student Performance")

#Analysis: As we can see in both plots, we have very distinct outliers in this dataset that will be removed in order to receive optimal results.

##Find the outliers in Portugese classin relation to Parent's Education and Final grades

ggplot(cclass, aes(x=Medu, y=G3.y, group=Medu))+geom_boxplot()+geom_jitter()+ xlab("Mothers Eduation")+ylab("Portugese Final Grades")+ggtitle("Mothers Education vs Portugese Student Performance")
ggplot(cclass, aes(x=Fedu, y=G3.y, group=Fedu))+geom_boxplot()+geom_jitter()+ xlab("Fathers Eduation")+ylab("Portugese Final Grades")+ggtitle("Fathers Education vs Portugese Student Performance")

#Analysis: Similarly to the math class results, very distinct outliers that will be removed to optimize results in analysis.

##Mother education status support students' school in Math class?

cclass %>% group_by(Medu,famsup.x) %>% summarise(n=n()) %>%
  ddply("Medu",transform,percent=n/sum(n)*100) %>%
  ggplot(aes(x=Medu,y=percent,fill=famsup.x))+
  geom_bar(stat="identity")+ggtitle("Family Support(%) and education level of the mother")

#Analysis: It is evident that the family support increases based on the higher education the mother receives and in return the lower the mothers educational background the lower the family support.

##Father education status support students' school in Math class?

cclass %>% group_by(Fedu,famsup.x) %>% summarise(n=n()) %>%
  ddply("Fedu",transform,percent=n/sum(n)*100) %>%
  ggplot(aes(x=Fedu,y=percent,fill=famsup.x))+
  geom_bar(stat="identity")+ggtitle("Family Support(%) and education level of the father")

#Analysis: It seems that the family support and fathers' education seem to be fairly even with the exception of the father receiver the highest education showing more family support to the students pursuit in school. 

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

#Analysis on Parents education status in relation to students educational goals: No matter what class room they are in math or portuegese the family support is the same in both classes where the mother is more likely to support the student if they have a high educational background whereas the father from low to mid educational level are about 50% to provide educational support.

## Student commitment to studying related to amount of failures?

ggplot(cclass, aes(x=studytime.x, fill=failures.x)) +
  geom_histogram(position="identity", alpha=0.4,binwidth=1.0)

ggplot(cclass, aes(x=studytime.y, fill=failures.y)) +
  geom_histogram(position="identity", alpha=0.4,binwidth=1.0)

#Analysis:In both classes, the trends are the same where the less you study the higher the failure rate. 

##Applying simple linear regression

mathlm <- lm(G3~., data = mathclass)
summary(mathlm)

#Analysis: Through a simple linear regression model, we are able to see that the age, family relationship, absences, G1 grades and G2 grades are significant to the final grades G3.

##High correlation between each attribute will be removed for math class

mathcorrelationMatrix <- cor(mathclass[,1:32])
mathhighlycorrelated <- findCorrelation(mathcorrelationMatrix, cutoff=0.5)
print(mathhighlycorrelated)

#Analysis: The correlation matrix has demonstrated that Mothers education, Weekend Alcohol consumption, G2 are highly correlated with other attributes in the dataset. Therefore, I've eliminated these attributes from further analysis. Cut off is set to another over 75% correlated.

#Overall results from Explanatory Analysis: I've found through explanatory analysis, both math and portuegese classes show similar or the same trend. Therefore, I've decided to move forward with only analyzing the students enrolled into the math class to narrow my focus on one dataset.