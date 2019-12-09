### Nonparametric bootstrap hypothesis test, Example 3.13.
T <- abs(mean(X)-mean(Y)) ### observed test statistic
Z <- c(X,Y)
TB <- rep(0,1000)
for (j in 1:1000){
ZB <- sample(Z,replace=T);
TB[j] <- abs(mean(ZB[1:10])-mean(ZB[11:20]))}
length(TB[T<TB])/1000 ### approximated p-value
