mental <- read.csv("mentalsurvey_clean.csv")

#Do a table showing answers to question: "How many employees does your company or organization have"
table(mental$How.many.employees.does.your.company.or.organization.have)

#Do a table showing answers to question: "How willing would you be to share with friends and family that you have a mental illness?"
table(mental$How.willing.would.you.be.to.share.with.friends.and.family.that.you.have.a.mental.illness.)
#Do a barplot showing answers to question: ""How willing would you be to share with friends and family that you have a mental illness?"
barplot(table(mental$How.willing.would.you.be.to.share.with.friends.and.family.that.you.have.a.mental.illness.), main = "Willingness to share mental illness with friends and family", names.arg=c("Neutral", "N/A (no mental illness", "Not Open", "Somewhat not open", "Somewhat open", "Very Open"), xlab = "Answer", ylab = "Count", ylim=c(0,600), las = 1, cex.names=0.5)

#Do a table showing answers to question: "Has your employer ever formally discussed mental health (for example, as part of a wellness campaign or other official communication)?"
table(mental$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..)
#Do a barplot showing answers to question: "Has your employer ever formally discussed mental health (for example, as part of a wellness campaign or other official communication)?"
barplot(table(mental$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..), main = "Has your employer formally discussed mental health with you?", xlab = "Answer", ylab = "Count", ylim=c(0,1000))

#Do a table showing answers to question: "Is your anonymity protected if you choose to take advantage of mental health or substance abuse treatment resources provided by your employer?"
table(mental$Is.your.anonymity.protected.if.you.choose.to.take.advantage.of.mental.health.or.substance.abuse.treatment.resources.provided.by.your.employer.)
#Do a barplot showing answers to question: "Is your anonymity protected if you choose to take advantage of mental health or substance abuse treatment resources provided by your employer?"
barplot(table(mental$Is.your.anonymity.protected.if.you.choose.to.take.advantage.of.mental.health.or.substance.abuse.treatment.resources.provided.by.your.employer.), main = "Is your anonymity protected (if using MH/SA resources)", xlab = "Answer", ylab = "Count", ylim=c(0,800))

#Do a table showing answers to question: "Have you observed or experienced an unsupportive or badly handled response to a mental health issue in your current or previous workplace?"
table(mental$Have.you.observed.or.experienced.an.unsupportive.or.badly.handled.response.to.a.mental.health.issue.in.your.current.or.previous.workplace.)
#Do a barplot showing answers to question: "Have you observed or experienced an unsupportive or badly handled response to a mental health issue in your current or previous workplace?"
barplot(table(mental$Have.you.observed.or.experienced.an.unsupportive.or.badly.handled.response.to.a.mental.health.issue.in.your.current.or.previous.workplace.), main = "Ever Observed/Experience Badly Handled MH Response", names.arg=c("Maybe", "Not Applicable", "No", "Yes (Experienced)", "Yes (observed"), xlab = "Answer", ylab = "Count", ylim=c(0,600), las = 1, cex.names=0.5)

#Do a table showing answers to question: "Do you think that team members/co-workers would view you more negatively if they knew you suffered from a mental health issue?"
table(mental$Do.you.think.that.team.members.co.workers.would.view.you.more.negatively.if.they.knew.you.suffered.from.a.mental.health.issue.)
#Do a barplot showing answers to question: "Do you think that team members/co-workers would view you more negatively if they knew you suffered from a mental health issue?"
barplot(table(mental$Do.you.think.that.team.members.co.workers.would.view.you.more.negatively.if.they.knew.you.suffered.from.a.mental.health.issue.), main = "Would coworkers view you negatively if you had MH", names.arg=c("Maybe", "Don't Think So", "No", "Do Think So", "Yes"), xlab = "Answer", ylab = "Count", ylim=c(0,600), las = 1.5, cex.names=0.5)

#Do a table showing answers to quetsion: "If you have a mental health issue, do you feel that it interferes with your work when being treated effectively?"
table(mental$If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.being.treated.effectively.)
#Do a barplot showing answers to quetsion: "If you have a mental health issue, do you feel that it interferes with your work when being treated effectively?"
barplot(table(mental$If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.being.treated.effectively.), main = "Does MH interfere with work (when treated effectively", names.arg=c("Never", "N/A", "Often", "Rarely", "Sometimes"), xlab = "Answer", ylab = "Count", ylim=c(0,600), las = 1.5, cex.names=0.5)

