### Sample median, Example 3.1.
x <- rcauchy(11,0,1)### sample from a cauchy distribution
median(x) ### sample median
B<-999
mboot <- rep(1:B)
for(j in 1:B){
mboot[j] <- median(sample(x,replace=T))
}
mean(mboot)-median(x) ### bootstrap estimator of the bias
−4
