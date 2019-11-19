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

#
pdf_file <- "barcharts_simple.pdf"
cairo_pdf(bg = "grey98", pdf_file, width = 9, height = 6.5)
#R基础绘图系统依赖于全局绘图参数设置，设置后的影响之后的所有绘图输出
#因此最好的习惯是先用opar = par()存下当前全局绘图参数
#在绘图结束后调用par(opar)恢复原设置。
opar <- par()
par(
    omi = c(0.65, 0.25, 0.75, 0.75),#下、左、上、右外边距
    mai = c(0.3, 1.5, 0.35, 0),#绘图区的边距
    mgp = c(3, 3, 0),#标题、坐标轴标签和坐标轴距离绘图区边缘
    #family = 'Arial',
    las = 1#坐标轴标签方向，“1”表示始终水平放置标签
  )
barplot(c(1:10), names.arg = FALSE,#不自动标记条形名称
        horiz = TRUE,#水平绘制条形图
        border = NA, #条形无边框
        xlim = c(0,12), col = "grey", axes = FALSE)
text(x = 10, y = 10, labels = "Country", adj = 1,#使条形名称右对齐
     xpd = TRUE,#表示绘图区域扩展到原设定的绘图区外
     cex = 1.5)#缩放
xleft <- seq(0, 12, length.out = 5)
xright <- seq(2, 10, length.out = 5)
ybottom <- rep(0, 5)
ytop <- rep(14.3, 5)
col_name <- ifelse(1:5%%2 == 1, rgb(191, 239, 255, 80, maxColorValue = 255), 
    rgb(191, 239, 255, 120, maxColorValue = 255))
rect(xleft, ybottom, xright, ytop, col = col_name, border = NA)
col <- rgb(255, 0, 210, maxColorValue = 255)
  barplot(c(1:10), names.arg = FALSE, horiz = TRUE, border = NA, xlim = c(0,
  10), col = col, cex.names = 0.85, axes = FALSE, 
  add = TRUE)#增添
arrows(0, 9, 10, lwd = 1.5, length = 0, xpd = TRUE, col = "skyblue3")
arrows(2, -2, 9, 11, lwd = 3, length = 0, xpd = TRUE)
arrows(2, -2, 9, 12, lwd = 3, length = 1, xpd = TRUE)
text(9, 13, "Average", adj =3, xpd = TRUE, cex = 0.65, font = 5)
xlab <- c(0, 2, 4, 6, 8, 10)
mtext(xlab, at = xlab, 1, line = -1, cex = 0.8)
#mtext设置坐标轴标签、图形主标题、副标题和数据来源
mtext(xlab, at = xlab, 1, line = 1, cex = 0.8)
mtext("xlab", 3, line = 0.5,#到绘图区的距离
      adj = 0.5,#参数控制文本左右位置，0表示居左，1表示居右，0.5表示居中
      cex = 1.2, outer = TRUE)#可以延伸到外边距
par(opar)
dev.off()

# 
# 条形的长度
bar_data <- c(70.1, 84.7, 84.8, 35, 33.1, 47.2, 76.4)
## 条形标签，不能放在一行的需要用“\n”手动换行
myC_v159 <- "A working mother can establish just as warm and\nsecure environment as a non-working mother"
myC_v160 <- "A pre-school child is likely to suffer if\nhis or her mother is working"
myC_v161 <- "A job is alright but what most women\nreally want is a home and children"
myC_v162 <- "Being a housewife is just as fulfilling as\nworking"
myC_v163 <- "Having a job is the best way for a woman\nto be independent"
myC_v164 <- "Both the husband and wife should contribute\nto the family income"
myC_v165 <- "In general, fathers are as well suited to\nlook after their children as women"
myC_v166 <- "Men should take as much responsibility\nas women for their household and children"
names <- c(myC_v165, myC_v164, myC_v163, myC_v162, myC_v161, myC_v160, myC_v159)
# 主图
y <- barplot(bar_data, col = 'grey', border = NA, 
             horiz = TRUE, names.arg = FALSE, axes = FALSE,
             xlim = c(0, 100))
# 标签
font_name <- ifelse(1:7 == 3, 'Arial Black', 'Arial')
for (i in 1:7) {
  if(i == 3) next()
  text(-3, y[i], labels = names[i], xpd = TRUE, 
       adj = 1, family = font_name[i])
  text(10, y[i], labels = format(bar_data[i], nsmall = 1), adj = 0.5,
       family = font_name[i])
}
xleft <- seq(0, 80, length.out = 5)
xright <- seq(20, 100, length.out = 5)
ybottom <- rep(0, 5)
ytop <- rep(8.6, 5);y[7]<8.6
bg_col <- ifelse(1:5 %% 2 == 1,  
                 rgb(191,239,255,80, maxColorValue=255),
                 rgb(191,239,255,120, maxColorValue=255))
