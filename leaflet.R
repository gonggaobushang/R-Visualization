library(leaflet)
################################################################基本设置
leaflet(options = leafletOptions(minZoom = 0, maxZoom = 18))

df <- data.frame(Lat = 1:10, Long = rnorm(10))
leaflet(df) %>% addCircles()

# 手动指定经度和纬度变量,结果一样 
leaflet(df) %>% addCircles(lng = ~Long, lat = ~Lat)
library(sp)
library(RColorBrewer)

Sr1 <- Polygon(cbind(c(2, 4, 4, 1, 2), c(2, 3, 5, 4, 2)))  
# 4对非重复点坐标，首尾相连
Sr2 <- Polygon(cbind(c(5, 4, 2, 5), c(2, 3, 2, 2)))  
# 3对非重复点坐标，画三角形
Sr3 <- Polygon(cbind(c(4, 4, 5, 10, 4), c(5, 3, 2, 5, 5)))  
# 4对非重复点坐标，画四边形
Sr4 <- Polygon(cbind(c(5, 6, 6, 5, 5), c(4, 4, 3, 3, 4)), hole = TRUE)  
# hole = TRUE,表示中空
Srs1 <- Polygons(list(Sr1), "s1")  
# 's1'指定ID参数，多个多边形才有ID参数，Polygon()没有ID参数
Srs2 <- Polygons(list(Sr2), "s2")
Srs3 <- Polygons(list(Sr4, Sr3), "s3/4")  # 合并Sr3和Sr4多边形

# 列表传参，传递多个多边形参数
SpP <- SpatialPolygons(list(Srs1, Srs2, Srs3), 1:3)

leaflet(height = "500px") %>% addPolygons(data = SpP, fillColor = brewer.pal(3, 
          name = "Set1"))
library(maps)
mapStates <- map("state", fill = TRUE, plot = FALSE)
leaflet(data = mapStates) %>% addTiles() %>% 
  addPolygons(fillColor = brewer.pal(10,name = "Paired"), stroke = FALSE)   

m <- leaflet() %>% addTiles()
df <- data.frame(lat = rnorm(100), lng = rnorm(100), size = runif(100, 5, 20), 
                     color = sample(colors(), 100))

m <- leaflet(df) %>% addTiles()
# circle图标的半径不随zoom变化:
m %>% addCircleMarkers(radius = ~size, color = ~color, fill = FALSE)
# circle图标的半径不随zoom变化:
m %>% addCircleMarkers(radius = runif(100, 4, 10), color = c("red"))





################################################################底图
names(providers) #支持多种免费第三方providers的tiles
m <- leaflet() %>% setView(lng = -71.0589, lat = 42.3601, zoom = 12)
m %>% addTiles()  #认即是OpenStreetMap
m %>% addProviderTiles(providers$Stamen.Toner)
leaflet() %>% addTiles() %>% setView(-93.65, 42.0285, zoom = 4) %>% 
  # 叠加一个WMS的tiles图层
addWMSTiles("http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi", 
            layers = "nexrad-n0r-900913", 
 options = WMSTileOptions(format = "image/png", transparent = TRUE), 
 attribution = "W eather data <U+00A9> 2012 IEM Nexrad")

#图层叠加
m <- leaflet() %>% setView(lng = -71.0589, lat = 42.3601, zoom = 12)
m %>% addProviderTiles(providers$MtbMap) %>% # 底层tiles
   addProviderTiles(providers$Stamen.TonerLines,  # 叠加一层tiles,显示公路和街道
options = providerTileOptions(opacity = 0.35)) %>% # opacity设定非透明度
 addProviderTiles(providers$Stamen.TonerLabels) # 叠加tiles,显示公路名

########################################################图标
data(quakes)

# 索引quakes前20行数据进行显示。
leaflet(data = quakes[1:20, ]) %>% addTiles() %>% 
# 增加图标图层，标签显示为quakes中的mag变量
addMarkers(~long, ~lat, popup = ~as.character(mag), label = ~as.character(mag))

 制作一组Icon
