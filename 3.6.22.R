### Stationary bootstrap, Example 3.3.
### simulate an AR(1) time series
T <- arima.sim(n = 1000, list(ar = c(0.8)), sd = sqrt(0.1796))
acf(TS) ### autocorrelation for the choice of the block length
library(boot)
stat <- function(TS){TS}
### one bootstrapped time series block length geometrical
### distributed with EX=l
TB <- tsboot(TS,stat,sim="geom",R=1,l=5,n.sim=100,orig.t=FALSE)
### estimator in AR(1)
stat2 <- function(T){arima(T,c(1,0,0),include.mean=F)$coef[1]}
TB2 <- tsboot(TS,stat2,sim="geom",R=1000,l=5
,n.sim=100,orig.t=TRUE)
TB2$t ### 1000 bootstrap replications of the estimator
