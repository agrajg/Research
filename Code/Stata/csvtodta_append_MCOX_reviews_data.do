clear all 
set more off
********************************************************************************
*** CLEANING MCOX REVIEWS DATA 
*** CLEANS DATA TO PRODUCE DTA FILES
*** .CSV TO .DTA FILE
********************************************************************************
import delimited "Y:\agrajg\Research\Data\RawMCOX_csv_data\reviews.csv", delimiter("", collapse) bindquote(strict) varnames(1) 
save "Y:\agrajg\Research\Data\RawMCOX_reviews_dta_data\reviews.dta", replace

forval i=1(1)20 {
	clear all
	import delimited "Y:\agrajg\Research\Data\RawMCOX_csv_data\reviews_`i'.csv", delimiter("", collapse) bindquote(strict) varnames(1) 
	save "Y:\agrajg\Research\Data\RawMCOX_reviews_dta_data\reviews_`i'.dta", replace
}
*** APPENDING ALL THE REVIEWS FROM THE PAST
clear all
use "Y:\agrajg\Research\Data\RawMCOX_reviews_dta_data\reviews.dta"
forval i=1(1)20 {
	append using "Y:\agrajg\Research\Data\RawMCOX_reviews_dta_data\reviews_`i'.dta"
}
duplicates drop listing_id id date reviewer_id reviewer_name comments , force
save "Y:\agrajg\Research\Data\RawMCOX_reviews_dta_data\reviews_all.dta", replace
export delimited using "Y:\agrajg\Research\Data\RawMCOX_reviews_dta_data\reviews_all.csv", replace