greenLeafIcon <- makeIcon(
  iconUrl = "E:/R_input_output/images_input/leaf-green.png", # 使用文件路径指定
  iconWidth = 38, iconHeight = 95, # 设定当个Icon的相对长宽。 
  iconAnchorX = 22, iconAnchorY = 94, # 定位点相对位置(在IconWidth和IconHeight内)
shadowUrl = "E:/R_input_output/images_input/leaf-shadow.png", # 阴影Icon
  shadowWidth = 50, shadowHeight = 64,
  shadowAnchorX = 4, shadowAnchorY = 62
)

leaflet(data = quakes[1:4,]) %>% addTiles() %>%
  addMarkers(~long, ~lat, icon = greenLeafIcon) # 增加Icon图层

quakes1 <- quakes[1:10,] # 索引前10行数据
leafIcons <- icons(
  iconUrl = ifelse(quakes1$mag < 4.6, # 若mag < 4.6为真
    "E:/R_input_output/images_input/leaf-green.png", # test = TRUE
    "E:/R_input_output/images_input/leaf-red.png" # test = FALSE
  ),
  iconWidth = 38, iconHeight = 95, # length = 1, 循环补齐
  iconAnchorX = 22, iconAnchorY = 94, # length = 1, 循环补齐
  shadowUrl = "E:/R_input_output/images_input/leaf-shadow.png", #
  shadowWidth = 50, shadowHeight = 64, # length = 1, 循环补齐
  shadowAnchorX = 4, shadowAnchorY = 62 # length = 1, 循环补齐
)

leaflet(data = quakes1) %>% addTiles() %>%
  addMarkers(~long, ~lat, icon = leafIcons) # 传递制作的Icons参数

oceanIcons <- iconList(
    ship = makeIcon(iconUrl = "E:/R_input_output/images_input/cargo-ship.png", 
            iconWidth = 30, iconHeight = 20), # 设定当个Icon的相对长宽。 
pirate = makeIcon(iconUrl = 
                    "E:/R_input_output/images_input/pirates-caribbean.png", 
        iconWidth = 30, iconHeight = 30) # 设定当个Icon的相对长宽。 
  )
# 编造一个数据
df <- sp::SpatialPointsDataFrame(
   cbind( # 列合并后为一个4列20行的数据框
       (runif(20) - .5) * 10 - 90.620130,  # 经度
       (runif(20) - .5) * 3.8 + 25.638077  # 纬度
   ),
  data.frame(type = factor(
       ifelse(runif(20) > 0.75, "pirate", "ship"), 
      c("ship", "pirate") # length = 2 < 20, 循环补齐
    ))
)
leaflet(df) %>% addTiles() %>%
    addMarkers(icon = ~oceanIcons[type]) # 使用type中的元素匹配oceanIcons中的列名

df.20 <- quakes[1:20,] # 索引前20行数据

# 创建颜色向量函数，mag <= 4 为绿色，mag = 5为橙色， mag > 5为红色
getColor <- function(quakes) {
    sapply(quakes$mag, function(mag) {
      if(mag <= 4) {
          "green"
        } else if(mag <= 5) {
            "orange"
         } else {
              "red"
          } } )
  }
icons <- awesomeIcons(
    icon = 'flash', # icon名字为"flash"(闪电),名字可以从前面库的网站上查看
    iconColor = 'black', # 指定icon颜色
    library = 'ion', # 指定icons库为ionicons
    markerColor = getColor(df.20) # 指定markers颜色
  )
leaflet(df.20) %>% addTiles() %>%
    addAwesomeMarkers(~long, ~lat, icon=icons, label=~as.character(mag))


#############图标簇
leaflet(quakes) %>% addTiles() %>% addAwesomeMarkers(~long, ~lat, icon = icons, 
label = ~as.character(mag), clusterOptions = markerClusterOptions()  # 设置簇
                              )
