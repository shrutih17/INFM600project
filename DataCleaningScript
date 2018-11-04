# Before doing this upload the data to R Studio
# checking to see what we have to clean
table(mental_heath_in_tech_2016_20161114$`How many employees does your company or organization have?`)
#Cleaning employer size column replace 43276 with 6-25 (determined it was a conversion error by looking at the CSV)
mental_heath_in_tech_2016_20161114$`How many employees does your company or organization have?`[mental_heath_in_tech_2016_20161114$`How many employees does your company or organization have?`=="43276"] <- "6-25"
#Cleaning employer size column replace 43105 with 1-5 (determined it was a conversion error by looking at the CSV)
mental_heath_in_tech_2016_20161114$`How many employees does your company or organization have?`[mental_heath_in_tech_2016_20161114$`How many employees does your company or organization have?`=="43105"] <- "1-5"
# confirming that the file is cleaned
table(mental_heath_in_tech_2016_20161114$`How many employees does your company or organization have?`)
