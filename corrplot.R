library(corrplot)
library(ggcorrplot)
library(ggplot2)
height <- c(6, 5.92, 5.58, 5.83)
wei <- c(20, 15, 7, 12)
cor(height, exp(height))
cor(height, wei)
# 展示系数矩阵,保留3位小数，
DT::datatable(round(cor(mtcars), 3), 
              options = list(pageLength = 11)) # 显示11行
ggcorrplot(cor(mtcars), method="circle")
mat_cor <- cor(mtcars)
library(showtext)
corrplot(mat_cor, title = "默认圆形全显示", # 默认method为圆形，默认type为full
                  mar = c(1,1,1,1)) # 指定边距，否则标题显示不完全
corrplot(mat_cor, method = "ellipse", type = "upper", title = "椭圆上三角",
                   mar = c(1,1,1,1))
corrplot(mat_cor, method = "number", type = "lower", title = "数字下三角",
                   mar = c(1,1,1,1))
corrplot(mat_cor, method = "circle", type = "upper", title = "圆形上三角",
                   mar = c(1,1,1,1))
corrplot(mat_cor, method = "square", type = "lower", title = "方形下三角",
                    mar = c(1,1,1,1))
corrplot(mat_cor, method = "shade", type = "full", title = "阴影全显示",
                   mar = c(1,1,1,1))
corrplot(mat_cor, method = "color", type = "upper", title = "颜色上三角",
                    mar = c(1,1,1,1))
corrplot(mat_cor, method = "pie", type = "lower", title = "饼图下三角",
                   mar = c(1,1,1,1))
color_1 <- colorRampPalette(c("cyan", "magenta"))
color_2 <- colorRampPalette(c("magenta", "cyan")) # 色板反向
palette_1 <- RColorBrewer::brewer.pal(n=11, name = "RdYlGn")
palette_2 <- rev(palette_1) # 色板反向
par(mfrow = c(2, 2))
corrplot(mat_cor, method = "number", col = "black", cl.pos = "n", 
                   title = "黑色数字", mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", col = color_1(10), 
                    title = "自定义颜色", mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", col = color_1(200), # 矩阵维度不够大，所以颜色没区别
                    title = "自定义颜色", mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", col = color_2(10), 
                    title = "色板反向", mar = c(1,1,1,1))
par(mfrow = c(1,1))
corrplot(mat_cor, method = "ellipse", col = palette_1,
                    title = "brewer.pal调色板", mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", col = palette_2,
                    title = "色板反向", mar = c(1,1,1,1)) 
corrplot(mat_cor, method = "ellipse", type = "lower", col = palette_2,
                  title = "默认显示对角线",diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", type = "lower", col = palette_2,
                   title = "不显示对角线", diag = FALSE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", type = "lower", col = palette_2,
                   title = "灰色背景", bg = "gray60", mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", type = "lower", col = palette_2,
                   title = "浅绿背景", bg = "lightblue", mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", col = palette_2,
                  title = "默认original顺序", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "AOE",  col = palette_2,
                   title = "AOE特征向量角序", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "FPC",  col = palette_2,
                   title = "FPC第一主成分顺序", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "hclust",  col = palette_2,
                   title = "hclust层次聚类顺序", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "alphabet",  col = palette_2,
                   title = "alphabet字母顺序", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "hclust",  col = palette_2,
        hclust.method = "complete", addrect = 1, rect.col = "blue", rect.lwd = 2,
       title = "hclust.method = \"complete\"", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "hclust",  col = palette_2,
       hclust.method = "ward", addrect = 2, rect.col = "blue", rect.lwd = 2,
        title = "hclust.method = \"ward\"", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "hclust",  col = palette_2,
       hclust.method = "single", addrect = 3, rect.col = "blue", rect.lwd = 2,
         title = "hclust.method = \"single\"", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "hclust",  col = palette_2,
      hclust.method = "average", addrect = 4, rect.col = "blue", rect.lwd = 2,
         title = "hclust.method = \"average\"", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "hclust",  col = palette_2,
      hclust.method = "mcquitty", addrect = 2, rect.col = "blue", rect.lwd = 2,
            title = "hclust.method = \"mcquitty\"", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "hclust",  col = palette_2,
       hclust.method = "median", addrect = 2, rect.col = "blue", rect.lwd = 2,
       title = "hclust.method = \"median\"", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "hclust",  col = palette_2,
 hclust.method = "centroid", addrect = 2, rect.col = "blue", rect.lwd = 2,
 title = "hclust.method = \"centroid\"", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "AOE",  col = palette_2, 
                 addCoef.col = "blue",
                title = "添加蓝色系数值", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "AOE",  col = palette_2, 
                   addCoef.col = "gray20",
                   title = "添加灰色系数值", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "AOE",  col = palette_2, 
                   addCoef.col = "blue", addCoefasPercent = TRUE,
                   title = "添加蓝色百分比系数", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "AOE",  col = palette_2, 
                    addCoef.col = "gray20", addCoefasPercent = TRUE,
                    title = "添加灰色百分比系数", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "AOE",  col = palette_2, 
                  addCoef.col = "gray20", addCoefasPercent = TRUE, cl.pos = "r", 
                 title = "图例在右边", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "AOE",  col = palette_2, 
                   addCoef.col = "gray20", addCoefasPercent = TRUE, cl.pos = "b", 
                   title = "图例在底部", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "AOE",  col = palette_2, 
                   addCoef.col = "gray20", addCoefasPercent = TRUE, cl.pos = "n", 
                   title = "无图例", diag = TRUE, mar = c(1,1,1,1))
