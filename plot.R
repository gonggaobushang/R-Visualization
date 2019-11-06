u <- 10
u1 <- 20
u2 <- 30

x1 <- seq(from=1,to=200,by=1)
x2 <- (u/sqrt(x1))^2
x3 <- (u1/sqrt(x1))^2
x4 <- (u2/sqrt(x1))^2

plot(x=x1,y=x2,type="l", col="red")
lines(x=x1,y=x3,type="l", col="green")
lines(x=x1,y=x4,type="l", col="black")
title("cobb")
legend(100,100,c("u=10","u=20","u=30"),col=c("red","green","black"),
       lty = c(1,1,1), merge = TRUE, bg='gray90')