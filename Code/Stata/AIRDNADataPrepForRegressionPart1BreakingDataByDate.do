clear all
set more off
****************************************************************************************
************** USING THIS FILE TO BREAK THE DATA BY DATE *******************************
****************************************************************************************
*This do file creates three sets of data
* 1. With all three status 
* 2. With only available and reserved 
* 3. Only Booked or reserved
****************************************************************************************

*=======================================================================================
use "Y:\agrajg\Research\Data\FinalData\AIRDNACleanedMergedDataForRegression.dta", clear
*=======================================================================================
****************************************************************************************
**************************** BY DATE ***************************************************
****************************************************************************************
sort date
sum date
local datemin = `r(min)'
local datemax = `r(max)'

di `datemin'
di `datemax'

forvalues i = `datemin'(1)`datemax' {
*forvalues i = 19936(1) 20036 {
*forvalues i = 20037(1)20136 {
*forvalues i = 20137(1)20236 {
*forvalues i = 20237(1)20336 {
*forvalues i = 20337(1)20436 {
*forvalues i = 20437(1)20536 {
*forvalues i = 20537(1)20636 {
*forvalues i = 20637(1)20736 {
*forvalues i = 20737(1)20836 {
*forvalues i = 20837(1)20909 {
	preserve
	keep if date == `i'
	compress
	save "Y:\agrajg\Research\Data\temp\DataBeforeVariablesCreationBrokenByDates`i'.dta", replace
	restore
}


clear all
set more off
forvalues i = `datemin'(1)`datemax' {
*forvalues i = 19936(1) 20036 {
*forvalues i = 20037(1)20136 {
*forvalues i = 20137(1)20236 {
*forvalues i = 20237(1)20336 {
*forvalues i = 20337(1)20436 {
*forvalues i = 20437(1)20536 {
*forvalues i = 20537(1)20636 {
*forvalues i = 20637(1)20736 {
*forvalues i = 20737(1)20836 {
*forvalues i = 20837(1)20909 {
	use "Y:\agrajg\Research\Data\temp\DataBeforeVariablesCreationBrokenByDates`i'.dta", clear
	drop if status=="B"
	save "Y:\agrajg\Research\Data\temp\DataBeforeVariablesCreationBrokenByDatesBlockedDropped`i'.dta", replace
	drop if status=="A"
	save "Y:\agrajg\Research\Data\temp\DataBeforeVariablesCreationBrokenByDatesOnlyBooked`i'.dta", replace
}


********************************************************************************
********************************************************************************
********************************************************************************
