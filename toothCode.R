library(datasets)
library(dplyr)
library(ggplot2)
library(reshape2)

# --- Loading and preprocessing the data ---
#############################################
data("ToothGrowth")

# --- basic exploratory data analyses --- 
#########################################
#The response is the length of odontoblasts (teeth) in each of 10 guinea 
#pigs at each of three dose levels of Vitamin C (0.5, 1, and 2 mg) with each 
#of two delivery methods (orange juice or ascorbic acid).
#head(ToothGrowth,60)
#str(ToothGrowth)
ggplot(ToothGrowth, aes(dose, len)) + geom_point() + facet_grid(~ supp)

melted <- melt(ToothGrowth, id.vars=c("supp", "dose"))
head(melted)
grouped <- group_by(melted,supp,dose)
str(grouped)
summarise(grouped, mean=mean(value), sd=sd(value))

groupDose1 <- filter(grouped,dose == 0.5)
t.test(value ~ supp, paired = FALSE, data = groupDose1)

groupDose2 <- filter(grouped,dose == 1.0)
t.test(value ~ supp, paired = FALSE, data = groupDose2)

groupDose3 <- filter(grouped,dose == 2.0)
t.test(value ~ supp, paired = FALSE, data = groupDose3)


#qplot(factor(supp), len, data = ToothGrowth, geom = "violin")