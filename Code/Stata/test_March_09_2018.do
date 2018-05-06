clear all
set more off
use "Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data_clean_final_BlockedDropped.dta", clear 
preserve
keep if date >= td(01aug2015) & date <= td(31dec2015)
sum propertyid
return list
********************************************************************************
keep if propertyid >= (4756980 - 2848321) | propertyid <= (4756980 + 2848321)
di (4756980 + 2848321)
di (4756980 - 2848321)
keep if propertyid >= (`r(mean)' - `r(sd)') & propertyid <= (`r(mean)' + `r(sd)') 
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_data_clean_final.dta"
keep if _merge ==3
save "Y:\agrajg\Research\Data\temp\test_March_09_2018.dta", replace
********************************************************************************
