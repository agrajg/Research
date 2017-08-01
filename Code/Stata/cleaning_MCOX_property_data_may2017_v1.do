clear all 
set more off 
import delimited Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\MCOX_csv_data\listings.csv, varnames(1) clear
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\MCOX_listings_dta_data\listings.dta", replace
forval i = 1(1)20 {
	import delimited Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\MCOX_csv_data\listings_`i'.csv, varnames(1) clear
	save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\MCOX_listings_dta_data\listings_`i'.dta", replace
}


use  "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\MCOX_listings_dta_data\listings.dta", clear
forval i = 1(1)20 {
	append using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\MCOX_listings_dta_data\listings_`i'.dta", force
}

destring id , generate(propertyid) force
order id propertyid
format %30s id
preserve
keep if propertyid==.
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\MCOX_listings_dta_data\MCOX_property_data_dirty.dta", replace
restore 

drop if propertyid ==.
