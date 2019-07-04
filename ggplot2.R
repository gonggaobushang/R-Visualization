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