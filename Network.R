#交互式的网络
library(networkD3)
library(dplyr)
src <- c("A", "A", "A", "A",
         "B", "B", "C", "C", "D")
target <- c("B", "C", "D", "J",
            "E", "F", "G", "H", "I")
networkData <- data.frame(src, target)
simpleNetwork(networkData,
              fontFamily="华文行楷",      
              linkColour="#B23AEE",#连线颜色       
              nodeColour="#00CD66",#节点颜色       
              charge = -550,#节点之间的引力       
              opacity=0.9,#透明度       
              zoom=TRUE,
              fontSize = 20)%>%
  saveNetwork(file = 'Net1.html')           




#将静态的graph的节点位置固定下来
library("igraph")
g1=matrix(c(1,0,0,0,
            -1,0,7,8,
            0,0,0,1,
            1,0,3,4),ncol=4) #只分两类：0和非0
# 1 -1 0 1 第一列  “一”指向“二”和“四”
# 0  0 0 0 第二列  “二”没有指向
# 0  7 0 3 
# 0  8 1 4
colnames(g1)=c("一","二","三","四")
g1
g2 <- graph.adjacency(g1, mode = "directed", weighted = TRUE, diag=F)
V(g2)$name
V(g2)$color <- c("gray","yellow","green","red") #框内颜色
V(g2)$frame.color <- V(g2)$color #框线
E(g2)$label<- c("1","2","3","4","5","6")
E(g2)$weight
E(g2)$name
E(g2)$label.cex=E(g2)$weight
E(g2)$color =c("gray","yellow","green","red","red","red")
E(g2)$width=c(1,2,3,4,5,6)
plot.igraph(g2) #直接画图形不固定
plot.igraph(g2,layout = matrix(c(-0.2,0,0.2,0.2,   #列名 
                                 -1,1,3,5),ncol =2)) #最中间相当于xy轴交汇点
#四个点的坐标轴 一(-0.2,-1);二(0,1) ...


          
