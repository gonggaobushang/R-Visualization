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






#能够截取部分长度
library(plotly)
library(quantmod)
getSymbols(Symbols = c("AAPL", "MSFT"))

ds <- data.frame(Date = index(AAPL), AAPL[,6], MSFT[,6])

plot_ly(ds, x = ~Date) %>%
  add_lines(y = ~AAPL.Adjusted, name = "Apple") %>%
  add_lines(y = ~MSFT.Adjusted, name = "Microsoft") %>%
  layout(
    title = "Stock Prices",
    xaxis = list(
      rangeselector = list(
        buttons = list(
          list(
            count = 3,
            label = "3 mo",
            step = "month",
            stepmode = "backward"),
          list(
            count = 6,
            label = "6 mo",
            step = "month",
            stepmode = "backward"),
          list(
            count = 1,
            label = "1 yr",
            step = "year",
            stepmode = "backward"),
          list(
            count = 1,
            label = "YTD",
            step = "year",
            stepmode = "todate"),
          list(step = "all"))),
      
      rangeslider = list(type = "date")),
    
    yaxis = list(title = "Price"))







#加了按钮选择等功能
library(plotly)
library(quantmod)

getSymbols("AAPL")
df <- data.frame(Date=index(AAPL),coredata(AAPL))
high_annotations <- list(
  x=df$Date[df$AAPL.High == max(df$AAPL.High)], 
  y=max(df$AAPL.High),
  xref='x', yref='y',
  text=paste0('High: $',max(df$AAPL.High)),
  ax=0, ay=-40
)
low_annotations <- list(
  x=df$Date[df$AAPL.Low == min(df$AAPL.Low)], 
  y=min(df$AAPL.Low),
  xref='x', yref='y',
  text=paste0('Low: $',min(df$AAPL.Low)),
  ax=0, ay=40
)
updatemenus <- list(
  list(
    active = -1,
    type= 'buttons',
    buttons = list(
      list(
        label = "High",
        method = "update",
        args = list(list(visible = c(FALSE, TRUE)),#只画最低价
                    list(title = "Yahoo High",
                         annotations = list(c(), high_annotations)))),
      list(
        label = "Low",
        method = "update",
        args = list(list(visible = c(TRUE, FALSE)),#只画最高价
                    list(title = "Yahoo Low",
                         annotations = list(low_annotations, c() )))),
      list(
        label = "Both",
        method = "update",
        args = list(list(visible = c(TRUE, TRUE)),
                    list(title = "Yahoo",
                         annotations = list(low_annotations, high_annotations)))),
      list(
        label = "Reset",
        method = "update",
        args = list(list(visible = c(TRUE, TRUE)),
                    list(title = "Yahoo",
                         annotations = list(c(), c())))))
  )
)
 df %>%
  plot_ly(type = 'scatter', mode = 'lines') %>%
  add_lines(x=~Date, y=~AAPL.High, name="High",
            line=list(color="#33CFA5")) %>%
  add_lines(x=~Date, y=~AAPL.Low, name="Low",
            line=list(color="#F06A6A")) %>%
  layout(title = "1", showlegend=FALSE,
         xaxis=list(title="Date"),
         yaxis=list(title="Price ($)"),
         updatemenus=updatemenus)
 
