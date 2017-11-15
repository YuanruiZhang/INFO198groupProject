setwd('~/desktop/INFO198/BS repo/')
child<- read.csv('child_mortality.csv')
expectancy<-read.csv('life_expectancy.198.csv')
expec.1960<-read.csv('life_expectancy1960.csv')
data <- read.csv("child_mortality.csv")
library(dplyr)
library(ggplot2)
library(plotly)
library(shiny)
library(reshape2)


#extract region in 1960
colnames(expec.1960)[1]<-"X"
region<- expec.1960 %>% 
  select(X, region)
new<-left_join(expectancy,region, by= "X")

###################
#research by X = country Y = age

#all data in 2015
in.2015<- new %>% 
  select(X, X2015,region) %>% 
  arrange(desc(X2015))

#top 10 in 2015
top.10.in.2015<-in.2015[1:10, ]

#top 5 in 2015
top.5.in.2015<-in.2015[1:5, ]

ggplot(data = top.10.in.2015) +
geom_point(mapping = aes(x = X, y = X2015, color = region, size = 1.5))


for.states<-expectancy %>% 
  filter(X %in% "United States")

#Hongkong and Fiji

#interactive.plot$month <- factor(interactive.plot$month, levels = interactive.plot[["month"]])
y <- plot_ly(expectancy, x = ~[66,], name = 'people get injured', type = 'scatter', mode = 'lines',
             line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
  #add_trace(y = ~total.died.of.the.month, name = 'people get killed', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
  
  layout(title = "People Get Injured and Killed Due to Gun Shooting in 2017",
         xaxis = list(title = "Months"),
         yaxis = list (title = "number of people"))

expectancy[66,]


##################

             