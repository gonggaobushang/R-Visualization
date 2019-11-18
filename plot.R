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

#
png("例子1.png",width=1200,height=800,res = 100)
plot(c(6,
       7.2,8,8.5,8,7,
       6.5,4.5,4,3,5,
       5.5)*100,type="l",xlab = "日期","ylab"="数值",lwd=3)
rect(2,300,12,850,col="#D3D3D3",density=10)
text(x=10,y=830,labels = "10日")
rect(7,300,12,650,col="#696969",density=20)
text(x=10,y=640,labels = "5日")
lines(c(10,12),c(300,550),col="red",lwd=4,lty=3)
lines(c(12,12),c(300,550),col="green",lwd=4,lty=3)
lines(c(10,12),c(300,300),col="blue",lwd=4,lty=3)
#text(x=12,y=555,labels = "F(M)")
text(x=10,y=290,labels = "F(K-5)")
lines(c(4,12),c(850,550),col="red",lwd=5,lty=4)
lines(c(4,4),c(550,850),col="green",lwd=5,lty=4)
lines(c(4,12),c(550,550),col="blue",lwd=5,lty=4)
text(x=12,y=555,labels = "F(M)")
text(x=4,y=860,labels = "F(K-10)")
dev.off()
