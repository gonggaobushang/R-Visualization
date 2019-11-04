library(visreg)
library(ggplot2)

set.seed(1)
x1 <- rnorm(100)
x2 <- rnorm(100, sd = 2)
x3 <- rnorm(100, sd = 1.7) + 0.3
cat <- sample(c(0, 1), 100, replace = TRUE)
e <- rnorm(100, mean = 2, sd = 1)
y0 <- 2 + 0.5 * x1 + 2.4 * x2 + 1.2 * x1 * x2 + e
y1 <- 0.8 + 1.7 * x1 + 1.4 * x2 + 0.5 * x1 * x2 + e
y <- ifelse(cat == 0, y0, y1)
data <- data.frame(y, x1, x2, x3, cat = as.factor(cat))

GGally::ggpairs(data)

reg01 <- lm(y ~ x1 + x2 + x3 + cat, data = data)
reg02 <- lm(y ~ x1 + x2 + x1 * x2 + x3 + cat, data = data)
reg_cat0 <- lm(y ~ x1 + x2 + x1 * x2 + x3, data = data[data$cat == 0, ])
reg_cat1 <- lm(y ~ x1 + x2 + x1 * x2 + x3, data = data[data$cat == 1, ])
texreg::htmlreg(list(reg01, reg02, reg_cat0, reg_cat1), single.row = TRUE)

par(mfrow = c(2, 2))  ##reg01模型中有四个变量，设置为2 x 2的图
visreg(reg01)#前两个参数分别为fit和xvar，前者为模型估计结果，后者为绘图的自变量
visreg(reg01, "x1")
visreg(reg01, "cat")
visreg(reg01, "x1", by = "cat")
visreg(reg01, "x1", by = "cat", overlay = TRUE)#图层叠加
visreg(reg01, "x1", by = "x2", breaks = 4, 
       layout = c(2, 2))#做图顺序

visreg2d(reg02, "x1", "x2")
visreg2d(reg02, "x1", "x2", 
         plot.type = "persp")#绘制3D表面图
visreg2d(reg02, "x1", "x2", plot.type = "rgl")
visreg(reg01, "x1", gg = TRUE)
visreg(reg01, "x1", gg = TRUE, line = list(col = "red"),
       fill = list(fill = "green"), 
       points = list(size = 3, pch = 24))
library(ggthemes)
visreg(reg01, "x1", gg = TRUE) + 
  geom_smooth(method = "loess", col = "blue", 
        fill = "#FF4E37") + theme_economist()
#以上都是最小二乘法

#广义最小二乘
data("birthwt", package = "MASS")
fit <- glm(low ~ age + race + smoke + lwt, data = birthwt, family = "binomial")
visreg(fit, "lwt", gg = TRUE, 
       xlab = "Mother's weight", ylab = "Log odds (low birthweight)")
visreg(fit, "lwt", scale = "response", gg = TRUE, xlab = "Mother's weight", 
       ylab = "P(low birthweight)")

#随机森林
library(randomForest)
aq <- na.omit(airquality)
fit <- randomForest(Ozone ~ Solar.R + Wind + Temp, data = aq)
visreg(fit, "Temp", gg = TRUE, ylab = "Ozone")

#向量机
library(e1071)
fit <- svm(Ozone ~ Solar.R + Wind + Temp, data = aq)
visreg(fit, "Temp", ylab = "Ozone")

#梯度下降模型
residuals.gbm <- function(fit) {
  fit$data$y - fit$fit
}
library(gbm)
fit <- gbm(Ozone ~ Solar.R + Wind + Temp, data = aq, distribution = "gaussian")
visreg(fit, "Temp", ylab = "Ozone")
