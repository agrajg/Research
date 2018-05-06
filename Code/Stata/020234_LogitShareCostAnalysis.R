rm(list = ls())
.libPaths(new = c("H:/agrajg/R", "H:/agrajg/R2")) 
library(tibble)
library(dplyr)
library(magrittr)
library(caret)
library(ggplot2)
library(tidyverse)
library(ggthemes)
library(stargazer)
library(magrittr)
library(h2o)
# h2o.init(nthreads = -1,max_mem_size = "265G", port =11229)

# csv or R data to h2o data
# marketdata <- read.csv(file = "Y:/agrajg/Research/Data/temp/010301_DataforQuantityRegressions.csv")
# save(marketdata, file = "Y:/agrajg/Research/Data/temp/020233_marketdata.RData")
ptm <- proc.time()
load(file = "Y:/agrajg/Research/Data/temp/020233_sharecost2.RData")
proc.time() - ptm


demand.price.beta <- -2.375901 
purge.lprice.beta <- 0.1958391
purge.booking.beta <-  -0.06882944 

sharecost.df <- sharecost.df %>% 
  mutate( 
    change.CS.price         = if_else((T_RegPurgeDum==1 & status=="R") ,
                                      -abs(purge.lprice.beta)*price, 
                                      NA_real_),      
    CF.log.odds.booking     = if_else(T_RegPurgeDum==1 & status=="A",
                                      log((R+(abs(purge.booking.beta)*(1-R)))/(1-(R+(abs(purge.booking.beta)*(1-R))))),
                                      NA_real_),  
    CF.booking.pred         = if_else(T_RegPurgeDum==1 & status=="A" & CF.log.odds.booking >=0, 
                                      1, 
                                      if_else(T_RegPurgeDum==1 & status == "A" & CF.log.odds.booking < 0,
                                              0, 
                                              NA_real_)), 
    change.CS.bookings      = if_else(T_RegPurgeDum==1 & status == "A" & CF.log.odds.booking >=0, 
                                      -CF.log.odds.booking/abs(purge.lprice.beta), 
                                      NA_real_),
    CF.log.odds.price       = if_else(T_RegPurgeDum==1 & status=="A", 
                                      log(R/A) + (abs(demand.price.beta)*abs(purge.lprice.beta)*price), 
                                      NA_real_),
    CF.booking.pred.variety = if_else(T_RegPurgeDum==1 & status=="A" & CF.log.odds.price >=0, 
                                      1,
                                      if_else(T_RegPurgeDum==1 & status=="A" & CF.log.odds.price <0,
                                              0, 
                                              NA_real_)),
    change.CF.variety       = if_else(CF.booking.pred.variety==1, 
                                      -CF.log.odds.price/abs(demand.price.beta), 
                                      NA_real_)
    )

# Consumers who paid a higher price lost surplus
summary(sharecost.df$change.CS.price)
sum(sharecost.df$change.CS.price, na.rm = TRUE)
sum(sharecost.df$change.CS.price, na.rm = TRUE)/sum(sharecost.df$T_RegPurgeDum, na.rm = TRUE)
# Counterfactual utility of those who did not book in benchmark case
summary(sharecost.df$CF.log.odds.booking)
# Counterfactual booking predictions of those who did not book in benchmark
summary(sharecost.df$CF.booking.pred)
# Income that would compensate the increased utility in counterfactual environment, 
# to bring positive utility to zero(no booking)
summary(sharecost.df$change.CS.bookings)
sum(sharecost.df$change.CS.bookings, na.rm = TRUE)
sum(sharecost.df$change.CS.bookings, na.rm = TRUE)/sum(sharecost.df$T_RegPurgeDum, na.rm = TRUE)
# In the counterfactual environmment, when the purge did not happen and prices were 
# lower more bookings would happen. 
# these extra bookings happened because of lower prices of existing and new bookings 
# Had the prices not changed, between benchmark and CF, the extra utility  comes 
# from wider range of product available to the consumers
summary(sharecost.df$CF.log.odds.price)
# Predicted CF bookings 
summary(sharecost.df$CF.booking.pred.variety)
# CV for variety loss
summary(sharecost.df$change.CF.variety)
sum(sharecost.df$change.CF.variety, na.rm = TRUE)
sum(sharecost.df$change.CF.variety, na.rm = TRUE)/sum(sharecost.df$T_RegPurgeDum, na.rm = TRUE)
sharecost.df %>% head()
sharecost.df %>% str()


########################################################################################
# Producer surplus and makups
# Here I compute markups and sales weighted markups
sharecost.df <- sharecost.df %>% 
  mutate(priceSW = if_else(status=="R", price, NA_integer_),
         mcSW = if_else(status=="R", mc, NA_real_),
         markupSW = if_else(status=="R",`markup <- price - mc`,NA_real_),
         markupSW.per = markupSW*100/priceSW, 
         markup = `markup <- price - mc`,
         markup.per = markup*100/price,
         profit = `profit <- if_else(status == "R", price - mc, -mc)`)  %>% 
  select(-`markup <- price - mc`,-`profit <- if_else(status == "R", price - mc, -mc)`) 
         

