rm(list = ls())
.libPaths(new = c("H:/agrajg/R", "H:/agrajg/R2")) 
library(dplyr)
library(magrittr)
library(caret)
library(ggplot2)
library(ggthemes)
library(magrittr)
library(tidyverse)
library(tidyr)
library(tibble)

library(h2o)
h2o.init(nthreads = -1,max_mem_size = "265G", port =11221)

# csv or R data to h2o data
# marketdata <- read.csv(file = "Y:/agrajg/Research/Data/temp/010301_DataforQuantityRegressions.csv")
# save(marketdata, file = "Y:/agrajg/Research/Data/temp/020233_marketdata.RData")
ptm <- proc.time()
load(file = "Y:/agrajg/Research/Data/temp/020233_marketdata.RData")
proc.time() - ptm

marketdata$propertyid <- as.factor(marketdata$propertyid)
marketdata$hostid <- as.factor(marketdata$hostid)
marketdata$date <- as.Date(marketdata$date, "%d%b%Y")
marketdata$status <- as.factor(marketdata$status)
#----------------------------------------------------------------------------------
# in this section I am plotting all listings vs booked listing at daily level.
growth.df <- marketdata %>% 
  group_by(date, status) %>% 
  summarise(property.count = n_distinct(propertyid)) %>% 
  spread(key = status, value = property.count) %>% 
  mutate(AplusR = A+R) %>% 
  gather(key = market.status,value = count , -date) %>% 
  mutate(market.status = if_else(market.status=="R", "Booked" , 
                    if_else(market.status=="AplusR", "All market", "A"))) %>% 
  filter(market.status != "A")

growth.df$market.status <- as.factor(growth.df$market.status)
  

plot <- growth.df %>%  ggplot(aes(x=date, y=count))  + geom_line(aes(linetype = market.status))
plot +  geom_vline(xintercept=as.Date(c("2015-10-01", "2015-12-01")), linetype=3, color = "blue", size=1) +
  labs( x = "Date", y = "Number of properties")
#----------------------------------------------------------------------------------
# marketdata %>% 
#   mutate(PrePurge.listing = between(date, as.Date("2014-08-01"), as.Date("2015-09-30"))) %>% 
#   mutate(DurPurge.listing = between(date, as.Date("2015-10-01"), as.Date("2015-11-30"))) %>% 
#   mutate(PostPurge.listing = between(date, as.Date("2015-12-01"), as.Date("2017-03-31"))) %>% 
#   select(date , PrePurge.listing, DurPurge.listing, PostPurge.listing) %>% head()


marketdata <-marketdata %>% 
  group_by(propertyid) %>%
  mutate(Min.Date = min(date), Max.Date = max(date)) %>% 
  mutate(Reg.Period = if_else(between(Max.Date, as.Date("2014-08-01"), as.Date("2015-09-30")),"Old", 
                              if_else(between(Max.Date, as.Date("2015-10-01"), as.Date("2015-11-30")),"Purged",
                                      if_else(between(Max.Date, as.Date("2015-12-01"), as.Date("2017-03-31")) & between(Min.Date, as.Date("2014-08-01"), as.Date("2015-11-30")),"Existing",
                                              if_else(between(Max.Date, as.Date("2015-12-01"), as.Date("2017-03-31")) & between(Min.Date, as.Date("2015-12-01"), as.Date("2017-03-31")),"New", "")))))

marketdata$Reg.Period = as.factor(marketdata$Reg.Period)

marketdata %>% 
  group_by(Reg.Period) %>% 
  summarise(N.prop = n_distinct(propertyid)) 
