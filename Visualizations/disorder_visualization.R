library(dplyr)
library(tidyr)
library(ggplot2)
health <- read.csv("mentalsurvey_clean.csv")
tmp = health %>% separate(mhd, 
                          sep = '\\|',
                          c('mhd_1', 'mhd_2', 'mhd_3', 'mhd_4', 'mhd_5',
                            'mhd_6', 'mhd_7', 'mhd_8', 'mhd_9'),
                          fill = 'right')


chk = tmp %>% select(matches('mhd_[1-9]'))
chk
# tmp2 = tmp %>% select(matches('mhd_[1-9]')) %>% mutate_all(.funs = 'as.factor')

comb = as.vector(t(chk))
comb
comb1 = comb[comb != ""&!is.na(comb)]
comb1

disorders=sapply(strsplit(comb1, split = " \\("), `[`, 1)
dataf <- as.data.frame(matrix(disorders))
subdataf <- subset(dataf, disorders != "I haven\'t been formally diagnosed, so I felt uncomfortable answering, but Social Anxiety and Depression.")

View(subdataf)

reorder_size <- function(x) {
  factor(x, levels = names(sort(table(x), decreasing = TRUE)))
}
#Plot to see the distribution of current mental health illness
p <- ggplot(data=subdataf, aes(x = reorder_size(V1)))+
  geom_bar(fill = 'black')+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

p+xlab("Current Mental health disorders")+ggtitle("Distribution of current Mental health disorders")

count_disorder <-data.frame(count(subdataf, V1, sort = TRUE))
View(count_disorder)

#Do a table showing answers to question: "How many employees does your company or organization have"
table(health$How.many.employees.does.your.company.or.organization.have.)
#First, I need to reorder the variables
ENumOrder  = factor(health$How.many.employees.does.your.company.or.organization.have, levels=c("1-5", "6-25", "26-100", "100-500", "500-1000", "More than 1000"))
#Then I can do the table
table(ENumOrder)
#Do a barplot showing answers to question about how many employees
barplot(table(ENumOrder), main = "How Many Employees Does Your Organization Have", xlab = "Answer", ylab = "Count", ylim=c(0,400), las = 1.5, cex.names=0.5)

#Do a table showing answers to question: "How willing would you be to share with friends and family that you have a mental illness?"
table(health$How.willing.would.you.be.to.share.with.friends.and.family.that.you.have.a.mental.illness.)
#Do a barplot showing answers to question: ""How willing would you be to share with friends and family that you have a mental illness?"
barplot(table(health$How.willing.would.you.be.to.share.with.friends.and.family.that.you.have.a.mental.illness.), main = "Willingness to share mental illness with friends and family", names.arg=c("Neutral", "N/A (no mental illness", "Not Open", "Somewhat not open", "Somewhat open", "Very Open"), xlab = "Answer", ylab = "Count", ylim=c(0,600), las = 1, cex.names=0.5)

#Do a table showing answers to question: "Has your employer ever formally discussed mental health (for example, as part of a wellness campaign or other official communication)?"
table(health$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..)
#Do a barplot showing answers to question: "Has your employer ever formally discussed mental health (for example, as part of a wellness campaign or other official communication)?"
barplot(table(health$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..), main = "Has your employer discussed mental health with you?", xlab = "Answer", ylab = "Count", ylim=c(0,1000))

#Do a table showing answers to question: "Is your anonymity protected if you choose to take advantage of mental health or substance abuse treatment resources provided by your employer?"
table(health$Is.your.anonymity.protected.if.you.choose.to.take.advantage.of.mental.health.or.substance.abuse.treatment.resources.provided.by.your.employer.)
#Do a barplot showing answers to question: "Is your anonymity protected if you choose to take advantage of mental health or substance abuse treatment resources provided by your employer?"
barplot(table(health$Is.your.anonymity.protected.if.you.choose.to.take.advantage.of.mental.health.or.substance.abuse.treatment.resources.provided.by.your.employer.), main = "Is your anonymity protected (if using MH/SA resources)", xlab = "Answer", ylab = "Count", ylim=c(0,800))