#Do a table showing answers to question: "Would you feel comfortable discussing a mental health disorder with your coworkers?"
table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers.)
#Do a barplot showing answers to question: "Would you feel comfortable discussing a mental health disorder with your coworkers?"
barplot(table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers.), main = "Do you feel comfortable discussing MH with Coworkers?", xlab = "Answer", ylab = "Count", ylim=c(0,500))

#COMPANY SIZE AND PROVISION OF BENEFITS

#Do a crosstab table showing provision of health benefits by company size
table(mental$How.many.employees.does.your.company.or.organization.have., mental$Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.)

#Do a crosstab table showing whether employers discuss MH by company size
table(mental$How.many.employees.does.your.company.or.organization.have., mental$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..)

#Do a crosstab table showing whether employers provide other resources by company size
table(mental$How.many.employees.does.your.company.or.organization.have., mental$Does.your.employer.offer.resources.to.learn.more.about.mental.health.concerns.and.options.for.seeking.help.)


#POSSIBLE FACTORS IN WHETHER EMPLOYEE FEELS ASKING FOR LEAVE WOULD BE DIFFICULT

#Answers by Gender (crosstab table)
ELDbG <- table(mental$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., mental$gender)
ELDbG
#Proportions (as column percentages)
prop.table(ELDbG, 2)
#Chi-Squared (We get a warning that the approximation may be incorrect, likely b/c the other values are small)
chisq.test(ELDbG)

#Answers by Company Size (crosstab table)
ELDbCS <- table(mental$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., mental$How.many.employees.does.your.company.or.organization.have.)
ELDbCS
#Proportions (as column percentages)
prop.table(ELDbCS, 2)
#Chi-Squared (Small P Value)
chisq.test(ELDbCS)

#Answers by Mental Health Benefit Provision (crosstab table)
ELDbMHB <- table(mental$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., mental$Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.)
ELDbMHB
#Proportions (as column percentages)
prop.table(ELDbMHB, 2)
#Chi-Squared (Small P Value)
chisq.test(ELDbMHB)

#Answers by If Employer Discussed Mental Health (crosstab table)
ELDbEDM <- table(mental$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., mental$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..)
ELDbEDM
#Proportions (as column percentages)
prop.table(ELDbEDM, 2)
#Chi-Squared (Relatively small p value, but we might want to set it at p=01 for chi-squared)
chisq.test(ELDbEDM)

#Answers by If Employer Offers Other Resources (crosstab table)
ELDbEOR <- table(mental$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., mental$Does.your.employer.offer.resources.to.learn.more.about.mental.health.concerns.and.options.for.seeking.help.)
ELDbEOR
#Proportions (as column percentages)
prop.table(ELDbEOR, 2)
#Chi-Squared (Small p value)
chisq.test(ELDbEOR)

#Answers by Experience With Poor Response (crosstab table)
ELDbPR <- table(mental$If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be., mental$Have.you.observed.or.experienced.an.unsupportive.or.badly.handled.response.to.a.mental.health.issue.in.your.current.or.previous.workplace.)
ELDbPR
#Proportions (as column percentages)
prop.table(ELDbPR, 2)
#Chi-Squared (Small p value)
chisq.test(ELDbPR)


#POSSIBLE FACTORS IN COMFORT WITH DISCUSSING MH WITH SUPERVISORS

#Answers by Gender (Counts)
MHbG <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., mental$gender)
MHbG
#Proportions (as column percentages)
prop.table(MHbG, 2)
#Chi-Squared (the p value is very large, which indicates that differences among genders is probably not significant)
chisq.test(MHbG)

#Answers by Company Size (crosstab table)
MHbCS <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., mental$How.many.employees.does.your.company.or.organization.have.)
MHbCS
#Proportions (as column percentages)
prop.table(MHbCS, 2)
#Chi-Squared (the p value is just over .05 which means it is probably not significant)
chisq.test(MHbCS)

