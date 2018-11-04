mental <- read.csv("mental-survey.csv")

library(plyr)
health <- rename(mental, c("What.is.your.age." = "age","What.is.your.gender." = "gender"))

female_levels = levels(health$gender)[grep('(fe).*|^f$|fm|woman|female', levels(health$gender), ignore.case = T, perl = T)]
male_levels   = levels(health$gender)[grep('^m$|\bmale| male|mail|male |^male| man|\bman|^man$|masculine|dude|^male$', levels(health$gender), ignore.case = T, perl = T)]
female_levels
male_levels
health$gender[health$gender %in% female_levels]<-"female"
health$gender[health$gender %in% male_levels] <- "male"
health$gender
summary(health$gender)

summary(mental$What.is.your.age.)#minimum is 3 and maximum is 323
#Cleaning the values in the age column
health$age[health$age >90]<-34
health$age[health$age <10]<-34
summary(health$age)

write.csv(health, "mentalsurvey_clean.csv")

