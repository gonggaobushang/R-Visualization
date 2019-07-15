#条形图
library(plotly)
data <- data.frame(a=c("一","二","三","四"), b=c(1,2,3,4), 
                   c=c(14,13,12,11),d=c(6,9,3,8))
plot_ly(data, x = ~a, y = ~b, type = 'bar',
        text=c("这","是","颜","色"),
        name="小方块的name",
        marker=list(
          color=c("red","yellow","brown","green"),
                    line=list(color = 'rgb(1,50,200)',
                              width = 2))
        ) %>%
  add_trace(y = ~c, name = '不你不是，',
            text=c("不是","没有","你","瞎说"),
            textposition = 'auto',
            marker=list(
              color=c("black","blue","white","purple"),
              line=list(color = 'rgb(10,10,200)',
                        width = 2))) %>%
  add_trace(y = ~d, name = '我最强',
            text=c(",,,,","...","~~~","&*"),
            marker=list(
              color=c("rgb(210,80,40)","rgb(220,90,90)","rgb(230,100,140)","rgb(240,110,250)"),
              line=list(color = 'rgb(200,70,10)',
                        width = 2))) %>%
  layout(
    title="大标题",
    xaxis=list(title="x标题"),
    yaxis = list(title = 'y标题'),
    #margin = list(b = 0),
         barmode = 'stack' #group
         )
#下面这种形式更适合画bar图
plot_ly() %>%
  add_bars(
    x=c("一","二","三","四"),
    y=c(1,2,3,4),
    text=c("这","是","颜","色"),
    name="小方块的name",
    base=c(-1,-3,-4,-6),
    width=c(1,2,3,4),
    textposition = 'auto',
    marker=list(
      color=c("red","yellow","brown","green"),
      line=list(color = 'rgb(1,50,200)',
                width = 2))
  )%>%
  add_bars(x=c("一","二","三","四"),y = c(14,13,12,11), name = '不你不是，',
            text=c("不是","没有","你","瞎说"),
            textposition = 'auto',
           base=c(5,2,0,-4),
            marker=list(
              color=c("black","blue","white","purple"),
              line=list(color = 'rgb(10,10,200)',
                        width = 2))) %>%
  add_bars(x=c("一","二","三","四"),y = c(3,5,1,9), name = '我最强',
            text=c(",,,,","...","~~~","&*"),
            base=c(-1,-2,-3,-4),
            #textposition = 'auto',
            marker=list(
              color=c("rgb(210,80,40)","rgb(220,90,90)","rgb(230,100,140)","rgb(240,110,250)"),
              line=list(color = 'rgb(200,70,10)',
                        width = 2))) %>%
  layout(
    title="大标题",
    xaxis = list(
      title = "是我呀",
      tickfont = list(
        size = 30,
        color = 'red')),
    yaxis = list(
      title = '呵呵',
      titlefont = list(
        size = 15,
        color = 'green'),
      tickfont = list(
        size = 20,
        color = 'brown')),
    legend = list(x = 1, y = 0.5, bgcolor = 'red'),
    barmode = 'stack',
    paper_bgcolor = 'yellow',
    plot_bgcolor = 'green',
    showlegend = T)%>%
  add_annotations(text = c("A深刻","B"),
                  x = c(1,2),
                  y = c(2,3),
                  font = list(#family = 'Arial',
                              size = 14,
                              color = 'purple'),
                  showarrow = F)
    
 





#自动描线，能够滑动的功能
library(plotly)
library(quantmod)
getSymbols("AAPL",src='yahoo')
df1 <- data.frame(Date=index(AAPL),coredata(AAPL))
df1 <- df2<-tail(df1, 10)
df1$ID <-df2$ID<- seq.int(nrow(df1))
df2$AAPL.Close<-df2$AAPL.Close+100
df1$pl<-rep(1,10)
df2$pl<-rep(2,10)

df3<-rbind(df1,df2)
accumulate_by <- function(dat, var) {
  var <- lazyeval::f_eval(var, dat)
  lvls <- plotly:::getLevels(var)
  dats <- lapply(seq_along(lvls), function(x) {
    cbind(dat[var %in% lvls[seq(1, x)], ], frame = lvls[[x]])
  })
  dplyr::bind_rows(dats)
}
df3 <- df3 %>%
  accumulate_by(~ID)
df3 %>%
  plot_ly(
    x = ~ID, 
    y = ~AAPL.Close, 
    frame = ~frame,
    type = 'scatter', 
    mode = 'lines', 
    #fill = 'tozeroy', 
    split = ~pl,
    #fillcolor='rgba(114, 186, 59, 0.5)',
    #line = list(color = 'rgb(114, 186, 59)'),
    text = ~paste("Day: ", ID, "<br>Close: $", AAPL.Close), 
    hoverinfo = 'text'
  ) %>%
  layout(
    title = "AAPL: Last 30 days",
    yaxis = list(
      title = "Close", 
      range = c(10,400), 
      zeroline = F,
      tickprefix = "11$"
    ),
    xaxis = list(
      title = "Day", 
      tickvals = c(1:10), 
      ticktext=c(1:10+21),
      zeroline = F, 
      showgrid = F,
      tickmode="array"
    )
  ) %>% 
  animation_opts(
    frame = 100, 
    transition = 0, 
    redraw = FALSE
  ) %>%
  animation_slider(
    currentvalue = list(
      prefix = "Day "
    )
  )%>%
  animation_button(
    x = 1, xanchor = "right", y = 0, yanchor = "bottom"
  )%>%
  animation_slider(
    hide = F
  )
