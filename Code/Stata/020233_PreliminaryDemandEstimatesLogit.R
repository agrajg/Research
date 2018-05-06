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
h2o.init(nthreads = -1, max_mem_size = "265G", port =11220)

# csv or R data to h2o data
# marketdata <- read.csv(file = "Y:/agrajg/Research/Data/temp/010301_DataforQuantityRegressions.csv")
# save(marketdata, file = "Y:/agrajg/Research/Data/temp/020233_marketdata.RData")
ptm <- proc.time()
load(file = "Y:/agrajg/Research/Data/temp/020233_marketdata.RData")
proc.time() - ptm

ptm <- proc.time()
marketdata.h2o.df <- as.h2o(marketdata)
proc.time() - ptm
rm(list = c("marketdata"))

marketdata.h2o.df$propertyid <- as.factor(marketdata.h2o.df$propertyid)
marketdata.h2o.df$date <- as.factor(marketdata.h2o.df$date)
marketdata.h2o.df$hostid <- as.factor(marketdata.h2o.df$hostid)
marketdata.h2o.df$status <- as.factor(marketdata.h2o.df$status)
marketdata.h2o.df$reservationid <- as.factor(marketdata.h2o.df$reservationid)
marketdata.h2o.df$reservationidalt <- as.factor(marketdata.h2o.df$reservationidalt)
marketdata.h2o.df$bookeddate <- as.factor(marketdata.h2o.df$bookeddate)
marketdata.h2o.df$bookeddatealt <- as.factor(marketdata.h2o.df$bookeddatealt)
marketdata.h2o.df$T_year <- as.factor(marketdata.h2o.df$T_year)
marketdata.h2o.df$T_moy <- as.factor(marketdata.h2o.df$T_moy)
marketdata.h2o.df$T_dom <- as.factor(marketdata.h2o.df$T_dom)
marketdata.h2o.df$T_qoy <- as.factor(marketdata.h2o.df$T_qoy)
marketdata.h2o.df$T_dow <- as.factor(marketdata.h2o.df$T_dow)
marketdata.h2o.df$T_woy1 <- as.factor(marketdata.h2o.df$T_woy1)
marketdata.h2o.df$T_woy2 <- as.factor(marketdata.h2o.df$T_woy2)
marketdata.h2o.df$T_doy <- as.factor(marketdata.h2o.df$T_doy)
marketdata.h2o.df$T_wom1 <- as.factor(marketdata.h2o.df$T_wom1)
marketdata.h2o.df$T_wom2 <- as.factor(marketdata.h2o.df$T_wom2)
marketdata.h2o.df$T_holiday <- as.factor(marketdata.h2o.df$T_holiday)
marketdata.h2o.df$T_holidaywoy1 <- as.factor(marketdata.h2o.df$T_holidaywoy1)
marketdata.h2o.df$T_holidaywom1 <- as.factor(marketdata.h2o.df$T_holidaywom1)
marketdata.h2o.df$T_holidaywoy2 <- as.factor(marketdata.h2o.df$T_holidaywoy2)
marketdata.h2o.df$T_holidaywom2 <- as.factor(marketdata.h2o.df$T_holidaywom2)
marketdata.h2o.df$T_RegCalledIllegal <- as.factor(marketdata.h2o.df$T_RegCalledIllegal)
marketdata.h2o.df$T_RegDebate <- as.factor(marketdata.h2o.df$T_RegDebate)
marketdata.h2o.df$T_RegRedSupply <- as.factor(marketdata.h2o.df$T_RegRedSupply)
marketdata.h2o.df$T_RegPurgeDum <- as.factor(marketdata.h2o.df$T_RegPurgeDum)
marketdata.h2o.df$T_RegDataDiscDum <- as.factor(marketdata.h2o.df$T_RegDataDiscDum)
marketdata.h2o.df$T_RegActRegImpDum <- as.factor(marketdata.h2o.df$T_RegActRegImpDum)

AllVarList <-  colnames(marketdata.h2o.df)


# Logit model estimation
Yvar <- "status"
Xvars1 <-  c("lprice")
Xvars2 <-  c("lprice", "propertyid")
Xvars3 <-  c("lprice", "propertyid", "date")
Xvars4 <-  c("lprice", "HT_ListCountAll", 
             "HT_ListCountActive", 
             "HT_countEHAAll", "HT_countNRAll", "HT_countPRAll", "HT_countSRAll", 
             "HT_countEHAActive", "HT_countNRActive", "HT_countPRActive", 
             "HT_countSRActive", "HT_HostAge", "HT_HostAgeComb", "HT_Adayshostcount", 
             "HT_Bdayshostcount", "HT_Rdayshostcount", "HT_HostGuestPastCount", 
             "LT_PropAge", "LT_Adayscount", 
             "LT_Bdayscount", "LT_Rdayscount", "LT_PropGuestPastCount", "propertyid", "date")

