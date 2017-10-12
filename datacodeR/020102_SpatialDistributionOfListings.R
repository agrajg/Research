rm(list = ls())
# Set working directory
# wdir <- "U:/datacodeR/"
wdir <- "Y:/agrajg/Research/datacodeR"
lib.path <- paste(wdir,"library", sep = "/")
.libPaths(new = lib.path)

# Packages
# ##############################################################################################################################

# install.packages("tidyr", lib =  lib.path)
# install.packages("dplyr", lib =  lib.path)
# install.packages("ggplot2", lib =  lib.path)
# install.packages("ggmap", lib =  lib.path)
# install.packages("rsparkling", lib =  lib.path)
# install.packages("sparklyr", lib =  lib.path)
# install.packages(c("nycflights13", "Lahman"), lib =  lib.path)
# detach("package:rsparkling", unload = TRUE)
# if ("package:h2o" %in% search()) { detach("package:h2o", unload = TRUE) }
# if (isNamespaceLoaded("h2o")){ unloadNamespace("h2o") }
# remove.packages("h2o", lib =  lib.path)
# install.packages("h2o", lib =  lib.path, type = "source", repos =  "https://h2o-release.s3.amazonaws.com/h2o/rel-weierstrass/2/R")
# update.packages()

library("sparklyr", lib.loc=lib.path)
library("dplyr", lib.loc=lib.path)
library("tidyr", lib.loc=lib.path)
library("ggplot2", lib.loc=lib.path)
library("ggmap", lib.loc=lib.path)
library("rsparkling", lib.loc=lib.path)
library("h2o", lib.loc=lib.path)


# ------------------------------------------------------------------------------------------------------
# loading data to R
setwd(wdir)
load("020101_airdna_listing_data.Rdata")
# load("mcox_listing_data.RData")
# load("020101_airdna_market_data.RData")
# ------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------
# starting spark environment
spark_install("2.0.1")
sc <- spark_connect(master = "local")
# ------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------
# Copying data on to spark
airdna.listing.data.sc <- sdf_copy_to(sc, airdna.listing.data, "airdna_listing_data" , overwrite = TRUE)
# market.data.sc <- sdf_copy_to(sc, market.data, "market_data_sc" , overwrite = TRUE)


# spark_disconnect(sc)