#Answers by Mental Health Benefit Provision (crosstab table)
MHbMHB <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., mental$Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.)
MHbMHB
#Proportions (as column percentages)
prop.table(MHbMHB, 2)
#Chi-Squared (the p value is very small, but I don't know if Chi-Squared is good for a large dataset)
chisq.test(MHbMHB)

#Answers by If Employer Discussed Mental Health (crosstab table)
MHbEDM <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., mental$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..)
MHbEDM
#Proportions (as column percentages)
prop.table(MHbEDM, 2)
#Chi-Squared (the p value is very small, but I don't know if Chi-Squared is good for a large dataset)
chisq.test(MHbEDM)

#Answers by If Employer Offers Other Resources (crosstab table)
MHbEOR <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., mental$Does.your.employer.offer.resources.to.learn.more.about.mental.health.concerns.and.options.for.seeking.help.)
MHbEOR
#Proportions (as column percentages)
prop.table(MHbEOR, 2)
#Chi-Squared (the p value is very small, but I don't know if Chi-Squared is good for a large dataset)
chisq.test(MHbEOR)

#Answers by Experience With Poor Response (crosstab table)
MHbPR <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s.., mental$Have.you.observed.or.experienced.an.unsupportive.or.badly.handled.response.to.a.mental.health.issue.in.your.current.or.previous.workplace.)
MHbPR
#Proportions (as column percentages)
prop.table(MHbPR, 2)
#Chi-Squared (the p value is very small, but I don't know if Chi-Squared is good for a large dataset)
chisq.test(MHbPR)

#POSSIBLE FACTORS IN COMFORT WITH DISCUSSING MH WITH COWORKERS

#Answers by Gender (crosstab table)
MHCbG <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., mental$gender)
MHCbG
#Proportions (as column percentages)
prop.table(MHCbG, 2)
#Chi-Squared (the p value is large, which indicates differences among gender is not stat sig)
chisq.test(MHCbG)

#Answers by Company Size (crosstab table)
MHCbCS <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., mental$How.many.employees.does.your.company.or.organization.have.)
MHCbCS
#Proportions (as column percentages)
prop.table(MHCbCS, 2)
#Chi-Squared (the p value is small)
chisq.test(MHCbCS)

#Answers by Mental Health Benefit Provision (crosstab table)
MHCbMHB <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., mental$Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.)
MHCbMHB
#Proportions (as column percentages)
prop.table(MHCbMHB, 2)
#Chi-Squared (the p value is small)
chisq.test(MHCbMHB)

#Answers by If Employer Discussed Mental Health (crosstab table)
MHCbEDM <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., mental$Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..)
MHCbEDM
#Proportions (as column percentages)
prop.table(MHCbEDM, 2)
#Chi-Squared (the p value is small)
chisq.test(MHCbEDM)

#Answers by If Employer Offers Other Resources (crosstab table)
MHCbEOR <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., mental$Does.your.employer.offer.resources.to.learn.more.about.mental.health.concerns.and.options.for.seeking.help.)
MHCbEOR
#Proportions (as column percentages)
prop.table(MHCbEOR, 2)
#Chi-Squared (the p value is small)
chisq.test(MHCbEOR)

#Answers by Experience With Poor Response (crosstab table)
MHCbPR <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., mental$Have.you.observed.or.experienced.an.unsupportive.or.badly.handled.response.to.a.mental.health.issue.in.your.current.or.previous.workplace.)
MHCbPR
#Proportions (as column percentages)
prop.table(MHCbPR, 2)
#Chi-Squared (the p value is small)
chisq.test(MHCbPR)

#Answers by Perception Coworkers Will View You Negatively if you had MH issue
MHCbCN <- table(mental$Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers., mental$Do.you.think.that.team.members.co.workers.would.view.you.more.negatively.if.they.knew.you.suffered.from.a.mental.health.issue.)
MHCbCN
#Proportions (as column percentages)
prop.table(MHCbCN, 2)
#Chi-Squared (the p value is small)
chisq.test(MHCbCN)

# ISSUES
# Having a hard time with making the location of a legend in a side-by-side bar chart not overlap with chart.  Maybe do a mosaic plot?
# I am having an awful time reordering the columns so it is in Ascending Order. Stack Overflow isn't helpful at all.