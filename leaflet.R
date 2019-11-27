#用leafletCN作中国地图
library(leaflet)
library(leafletCN)

leaflet() %>% amap()
demomap("china")
demomap(regionNames('city')[21])

dat = data.frame(name = regionNames("china"),
                 value = runif(34))
geojsonMap(dat,"china")
dat$value2 = cut(dat$value, c(0, 0.25, 0.5, 1))
geojsonMap(dat,"china",
           namevar = ~name,
           valuevar = ~value2,
           palette="Reds",
           fillOpacity=0.5,
           legendTitle="标题",
           na.color="green", #数据缺失的颜色
           smoothFactor=5, #连线的平滑度
           stroke = T, #是否沿着描线
           weight = 10, #线的粗细
           colorMethod="factor")
geojsonMap(dat,"china",
           namevar = ~name,
           valuevar = ~value2,
           palette = topo.colors(3),
           colorMethod="factor")

dat = data.frame(regionNames("china"),
                 runif(34))
map = leafletGeo("china", dat)
pal <- colorNumeric(
  palette = "Blues",
  domain = map$value)
leaflet(map) %>% addTiles() %>%
  addPolygons(stroke = TRUE,
              smoothFactor = 1,
              fillOpacity = 0.7,
              weight = 1,
              color = ~pal(value),
              popup = ~htmltools::htmlEscape(popup)
  ) %>%
  addLegend("bottomright", pal = pal, values = ~value,
            title = "legendTitle",
            labFormat = leaflet::labelFormat(prefix = ""),
            opacity = 1)

filePath = system.file("geojson/china.json",package = "leafletCN")
map = read.geoShape(filePath)
plot(map)


