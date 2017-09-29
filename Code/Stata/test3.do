clear all
set more off
use  "Y:\agrajg\Research\Data\temp\010203_MergedAppendedbyDatesBlockedDropped.dta", clear

gen tempvar 		= "Period 1 : Pre Purge" 							if date < td(20nov2015)
replace tempvar 	= "Period 2 : Post Purge - Pre Expose" 				if date >= td(20nov2015) & date < td(10feb2016)
replace tempvar 	= "Period 3 : Post Expose - Pre Law Enforcement" 	if date >= td(10feb2016) & date < td(1nov2016)
replace tempvar 	= "Period 4 : Post Law Enforcement" 				if date >= td(1nov2016)
encode tempvar, generate(event)
drop tempvar

gen tempvar  = "Entire Home or Apartment" if zltypedum1==1
replace tempvar = "Private Rooms" if zltypedum3==1
replace tempvar = "Shared Rooms and Others" if tempvar==""
encode tempvar, generate(SpaceType)
drop tempvar


********************************************************************************
*** Total number of listings and hosts in the market over time
*** Categorised by Events...
preserve
timer on 1
collapse (count)countpid = pid, by (date event hid)
collapse (sum) NumListing=countpid (count) NumHost = hid , by ( event date)
label var date "Date of stay"
label var event "Regulatory events"
label var  NumListing "Number of listing"
label var  NumHost "Number of hosts"
save "Y:\agrajg\Research\Output\020101_NumberOfListingHostByDate.dta", replace
timer off 1
restore
********************************************************************************
*** Total number of Reserved listings and hosts in the market over time
*** Equilibrium bookings 
*** Were the number of bookings in eqilibrium change with changing events
preserve
timer on 2
collapse (count)countpid = pid, by (date event hid status)
collapse (sum) NumListing=countpid (count) NumHost = hid , by (event date status)
label var date "Date of stay"
label var event "Regulatory events"
label var status "Status"
label var  NumListing "Number of listing"
label var  NumHost "Number of hosts"
save "Y:\agrajg\Research\Output\020101_NumberOfListingsByDateStatus.dta", replace
timer off 2
restore
********************************************************************************
preserve
timer on 3
collapse (count)countpid = pid, by (date event hid SpaceType)
collapse (sum) NumListing=countpid (count) NumHost = hid , by (event date SpaceType)
label var date "Date of stay"
label var event "Regulatory events"
label var SpaceType "Space Type"
label var  NumListing "Number of listing"
label var  NumHost "Number of hosts"
save "Y:\agrajg\Research\Output\020101_NumberOfListingsByDateSpaceType.dta", replace
timer off 3
restore
********************************************************************************
preserve
timer on 4
collapse (count)countpid = pid, by (date event hid status SpaceType)
collapse (sum) NumListing=countpid (count) NumHost = hid , by (event date status SpaceType)
label var date "Date of stay"
label var event "Regulatory events"
label var SpaceType "Space Type"
label var status "Status"
label var  NumListing "Number of listing"
label var  NumHost "Number of hosts"
save "Y:\agrajg\Research\Output\020101_NumberOfListingsByDateSpaceTypeStatus.dta", replace
timer off 4
restore
********************************************************************************






timer list