#Do a table showing answers to question: "Have you observed or experienced an unsupportive or badly handled response to a mental health issue in your current or previous workplace?"
table(health$Have.you.observed.or.experienced.an.unsupportive.or.badly.handled.response.to.a.mental.health.issue.in.your.current.or.previous.workplace.)
#Do a barplot showing answers to question: "Have you observed or experienced an unsupportive or badly handled response to a mental health issue in your current or previous workplace?"
barplot(table(health$Have.you.observed.or.experienced.an.unsupportive.or.badly.handled.response.to.a.mental.health.issue.in.your.current.or.previous.workplace.), main = "Ever Observed/Experience Badly Handled MH Response", names.arg=c("Maybe", "Not Applicable", "No", "Yes (Experienced)", "Yes (observed"), xlab = "Answer", ylab = "Count", ylim=c(0,600), las = 1, cex.names=0.5)

#Do a table showing answers to question: "Do you think that team members/co-workers would view you more negatively if they knew you suffered from a mental health issue?"
table(health$Do.you.think.that.team.members.co.workers.would.view.you.more.negatively.if.they.knew.you.suffered.from.a.mental.health.issue.)
#Do a barplot showing answers to question: "Do you think that team members/co-workers would view you more negatively if they knew you suffered from a mental health issue?"
barplot(table(health$Do.you.think.that.team.members.co.workers.would.view.you.more.negatively.if.they.knew.you.suffered.from.a.mental.health.issue.), main = "Would coworkers view you negatively if you had MH", names.arg=c("Maybe", "Don't Think So", "No", "Do Think So", "Yes"), xlab = "Answer", ylab = "Count", ylim=c(0,600), las = 1.5, cex.names=0.5)

#Do a table showing answers to quetsion: "If you have a mental health issue, do you feel that it interferes with your work when being treated effectively?"
table(health$If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.being.treated.effectively.)
#Do a barplot showing answers to quetsion: "If you have a mental health issue, do you feel that it interferes with your work when being treated effectively?"
barplot(table(health$If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.being.treated.effectively.), main = "Does MH interfere with work (when treated effectively", names.arg=c("Never", "N/A", "Often", "Rarely", "Sometimes"), xlab = "Answer", ylab = "Count", ylim=c(0,600), las = 1.5, cex.names=0.5)

#Do a table showing answers to question: "Would you feel comfortable discussing a mental health disorder with your coworkers?"
table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers.)
#Do a barplot showing answers to question: "Would you feel comfortable discussing a mental health disorder with your coworkers?"
barplot(table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers.), main = "Do you feel comfortable discussing MH with Coworkers?", xlab = "Answer", ylab = "Count", ylim=c(0,500))

#COMPANY SIZE AND PROVISION OF BENEFITS

#Descriptive statistics for the variable related to company size
summary(Health$How.many.employees.does.your.company.or.organization.have.)

#Do a crosstab table showing provision of health benefits by company size
table(health$How.many.employees.does.your.company.or.organization.have., health$Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.)

#Do a crosstab table showing whether employers discuss MH by company size
table(health$How.many.employees.does.your.company.or.organization.have., health$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..)

#Do a crosstab table showing whether employers provide other resources by company size
table(health$How.many.employees.does.your.company.or.organization.have., health$Does.your.employer.offer.resources.to.learn.more.about.mental.health.concerns.and.options.for.seeking.help.)

#crosstab 
gender_disorder <- table(health$Do.you.currently.have.a.mental.health.disorder., health$gender)
gender_disorder
colprop <- prop.table(gender_disorder,2)# To know the % of each level gender who may, don't or have mental disorder
rowprop <- prop.table(gender_disorder,1) #To know the % of who may, don't or have mental disorder among genders
dr1 <-as.data.frame(rowprop)
dr2 <-as.data.frame(colprop)

# Distribution of respondents among gender provided they may/have/donot have a mental diorder 
ggplot(data = dr1, aes(x =Var1 , y = Freq, fill = Var2)) + 
  geom_bar(stat = 'identity', position = 'dodge', alpha = 2/3) +              
  labs(x = NULL, y = 'Proportion', fill = 'Gender')+ggtitle('Distribution ')
