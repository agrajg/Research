clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDs.dta", clear
*tsset propertyid date, daily
*-------------------------------------------------------------------------------
capture drop pid
capture drop tid
capture drop hid
capture drop gid
count
*-------------------------------------------------------------------------------
drop if status == "B"
drop if status == "A"
count
*-------------------------------------------------------------------------------
* Adding all time variables, regulatory events, seasonality etc
merge m:1 date using "Y:\agrajg\Research\Data\temp\010211_T_AllTimeVariables.dta"
keep if _merge==3
drop _merge
count
*-------------------------------------------------------------------------------
*Host Variables
merge m:1 hostid date 	using "Y:\agrajg\Research\Data\temp\010209_HT_ListingsCountAll.dta"
keep if _merge==3
drop _merge
count
merge m:1 hostid 		using "Y:\agrajg\Research\Data\temp\010209_H_HostType1All.dta"
keep if _merge==3
drop _merge
count
merge m:1 hostid 		using "Y:\agrajg\Research\Data\temp\010209_H_HostType2All.dta"
keep if _merge==3
drop _merge
count
merge m:1 hostid 		date using "Y:\agrajg\Research\Data\temp\010209_HT_PropCountActive.dta"
keep if _merge==3
drop _merge
count
merge m:1 hostid 		using "Y:\agrajg\Research\Data\temp\010209_H_HostType1Active.dta"
keep if _merge==3
drop _merge
count
merge m:1 hostid 		using "Y:\agrajg\Research\Data\temp\010209_H_HostType2Active.dta"
keep if _merge==3
drop _merge
count
merge m:1 hostid date 	using "Y:\agrajg\Research\Data\temp\010209_HT_EHA_PR_SHCount.dta"
keep if _merge==3
drop _merge
count
merge m:1 hostid date 	using "Y:\agrajg\Research\Data\temp\010209_HT_TimeVaryingHostCharacteristics.dta"
keep if _merge==3
drop _merge
count
*-------------------------------------------------------------------------------
*Property characteristics
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010213_L_listingtype.dta"
keep if _merge==3
drop _merge
count

*Property time characteristics
merge m:1 propertyid date using "Y:\agrajg\Research\Data\temp\010213_LT_TimeVaryingListingCharacteristics.dta" 
keep if _merge==3
drop _merge
count
*-------------------------------------------------------------------------------
save "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", replace
*-------------------------------------------------------------------------------


