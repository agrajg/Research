rm(list = ls())
.libPaths(new = c("H:/agrajg/R", "H:/agrajg/R2")) 
library(tibble)
library(dplyr)
library(magrittr)
library(caret)
library(ggplot2)
library(tidyverse)
library(ggthemes)
library(magrittr)
library(h2o)
localH2O <- h2o.init(nthreads = -1,max_mem_size = "265G",port =54328)

# Loading market data
ptm <- proc.time()
load(file = "000001_AIRDNA_market_data_clean_final.RData")
MarketARB.df <- MarketARB.df %>% select(-ends_with("alt"))
proc.time() - ptm
# Converting into h2o data frame
ptm <- proc.time()
MarketARB.df.h2o <- as.h2o(MarketARB.df)
proc.time() - ptm




 
# rm(list = c("marketdata"))
# 
# marketdata.h2o.df$propertyid <- as.factor(marketdata.h2o.df$propertyid)
# marketdata.h2o.df$date <- as.factor(marketdata.h2o.df$date)
# marketdata.h2o.df$hostid <- as.factor(marketdata.h2o.df$hostid)
# marketdata.h2o.df$status <- as.factor(marketdata.h2o.df$status)
# marketdata.h2o.df$reservationid <- as.factor(marketdata.h2o.df$reservationid)
# marketdata.h2o.df$reservationidalt <- as.factor(marketdata.h2o.df$reservationidalt)
# marketdata.h2o.df$bookeddate <- as.factor(marketdata.h2o.df$bookeddate)
# marketdata.h2o.df$bookeddatealt <- as.factor(marketdata.h2o.df$bookeddatealt)
# marketdata.h2o.df$T_year <- as.factor(marketdata.h2o.df$T_year)
# marketdata.h2o.df$T_moy <- as.factor(marketdata.h2o.df$T_moy)
# marketdata.h2o.df$T_dom <- as.factor(marketdata.h2o.df$T_dom)
# marketdata.h2o.df$T_qoy <- as.factor(marketdata.h2o.df$T_qoy)
# marketdata.h2o.df$T_dow <- as.factor(marketdata.h2o.df$T_dow)
# marketdata.h2o.df$T_woy1 <- as.factor(marketdata.h2o.df$T_woy1)
# marketdata.h2o.df$T_woy2 <- as.factor(marketdata.h2o.df$T_woy2)
# marketdata.h2o.df$T_doy <- as.factor(marketdata.h2o.df$T_doy)
# marketdata.h2o.df$T_wom1 <- as.factor(marketdata.h2o.df$T_wom1)
# marketdata.h2o.df$T_wom2 <- as.factor(marketdata.h2o.df$T_wom2)
# marketdata.h2o.df$T_holiday <- as.factor(marketdata.h2o.df$T_holiday)
# marketdata.h2o.df$T_holidaywoy1 <- as.factor(marketdata.h2o.df$T_holidaywoy1)
# marketdata.h2o.df$T_holidaywom1 <- as.factor(marketdata.h2o.df$T_holidaywom1)
# marketdata.h2o.df$T_holidaywoy2 <- as.factor(marketdata.h2o.df$T_holidaywoy2)
# marketdata.h2o.df$T_holidaywom2 <- as.factor(marketdata.h2o.df$T_holidaywom2)
# marketdata.h2o.df$T_RegCalledIllegal <- as.factor(marketdata.h2o.df$T_RegCalledIllegal)
# marketdata.h2o.df$T_RegDebate <- as.factor(marketdata.h2o.df$T_RegDebate)
# marketdata.h2o.df$T_RegRedSupply <- as.factor(marketdata.h2o.df$T_RegRedSupply)
# marketdata.h2o.df$T_RegPurgeDum <- as.factor(marketdata.h2o.df$T_RegPurgeDum)
# marketdata.h2o.df$T_RegDataDiscDum <- as.factor(marketdata.h2o.df$T_RegDataDiscDum)
# marketdata.h2o.df$T_RegActRegImpDum <- as.factor(marketdata.h2o.df$T_RegActRegImpDum)