# Distribution of respondents who may/have/donot have a mental diorder over the gender
ggplot(data = dr2, aes(x =Var2 , y = Freq, fill = Var1)) + 
  geom_bar(stat = 'identity', position = 'dodge', alpha = 2/3) +              
  labs(x = NULL, y = 'Proportion', fill = 'Disorder')+ggtitle('Distribution ')

summary(health$age)
#Creating lavbels for age groups
labs <- c(paste(seq(17, 74, by = 20), seq(37, 80, by = 20),
                sep = "-"))
labs
health$AgeGroup <- cut(health$age, breaks = c(seq(17, 74, by = 20), Inf), labels = labs, right = FALSE)
View(health$AgeGroup)
write.csv(health, "output.csv")

agegr <- table(health$Do.you.currently.have.a.mental.health.disorder.,health$AgeGroup)
ageprop <- prop.table(agegr,2)
dfageprop <- as.data.frame(ageprop)
ageprop1 <- prop.table(agegr,1)
dfageprop1 <- as.data.frame(ageprop1)

#Distribution of respondents reporting a mental disorder by age groups
ggplot(data = dfageprop, aes(x =Var2 , y = Freq, fill = Var1)) + 
  geom_bar(stat = 'identity', position = 'dodge', alpha = 2/3) +              
  labs(x = "Age Groups", y = 'Proportion', fill = 'Disorder')

ggplot(data = dfageprop1, aes(x =Var1 , y = Freq, fill = Var2)) + 
  geom_bar(stat = 'identity', position = 'dodge', alpha = 2/3) +              
  labs(x = "Disorder", y = 'Proportion', fill = 'Age group')

# NEGATIVE CONSEQUENCES ON DISUCSSING HEALTH ISSUES: MENTAL VS PHYSICAL

#Creating a table with gender and mental health responses
tab <- table(health$Do.you.think.that.discussing.a.mental.health.disorder.with.your.employer.would.have.negative.consequences., health$gender)
tab
#Creating a table with gender and physical health responses
tab1 <- table(health$Do.you.think.that.discussing.a.physical.health.issue.with.your.employer.would.have.negative.consequences., health$gender)
tab1

#creating the combined plot
tabdf <- as.data.frame(tab)
tab1df <- as.data.frame(tab1)

plot1 <- ggplot(data = tabdf, aes(x = Var1, y =Freq, fill = Var2)) + 
  geom_bar(stat = 'identity', position = 'dodge', alpha = 2/3) +              
  labs(x = "Mental health disorders", y = 'count')+ theme(legend.position='none')

plot2 <- ggplot(data = tab1df, aes(x = Var1, y =Freq, fill = Var2)) + 
  geom_bar(stat = 'identity', position = 'dodge', alpha = 2/3) +              
  labs(x = "Physical health disorders", y = 'count', fill = 'Gender')
title1=textGrob("Negative consequences: Mental vs Physial", gp=gpar(fontface="bold"))
grid.arrange(plot1, plot2,ncol=2,top = title1, widths = c(3/4,1))

#POSSIBLE FACTORS IN WHETHER EMPLOYEE FEELS ASKING FOR LEAVE WOULD BE DIFFICULT

#Answers by Gender (crosstab table)
ELDbG <- table(health$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., health$gender)
ELDbG
#Proportions (as column percentages)
prop.table(ELDbG, 2)
#Chi-Squared (We get a warning that the approximation may be incorrect, likely b/c the other values are small)
chisq.test(ELDbG)

#Answers by Age Group (crosstab table)
ELDbA <- table(health$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., health$AgeGroup)
ELDbA
#Proportions (as column percentages)
prop.table(ELDbA, 2)
#Chi-Squared (We get a huge chi-quared and a warning it may be incorrect, likely b/c small values for the 57-77 column)
chisq.test(ELDbA)

#Answers by Company Size (crosstab table)
ELDbCS <- table(health$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., ENumOrder)
ELDbCS
#Proportions (as column percentages)
prop.table(ELDbCS, 2)
#Chi-Squared (Small P Value)
chisq.test(ELDbCS)

#Answers by Mental Health Benefit Provision (crosstab table)
ELDbMHB <- table(health$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., health$Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.)
ELDbMHB
#Proportions (as column percentages)
prop.table(ELDbMHB, 2)
#Chi-Squared (Small P Value)
chisq.test(ELDbMHB)

