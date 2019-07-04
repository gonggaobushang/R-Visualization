library(networkD3)
library(dplyr)
src <- c("A", "A", "A", "A",
         "B", "B", "C", "C", "D")
target <- c("B", "C", "D", "J",
            "E", "F", "G", "H", "I")
networkData <- data.frame(src, target)
#交互式的网络
simpleNetwork(networkData,
              fontFamily="华文行楷",      
              linkColour="#B23AEE",#连线颜色       
              nodeColour="#00CD66",#节点颜色       
              charge = -550,#节点之间的引力       
              opacity=0.9,#透明度       
              zoom=TRUE,
              fontSize = 20)%>%
  saveNetwork(file = 'Net1.html')           




          