# Logit demand estimation
ptm <- proc.time()
logit1 <- h2o.glm(x = Xvars1, y = Yvar, training_frame = marketdata.h2o.df, 
                  family = "binomial",
                  remove_collinear_columns = TRUE,
                  lambda = 0 ,
                  seed = 47374, 
                  objective_epsilon = 0.000001)
proc.time() - ptm
summary.logit1 <- summary(logit1)
h2o.coef(logit1)["lprice"]
logit1.path <- h2o.saveModel(logit1, path = "Y:/agrajg/Research/Code/Output", force = TRUE)

ptm <- proc.time()
logit2 <- h2o.glm(x = Xvars2, y = Yvar, training_frame = marketdata.h2o.df, 
                  family = "binomial",
                  remove_collinear_columns = TRUE,
                  lambda = 0 ,
                  seed = 47374, 
                  objective_epsilon = 0.000001)
proc.time() - ptm
summary.logit2 <- summary(logit2)
h2o.coef(logit2)["lprice"]
logit2.path <- h2o.saveModel(logit2, path = "Y:/agrajg/Research/Code/Output", force = TRUE)

ptm <- proc.time()
logit3 <- h2o.glm(x = Xvars3, y = Yvar, training_frame = marketdata.h2o.df, 
                  family = "binomial",
                  remove_collinear_columns = TRUE,
                  lambda = 0 ,
                  seed = 47374, 
                  objective_epsilon = 0.000001)
proc.time() - ptm
summary.logit3 <- summary(logit3)
h2o.coef(logit3)["lprice"]
logit3.path <- h2o.saveModel(logit3, path = "Y:/agrajg/Research/Code/Output", force = TRUE)
 
ptm <- proc.time()
logit4 <- h2o.glm(x = Xvars4, y = Yvar, training_frame = marketdata.h2o.df, 
                  family = "binomial",
                  remove_collinear_columns = TRUE,
                  lambda = 0 ,
                  seed = 47374, 
                  objective_epsilon = 0.000001)
proc.time() - ptm
summary.logit4 <- summary(logit4)
h2o.coef(logit4)["lprice"]
lprice.coeff.logit4 <- h2o.coef(logit4)["lprice"]
logit4.path <- h2o.saveModel(logit4, path = "Y:/agrajg/Research/Code/Output", force = TRUE)

# Using the demand estimates, predict the probibility of bookings 


predshare.h2o.df <- h2o.predict(object = logit4, newdata = marketdata.h2o.df)
ptm <- proc.time()
predshare.df <- as.data.frame(predshare.h2o.df)
proc.time() - ptm

ptm <- proc.time()
load(file = "Y:/agrajg/Research/Data/temp/020233_marketdata.RData")
proc.time() - ptm


lprice.coeff.logit4 <- h2o.coef(logit4)["lprice"]
lprice.coeff.logit4 = lprice.coeff.logit4 -6.2

sharecost.df <- marketdata %>% 
  select(propertyid,date,hostid,price,status, T_RegPurgeDum) %>% 
  bind_cols(predshare.df) %>% 
  mutate(
    predshare = R,
    elaticity = lprice.coeff.logit4*(1-predshare),
    mc = price*(1+(1/(lprice.coeff.logit4*(1-predshare)))),
    markup <- price - mc,
    profit <- if_else(status=="R", price - mc, -mc)
  )

summary(sharecost.df$elaticity)
summary(sharecost.df$mc)
summary(sharecost.df$markup)
summary(sharecost.df$profit)


save(sharecost.df, file = "Y:/agrajg/Research/Data/temp/020233_sharecost2.RData")

# Computing implied change in  booking
Yvar <- "status"
marketdata.h2o.df$T_RegPurgeDum <- as.numeric(marketdata.h2o.df$T_RegPurgeDum)
PQcovariates <-  c("T_year","T_moy","T_dom","T_dow","T_wom2","T_holiday","T_holidaywom2","T_RegCalledIllegal","T_RegDebate",             
                   "T_RegRedSupply","T_RegPurgeDum","T_RegDataDiscDum","T_RegActRegImpDum", "HT_ListCountAll", 
                   "HT_ListCountActive","HT_countEHAAll", "HT_countNRAll", "HT_countPRAll", "HT_countSRAll", 
                   "HT_countEHAActive", "HT_countNRActive", "HT_countPRActive", 
                   "HT_countSRActive", "HT_HostAge", "HT_HostAgeComb", "HT_Adayshostcount", 
                   "HT_Bdayshostcount", "HT_Rdayshostcount", "HT_HostGuestPastCount", 
                   "LT_PropAge", "LT_Adayscount","LT_Bdayscount", "LT_Rdayscount", "LT_PropGuestPastCount", "propertyid")
