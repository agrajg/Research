clear all 
set more off 
use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\MCOX_listings_dta_data\allappended_listings.dta", clear

destring id , generate(propertyid) force
order id propertyid
format %30s id
preserve
keep if propertyid==.
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\MCOX_listings_dta_data\MCOX_property_data_dirty.dta", replace
restore 

drop if propertyid ==.
