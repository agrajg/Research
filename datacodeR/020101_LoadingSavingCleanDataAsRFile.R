rm(list = ls())
# Set working directory
# wdir <- "U:/datacodeR/"
wdir <- "Y:/agrajg/Research/datacodeR"
# Packages
# ##############################################################################################################################

install.packages("tidyr", lib =  paste(wdir,"library", sep = "/"))
install.packages("dplyr", lib =  paste(wdir,"library", sep = "/"))
install.packages("ggplot2", lib =  paste(wdir,"library", sep = "/"))
install.packages("ggmap", lib =  paste(wdir,"library", sep = "/"))
install.packages("sparklyr", lib =  paste(wdir,"library", sep = "/"))
update.packages()

library("sparklyr", lib.loc=paste(wdir,"library", sep = "/"))
library("dplyr", lib.loc=paste(wdir,"library", sep = "/"))
library("tidyr", lib.loc=paste(wdir,"library", sep = "/"))
library("ggplot2", lib.loc=paste(wdir,"library", sep = "/"))
library("ggmap", lib.loc=paste(wdir,"library", sep = "/"))

# 
# install.packages(c("tidyr","dplyr","ggplot2","ggmap", "sparklyr"))
# library("ggplot2")
# library("ggmap")
# library("sparklyr")
# library("dplyr")
# library("tidyr")

# ##############################################################################################################################

setwd(wdir)
ptm <- proc.time()

# Market data
market.data <- read.csv(file = "000103_AIRDNA_market_data_clean_final.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# market.data$date <- as.Date(market.data$date, "%d%b%Y")
# market.data$bookeddate <- as.Date(market.data$bookeddate, "%d%b%Y")
# market.data$bookeddatealt <- as.Date(market.data$bookeddatealt, "%d%b%Y")
save(market.data, file = "020101_airdna_market_data.RData")

# MCOX listings data
mcox.listing.data <- read.csv(file = "MCOX_property_data_clean_final.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# mcox.listing.data$scraped_date <- as.Date(mcox.listing.data$scraped_date ,"%d%b%Y")
# mcox.listing.data$last_scraped <- as.Date(mcox.listing.data$last_scraped ,"%d%b%Y")
# mcox.listing.data$host_since <- as.Date(mcox.listing.data$host_since ,"%d%b%Y") 
# mcox.listing.data$calendar_last_scraped <- as.Date(mcox.listing.data$calendar_last_scraped ,"%d%b%Y")
save(mcox.listing.data, file = "mcox_listing_data.RData")
# AIRDNA listings data

airdna.listing.data <- read.csv(file = "000102_AIRDNA_listings_data_clean_final.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# airdna.listing.data$createddate <- as.Date(airdna.listing.data$createddate, "%d%b%Y")
# airdna.listing.data$lastscrapeddate <- as.Date(airdna.listing.data$lastscrapeddate, "%d%b%Y")
save(airdna.listing.data, file = "020101_airdna_listing_data.RData")
# ##############################################################################################################################


proc.time() - ptm

# Data load csv and save RData (All data)
setwd(wdir)
ptm <- proc.time()

# Market data
market.data <- read.csv(file = "000103_AIRDNA_market_data_clean_final_sample50.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# market.data$date <- as.Date(market.data$date, "%d%b%Y")
# market.data$bookeddate <- as.Date(market.data$bookeddate, "%d%b%Y")
# market.data$bookeddatealt <- as.Date(market.data$bookeddatealt, "%d%b%Y")
save(market.data, file = "020101_airdna_market_data_sample50.RData")

# MCOX listings data
mcox.listing.data <- read.csv(file = "MCOX_property_data_clean_final_sample50.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# mcox.listing.data$scraped_date <- as.Date(mcox.listing.data$scraped_date ,"%d%b%Y")
# mcox.listing.data$last_scraped <- as.Date(mcox.listing.data$last_scraped ,"%d%b%Y")
# mcox.listing.data$host_since <- as.Date(mcox.listing.data$host_since ,"%d%b%Y") 
# mcox.listing.data$calendar_last_scraped <- as.Date(mcox.listing.data$calendar_last_scraped ,"%d%b%Y")
save(mcox.listing.data, file = "mcox_listing_data_sample50.RData")

# AIRDNA listings data
airdna.listing.data <- read.csv(file = "000102_AIRDNA_listings_data_clean_final_sample50.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# airdna.listing.data$createddate <- as.Date(airdna.listing.data$createddate, "%d%b%Y")
# airdna.listing.data$lastscrapeddate <- as.Date(airdna.listing.data$lastscrapeddate, "%d%b%Y")
save(airdna.listing.data, file = "020101_airdna_listing_data_sample50.RData")

proc.time() - ptm