#Answers by If Employer Discussed Mental Health (crosstab table)
ELDbEDM <- table(health$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., health$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..)
ELDbEDM
#Proportions (as column percentages)
prop.table(ELDbEDM, 2)
#Chi-Squared (Relatively small p value, but we might want to set it at p=01 for chi-squared)
chisq.test(ELDbEDM)

#Answers by If Employer Offers Other Resources (crosstab table)
ELDbEOR <- table(health$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., health$Does.your.employer.offer.resources.to.learn.more.about.mental.health.concerns.and.options.for.seeking.help.)
ELDbEOR
#Proportions (as column percentages)
prop.table(ELDbEOR, 2)
#Chi-Squared (Small p value)
chisq.test(ELDbEOR)

#Answers by Experience With Poor Response (crosstab table)
ELDbPR <- table(health$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., health$Have.you.observed.or.experienced.an.unsupportive.or.badly.handled.response.to.a.mental.health.issue.in.your.current.or.previous.workplace.)
ELDbPR
#Proportions (as column percentages)
prop.table(ELDbPR, 2)
#Chi-Squared (Small p value)
chisq.test(ELDbPR)


#POSSIBLE FACTORS IN COMFORT WITH DISCUSSING MH WITH SUPERVISORS

#Answers by Gender (crosstab table)
MHbG <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., health$gender)
MHbG
#Proportions (as column percentages)
prop.table(MHbG, 2)
#Chi-Squared (the p value is very large, which indicates that differences among genders is probably not significant)
chisq.test(MHbG)

#Answers by Age Group (crosstab table)
MHbA <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., health$AgeGroup)
MHbA
#Proportions (as column percentages)
prop.table(MHbA, 2)
#Chi-Squared (We get a big chi-quared and a warning it may be incorrect, likely b/c small values for the 57-77 column)
chisq.test(MHbA)

#Answers by Company Size (crosstab table)
MHbCS <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., ENumOrder)
MHbCS
#Proportions (as column percentages)
prop.table(MHbCS, 2)
#Chi-Squared (the p value is just over .05 which means it is probably not significant)
chisq.test(MHbCS)

#Answers by Mental Health Benefit Provision (crosstab table)
MHbMHB <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., health$Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.)
MHbMHB
#Proportions (as column percentages)
prop.table(MHbMHB, 2)
#Chi-Squared (the p value is very small, but I don't know if Chi-Squared is good for a large dataset)
chisq.test(MHbMHB)

#Answers by If Employer Discussed Mental Health (crosstab table)
MHbEDM <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., health$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..)
MHbEDM
#Proportions (as column percentages)
prop.table(MHbEDM, 2)
#Chi-Squared (the p value is very small, but I don't know if Chi-Squared is good for a large dataset)
chisq.test(MHbEDM)

#Answers by If Employer Offers Other Resources (crosstab table)
MHbEOR <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., health$Does.your.employer.offer.resources.to.learn.more.about.mental.health.concerns.and.options.for.seeking.help.)
MHbEOR
#Proportions (as column percentages)
prop.table(MHbEOR, 2)
#Chi-Squared (the p value is very small, but I don't know if Chi-Squared is good for a large dataset)
chisq.test(MHbEOR)

#Answers by Experience With Poor Response (crosstab table)
MHbPR <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., health$Have.you.observed.or.experienced.an.unsupportive.or.badly.handled.response.to.a.mental.health.issue.in.your.current.or.previous.workplace.)
MHbPR
#Proportions (as column percentages)
prop.table(MHbPR, 2)
#Chi-Squared (the p value is very small, but I don't know if Chi-Squared is good for a large dataset)
chisq.test(MHbPR)

#POSSIBLE FACTORS IN COMFORT WITH DISCUSSING MH WITH COWORKERS

#Answers by Gender (crosstab table)
MHCbG <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., health$gender)
MHCbG
#Proportions (as column percentages)
prop.table(MHCbG, 2)
#Chi-Squared (the p value is large, which indicates differences among gender is not stat sig)
chisq.test(MHCbG)