rect(xleft, ybottom, xright, ytop, border = NA, col = bg_col)
bar_high_light <- ifelse(1:7 == 3, bar_data, 0)
barplot(bar_high_light, horiz = TRUE, names.arg = FALSE, border = FALSE,
        col = rgb(255, 0, 210, maxColorValue = 255), axes = FALSE,
        add = TRUE)#图层叠加
text(-3, y[3], labels = names[3], xpd = TRUE,
     adj = 1, family = font_name[3])
text(10, y[3], labels = format(bar_data[3], nsmall = 1), adj = 0.5,
     family = font_name[3])
arrows(50, 0, 50, 8.7, lwd = 1.5, col = 'skyblue', 
       length = 0, xpd = TRUE)
arrows(50, -0.25, 50, 0, lwd = 3, col = 'black', 
       length = 0, xpd = TRUE)
arrows(50, 8.7, 50, 8.95, lwd = 3, col = 'black', 
       length = 0, xpd = TRUE)
text(48, 8.7, labels = 'Mojority', adj = 1, cex = 0.9, 
     font = 3, xpd = TRUE)
text(52, 8.7, labels = '50%', adj = 0, cex = 0.9, 
     font = 3, xpd = TRUE)
text(100, 8.7, labels = 'all value in percent', adj = 1, 
     cex = 0.9, font = 3, xpd = TRUE)
mtext(seq(0, 100, length.out = 6), 
      at = seq(0, 100, length.out = 6), side = 1,
      line = 0, cex = 0.9)
mtext('It is often said that attitudes towards gender roles are changing',
      side = 3, line = 2, cex = 1.8, adj = 0, 
      family = 'Arial Black', outer = TRUE)
mtext('Agree strongly/Agree', side = 3, line = 0, cex = 1.5, 
      adj = 0, outer = TRUE)
mtext('Source: European Values Study 2008 Germany, ZA4753. www.gesis.org. Design: Stefan Fichtel, ixtract',
      side = 1, line = 0.7, adj = 1, cex = 0.9, 
      outer = TRUE)
data <- c(
  5,27,42,23,3,
  3,38,47,9,3,
  3,44,41,10,2,
  7,7,28,32,26,
  7,6,27,35,25,
  5,14,33,31,17,
  3,39,36,15,7
)
za4753 <- t(matrix(data, nrow = 7, byrow = TRUE))
responses <- c("n.a./don’t know", "agree strongly", 
               "agree", "disagree", "disagree strongly")
# labels
myC_v159 <- "A working mother can establish just as warm and\nsecure environment as a non-working mother"
myC_v160 <- "A pre-school child is likely to suffer if\nhis or her mother is working"
myC_v161 <- "A job is alright but what most women\nreally want is a home and children"
myC_v162 <- "Being a housewife is just as fulfilling as\nworking"
myC_v163 <- "Having a job is the best way for a woman\nto be independent"
myC_v164 <- "Both the husband and wife should contribute\nto the family income"
myC_v165 <- "In general, fathers are as well suited to\nlook after their children as women"
myC_v166 <- "Men should take as much responsibility\nas women for their household and children"
names <- c(myC_v165, myC_v164, myC_v163, myC_v162, 
           myC_v161, myC_v160, myC_v159)
# 主图 颜色
col01 <- rgb(0,208,226, maxColorValue =255)
col02 <- rgb(109,221,225, maxColorValue =255)
col03 <- rgb(255,138,238, maxColorValue =255)
col04 <- rgb(255,0,210, maxColorValue =255)
col_name <- c('grey', col01, col02, col03, col04)
##绘图
y <- barplot(za4753, names.arg = names, border = NA, horiz = TRUE,
             col = col_name, axes = FALSE, xlim = c(0, 100), cex.names = 1.1)
#其它绘图元素
xl_mark <- c(2, 8, 37, 64, 98)
yl_mark <- rep(9.0, 5)
xl_lab <- c(-1, 25, 46, 61, 95)
yl_lab <- rep(9.0, 5)
points(xl_mark, yl_mark, pch = 15, cex = 4, col = col_name, xpd = TRUE)
text(xl_lab, yl_lab, labels = responses, adj = 1, xpd = TRUE, font = 3)
x_label <- c(0, 20, 40, 60, 80, 100)
mtext(x_label, side = 1, at = x_label, line = 0, cex = 0.95)
mtext('It is often said that attitudes towards gender roles are changing',
      side = 3, line = 6.5, cex = 1.8, adj = 0, family = 'Arial Black', outer = TRUE)
mtext('Agree strongly/Agree', side = 3, line = 3.5, cex = 1.5, adj = 0, outer = TRUE)
mtext('Source: European Values Study 2008 Germany, ZA4753. www.gesis.org. Design: Stefan Fichtel, ixtract',
      side = 1, line = 4.5, adj = 1, cex = 0.9)
mtext('all value in percent', side = 1, line = 1.5, cex = 0.9, adj = 1, font = 3)
mtext('N = 2075', side = 1, line = 1.5, cex = 0.9, adj = 0, font = 3)
