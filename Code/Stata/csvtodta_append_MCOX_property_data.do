clear all 
set more off 
import delimited Y:\agrajg\Research\Data\RawMCOX_csv_data\listings.csv, varnames(1) clear
save "Y:\agrajg\Research\Data\RawMCOX_listings_dta_data\listings.dta", replace
forval i = 1(1)20 {
	import delimited Y:\agrajg\Research\Data\RawMCOX_csv_data\listings_`i'.csv, varnames(1) clear
	save "Y:\agrajg\Research\Data\RawMCOX_listings_dta_data\listings_`i'.dta", replace
}


use  "Y:\agrajg\Research\Data\RawMCOX_listings_dta_data\listings.dta", clear
forval i = 1(1)20 {
	append using "Y:\agrajg\Research\Data\RawMCOX_listings_dta_data\listings_`i'.dta", force
}
save "Y:\agrajg\Research\Data\RawMCOX_listings_dta_data\allappended_listings.dta", replace
