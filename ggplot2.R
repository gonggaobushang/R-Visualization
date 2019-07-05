#双坐标轴
a=data.frame(EIA=c(50:60+10*rnorm(11)),WTI=c(600:610+100*rnorm(11)),
             X=c("2010-9-1","2010-9-2","2010-9-3","2010-9-4",
                 "2010-9-5","2010-9-6","2010-9-7","2010-9-8",
                 "2010-9-9","2010-9-10","2010-9-11"))
library(ggplot2)
zz=a$EIA/
  ((max(a$EIA)-min(a$EIA))/(max(a$WTI)-min(a$WTI)))
png("V1.png",width=1200,height=800,res = 200) #清晰度
PP=ggplot()+
  geom_line(data=a,aes(x=as.Date(X),y=WTI,color="WTI"),size=1)+
  geom_line(data=a,aes(x=as.Date(X),y=EIA/
                         ((max(EIA)-min(EIA))/(max(WTI)-min(WTI)))-
                         (max(zz)-max(WTI)),
                       color="EIA"),size=1)+
  scale_colour_manual("",values = c("WTI" = "red","EIA"="blue"))+ #重设颜色
  scale_y_continuous(
    sec.axis = sec_axis( ~scales::rescale(.,c(min(a$EIA),max(a$EIA))), 
                         name = "另一个尺度"))+
  theme(panel.background = element_rect(fill = "transparent",colour ="black"), 
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        plot.background = element_rect(fill = "transparent",colour = NA),
        legend.position="bottom",legend.title = element_blank(),
        legend.background=element_blank(),
        legend.key =element_blank(),
        legend.box.background=element_blank()
  ) +
  labs(x="",y="",title="") 
print(PP)
dev.off()


#ggplot2中自带的主题
mtcars2 <- within(mtcars, {   #可以修改原表达式
  vs <- factor(vs, labels = c("V-shaped", "Straight"))
  am <- factor(am, labels = c("Automatic", "Manual"))
  cyl  <- factor(cyl)
  gear <- factor(gear)
})
p1 <- ggplot(mtcars2) +
  geom_point(aes(x = wt, y = mpg, colour = gear)) +
  labs(title = "Fuel economy declines as weight increases",
       subtitle = "(1973-74)",
       caption = "Data from the 1974 Motor Trend US magazine.",
       tag = "Figure 1",
       x = "Weight (1000 lbs)",
       y = "Fuel economy (mpg)",
       colour = "Gears")
p1+theme_grey() #默认的主题
p1+theme_gray()
p1+theme_bw()
p1+theme_linedraw()
p1+theme_light()
p1+theme_dark()
p1+theme_minimal()
p1+theme_classic()
p1+theme_void()
p1+theme_test()
