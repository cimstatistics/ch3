Casewise resampling
function(x,y){
n <- length(x)
data <- data.frame(x,y)
for(i in 1:n){
u <- ceiling(runif(1,0,n))
data[i,1] <- x[u]
data[i,2] <- y[u]}
return(data)}
