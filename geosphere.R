# 画航线图
library(geosphere)
# 计算2点之间的中间点坐标
line_points_1 <- gcIntermediate(c(168,-50), c(168,90), n = 5, addStartEnd = TRUE)
class(line_points_1); 
line_points_1 # 返回5个中间点，2个端点，共7个点坐标
#多组点之间的中间点坐标
start_points <- rbind(c(168,-50), c(5,52)) 
end_points <- rbind(c(168,90), c(20,52))
line_points_2 <- gcIntermediate(start_points, end_points, n = 5, addStartEnd = TRUE)
class(line_points_2) # 默认返回list
line_points_2[[1]]; line_points_2[[2]] # 索引出来
rm(start_points, end_points, line_points_1, line_points_2)

library(tidyverse)
library(maps)
par(mar = c(0,0,0,0)) # 边距全部为0
# 坐标点
Buenos_aires <- c(-58,-34) # 布宜诺斯艾利斯
Paris <- c(2,49)           # 巴黎
Melbourne <- c(145,-38)    # 墨尔本
points_data <- rbind(Buenos_aires, Paris, Melbourne) %>% as.data.frame()
colnames(points_data) <- c("long","lat") 
# 计算中间点坐标
inter_points_1 <- gcIntermediate(Paris,  Buenos_aires, n = 50, addStartEnd = TRUE)
inter_points_2 <- gcIntermediate(Melbourne,  Paris, n = 50, addStartEnd = TRUE)   
## 地图底层
map('world', col = "grey", fill = TRUE, bg = "white", 
    lwd = 0.05, mar = rep(0,4), border = 0, ylim = c(-80, 80))
# 叠加曲线
lines(inter_points_1, col = "magenta", lwd = 2) # 从巴黎到布宜诺斯艾利斯
lines(inter_points_2, col = "magenta", lwd = 2) # 从墨尔本到巴黎
## 叠加点
points(x = points_data$long, y = points_data$lat, 
       col = "green", cex = 3, pch = 20)
## 叠加文字
text(x = points_data$long, y = points_data$lat,  
     labels = rownames(points_data), col = "blue", cex = 1, pos = 4)
