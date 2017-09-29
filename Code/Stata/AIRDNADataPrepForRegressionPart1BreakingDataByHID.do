clear all
set more off
****************************************************************************************
************** USING THIS FILE TO BREAK THE DATA BY HOSTID *****************************
****************************************************************************************
*This do file creates three sets of data
* 1. With all three status 
* 2. With only available and reserved 
* 3. Only Booked or reserved
****************************************************************************************

*=======================================================================================
use "Y:\agrajg\Research\Data\FinalData\AIRDNACleanedMergedDataForRegression.dta", clear
*=======================================================================================


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
	save "Y:\agrajg\Research\Data\temp\DataBeforeVariablesCreationBrokenByhostids`i'to`i99'.dta", replace
	restore
}

clear all
set more off
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
	use "Y:\agrajg\Research\Data\temp\DataBeforeVariablesCreationBrokenByhostids`i'to`i99'.dta", clear
	drop if status =="B"
	save "Y:\agrajg\Research\Data\temp\DataBeforeVariablesCreationBrokenByhostidsBlockedDropped`i'to`i99'.dta", replace
	drop if status =="A"
	save "Y:\agrajg\Research\Data\temp\DataBeforeVariablesCreationBrokenByhostidsOnlyBooked`i'to`i99'.dta", replace
}

