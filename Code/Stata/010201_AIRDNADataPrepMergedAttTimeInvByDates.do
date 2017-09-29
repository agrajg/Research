********************************************************************************
clear all
set more off
forvalues i = 19936(1)20909 {
*local i = 20658 
*forvalues i = 19936(1)19985 {
*forvalues i = 19986(1)20035 {
*forvalues i = 20036(1)20085 {
*forvalues i = 20086(1)20135 {
*forvalues i = 20136(1)20185 {
*forvalues i = 20186(1)20235 {
*forvalues i = 20236(1)20285 {
*forvalues i = 20286(1)20335 {
*forvalues i = 20336(1)20385 {
*forvalues i = 20386(1)20435 {
*forvalues i = 20436(1)20485 {
*forvalues i = 20486(1)20535 {
*forvalues i = 20536(1)20585 {
*forvalues i = 20586(1)20635 {
*forvalues i = 20636(1)20685 {
*forvalues i = 20686(1)20735 {
*forvalues i = 20736(1)20785 {
*forvalues i = 20786(1)20835 {
*forvalues i = 20836(1)20885 {
*forvalues i = 20886(1)20909 {

capture drop _merge

use "Y:\agrajg\Research\Data\temp\010101_MarketDataAllIDsBrokenByDates`i'.dta", clear
merge 1:1 propertyid using "Y:\agrajg\Research\Data\temp\010200_AIRDNATimeInvariantPropertyCharacteristics.dta"
keep if _merge ==3 
save "Y:\agrajg\Research\Data\temp\010201_MarketDataAllIDsBrokenByDates`i'MergedAttTimeInv.dta", replace

use "Y:\agrajg\Research\Data\temp\010101_MarketDataAllIDsBlockedDroppedBrokenByDates`i'.dta" , clear
merge 1:1 propertyid using "Y:\agrajg\Research\Data\temp\010200_AIRDNATimeInvariantPropertyCharacteristics.dta"
keep if _merge ==3
save "Y:\agrajg\Research\Data\temp\010201_MarketDataAllIDsBlockedDroppedBrokenByDates`i'MergedAttTimeInv.dta" , replace

use "Y:\agrajg\Research\Data\temp\010101_MarketDataAllIDsOnlyBookedBrokenByDates`i'.dta" , clear
merge 1:1 propertyid using "Y:\agrajg\Research\Data\temp\010200_AIRDNATimeInvariantPropertyCharacteristics.dta"
keep if _merge ==3
save "Y:\agrajg\Research\Data\temp\010201_MarketDataAllIDsOnlyBookedBrokenByDates`i'MergedAttTimeInv.dta" , replace
}
********************************************************************************

