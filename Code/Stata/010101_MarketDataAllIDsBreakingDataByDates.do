*** Breaking data by date
****************************************************************************************
**************************** BY DATE ***************************************************
****************************************************************************************
clear all 
set more off

*===============================================================================
use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDs.dta", clear
*===============================================================================

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
	
	*===============================================================================
	save "Y:\agrajg\Research\Data\temp\010101_MarketDataAllIDsBrokenByDates`i'.dta", replace
	*===============================================================================
	
	drop if status =="B"
	*===============================================================================
	save "Y:\agrajg\Research\Data\temp\010101_MarketDataAllIDsBlockedDroppedBrokenByDates`i'.dta" , replace
	*===============================================================================
	
	drop if status =="A"
	*===============================================================================
	save "Y:\agrajg\Research\Data\temp\010101_MarketDataAllIDsOnlyBookedBrokenByDates`i'.dta" , replace
	*===============================================================================
	restore
}


*forvalues i = `datemin'(1)`datemax' {
*forvalues i = 1(1)20909 {
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
*use "Y:\agrajg\Research\Data\temp\011_MarketDataAllIDsOnlyBookedBrokenByDates`i'.dta.dta" , clear
*save "Y:\agrajg\Research\Data\temp\010101_MarketDataAllIDsBrokenByDates`i'.dta", replace
*capture erase "Y:\agrajg\Research\Data\temp\011_MarketDataAllIDsOnlyBookedBrokenByDates`i'.dta.dta"

*use "Y:\agrajg\Research\Data\temp\011_MarketDataAllIDsBlockedDroppedBrokenByDates`i'.dta.dta" , clear
*save "Y:\agrajg\Research\Data\temp\010101_MarketDataAllIDsBlockedDroppedBrokenByDates`i'.dta" , replace
*capture erase "Y:\agrajg\Research\Data\temp\011_MarketDataAllIDsBlockedDroppedBrokenByDates`i'.dta.dta"

*use "Y:\agrajg\Research\Data\temp\011_MarketDataAllIDsOnlyBookedBrokenByDates`i'.dta.dta" , clear
*save "Y:\agrajg\Research\Data\temp\010101_MarketDataAllIDsOnlyBookedBrokenByDates`i'.dta" , replace
*capture erase "Y:\agrajg\Research\Data\temp\011_MarketDataAllIDsOnlyBookedBrokenByDates`i'.dta.dta"
*}


********************************************************************************
******************** END 010101 ************************************************
********************************************************************************
