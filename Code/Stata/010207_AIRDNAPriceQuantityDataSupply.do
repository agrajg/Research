clear all
set more off

use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDsBlockedDropped.dta", clear
collapse (sum)TotalAmount = price (mean)PricePerDay = price (sd)SdPrice = price (count)NumDays = date (min)StayFrom = date (max)StayTo = date ,by ( pid hid propertyid hostid  )
format %9.0g NumDays
merge m:1 propertyid using "Y:\agrajg\Research\Data\FinalData\AIRDNA_listings_data_clean_final.dta"
rename _merge merge1
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\test4_hostCharacteristics.dta"
rename _merge merge2


tab state 
keep if state==8
tab state 
drop state
drop if merge1 ==2


gen tempvar 		= "Period 1 : Pre Purge" 							if StayTo < td(20nov2015)
replace tempvar 	= "Period 2 : Post Purge - Pre Expose" 				if StayTo >= td(20nov2015) & StayTo < td(10feb2016)
replace tempvar 	= "Period 3 : Post Expose - Pre Law Enforcement" 	if StayTo >= td(10feb2016) & StayTo < td(1nov2016)
replace tempvar 	= "Period 4 : Post Law Enforcement" 				if StayTo >= td(1nov2016)
encode tempvar, generate(event)
drop tempvar

global StrVariables  HostType1 HostType2 Hosttype3 HostType1E HostType2E Hosttype3E
foreach var in $StrVariables {
	rename `var' temp`var'
	encode temp`var', generate(`var')
	order `var', after(temp`var')
	drop temp`var'
}

gen lprice = ln(PricePerDay )
gen lquan = ln(NumDays )
reg lprice lquan


reg  lquan i.event i.HostType1 i.event#i.HostType1
reg  lprice  i.event i.HostType1 i.event#i.HostType1
reg  lprice lquan  i.event i.HostType1 i.event#i.HostType1
reg   lquan  i.event i.HostType1E i.event#i.HostType1E
save "Y:\agrajg\Research\Data\Meeting29Sept2017\Supply.dta" , replace
