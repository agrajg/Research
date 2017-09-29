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
/*
preserve
collapse 	(count) numproperties = propertyid ///
			(sum) numprnextpd = matchedtonextpd ///
			(mean) mean_ltypedum1 = ltypedum1 ///
			(mean) mean_ltypedum2 = ltypedum2 ///
			(mean) mean_ltypedum3 = ltypedum3 ///
			(mean) mean_ltypedum4 = ltypedum4 ///
			(mean) mean_bedrooms = bedrooms ///
			(min) min_bedrooms =bedrooms ///
			(p1) p1_bedrooms =bedrooms ///
			(p5) p5_bedrooms =bedrooms ///
			(p10) p10_bedrooms =bedrooms ///
			(p25) p25_bedrooms =bedrooms ///
			(p50) p50_bedrooms =bedrooms ///
			(p75) p75_bedrooms =bedrooms ///
			(p90) p90_bedrooms =bedrooms ///
			(p95) p95_bedrooms =bedrooms ///
			(p99) p99_bedrooms =bedrooms ///
			(max) max_bedrooms =bedrooms ///
			(mean) mean_bathrooms = bathrooms ///
			(min) min_bathrooms =bathrooms ///
			(p1) p1_bathrooms =bathrooms ///
			(p5) p5_bathrooms =bathrooms ///
			(p10) p10_bathrooms =bathrooms ///
			(p25) p25_bathrooms =bathrooms ///
			(p50) p50_bathrooms =bathrooms ///
			(p75) p75_bathrooms =bathrooms ///
			(p90) p90_bathrooms =bathrooms ///
			(p95) p95_bathrooms =bathrooms ///
			(p99) p99_bathrooms =bathrooms ///
			(max) max_bathrooms =bathrooms ///
			, by(date)

save "Y:\agrajg\Research\Output\SumStatsbyDatePrimaryvar1.dta", replace			
restore
*/	
		
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
