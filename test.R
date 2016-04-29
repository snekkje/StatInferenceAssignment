library(datasets); data(ChickWeight); library(reshape2)
##define weight gain or loss
head(ChickWeight)

wideCW <- dcast(ChickWeight, Diet + Chick ~ Time, value.var = "weight")
head(ChickWeight)
names(wideCW)[-(1 : 2)] <- paste("time", names(wideCW)[-(1 : 2)], sep = "")
head(ChickWeight)
library(dplyr)
wideCW <- mutate(wideCW,
                 gain = time21 - time0
)
head(ChickWeight)
