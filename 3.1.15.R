### Stroke data, Example 3.2.
p1 <- 119/11037; n1 <- 11037; p2 <- 98/11034; n2 <- 11034
boot1 <- function(p1,n1,p2,n2,B){
theta <- rep(NA,B);
for(i in1:B){
x1 <- rbinom(1,n1,p1)
x2 <- rbinom(1,n2,p2)
theta[i] <- (x1*n2)/(x2*n1)
}
return(theta)}
R <- sort(boot1(p1,n1,p2,n2,1000))
R[25]; R[975]