# tl.pos只有在混合布局的时候才有意义
corrplot(mat_cor, method = "ellipse", order = "AOE",  col = palette_2, 
                  addCoef.col = "gray20", addCoefasPercent = TRUE, cl.pos = "r", 
                tl.pos = "lt",tl.cex = 2, tl.col = "blue",
                 title = "蓝色变量文本", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", order = "AOE",  col = palette_2, 
                   addCoef.col = "gray20", addCoefasPercent = TRUE, cl.pos = "r", 
                   tl.pos = "n",
                   title = "无变量文本", diag = TRUE, mar = c(1,1,1,1))
corrplot(mat_cor, method = "shade", order = "AOE", col = palette_2, 
                  addshade = "negative", shade.lwd = 1, shade.col = "blue",   
                  title = "蓝色负阴影", mar = c(1,1,1,1))
corrplot(mat_cor, method = "shade", order = "AOE", col = palette_2, 
                  addshade = "positive", shade.lwd = 1, shade.col = "blue", 
                 title = "蓝色正阴影", mar = c(1,1,1,1))
corrplot(mat_cor, method = "shade", order = "AOE", col = palette_2, 
                   shade.lwd = 1, shade.col = "blue", 
                  title = "默认全阴影", mar = c(1,1,1,1))
res1 <- cor.mtest(mtcars, conf.level = .95)
corrplot(mat_cor, method = "circle",  col = palette_2,
                   p.mat = res1$p, sig.level = 0.01, 
                   title = "增加显著性标记", mar = c(1,1,1,1))
corrplot(mat_cor, method = "circle",  col = palette_2,
    p.mat = res1$p, sig.level = 0.01, insig = "pch", pch.col = "blue", pch.cex = 3,
              title = "蓝色显著性标记", mar = c(1,1,1,1))
corrplot(mat_cor, method = "ellipse", type = "upper", order = "AOE", 
                  col = palette_2, tl.pos = "d",
                  title = "上椭圆下百分比混合布局", mar = c(1,1,1,1))
corrplot(mat_cor, method = "number", type = "lower", order = "AOE", col = palette_2,
         add = TRUE, diag = FALSE, tl.pos = "n", addCoefasPercent = TRUE, cl.pos = "n", 
         mar = c(1,1,1,1))
corrplot(mat_cor, method = "pie", type = "lower", order = "AOE", 
         col = palette_2, tl.pos = "tp", tl.col = "blue", cl.pos = "r", 
         title = "上数字下饼图混合布局", mar = c(1,1,1,1))
corrplot(mat_cor, method = "number", type = "upper", order = "AOE", col = palette_2,
         add = TRUE, diag = FALSE, tl.pos = "n", cl.pos = "n", 
         mar = c(1,1,1,1))
# 更改字体
windowsFonts(YaHei_rontine = windowsFont("微软雅黑"),
            Time_NewR = windowsFont("Times New Romans 常规"))
font_add("YaHei_rontine", regular = "msyh.ttc", bold = "msyhbd.ttc")
font_add("Time_NewR", "times.ttf", 
                   bold = "timesbd.ttf", 
                   italic = "timesi.ttf", 
                   bolditalic = "timesbd.ttf")
showtext_auto()
mytheme <- theme_bw() +
    theme(
        plot.title = element_text(colour = "blue", hjust = 0.5, size = 20), 
        legend.text = element_text(colour = "blue"), 
        legend.title = element_text(family = "YaHei_rontine", colour = "blue"), 
        legend.position = "bottom", legend.direction = "horizontal"
        )
ggcorrplot(mat_cor, 
                        method="circle", 
                        hc.order = TRUE, 
                        type = "lower", 
                        lab = TRUE,  # 显示相关系数
                        lab_col = "blue", lab_size = 3, 
                        colors = c("cyan", "white", "magenta"), 
                       tl.cex = 10, tl.col = "blue", digits = 1, 
                       title="下三角圆形，hclust排列", 
                       legend.title = "相关系数", 
                        ggtheme = theme_bw())
ggcorrplot(mat_cor, 
                       method="circle", 
                       hc.order = TRUE, 
                       type = "lower", 
                       lab = TRUE,  # 显示相关系数
                       lab_col = "blue", lab_size = 3, 
                       colors = c("cyan", "white", "magenta"), 
                       tl.cex = 10, tl.col = "blue", digits = 1, 
                       title="自定义主题", 
                       legend.title = "相关系数", 
                       ggtheme = mytheme)
p_mat <- cor_pmat(mtcars)
ggcorrplot(mat_cor, 
                   method="circle", hc.order = TRUE, type = "lower", 
                     lab = TRUE,  lab_col = "blue", lab_size = 3, # 显示相关系数
                     colors = c("cyan", "white", "magenta"), 
                     tl.cex = 10, tl.col = "blue", digits = 1, 
                     title="显著性标记", 
                     legend.title = "相关系数", 
                     p.mat = p_mat, 
                      ggtheme = theme_bw())
ggcorrplot(mat_cor, 
                        hc.order = TRUE, type = "full", 
                        colors = c("cyan", "white", "magenta"), 
                        tl.cex = 10, tl.col = "blue", digits = 1, 
                        title="低于p值为空", 
                        legend.title = "相关系数", 
                        p.mat = p_mat, insig = "blank", 
                        ggtheme = theme_bw())

ggcorrplot(mat_cor, 
                       method="circle", hc.order = TRUE, type = "upper", 
                        colors = c("cyan", "white", "magenta"), 
                        tl.cex = 10, tl.col = "blue", digits = 1, 
                        title="红色显著性标记", 
                        legend.title = "相关系数", 
                        p.mat = p_mat, insig = "pch", pch.col = "red", pch.cex = 4, 
                        ggtheme = theme_bw())
