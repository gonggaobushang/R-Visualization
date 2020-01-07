library(canvasXpress)
#可镶嵌在shiny中
cxShinyExample("example3")

y=read.table("http://www.canvasxpress.org/data/cX-generic-dat.txt", header=TRUE, sep="\t", quote="", row.names=1, fill=TRUE, check.names=FALSE, stringsAsFactors=FALSE)
x=read.table("http://www.canvasxpress.org/data/cX-generic-smp.txt", header=TRUE, sep="\t", quote="", row.names=1, fill=TRUE, check.names=FALSE, stringsAsFactors=FALSE)
z=read.table("http://www.canvasxpress.org/data/cX-generic-var.txt", header=TRUE, sep="\t", quote="", row.names=1, fill=TRUE, check.names=FALSE, stringsAsFactors=FALSE)
#https://canvasxpress.org/html/bar-9.html 官网上的Rcode有误
canvasXpress(
  data=y,
  smpAnnot=x,
  varAnnot=z,
  colorScheme="CanvasXpress",
  graphType="Bar",
  isclass="json-number",
  is3DPlot=TRUE,
  scatterType="bar",
  widthFactor=1.2,
  xclass="json-number",
  x3DRatio=0.5
  )
  
