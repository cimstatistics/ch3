library(boot)
attach(bigcity)
F <- function(x,y){
n <- length(x)
u <- sample(1:n,replace=T)
data <- data.frame(x[u],y[u])
return(data)}
### percentile confidence interval ###
boot <- function(B){
theta <- rep(NA,B)
for (i in 1:B){
B <- F(u,x)
theta[i] <- mean(B$y)/mean(B$x)}
return(theta)}
B1 <- sort(boot(999))
LOW1 <- B1[25]
UP1 <- B1[975]
### basic bootstrap confidence interval ###
theta.hat <- mean(x)/mean(u); B2 <- sort(boot(999))
LOW2 <- 2*theta.hat-B2[975]; UP1 <- 2*theta.hat-B2[25]
### studentized bootstrap confidence interval ###
studb <- function(xb,ub,x,u){
tb <- mean(xb)/mean(ub)
varb <- mean((xb-ub*tb)^2)/mean(ub)^2
studb <- (mean(xb)/mean(ub)-mean(x)/mean(u))/sqrt(varb)
return(studb)}
bootstud <- function(B){
TB <- rep(NA,B)
for (i in 1:B){
B <- F(u,x)
TB[i] <- studb(B$y,B$x,x,u)}
return(TB)}
TS <- sort(bootstud(999));U <- TS[25]; L <- TS[975]
se <- sqrt(mean((x-u*theta.hat)^2)/mean(u)^2)
LOW3 <- theta.hat-se*L; UP3 <- theta.hat-se*U
