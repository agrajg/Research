********************************************************************************
clear all
set more off



forvalues i = 1(100)110966 {  

*forvalues i = 1(100)5000 {  
*forvalues i = 5001(100)10000 {  
*forvalues i = 10001(100)15000 {  
*forvalues i = 15001(100)20000 {  
*forvalues i = 20001(100)25000 {  
*forvalues i = 25001(100)30000 {  
*forvalues i = 30001(100)35000 {  
*forvalues i = 35001(100)40000 {  
*forvalues i = 40001(100)45000 {  
*forvalues i = 45001(100)50000 {  
*forvalues i = 50001(100)55000 {  
*forvalues i = 55001(100)60000 {  
*forvalues i = 60001(100)65000 {  
*forvalues i = 65001(100)70000 {  
*forvalues i = 70001(100)75000 {  
*forvalues i = 75001(100)80000 {  
*forvalues i = 80001(100)85000 {  
*forvalues i = 85001(100)90000 {  
*forvalues i = 90001(100)95000 {  
*forvalues i = 95001(100)100000 {  
*forvalues i = 100001(100)105000 { 
*forvalues i = 105001(100)110966 { 


local i99 = `i' + 99
di "hid from " `i' " to " `i99' 
capture drop _merge

use "Y:\agrajg\Research\Data\temp\010102_MarketDataAllIDsBrokenByHid`i'to`i99'.dta", clear
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010200_AIRDNATimeInvariantPropertyCharacteristics.dta"
keep if _merge ==3 
save "Y:\agrajg\Research\Data\temp\010202_MarketDataAllIDsBrokenByHid`i'to`i99'MergedAttTimeInv.dta", replace

use "Y:\agrajg\Research\Data\temp\010102_MarketDataAllIDsBlockedDroppedBrokenByHid`i'to`i99'.dta" , clear
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010200_AIRDNATimeInvariantPropertyCharacteristics.dta"
keep if _merge ==3
save "Y:\agrajg\Research\Data\temp\010202_MarketDataAllIDsBlockedDroppedBrokenByHid`i'to`i99'MergedAttTimeInv.dta" , replace

use "Y:\agrajg\Research\Data\temp\010102_MarketDataAllIDsOnlyBookedBrokenByHid`i'to`i99'.dta" , clear
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010200_AIRDNATimeInvariantPropertyCharacteristics.dta"
keep if _merge ==3
save "Y:\agrajg\Research\Data\temp\010202_MarketDataAllIDsOnlyBookedBrokenByHid`i'to`i99'MergedAttTimeInv.dta" , replace
}
********************************************************************************

