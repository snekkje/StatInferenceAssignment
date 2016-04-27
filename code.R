#The exponential distribution can be simulated in R with rexp(n, lambda) where lambda is the rate parameter. 
#The mean of exponential distribution is 1/lambda and the standard deviation is also 1/lambda. 
#Set lambda = 0.2 for all of the simulations. You will investigate the distribution of averages of 40 exponentials. 
#Note that you will need to do a thousand simulations

#Show the sample mean and compare it to the theoretical mean of the distribution
n <- 40
lamda <- 0.2
numSims <- 1000

meanSimExp <- NULL
for (i in 1 : numSims) meanSimExp <- c(meanSimExp, mean(rexp(n,lamda)))

hist(meanSimExp)
mean(meanSimExp)
expMean <- sum(meanSimExp)/numSims
expMean

#Show how variable the sample is (via variance) and compare it to the theoretical variance of the distribution.
#expVariance <- sum((meanSimExp - expMean)^2)/(numSims -1)
#expVariance

25/40

varianceSimExp <- NULL
for (i in 1 : numSims) varianceSimExp <- c(varianceSimExp, var(rexp(n,lamda)))
hist(varianceSimExp)
