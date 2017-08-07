********************************************************************************
****************AIRDNA DATA PREP FOR REGRESSION ********************************
*****************************BEGIN**********************************************
********************************************************************************
clear all
set more off

*===============================================================================
use "Y:\agrajg\Research\Data\FinalData\AIRDNA_market_data_clean_final_sample50.dta" , clear
*use "Y:\agrajg\Research\Data\FinalData\AIRDNA_market_data_clean_final.dta" , clear
merge m:1 propertyid using "Y:\agrajg\Research\Data\FinalData\AIRDNA_listings_data_clean_final1.dta" 
*===============================================================================

drop if _merge == 1
drop if _merge == 2

global CatVariables propertytype listingtype country state city zipcode neighborhood metropolitanstatisticalarea superhost cancellationpolicy checkintime checkouttime businessready instantbookenabled 


foreach var in $CatVariables {
	rename `var' temp`var'
	encode temp`var', generate(`var')
	order `var', after(temp`var')
	drop temp`var'
}

compress

*===============================================================================
save "AIRDNACleanedMergedDataForRegression.dta", replace
*===============================================================================

drop if status =="B"
compress

*===============================================================================
save "AIRDNACleanedMergedDataForRegressionBlockedDropped.dta" , replace
*===============================================================================

********************************************************************************
****************AIRDNA DATA PREP FOR REGRESSION ********************************
*****************************BEGIN**********************************************
********************************************************************************
