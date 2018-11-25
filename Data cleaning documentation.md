# Data Cleaning Documentation

## Description of Data Source

The dataset we will be using is the Open Sourcing Mental Illness dataset. 

Open Sourcing Mental Illness, LTD (2016a). OSMI (Version 1) [Data file]. Retrieved September 7, 2018, from https://osmihelp.org/research

In 2016, a voluntary survey was conducted of those who worked in the technology industry (Open Sourcing Mental Illness, LTD, 2016b).  The anonymous survey asks questions about how mental health is handled in the workplace as well as what are common mental health disorders in the technology industry (Open Sourcing Mental Illness, LTD, 2016b).  A total of 1,433 complete responses are included in the dataset (Open Sourcing Mental Illness, LTD, 2016b).  The survey contains responses from workers from across the world, although almost 60 percent of those surveyed worked in the United States at the time of the survey (Open Sourcing Mental Illness, LTD, 2016a).  


## Description of Constraints

The dataset has a Creative Commons Attribution-ShareAlike 4.0 International license (Open Sourcing Mental Illness, LTD, 2016b).  Under this license, users can copy and distribute the material with no limitations on medium or format, as well as transform the dataset for any purpose, as long as it is distributed under the same license (Creative Commons, n.d.[a]).   However, users must follow the terms of the license, which requires users to provide credit and a link to the license (Creative Commons, n.d.[a]).  Credit is defined as providing the name of the dataset creator, a notice referring to the copyright, a notice referring to the license, a notice of the disclaimer provided in the license, and a link to the material (Creative Commons, n.d.[b]).  However, the license indicates that these conditions may be satisfied “in any reasonable manner” based on the context the dataset is shared (the example provided is giving a link to a resource that provides this information) (Creative Commons, n.d.[b]).  Since we are using this for a class project, it would be appropriate to provide a link to the source of the data and the data license, as this has the necessary information.  

Those who use the data must also indicate if any changes were made to the dataset and cannot imply that the organization holding the license is endorsing the users or their product (Creative Commons, n.d.[a]).  Furthermore, those who use the data cannot restrict others from doing things allowed under this license (Creative Commons, n.d.[a]).  In summary, the license does not place a lot of restrictions on data users.  There do not appear to be significant contraints on the analysis from the dataset itself, the issues found in the dataset can likely be resolved through the data cleaning process.  


## Description of Metadata

The zip file that comes with the dataset contains a file called “osmi-survey-2016_1479139902,” which provides the available metadata for this dataset.  First, the file contains the total number of responses they got, as well as the total “complete” entries which can be found in the data file (Open Sourcing Mental Illness, LTD, 2016b).  The file also contains a paragraph providing information about what the survey will cover, how the survey will be anonymous, how long the survey will take to complete, and how the survey will be released and used (Open Sourcing Mental Illness, LTD, 2016b).  This paragraph appears to be the information provided to volunteers that chose to reply to this survey.  The file provides a list of all questions in the survey, and the “id” provides a clue about the type of question (e.g., yes/no, list, a number, a drop down) (Open Sourcing Mental Illness, LTD, 2016b).   Beneath each question is a “field_id” which corresponds to entries on a list of all responses that were provided to each question (Open Sourcing Mental Illness, LTD, 2016b).  


## Issues Encountered with Data

One of the issues our group has found with the data, is that the column names are very long, since it is the question asked in the survey.  This would make analyzing the data difficult in R.  Furthermore, we have noticed odd answers for several of the questions from the survey.  Examples include:

1.	Inconsistent answers in the question about the respondent’s gender (e.g., some are “M” or “Mail”, some are in sentence format) (Open Sourcing Mental Illness, LTD, 2016b).
2.	In the question “How many employees does your organization have” some have 25-Jun and 5-Jan as the answer (it must have been a formatting error with the .csv file) (Open Sourcing Mental Illness, LTD, 2016b).  
3.	For the age question, the minimum age is 3 and the maximum age is 323. However, the average age is 34, which implies that these may be typos (Open Sourcing Mental Illness, LTD, 2016b). 
4.  For quite a few variables, the values for participants' responses are blank or NA. The blank values can interfere with the results of the analysis and in calculation of statistical parameters.
5.  For some variables, for example: "Does your employer provide mental health benefits as part of healthcare coverage?", some participants have responded with "I don't know". For the purpose of the analysis, we would be considering these responses as null.
6.  For the question, "Do you think that discussing a mental health disorder with your employer would have negative consequences" and "Would you feel comfortable discussing a mental health disorder with your coworkers?", one of the options for the responses is "Maybe". This adds an element of uncertainty to the respective analysis.
7.  This one may not be an issue but needs to be modified for the purpose of the analysis. The question "If a mental health issue prompted you to request a medical leave from work, asking for that leave would be" has nominal responses ranging from "Very easy", "Somewhat easy", "Neither easy nor difficult", "Difficult" to "Very difficult". These nominal responses, if converted to a numerical scale of say, 1 to 5, would make analysis easier.

## Description of Steps Taking to Remediate and Data Cleaning Process

The first step is that each member of the group took 4-5 questions that were listed on the group work plan and determined which variables will be needed for each question.  From this, the group will come up with a planned list of variables to be used in the project and will split the variables used so that each user will investigate a group of variables.  The group will look at each variable to see if there are any odd entries like those listed above. For each issue encountered, the group will list the issues on a shared document and the group will work together to come up with an appropriate approach for each type of issue encountered.  Approaches used for this dataset were:

1. Some instances where there are inconsistent answers where the entry is clear can be standardized during data cleaning.  For instance, M or Mail can be converted into Male (or the code number assigned to "Male"), and "I am female" can be converted into Female (or the code number assigned to female) (Open Sourcing Mental Illness, LTD, 2016b).
2. Some instances where there are odd answers that do not make sense in the context of the question can be determined using context clues.  For instance, for the "how many employees does your organization have" question, 25-Jun and 5-Jan appear to be respectively 6-25 and 1-5 based off of the other entries in that column (Open Sourcing Mental Illness, LTD, 2016b). 
3. Other instances where there are clear typos can be handled by changing them to the average of that variable.  For instance, with the third issue listed above, instead of dropping the rows with nonsensical ages, we will change them to the average age 34 so that we can make use of the other responses in the columns (Open Sourcing Mental Illness, LTD, 2016b).
4. We ultimately decided not to eliminate blank or NA variables from the dataset.  Most of the blank entries in the dataset are from those who are self employed (therefore they were not able to answer questions about current employers).  We decided to exclude those who are self-employed from our analysis as we are taking the perspective of a Human Resources department in an organization.

The code that we used to handle issues with our dataset can be found here:  https://github.com/shrutih17/INFM600project/blob/master/health-survey.R

## Works Cited

1.	Open Sourcing Mental Illness, LTD (2016a). OSMI (Version 1) [Data file]. Retrieved September 7, 2018, from https://osmihelp.org/research
2.	Open Sourcing Mental Illness, LTD (2016b).  osmi-survey-2016_1479139902 [Metadata File].  Retrieved September 19, 2018, from https://osmihelp.org/research.
3.	Creative Commons (n.d.[a]), Attribution-ShareAlike 4.0 International [License].  Retrieved October 28, 2018 from https://creativecommons.org/licenses/by-sa/4.0/legalcode.    
4.	Creative Commons (n.d.[b]), Attribution-ShareAlike 4.0 International [Commons Deed].  Retrieved October 28, 2018 from https://creativecommons.org/licenses/by-sa/4.0/.  



