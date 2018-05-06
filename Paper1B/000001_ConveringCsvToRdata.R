# Converting csv data into RDtata
rm(list = ls())
.libPaths(new = c("H:/agrajg/R", "H:/agrajg/R2")) 

# Data on properties
ptm <- proc.time()
Property.df <- read.csv(file = "000102_AIRDNA_listings_data_clean_final.csv", header = TRUE)
save(Property.df, file = "000001_AIRDNA_listings_data_clean_final.RData")
proc.time() - ptm


# market data on all the properties including those that were blocked
ptm <- proc.time()
MarketARB.df <- read.csv(file = "000103_AIRDNA_market_data_clean_final.csv", header = TRUE)
save(MarketARB.df, file = "000001_AIRDNA_market_data_clean_final.RData")
proc.time() - ptm
# Data without blocked listings
ptm <- proc.time()
MarketAR.df <- read.csv(file = "000103_AIRDNA_market_data_clean_final_BlockedDropped.csv", header = TRUE)
save(MarketAR.df, file = "000001_AIRDNA_market_data_clean_final_BlockedDropped.RData")
proc.time() - ptm
# transactions only data
ptm <- proc.time()
MarketA.df <- read.csv(file = "000103_AIRDNA_market_data_clean_final_OnlyBooked.csv", header = TRUE)
save(MarketA.df, file = "000001_AIRDNA_market_data_clean_final_OnlyBooked.csv.RData")
proc.time() - ptm
