mental <- read.csv("mental-survey.csv")

library(plyr)
health <- rename(mental, c("What.is.your.age." = "age","What.is.your.gender." = "gender"))

health$gender[health$gender %in% c('male', 'Male ', 'M', 'm', 'man', 'Cis male',
                                   'Male.', 'Male (cis)', 'Man', 'Sex is male',
                                   'cis male', 'Malr', 'Dude', "I'm a man why didn't you make this a drop down question. You should of asked sex? And I would of answered yes please. Seriously how much text can this take? ",
                                   'mail', 'M|', 'male ', 'Cis Male', 'Male (trans, FtM)',
                                   'cisdude', 'cis man', 'MALE')]<- 'Male'

health$gender[health$gender %in% c('female', 'I identify as female.', 'female ',
                                   'Female assigned at birth ', 'F', 'Woman', 'fm', 'f',
                                   'Cis female', 'Transitioned, M2F', 'Female or Multi-Gender Femme',
                                   'Female ', 'woman', 'female/woman', 'Cisgender Female', 
                                   'mtf', 'fem', 'Female (props for making this a freeform field, though)',
                                   ' Female', 'Cis-woman', 'AFAB', 'Transgender woman',
                                   'Cis female ') ]<- 'Female'
health$gender[health$gender %in% c('Bigender', 'non-binary,', 'Genderfluid (born female)',
                                   'Other/Transfeminine', 'Androgynous', 'male 9:1 female, roughly',
                                   'nb masculine', 'genderqueer', 'Human', 'Genderfluid',
                                   'Enby', 'genderqueer woman', 'Queer', 'Agender', 'Fluid',
                                   'Genderflux demi-girl', 'female-bodied; no feelings about gender',
                                   'non-binary', 'Male/genderqueer', 'Nonbinary', 'Other', 'none of your business',
                                   'Unicorn', 'human', 'Genderqueer') ]<- 'Other'
View(health$gender)

# female_levels = levels(health$gender)[grep('(fe).*|^f$|fm|woman|female', levels(health$gender), ignore.case = T, perl = T)]
# male_levels   = levels(health$gender)[grep('^m$|\bmale| male|mail|male |^male| man|\bman|^man$|masculine|dude|^male$', levels(health$gender), ignore.case = T, perl = T)]
# female_levels
# male_levels
# health$gender[health$gender %in% female_levels]<-"female"
# health$gender[health$gender %in% male_levels] <- "male"
# health$gender
# summary(health$gender)

summary(mental$What.is.your.age.)#minimum is 3 and maximum is 323
#Cleaning the values in the age column
health$age[health$age >90]<-34
health$age[health$age <10]<-34
summary(health$age)

write.csv(health, "mentalsurvey_clean.csv")