leaflet(quakes) %>% addTiles() %>% addAwesomeMarkers(~long, ~lat, icon = icons, 
label = ~as.character(mag), clusterOptions = 
  markerClusterOptions(freezeAtZoom = 5)  # 冻结簇在zoom level = 5
 )

# 默认circles参数
leaflet(df) %>% addTiles() %>% addCircleMarkers()

# stroke = FALSE去掉路径阴影
leaflet(df) %>% addTiles() %>% addCircleMarkers(radius = 15, stroke = FALSE) %>% 

# fill = FALSE空心圆环
addCircleMarkers(radius = 15, color = "magenta", weight = 8, opacity = 0.2, 
    fill = FALSE) %>% 
# 分别指定stroke和fill不同的颜色。并调整透明度
addCircleMarkers(radius = 60, color = "lime", weight = 8, opacity = 0.8, 
                 fillColor = "cyan", 
    fillOpacity = 0.3, dashArray = "5 2")
pal <- colorFactor(c("blue", "magenta"), domain = c("ship", "pirate")) 

leaflet(df) %>% addTiles() %>%
    addCircleMarkers(
radius = ~ifelse(type == "ship", 6, 10),#分别设置ship半径为6，pirate半径为10
    color = ~pal(type), # 色板函数匹配
    stroke = FALSE, fillOpacity = 0.5
  )
############################################################信息提示框
# 生成popup框内信息
content <- paste(sep = "<br/>", # 分隔符为html语法的换行符
 # 单引号内为HTML链接，单引号后为HTML显示标签                 
 "<b><a href='http://www.samurainoodle.com'>Samurai Noodle</a></b>", 
 "606 5th Ave. S",
  "Seattle, WA 98138",
 "框内","<b><a href='http://www.baidu.com'> 标签 </a></b>"
)

leaflet() %>% addTiles() %>%
addPopups(-122.327298, 47.597131, popup = content, 
options = popupOptions(closeButton = FALSE)  )

library(htmltools)  # 为了调用htmlEscape()函数,

