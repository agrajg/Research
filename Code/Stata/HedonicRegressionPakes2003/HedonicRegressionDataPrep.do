********************************************************************************
*********************** AIRDNA HEDONIC ANALYSIS DATA PREP **********************
*****************************BEGIN**********************************************
********************************************************************************
clear all
set more off
timer clear

timer on 1
*===============================================================================
use "Y:\agrajg\Research\Data\FinalData\AIRDNACleanedMergedDataForRegressionBlockedDropped.dta" , clear
*===============================================================================
timer off 1

g lprice = log(price)
order lprice, after(price)
gen i = 1
tab _merge
drop _merge
merge m:1 i using Y:\agrajg\Research\Data\OtherData\centeroids.dta
drop _merge
sort propertyid date

by propertyid : gen matchedtonextpd = (date[_n+1] - date ==1)
label var matchedtonextpd "Property matched to next period"

* Starting with the primary characteristics , generating sumamry stats
tab listingtype, generate(ltypedum)
order ltypedum*, after (listingtype)
		
forvalues i = 1(1)9 {
	gen dist`i' = sqrt((latitude - mean_attlatitude`i')^2+(longitude - mean_attlongitude`i')^2)
	drop mean_attlatitude`i' mean_attlongitude`i'
}

tab neighborhood , generate(nbhddum)

sort date
sum date
local datemin = `r(min)'
local datemax = `r(max)'

di `datemin'
di `datemax'

********************************************************************************
***************** SAVING DATA FOR HEDONIC REGRESSION ***************************
********************************************************************************
save "Y:\agrajg\Research\Data\temp\HedonicRegressionData.dta", replace
********************************************************************************
/*
forvalues i = `datemin'(1)`datemax' {
	preserve
	keep if date == `i'
	save "Y:\agrajg\Research\Data\temp\HedonicRegressionDatabrokenbyDates`i'.dta", replace
	restore
}
********************************************************************************
********************************************************************************
********************************************************************************
timer list
********************************************************************************
*********************** AIRDNA HEDONIC ANALYSIS DATA PREP **********************
*****************************END************************************************
********************************************************************************
