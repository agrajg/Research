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
ptm <- proc.time()
Property.df <- read.csv(file = "Y:\\agrajg\\Research\\Data\\temp\\000102_AIRDNA_listings_data_clean_final.csv", header = TRUE)
save(Property.df, file = "Y:\\agrajg\\Research\\Data\\temp\\010401_CleanedPropertyDataAirDna.RData")
proc.time() - ptm


ptm <- proc.time()
Market.df <- read.csv(file = "Y:\\agrajg\\Research\\Data\\temp\\000103_AIRDNA_market_data_clean_final.csv", header = TRUE)
save(Market.df, file = "Y:\\agrajg\\Research\\Data\\temp\\010401_CleanedMarketDataAirDna.RData")
proc.time() - ptm