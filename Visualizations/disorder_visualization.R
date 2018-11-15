library(dplyr)
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
# View(tmp2)

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

p <- ggplot(data=subdataf, aes(x = reorder_size(V1)))+
  geom_bar(fill = 'black')+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

p+xlab("Current Mental health disorders")+ggtitle("Distribution of current Mental health disorders")

count_disorder <-data.frame(count(subdat, V1, sort = TRUE))
View(count_disorder)

#combi = na.action(comb,rm)

# tmp2 %>% select(matches('mhd_[1-9]')) %>% str()
# tmp_newrow = tmp2 %>% unite(disorders,sep = '',remove =TRUE)
# View(tmp_newrow)

# typeof(health$mhd)
# tmp1 = separate_rows(health,mhd,sep = '\\|')
# tmp4 = as.character(health$mhd)
# tmp3 = strsplit(tmp4, "\\|")
# tmp3
#write.csv(tmp, "mentalsurvey_separator.csv", row.names=FALSE)