# storing summary stats of these suplly side variables
summary.stats.supply <- sharecost.df %>% 
  select(price, priceSW , mc, mcSW,  markup,markupSW, markup.per, markupSW.per, profit) %>% 
  summarise_all(funs(n = sum(!is.na(.)),
                     mean = mean(., na.rm = TRUE), 
                     sd = sd(., na.rm = TRUE), 
                     min = min(., na.rm = TRUE), 
                     p01 = quantile(., probs = 0.01,na.rm = TRUE), 
                     p05 = quantile(., probs = 0.05,na.rm = TRUE), 
                     p10 = quantile(., probs = 0.10,na.rm = TRUE), 
                     p25 = quantile(., probs = 0.25,na.rm = TRUE), 
                     p50 = quantile(., probs = 0.50,na.rm = TRUE), 
                     p75 = quantile(., probs = 0.75,na.rm = TRUE), 
                     p90 = quantile(., probs = 0.90,na.rm = TRUE), 
                     p95 = quantile(., probs = 0.95,na.rm = TRUE), 
                     p99 = quantile(., probs = 0.99,na.rm = TRUE),
                     max = max(., na.rm = TRUE)))

# exporting summary stats to latex 
# no sales weighted
sharecost.df %>%
  select(price,mc,markup,markup.per,profit) %>%
  filter(between(mc,summary.stats.supply$mc_p01, summary.stats.supply$mc_p99)) %>%
  stargazer(type = "latex",
            title = "Summary Statistics of Prices, Marginal Cost and Markup",
            summary.stat = c("n","mean", "sd", "min", "p25", "median", "p75", "max"),
            notes = c("1. N = 34,854,820", "2. Some other notes .."),
            style = "aer",
            digits =2,
            font.size = "scriptsize",
            flip = TRUE,
            label = "PriceMarkupProfit")

# sales weighted
sharecost.df %>%
  select(priceSW,mcSW,markupSW,markupSW.per) %>%
  filter(between(mcSW,summary.stats.supply$mcSW_p01, summary.stats.supply$mcSW_p99)) %>%
  stargazer(type = "latex",
            title = "Summary Statistics of (Sales Weighted) Prices, Marginal Cost and Markup",
            summary.stat = c("n","mean", "sd", "min", "p25", "median", "p75", "max"),
            notes = c("1. N = 34,854,820", "2. Some other notes .."),
            style = "aer",
            digits =2,
            font.size = "scriptsize",
            flip = TRUE,
            label = "PriceMarkupProfitSW")


# Colors for the plots
colorpal1 <- c('#a6cee3','#33a02c')
colorpal1 <- c("#000000", "#E69F00")



# Plotting density of price
sharecost.df %>% 
  select(price,priceSW) %>% 
  filter(between(price, summary.stats.supply$price_p01, summary.stats.supply$price_p99)) %>% 
  ggplot() +
  geom_density(mapping = aes(x=price, color = 'price')) +
  geom_density(mapping = aes(x=priceSW, color = 'priceSW'))  +
  scale_colour_manual(name = 'Prices', values =colorpal1)
  
# Plotting density of marginal cost
sharecost.df %>% 
  select(mc,mcSW) %>% 
  filter(between(x = mc, left = summary.stats.supply$mc_p01,right = summary.stats.supply$mc_p99)) %>% 
  ggplot() +
  geom_density(mapping = aes(x=mc, color = 'mc')) +
  geom_density(mapping = aes(x=mcSW, color = 'mcSW'))  +
  scale_colour_manual(name = 'Marginal Costs', values =colorpal1)

# Plotting density of markup
sharecost.df %>% 
  select(markup, markupSW) %>% 
  filter(between(markup, summary.stats.supply$markup_p01, summary.stats.supply$markup_p99)) %>% 
  ggplot() +
  geom_density(mapping = aes(x=markup, color = 'markup')) +
  geom_density(mapping = aes(x=markupSW, color = 'markupSW')) +
  scale_colour_manual(name = 'Markup', values =colorpal1)

# Plotting density of markup (as a percentage of prices)
sharecost.df %>% 
  select(markup.per, markupSW.per) %>% 
  filter(between(markup.per, summary.stats.supply$markup.per_p01, summary.stats.supply$markup.per_p99)) %>% 
  ggplot() +
  geom_density(mapping = aes(x=markup.per, color = 'markup.per')) +
  geom_density(mapping = aes(x=markupSW.per, color = 'markupSW.per')) +
  scale_colour_manual(name = 'Markup.per', values =colorpal1)