#Answers by Age Group (crosstab table)
MHCbA <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., health$AgeGroup)
MHCbA
#Proportions (as column percentages)
prop.table(MHCbA, 2)
#Chi-Squared (We get a big chi-quared and a warning it may be incorrect, likely b/c small values for the 57-77 column)
chisq.test(MHCbA)

#Answers by Company Size (crosstab table)
MHCbCS <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., ENumOrder)
MHCbCS
#Proportions (as column percentages)
prop.table(MHCbCS, 2)
#Chi-Squared (the p value is small)
chisq.test(MHCbCS)

#Answers by Mental Health Benefit Provision (crosstab table)
MHCbMHB <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., health$Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.)
MHCbMHB
#Proportions (as column percentages)
prop.table(MHCbMHB, 2)
#Chi-Squared (the p value is small)
chisq.test(MHCbMHB)

#Answers by If Employer Discussed Mental Health (crosstab table)
MHCbEDM <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., health$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..)
MHCbEDM
#Proportions (as column percentages)
prop.table(MHCbEDM, 2)
#Chi-Squared (the p value is small)
chisq.test(MHCbEDM)

#Answers by If Employer Offers Other Resources (crosstab table)
MHCbEOR <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., health$Does.your.employer.offer.resources.to.learn.more.about.mental.health.concerns.and.options.for.seeking.help.)
MHCbEOR
#Proportions (as column percentages)
prop.table(MHCbEOR, 2)
#Chi-Squared (the p value is small)
chisq.test(MHCbEOR)

#Answers by Experience With Poor Response (crosstab table)
MHCbPR <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., health$Have.you.observed.or.experienced.an.unsupportive.or.badly.handled.response.to.a.mental.health.issue.in.your.current.or.previous.workplace.)
MHCbPR
#Proportions (as column percentages)
prop.table(MHCbPR, 2)
#Chi-Squared (the p value is small)
chisq.test(MHCbPR)

#Answers by Perception Coworkers Will View You Negatively if you had MH issue
MHCbCN <- table(health$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., health$Do.you.think.that.team.members.co.workers.would.view.you.more.negatively.if.they.knew.you.suffered.from.a.mental.health.issue.)
MHCbCN
#Proportions (as column percentages)
prop.table(MHCbCN, 2)
#Chi-Squared (the p value is small)
chisq.test(MHCbCN)

#Importing the dataset

Health<-read.csv(file.choose())
Health

#VARIABLE NAME: Health$Do.you.think.that.discussing.a.mental.health.disorder.with.your.employer.would.have.negative.consequences.
#Checking the frequency distribution for the variable in the table
table(Health$Do.you.think.that.discussing.a.mental.health.disorder.with.your.employer.would.have.negative.consequences.)
#Visualizing the frequency distribution of the responses to the variable
barplot(table(Health$Do.you.think.that.discussing.a.mental.health.disorder.with.your.employer.would.have.negative.consequences.), main = "Negative consequences of discussing mental disorders with Employer", xlab = "Responses of Participants", ylab = "Frequency Distribution of Responses")
#Distribution based on gender
barplot(table(Health$Do.you.think.that.discussing.a.mental.health.disorder.with.your.employer.would.have.negative.consequences., Health$gender))
#Distribution based on age
barplot(table(Health$Do.you.think.that.discussing.a.mental.health.disorder.with.your.employer.would.have.negative.consequences., Health$age))

#VARIABLE: Does your employer provide mental health benefits as part of healthcare coverage? 
#Checking the frequency distribution for the variable
table(Health$Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.)
#Dropping the unused values from the variable
dataframe1<-droplevels(Health)
barplot(table(dataframe1$Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.), main = "Does the healthcare coverage include mental health benefits?", xlab = "Participant responses", ylab = "Frequency distribution of responses")

#VARIABLE: Does your employer offer resources to learn more about mental health concerns and options for seeking help?
#Checking the frequency distribution for the variable
table(Health$Does.your.employer.offer.resources.to.learn.more.about.mental.health.concerns.and.options.for.seeking.help.)
#Plotting a barplot for the variable
barplot(table(Health$Does.your.employer.offer.resources.to.learn.more.about.mental.health.concerns.and.options.for.seeking.help.), main = "Employer Resources", xlab = "Participant responses", ylab = "Frequency distribution of responses")
install.packages("gmodels")
library(gmodels)
#Cross table to show availability of resources to learn about mental health benefits by size of the organization 
CrossTable(Health$Does.your.employer.offer.resources.to.learn.more.about.mental.health.concerns.and.options.for.seeking.help., Health$How.many.employees.does.your.company.or.organization.have.)

