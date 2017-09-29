*** Breaking data by date
****************************************************************************************
**************************** BY DATE ***************************************************
****************************************************************************************
clear all 
set more off

*===============================================================================
use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDs.dta", clear
*===============================================================================

sort hid
sum hid
local hidmin = `r(min)'
local hidmax = `r(max)'

di `hidmin'
di `hidmax'

forvalues i = `hidmin'(100)`hidmax' {
*forvalues i = 1(100)10000 {  
*forvalues i = 10001(100)20000 {  
*forvalues i = 20001(100)30000 {  
*forvalues i = 30001(100)40000 {  
*forvalues i = 40001(100)50000 {  
*forvalues i = 50001(100)60000 {  
*forvalues i = 60001(100)70000 {  
*forvalues i = 70001(100)80000 {  
*forvalues i = 80001(100)90000 {  
*forvalues i = 90001(100)100000 {  
*forvalues i = 100001(100)110966 { 
	local i99 = `i' + 99
	di "hid from " `i' " to " `i99' 
	preserve
	keep if hid >= `i' & hid <= `i99' 
	compress
	*===============================================================================
	save "Y:\agrajg\Research\Data\temp\010102_MarketDataAllIDsBrokenByHid`i'to`i99'.dta", replace
	*===============================================================================
	drop if status =="B"
	*===============================================================================
	save "Y:\agrajg\Research\Data\temp\010102_MarketDataAllIDsBlockedDroppedBrokenByHid`i'to`i99'.dta", replace
	*===============================================================================
	drop if status =="A"
	*===============================================================================
	save "Y:\agrajg\Research\Data\temp\010102_MarketDataAllIDsOnlyBookedBrokenByHid`i'to`i99'.dta", replace
	*===============================================================================
	restore
}


/*
*forvalues i = `hidmin'(100)`hidmax' {
forvalues i = 1(100)110966 { 
*forvalues i = 1(100)10000 {  
*forvalues i = 10001(100)20000 {  
*forvalues i = 20001(100)30000 {  
*forvalues i = 30001(100)40000 {  
*forvalues i = 40001(100)50000 {  
*forvalues i = 50001(100)60000 {  
*forvalues i = 60001(100)70000 {  
*forvalues i = 70001(100)80000 {  
*forvalues i = 80001(100)90000 {  
*forvalues i = 90001(100)100000 {  
*forvalues i = 100001(100)110966 { 
	local i99 = `i' + 99
	di "hid from " `i' " to " `i99' 

	*===============================================================================
*	    use "Y:\agrajg\Research\Data\temp\011_MarketDataAllIDsBrokenByHid`i'to`i99'.dta", clear
*	save "Y:\agrajg\Research\Data\temp\010102_MarketDataAllIDsBrokenByHid`i'to`i99'.dta", replace
	  erase "Y:\agrajg\Research\Data\temp\011_MarketDataAllIDsBrokenByHid`i'to`i99'.dta"

*	    use "Y:\agrajg\Research\Data\temp\011_MarketDataAllIDsBlockedDroppedBrokenByHid`i'to`i99'.dta", clear
*	save "Y:\agrajg\Research\Data\temp\010102_MarketDataAllIDsBlockedDroppedBrokenByHid`i'to`i99'.dta", replace
	  erase "Y:\agrajg\Research\Data\temp\011_MarketDataAllIDsBlockedDroppedBrokenByHid`i'to`i99'.dta"

*	    use "Y:\agrajg\Research\Data\temp\011_MarketDataAllIDsOnlyBookedBrokenByHid`i'to`i99'.dta", clear
*	save "Y:\agrajg\Research\Data\temp\010102_MarketDataAllIDsOnlyBookedBrokenByHid`i'to`i99'.dta", replace
	  erase "Y:\agrajg\Research\Data\temp\011_MarketDataAllIDsOnlyBookedBrokenByHid`i'to`i99'.dta"

	*===============================================================================

}
*/

********************************************************************************
******************** END 010102 ************************************************
********************************************************************************
