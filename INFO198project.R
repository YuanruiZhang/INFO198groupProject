setwd("~/desktop/INFO198/BS repo/")
child.mortality <- read.csv("child_mortality.csv")
life.expectancy<-read.csv("life_expectancy.198.csv")
library(dplyr)
library(reshape2)
library(plotly)

small.data <- life.expectancy %>% filter(X %in% c("Belgium","Bhutan","China","Philippines","Eritrea","Ghana","Israel","Finland","Thailand","India", "Finland", "Greece","Japan","Ireland","Italy","New Zealand","Sweden","United States","Australia")) %>%  select(-X.1)

small.transpose <- data.frame(t(small.data), stringsAsFactors = FALSE)  

name <- small.transpose[1,]

small.transpose <- filter(small.transpose, X1 != "Australia") %>% mutate("Years" = c("2000","2001","2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009",
                                                                                         "2010", "2011", "2012", "2013", "2014", "2015"))
colnames(small.transpose) <- c(name, "Years")

p <- plot_ly(small.transpose, x = ~Years, y = ~Australia, name = 'Australia', type = 'scatter', mode = 'lines',
             line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
  add_trace(y = ~`United States`, name = 'United States', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
  add_trace(y = ~`Sweden`, name = 'Sweden', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
  add_trace(y = ~`New Zealand`, name = 'New Zealand', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
  add_trace(y = ~`Italy`, name = 'Italy', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
  add_trace(y = ~`Ireland`, name = 'Ireland', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
  add_trace(y = ~`Japan`, name = 'Japan', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
  add_trace(y = ~`Greece`, name = 'Greece', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
  add_trace(y = ~`Finland`, name = 'Finland', line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
  add_trace(y = ~China, name = 'China', line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
  add_trace(y = ~Belgium, name = 'Belgium', line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
  add_trace(y = ~Bhutan, name = 'Bhutan', line = list(color = 'rgb(205, 12, 2u4)', width = 4)) %>%
  add_trace(y = ~Philippines, name = 'Philippines', line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
  add_trace(y = ~Eritrea, name = 'Eritrea', line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
  add_trace(y = ~Ghana, name = 'Ghana', line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
  add_trace(y = ~Israel, name = 'Israel', line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
  add_trace(y = ~Finland, name = 'Finland', line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
  add_trace(y = ~Thailand, name = 'Thailand', line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
  layout(title = "Child mortality of countries throughtout the years",
         xaxis = list(title = "Years"),
         yaxis = list (title = "child mortality"))


