#The exponential distribution can be simulated in R with rexp(n, lambda) where lambda is the rate parameter. 
#The mean of exponential distribution is 1/lambda and the standard deviation is also 1/lambda. 
#Set lambda = 0.2 for all of the simulations. You will investigate the distribution of averages of 40 exponentials. 
#Note that you will need to do a thousand simulations

#central limit theorem (CLT) states that, given certain conditions, the arithmetic mean 
#of a sufficiently large number of iterates of independent random variables, each with a 
#well-defined expected value and well-defined variance, will be approximately normally 
#distributed, regardless of the underlying distribution

###
#Show the sample mean and compare it to the theoretical mean of the distribution
###
n <- 40
lamda <- 0.2
numSims <- 1000
set.seed(0)

meanSimExp <- NULL
for (i in 1 : numSims) meanSimExp <- c(meanSimExp, mean(rexp(n,lamda)))
#hist(meanSimExp)

#Calculating the mean of means
mean(meanSimExp)
expMean <- sum(meanSimExp)/numSims
expMean

###
#Show how variable the sample is (via variance) and compare it to the theoretical variance of the distribution.
###

#Theorectical
(1/lamda)^2

varianceSimExp <- NULL
for (i in 1 : numSims) varianceSimExp <- c(varianceSimExp, var(rexp(n,lamda)))
#hist(varianceSimExp, prob=TRUE, col = "grey")
#lines(density(varianceSimExp), col="blue", lwd=2)

mean(varianceSimExp)

###
#Show that the distribution is approximately normal.
###
#The sample mean is unbiased: the population mean of its distribution is the mean that it's
#trying to estimate.

hist(rexp(n,lamda))
mean(rexp(n,lamda))
# multiply each density by the difference in the breaks like this
#sum(diff(hist1$breaks) * hist1$density)



