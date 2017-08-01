clear all
set more off 
cd "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Code\Stata\"
********************************************************************************
timer clear 1
timer on 1
do "csvtodta_MCOX_reviews_data_april2017.do"
timer off 1
timer on 1
do "cleaning_MCOX_property_data_may2017_v12.do"
timer off 1
timer on 1
do "cleaning_MCOX_property_data_may2017_v22.do"
timer off 1
********************************************************************************
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\MCOX_listings_dta_data\MCOX_property_data_clean_final.dta", replace
export delimited using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\datacodeR\MCOX_property_data_clean_final.csv", replace
********************************************************************************
*sampling 50 properties
do "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Code\Stata\sample50properties_v11.do"
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_market_dta_data\MCOX_property_data_clean_final_sample50.dta", replace 
export delimited using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\datacodeR\MCOX_property_data_clean_final_sample50.csv", replace
********************************************************************************

timer list 1
