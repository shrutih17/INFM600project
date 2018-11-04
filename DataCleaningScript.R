# Before doing this upload the data to R Studio
# checking to see what we have to clean
table(mental_heath_in_tech_2016_20161114$`How many employees does your company or organization have?`)
# Cleaning employer size column replace 43276 with 6-25 (determined it was a conversion error by looking at the CSV)
mental_heath_in_tech_2016_20161114$`How many employees does your company or organization have?`[mental_heath_in_tech_2016_20161114$`How many employees does your company or organization have?`=="43276"] <- "6-25"
# Cleaning employer size column replace 43105 with 1-5 (determined it was a conversion error by looking at the CSV)
mental_heath_in_tech_2016_20161114$`How many employees does your company or organization have?`[mental_heath_in_tech_2016_20161114$`How many employees does your company or organization have?`=="43105"] <- "1-5"
# confirming that the file is cleaned
table(mental_heath_in_tech_2016_20161114$`How many employees does your company or organization have?`)


#Renaming the column "Does your employer provide mental health benefits as part of healthcare coverage? "
names(mental_heath_in_tech_2016_20161114)[5]<-"EmployerMHBen"
#Contingency table for the variable EmployerMHBen
table(mental_heath_in_tech_2016_20161114$EmployerMHBen)

#Renaming the column "Do you think that discussing a mental health disorder with your employer would have negative consequences? "
names(mental_heath_in_tech_2016_20161114)[11]<-"EmployerNegCons"
#Contingency table for the variable EmployerNegCons
table(mental_heath_in_tech_2016_20161114$EmployerNegCons)

#Renaming the column "Does your employer offer resources to learn more about mental health concerns and options for seeking help?"
names(mental_heath_in_tech_2016_20161114)[8]<-"EmployerResources"
#Contingency table for the variable EmployerResources
table(mental_heath_in_tech_2016_20161114$EmployerResources)

#Renaming the column "If a mental health issue prompted you to request a medical leave from work, asking for that leave would be"
names(mental_heath_in_tech_2016_20161114)[10]<-"MedLeaveDifficulty"
#Contingency table for the variable MedLeaveDifficulty
table(mental_heath_in_tech_2016_20161114$MedLeaveDifficulty)

#Renaming the column "Is your employer primarily a tech company/organization?"
names(mental_heath_in_tech_2016_20161114)[3]<-"EmployerType"
#Contingency table for the variable EmployerType
table(mental_heath_in_tech_2016_20161114$EmployerType)

#Renaming the column "Do you have a family history of mental illness?"
names(mental_heath_in_tech_2016_20161114)[46]<-"FamilyIllnessHistory"
#Contingency table for the variable FamilyIllnessHistory
table(mental_heath_in_tech_2016_20161114$FamilyIllnessHistory)

#Renaming the column "Have you had a mental health disorder in the past? "
names(mental_heath_in_tech_2016_20161114)[47]<-"PastMentalDisorder"
#Contingency table for the variable PastMentalDisorder
table(mental_heath_in_tech_2016_20161114$PastMentalDisorder)

#Renaming the column "Have you had a mental health disorder in the past? "
names(mental_heath_in_tech_2016_20161114)[48]<-"CurrentMentalDisorder"
#Contingency table for the variable CurrentMentalDisorder
table(mental_heath_in_tech_2016_20161114$CurrentMentalDisorder)

#Renaming the column "If so, what condition were you diagnosed with?"
names(mental_heath_in_tech_2016_20161114)[52]<-"ConditionDiagnosed"
#Contingency table for the variable ConditionDiagnosed
table(mental_heath_in_tech_2016_20161114$ConditionDiagnosed)

#Renaming the column "If you have a mental health issue, do you feel that it interferes with your work when NOT being treated effectively? "
names(mental_heath_in_tech_2016_20161114)[55]<-"MHInterfere_NotEff"
#Contingency table for the variable MHInterfere_NotEff
table(mental_heath_in_tech_2016_20161114$MHInterfere_NotEff)
