###Casewise bootstrap for Galton’s table, Example 3.16.
### 2D histogram, M matrix with the table values
library(lattice)
library(latticeExtra)
cloud(M,xlab="parent",ylab="child",zlab="Freq",zoom=1.2,
par.settings=list(box.3d=list(col="transparent"))
,col.facet=grey(0.9),screen=list(z=40,x=-25),
panel.3d.cloud=panel.3dbars,panel.aspect=1.3,
aspect=c(1,1),xbase=0.6,ybase=0.6)
### bootstrap
library(UsingR)
data(galton)
attach(galton)
M <- lm(child~parent)
M$coeff[2]
boot <- function(x,y,B){
BB <- rep(0,B)
n <- length(y)
for( j in 1:B){
u <- sample(1:n,replace=T)
M <- lm(y[u]~x[u])
BB[j] <- M$coeff[2]}
return(BB)}
Bound <- sort(boot(parent,child,1000))[50]
