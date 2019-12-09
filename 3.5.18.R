### Model-based bootstrap, Example 3.14.
x2 <- x*x
M <- lm(y~x+x2-1) ### regression without intercept
R <- M$resid-mean(M$resid) ### normalizing residuals
B <- 1000
B2 <- rep(0,B)
for (j in 1:B){
yb <- M$fit+sample(R,replace=T)
Mb <- lm(yb~x+x2-1)
B2[j] <- Mb$coef[2]}
