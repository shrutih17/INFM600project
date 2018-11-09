# Before doing this upload the data to R Studio
# check the levels on the employer size variable (which is a factor variable in the cleaned dataset)
levels(mental$How.many.employees.does.your.company.or.organization.have.)
# Doing a preliminary table to see the counts
table(mental$How.many.employees.does.your.company.or.organization.have.)
# 01-May is 1-5 and 25-Jun is 6-25, so replace those in the factor list. 
> levels(mental$How.many.employees.does.your.company.or.organization.have.) = c("", "1-5", "100-500", "26-100", "500-1000", "6-25", "More than 1000")
# confirming that the counts are the same (I also did a spot check of the 01-May and 25-Jun items and did not see errors)
table(mental$How.many.employees.does.your.company.or.organization.have.)

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