#VARIABLE:If a mental health issue prompted you to request a medical leave from work, asking for that leave would be
#Checking the frequency distribution for the variable
table(Health$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be.)
#Barplot for the variable
barplot(table(Health$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be.))

install.packages("MASS")
library(MASS)

#VARIABLE: Is your employer primarily a tech company/organization?
#Checking the frequency distribution for the variable
table(Health$Is.your.employer.primarily.a.tech.company.organization.)
#Barplot for the variable
barplot(table(Health$Is.your.employer.primarily.a.tech.company.organization.), main = "Is the employer primarily a tech organization", xlab = "Participant Responses", ylab = "Frequency distribution of the responses")
#Cross table for provision of mental health benefits by type of organization
CrossTable(Health$Is.your.employer.primarily.a.tech.company.organization., Health$Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.)

#VARIABLE: Do you have a family history of mental illness?
#Checking the frequency distribution for the variable
table(Health$Do.you.have.a.family.history.of.mental.illness.)
#barplot for the variable to visualize the frequency distribution
barplot(table(Health$Do.you.have.a.family.history.of.mental.illness.), main = "Family history of mental illness", xlab = "Participant responses", ylab = "Frequency distribution of responses")

#VARIABLE: Have you had a mental health disorder in the past?
#Checking the frequency distribution for the variable
table(Health$Have.you.had.a.mental.health.disorder.in.the.past.)
#barplot for the variable to visualize the frequency distribution
barplot(table(Health$Have.you.had.a.mental.health.disorder.in.the.past.), main = "Past Mental Illness", xlab = "Participant Responses", ylab = "Frequency distribution of the Responses")

#VARIABLE: Do you currently have a mental health disorder? 
#Checking the frequency distribution for the variable
table(Health$Do.you.currently.have.a.mental.health.disorder.)
#Checking the frequency distribution for the variable
barplot(table(Health$Do.you.currently.have.a.mental.health.disorder.), main = "Current Mental Disorder", xlab = "Participant Responses", ylab = "Frequency Distribution of Responses")

#VARIABLE: If you have a mental health issue, do you feel that it interferes with your work when NOT being treated effectively? 
#Checking the frequency distribution for the variable
table(Health$If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.NOT.being.treated.effectively.)
#barplot for visualizing the frequency distribution of the variable
barplot(table(Health$If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.NOT.being.treated.effectively.), main = "Mental Health Interference in Absence of Treatment", xlab = "Participant Responses", ylab = "Frequency Distribution of the Responses")

#Relationship between perceiving the negative impact of mental illness at previous workplace and the impact at current workplace.
Data2<- table(Health$Do.you.think.that.discussing.a.mental.health.disorder.with.your.employer.would.have.negative.consequences., Health$Do.you.think.that.discussing.a.mental.health.disorder.with.previous.employers.would.have.negative.consequences.)
Data2
#Proportaions of the Participant Responses
prop.table(Data2, 2)
#Chi-Square test (Gives small p value) 
chisq.test(Data2)

#Relationship between provision of mental health benefits and formal discussion of the same by the employer
Data3<-table(Health$Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage., Health$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..)
#Proportions of the Participant Responses
prop.table(Data3)
#Chi-Square test (gives small p value)
chisq.test(Data3)

#Relationship between gender and mental health distribution
Data4<-table(Health$What.is.your.gender., Health$Have.you.been.diagnosed.with.a.mental.health.condition.by.a.medical.professional.)
#Proportion of genders diagnosed with mental health illness
prop.table(Data4)
#Chi-Square test(gives small p value)
chisq.test(Data4)

#Relationship between their mental illness and their own perceived productivity:
Data5<-table(Health$If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.being.treated.effectively., Health$Have.you.been.diagnosed.with.a.mental.health.condition.by.a.medical.professional.)
#Proportion of responses for impact of mental illness on perceived productivity
prop.table(Data5)
#Chi-Square test (gives small p value)
chisq.test(Data5)
