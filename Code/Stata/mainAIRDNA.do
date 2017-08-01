clear all
set more off 
cd "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Code\Stata\"
********************************************************************************

*******************AIRDNA LISTINGS DATA*****************************************

do "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Code\Stata\cleaning_AIRDNA_property_data_may2017_v1.do" 
*saving all data
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_listings_dta_data\AIRDNA_listings_data_clean_final.dta", replace
export delimited using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\datacodeR\AIRDNA_listings_data_clean_final.csv", replace
*sampling 50 properties
do "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Code\Stata\sample50properties_v11.do"
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_market_dta_data\AIRDNA_listings_data_clean_final_sample50.dta", replace 
export delimited using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\datacodeR\AIRDNA_listings_data_clean_final_sample50.csv", replace
********************************************************************************

timer clear 1
*******************AIRDNA MARKET DATA*******************************************
timer on 1
do "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Code\Stata\csvtodta_AIRDNA_market_data_may2017.do"
timer off 1
timer on 1
do "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Code\Stata\cleaning_AIRDNA_market_data_may2017_v2.do"
timer off 1
timer on 1
do "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Code\Stata\cleaning_AIRDNA_market_data_may2017_v32.do"
timer off 1

*saving all data
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_market_dta_data\AIRDNA_market_data_clean_final.dta", replace 
export delimited using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\datacodeR\AIRDNA_market_data_clean_final.csv", replace
*sampling 50 properties
do "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Code\Stata\sample50properties_v11.do"
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_market_dta_data\AIRDNA_market_data_clean_final_sample50.dta", replace 
export delimited using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\datacodeR\AIRDNA_market_data_clean_final_sample50.csv", replace
timer list 1


********************************************************************************
