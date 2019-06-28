#图像处理
library(magick)
rm(list=ls())
out1 <- image_blur(logo, 3)
out2 <- image_oilpaint(logo, 3)
input <- c(logo, out1, out2, logo) #数据类型为magick-image
logo <- image_read("https://jeroen.github.io/images/Rlogo.png")
oldlogo <- image_read("https://developer.r-project.org/Logo/Rlogo-3.png")
both <- image_scale(c(oldlogo, logo), "400")  #进行浏览
image_average(image_crop(both)) #单独的帧
image_animate(image_morph(both, 100)) #转化为gif 合并帧；中间的用于扩展帧
banana <- image_read("https://jeroen.github.io/images/banana.gif")
length(banana) #8个帧
image_average(banana) #平均为单独的帧
image_flatten(banana) #合并为单独的帧
image_append(banana) #从左到右堆叠图像
image_append(banana, stack = TRUE) #从上到下堆叠图像
wizard <- image_read("wizard:")
image_composite(banana, image_scale(logo, "300"))
front <- image_scale(banana, "300")
background <- image_background(image_scale(logo, "400"), 'white')
frames <- image_apply(front, function(x){image_composite(background, x, offset = "+70+30")})
image_animate(frames, fps = 10)  #合并帧
logo <- image_read("logo:")
image_modulate(logo, brightness = 200) #调整亮度
image_modulate(logo, saturation = 150) #调整饱和度
image_modulate(logo, hue = 200) #调整色调
image_quantize(logo, max = 10, colorspace = 'gray') #减少某一颜色
image_quantize(logo, max = 10, colorspace = 'rgb')
image_quantize(logo, max = 10, colorspace = 'cmyk')
translogo <- image_transparent(logo, 'white') #将近似匹配给定颜色的像素设置为透明。
image_background(translogo, "pink", flatten = TRUE) #设置背景颜色
image_fill(logo, "pink", fuzz = 20)
image_colorize(logo, 50, "red") #使用指定的不透明度覆盖纯色框架
image_contrast(logo) #增强图像的强度差异
image_normalize(logo) #通过将像素值标准化以跨越整个颜色范围来增加对比度
image_enhance(logo) #尽量减少噪音
image_equalize(logo) #使用直方图均衡来均衡
image_median(logo) #用圆形邻域中的中间颜色替换每个像素
image_convert(logo, type = 'grayscale')
imlogo <- image_scale(image_read("logo:"), "x275")
rlogo <- image_read("https://developer.r-project.org/Logo/Rlogo-3.png")
image_composite(imlogo, rlogo) #叠加
image_composite(imlogo, rlogo, operator = "blend", compose_args="50")
image_border(imlogo, "red", "10x10")
image_frame(imlogo)
frink <- image_read("https://jeroen.github.io/images/frink.png")
fig <- image_graph(res = 96)
ggplot2::qplot(mpg, wt, data = mtcars, colour = cyl)
dev.off()
out <- image_composite(fig, frink, offset = "+70+30") #在已经out的viwer中叠加
print(out)
img <- image_draw(frink)#设置边距为0，用图形坐标来匹配图像大小(以像素为单位,宽度x高度)，(0,0)是左上角
rect(20, 20, 200, 100, border = "red", lty = "dashed", lwd = 5)
abline(h = 300, col = 'blue', lwd = '10', lty = "dotted")
text(10, 250, "Hoiven-Glaven", family = "monospace", cex = 4, srt = 90)
palette(rainbow(11, end = 0.9))
symbols(rep(200, 11), seq(0, 400, 40), circles = runif(11, 5, 35),
        bg = 1:11, inches = FALSE, add = TRUE)
dev.off()
print(img)
frink <- image_read("https://jeroen.github.io/images/frink.png")
worldcup_frink <- image_fill(frink, "orange", "+100+200", 20)
image_write(worldcup_frink, "output.png") #输出
image_blank(600, 400, "green")
image_blank(600, 400, pseudo_image = "radial-gradient:purple-yellow")
#各种稀奇古怪的高级应用
logo <- image_read("logo:")
image_despeckle(logo)
image_reducenoise(logo)
image_noise(logo)
image_blur(logo, 10, 10)
image_charcoal(logo)
image_oilpaint(logo, radius = 3)
image_emboss(logo)
image_implode(logo)
image_negate(logo)
logo <- image_read("logo:")
image_annotate(logo, "Some text", location = geometry_point(100, 200), size = 24) #添加注释
image_crop(logo, geometry_area(300, 300), repage = FALSE) #修剪
image_crop(logo, geometry_area(300, 300, 100, 100), repage = FALSE)
image_resize(logo, geometry_size_pixels(300)) #调整
image_resize(logo, geometry_size_pixels(height = 300))
image_resize(logo, geometry_size_pixels(300, 300, preserve_aspect = FALSE))
image_resize(logo, geometry_size_percent(50))
image_resize(logo, geometry_size_percent(50, 20))
logo <- image_read("logo:")
logo <- image_background(logo, 'white')
image_fill(logo, "pink", point = "+450+400") #绘制起点和大致相同颜色的所有相邻像素来执行泛洪填充
image_fill(logo, "pink", point = "+450+400", fuzz = 25)
image_annotate(logo, "This is a test") # 添加注释
image_annotate(logo, "CONFIDENTIAL", size = 50, color = "red", boxcolor = "pink",
               degrees = 30, location = "+100+100")
image_annotate(logo, "The quick brown fox", font = "monospace", size = 50)
img <- image_quantize(logo, 4)
layers <- image_split(img) #根据像素强度分割图像
image_fuzzycmeans(logo) #模糊c-均值分割颜色分量的直方图
test <- image_convert(logo, colorspace = "Gray")
image_threshold(test, type = "black", threshold = "50%") #强制低于阈值的所有像素变为黑色
image_threshold(test, type = "white", threshold = "50%")#强制低于阈值的所有像素变为白色
image_lat(test, geometry = '10x10+5%')#像素值大于平均值减去偏移量，在像素邻域周围的框(宽度x高度)查找
logo <- image_read("logo:")
logo <- image_scale(logo, "400")
image_trim(logo) #从图像中删除作为背景颜色的边
image_chop(logo, "100x20") #删除图像的垂直或水平子区域
image_rotate(logo, 45) #削减原始图像的子区域
rose <- image_convert(image_read("rose:"), "png")
image_resize(rose, "400x")
image_resize(rose, "x400")
image_resize(rose, "400x400")
image_resize(rose, "400x400!")
image_resize(rose, "400x", filter = "Triangle")
image_resize(rose, "400x", filter = "Point")
image_scale(rose, "400x")
image_sample(rose, "400x")
image_crop(logo, "400x400+200+200")
image_flip(logo) #垂直反转
image_flop(logo) #水平反转



# 2019.6.28
#添加水印
library(magick)
a<-image_read("https://jeroen.github.io/images/Rlogo.png")
b<-image_read("https://developer.r-project.org/Logo/Rlogo-3.png")%>%image_scale(.,"1100")
b<-image_contrast(b) %>%image_enhance #增强图像的强度差异，减少噪音
c<-image_transparent(b, 'white') #将白色部分变成透明
image_composite(b,a,operator = "blend", offset = "+0+0",compose_args="70")
image_composite(a,c,operator = "blend", offset = "+0+0",compose_args="40")
