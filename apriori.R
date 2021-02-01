setwd("D://不明觉厉/自用/2021-self-study/0122大乐透")
install.packages("arules")
library(arules)
library(readxl)
d<-read_excel('./大乐透.xls',sheet = '大乐透')
head(d)
d1 <- d[3:9]
head(d1)
head(d1)
d1$前区1 <- as.factor(d1$前区1)
d1$前区2 <- as.factor(d1$前区2)
d1$前区3 <- as.factor(d1$前区3)
d1$前区4 <- as.factor(d1$前区4)
d1$前区5 <- as.factor(d1$前区5)
d1$后区1 <- as.factor(d1$后区1)
d1$后区2 <- as.factor(d1$后区2)
head(d1)
trans = as(d1,"transactions")
inspect(trans[1:7])
m0 <- apriori(trans)
inspect(m0)
m0
rules = apriori(trans,parameter = list(
  support=0.005,
  confidence = 0.5,
  minlen=2
))
rules
#rules1 <- subset(rules)
inspect(rules)
inspect(rules1)
inspect(sort(rules,by="lift")[1:15])
#install.packages("arulesViz")
library(arulesViz)
library(RColorBrewer)
plot(rules, method="scatterplot",control=list(jitter=2, col = rev(brewer.pal(9, "Greens"))), shading = "lift")
plot(rules, method="grouped",control=list(col = rev(brewer.pal(9, "Greens")[4:9])))
plot(rules, measure="confidence", method="graph",control=list(type="items"), shading = "lift")