# Plotting density of profits of all properies
sharecost.df %>% 
  select(profit) %>% 
  filter(between(profit, summary.stats.supply$profit_p01, summary.stats.supply$profit_p99)) %>% 
  ggplot() +
  geom_density(mapping = aes(profit))


# Before and after comparision






sharecost.df  %>% 
  select(priceSW) %>% 
  filter(between(priceSW, summary.stats.supply$price_p01, summary.stats.supply$price_p99)) %>% 
  ggplot() +
  geom_density(mapping = aes(x=priceSW))


sharecost.df %>% 
  select( , priceSW , mc, mcSW,  markup,markupSW, markup.per, markupSW.per, profit) %>% 
  filter(between(mc, summary.stats.supply$mc_p01, summary.stats.supply$mc_p99)) %>% 
  ggplot() + 
  geom_histogram(mapping = aes(x=mc), binwidth = 10) + 
  labs( x = "Marginal Cost", y = "Frequency",
        title ="Marginal Costs",
        subtitle = "All properties, August 2014 - March 2017",
        caption = "The plot shows 98% of marginal cost values, 1% from left and right tail has been removed.") + 
  scale_x_continuous(breaks = seq(from=-2000, to=1000, by=500),
                     minor_breaks = seq(from=-2000, to=1000, by=100))



sharecost.df %>% 
  select(price, priceSW , mc, mcSW,  markup,markupSW, markup.per, markupSW.per, profit, T_RegPurgeDum) %>% 
  filter(between(mc, summary.stats.supply$mc_p01, summary.stats.supply$mc_p99)) %>% 
  ggplot() + 
  geom_density(mapping = aes(x=mc, colour  = T_RegPurgeDum), kernel = "gaussian", show.legend = TRUE) + 
  labs( x = "Marginal Cost", y = "Frequency",
        title ="Marginal Costs",
        subtitle = "All properties, August 2014 - March 2017",
        caption = "The plot shows 98% of marginal cost values, 1% from left and right tail has been removed.") + 
  scale_x_continuous(breaks = seq(from=-2000, to=1000, by=500),
                     minor_breaks = seq(from=-2000, to=1000, by=100))

sharecost.df %>% 
  select(price, priceSW , mc, mcSW,  markup,markupSW, markup.per, markupSW.per, profit, T_RegPurgeDum) %>% 
  filter(between(mcSW, summary.stats.supply$mcSW_p01, summary.stats.supply$mcSW_p99)) %>% 
  ggplot() + 
  geom_density(mapping = aes(x=price, colour = T_RegPurgeDum), kernel = "gaussian", show.legend = TRUE)


summary(sharecost.df$price[sharecost.df$T_RegPurgeDum==0])
summary(sharecost.df$price[sharecost.df$T_RegPurgeDum==1])

sharecost.df %>% 
  select(price, priceSW , mc, mcSW,  markup,markupSW, markup.per, markupSW.per, profit) %>% 
  filter(between(mcSW, summary.stats.supply$mcSW_p01, summary.stats.supply$mcSW_p99)) %>% 
  ggplot() + 
  geom_histogram(mapping = aes(x=profit), binwidth = 10) 


# 
# sharecost.df %>% 
#   select(price, priceSW , mc, mcSW,  markupSW, markupSW.per, profit) %>% 
#   filter(between(mc, summary.stats.supply$priceSW_min, summary.stats.supply$priceSW_p99)) %>% 
#   ggplot() + 
#   geom_histogram(mapping = aes(x=priceSW), binwidth = 10) 
# 
# 
# 
# labs( x = "price (sales weighted)", y = "Frequency",
#       title ="Prices (sales weighted)",
#       subtitle = "All properties, August 2014 - March 2017",
#       caption = "The plot shows 99% of marginal cost values, 1% of the right tail has been removed.") + 
#   scale_x_continuous(breaks = seq(from=-2000, to=1000, by=500),
#                      minor_breaks = seq(from=-2000, to=1000, by=100))
# 

# sharecost.df %>% 
#   select(mc) %>% 
#   arrange(mc) %>% 
#   mutate(percentile  = percent_rank(mc)) %>% 
#   filter(between(mc, -0.99,0.01)|between(mc, 49.99, 50.01)| between(mc, 99.99, 100.01)|between(mc, 149.99, 150.01)) %>% view()
#   

# ptm <- proc.time()
# load(file = "Y:/agrajg/Research/Data/temp/020233_marketdata.RData")
# proc.time() - ptm
# 
# purgedummy.df  <- marketdata %>% 
#                     select(propertyid, date, T_RegPurgeDum)
# 
# sharecost.df <- sharecost.df %>% 
#   left_join(purgedummy.df) 

# sharecost.df <- sharecost.df %>% 
#   mutate(if_else(T_RegPurgeDum == 1, ))