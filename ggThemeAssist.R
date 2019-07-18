#用鼠标选择ggplot2的框架
#返回代码
library(ggplot2)
library(ggThemeAssist)
gg <- ggplot(mtcars, aes(x = hp, y = mpg, colour = as.factor(cyl))) + geom_point()
ggThemeAssistGadget(gg)
#右上角的Done,自动输出代码
#中文最好要在代码输出后手动改