ptm <- proc.time()
logit.booking <- h2o.glm(x = PQcovariates, y = Yvar, training_frame = marketdata.h2o.df, 
                          family = "binomial", 
                          lambda = 0,
                          remove_collinear_columns = TRUE, 
                          seed = 47374, 
                          objective_epsilon = 0.000001)
proc.time() - ptm
summary.logit.booking <- summary(logit.booking)
Purge.coeff.logit.booking <- h2o.coef(logit.booking)["T_RegPurgeDum"]
Purge.coeff.logit.booking
# Purge.coeff.logit.booking <- logit.booking@model$coefficients_table
logit.booking.path <- h2o.saveModel(logit.booking, path = "Y:/agrajg/Research/Code/Output", force = TRUE)

# Computing implied change in price
Yvar <- "lprice"
ptm <- proc.time()
logit.lprice <- h2o.glm(x = PQcovariates, y = Yvar, training_frame = marketdata.h2o.df, 
                          family = "gaussian", 
                          lambda = 0,
                          remove_collinear_columns = TRUE, 
                          seed = 47374, 
                          objective_epsilon = 0.000001)
proc.time() - ptm
summary.logit.lprice <- summary(logit.lprice)
Purge.coeff.logit.lprice <- h2o.coef(logit.lprice)["T_RegPurgeDum"]
Purge.coeff.logit.lprice
# Purge.coeff.logit.lprice <- logit.lprice@model$coefficients_table
logit.lprice.path <- h2o.saveModel(logit.lprice, path = "Y:/agrajg/Research/Code/Output", force = TRUE)

# plot.data.df <- sharecost.df %>% 
#   filter(propertyid >=5890347 & propertyid <= 5892000)
# 
# ggplot(plot.data.df, mapping = aes(x=date,y=mc, color = propertyid)) + geom_jitter()


# rm(list = c("marketdata", "predshare.df"))



# sharecost.df$predshare <- sharecost.df$R
# sharecost.df$elaticity <- lprice.coeff.logit4*(1-demandcostdata$predshare)
# demandcostdata$mc <- demandcostdata$price*(1+(1/(lprice.coeff.logit4*(1-demandcostdata$predshare))))
# demandcostdata$markup <- demandcostdata$price - demandcostdata$mc
# summary(demandcostdata$elaticity,exact_quantiles=TRUE)
# summary(demandcostdata$mc,exact_quantiles=TRUE)
# summary(demandcostdata$markup,exact_quantiles=TRUE)
# 
# 
# 
# 
# demandcostdata$propertyid <- marketdata.h2o.df$propertyid
# demandcostdata$predshare <- demandcostdata$R
# 
# # marketdata.h2o.df$predshare <- h2o.predict(object = logit4, newdata = marketdata.h2o.df)$R
# demandcostdata$elaticity <- lprice.coeff.logit4*(1-demandcostdata$predshare)
# demandcostdata$mc <- demandcostdata$price*(1+(1/(lprice.coeff.logit4*(1-demandcostdata$predshare))))
# demandcostdata$markup <- demandcostdata$price - demandcostdata$mc
# summary(demandcostdata$elaticity,exact_quantiles=TRUE)
# summary(demandcostdata$mc,exact_quantiles=TRUE)
# summary(demandcostdata$markup,exact_quantiles=TRUE)
# 
# 





# # Saving the models
# 
# # h2o.shutdown()
# 
# logit4.fit <- h2o.predict(object = logit4, newdata = marketdata.h2o.df)
# summary(logit4.fit)
# logit4.fit <- as.data.frame(logit4.fit)
# 
# logit4.fit$LogOdds <- log(logit4.fit$R/logit4.fit$A)  
# logit4.fit$lesslprice <- logit4.fit$LogOdds - h2o.coef(logit4)["lprice"] * marketdata.h2o.df$lprice
# logit4.fit$WTP99 <- exp((1/h2o.coef(logit4)["lprice"])*(log(99)-logit4.fit$lesslprice))
# marketdata.h2o.df$WTP99 <- logit4.fit$WTP99
# 
# logit4.fit %>% 
#   filter(predict=="A") %>% 
#   head()
# 
# 
# CS.df <- as.data.frame(marketdata.h2o.df[, c("propertyid", "date", "price","status", "T_RegPurgeDum", "WTP99")])
# 
# 
# # CS.df <- CS.df %>%
# #   mutate(surplus = if_else(status=="R", WTP99 - price, NA))
# # 
# # CS.df %>% 
# #   group_by(T_RegPurgeDum) %>% 
# #   select(surplus) %>% 
# #   summarise()
# # 
# # 
# # CS.hist <- CS.df %>% 
# #   filter(status=="R")  %>% 
# #   ggplot(aes(x = surplus,colour=T_RegPurgeDum)) + geom_density() + theme_tufte()