# 创建一个数据框
df <- read.csv(textConnection("Name,Lat,Long
                               Samurai Noodle,47.597131,-122.327298
                               Kukai Ramen,47.6154,-122.327157
                               Tsukushinbo,47.59987,-122.326726"))
df

leaflet(df) %>% addTiles() %>% addMarkers(~Long, ~Lat, 
        popup = ~htmlEscape(Name))  # 默认点击Marker才出现popup

leaflet() %>% addTiles() %>% setView(-118.456554, 34.09, 13) %>%
  
 addMarkers(
    lng = -118.456554, lat = 34.105,
    label = "Default Label",
    labelOptions = labelOptions(noHide = F)) %>% # 隐藏的popups

  addMarkers(
    lng = -118.456554, lat = 34.095,
    label = "Label w/o surrounding box",
    labelOptions = labelOptions(noHide = T, textOnly = TRUE)) %>% 
  # 只显示文字，不显示提示框

  addMarkers(
    lng = -118.456554, lat = 34.085,
    label = "label w/ textsize 15px",
    labelOptions = labelOptions(noHide = T, textsize = "15px")) %>% 
  # 修改提示框大小，文本大小随之变化

  addMarkers(
    lng = -118.456554, lat = 34.075,
    label = "Label w/ custom CSS style",
    labelOptions = labelOptions(noHide = T, direction = "bottom", 
                                # 修改提示框相对位置
      style = list( # 修改提示框文本样式，列表传参
        "color" = "red", # 设定文本颜色为红色
        "font-family" = "serif", # 设置字体
    "font-style" = "italic", # 设置字型为斜体
    "box-shadow" = "3px 3px yellow", # 设置提示框边框线阴影尺寸和边框阴影颜色
      "font-size" = "12px", # 设置字体大小为12个像素点
    "border-color" = "cyan" # 设置提示框边框线颜色
      ))
  )

cities <- read.csv(textConnection("
City,Lat,Long,Pop
                                  Boston,42.3601,-71.0589,645966
                                 Hartford,41.7627,-72.6743,125017
                                 New York City,40.7127,-74.0059,8406000
                                 Philadelphia,39.9500,-75.1667,1553000
                                 Pittsburgh,40.4397,-79.9764,305841
                                 Providence,41.8236,-71.4222,177994"))

leaflet(cities) %>% addTiles() %>% addCircles(lng = ~Long, lat = ~Lat,
weight = 1,radius = ~sqrt(Pop) * 30, popup = ~City, 
fillColor = "magenta", fillOpacity = 0.2)

leaflet() %>% addTiles() %>% addRectangles(lng1 = -118.456554, lat1 = 34.078039,
lng2 = -118.436383, lat2 = 34.062717, fillColor = "transparent"  
# fillColor = 'transparent'与fillColor = NULL结果不一样
)
###################################################################不上外网会失败
path <- "E:/R_input_output/data_input/cb_2013_us_state_20m/cb_2013_us_state_20m.shp"
states <- rgdal::readOGR(path,layer = "cb_2013_us_state_20m", 
   GDAL1_integer64_policy = TRUE)# 读取数据

neStates <- subset(states, states$STUSPS %in% c( 
  "CT","ME","MA","NH","RI","VT","NY","NJ","PA"
  ))
leaflet(neStates) %>%
 addPolygons(color = "cyan", weight = 1, smoothFactor = 0.5,
             opacity = 1.0, fillOpacity = 0.5,
            fillColor = ~colorQuantile("YlOrRd", ALAND)(ALAND),
highlightOptions = highlightOptions(color = "white", weight = 2, 
                                    #高亮形状区域，置于表层。
      bringToFront = TRUE))

#简化数据量
devtools::install_github("hrbrmstr/albersusa")
library(albersusa)

fullsize <- usa_sf()  # albersusa包自带数据
object.size(fullsize)  # object.size属于utils包，R自带

simplified <- rmapshaper::ms_simplify(fullsize)
object.size(simplified)  # 可以看出，这种简化方式存储量只有原来1/8

######################################################json数据
library(rgdal)
filepath <- "E:/R_input_output/data_input/JSON/TopoJson/China.json"
# filepath <- "E:/R_input_output/data_input/JSON/GeoJSON/China.geojson"#结果一样
China_map <- readOGR(filepath, stringsAsFactors = FALSE)
# China_map <-  geojsonio::geojson_read(filepath,what = "sp") # 结果一样

Encoding(China_map@data$name) <- "UTF-8" # 纠正中文字符乱码
leaflet(China_map) %>% 
  setView(lng = 106.33, lat = 29.35, zoom = 3.5) %>% # 以重庆城区经纬度为中心
  addPolygons(stroke = TRUE, color = "magenta", smoothFactor = 0.3, 
              fillOpacity = 0.5,fillColor = "lime") %>%
  addMarkers(lng = 114.3,lat = 30.6 ) # 增加一个图标



# 调动颜色函数，生成一个palette函数
pal <- colorNumeric(c("red", "green", "blue"), 1:10)
# 给色板函数传进一个数字向量，返回颜色色值向量。
pal(c(1, 6, 9))


library(leafletCN)

regionNames("China")
regionNames("四川省")
regionNames("成都")
demomap("台湾")
dat <-  data.frame(name = regionNames("china"),
                                 value = runif(34))
geojsonMap(dat,"china") %>%  # 给变量value着色
 setView(lng = 106.33, lat = 29.35, zoom = 3.5)
leaflet() %>% amap() %>% addMarkers(lng = 121.644688, lat = 29.904886, 
                                      popup = "opppo")
m <- leaflet() %>% setView(lng = 121.651788, lat = 29.910886, zoom = 12)
m %>% addProviderTiles(providers$Stamen.Toner) %>% 
  addProviderTiles(providers$Stamen.TonerLines,  
                   options = providerTileOptions(opacity = 0.35)) %>% 
  addProviderTiles(providers$Stamen.TonerLabels) %>% addMarkers(lng = 121.652088, lat = 29.91799, 
                                                                popup = "opppo")

