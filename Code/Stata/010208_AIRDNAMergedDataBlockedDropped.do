* setting up data for regressions
clear all 
set more off 
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDs.dta", clear
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_Create_date.dta"
keep if _merge ==3
drop _merge
*-------------------------------------------------------------------------------
order hostid propertyid date reservationid bookeddate
*-------------------------------------------------------------------------------
* Time varying characteristics
* Counting numer of guest in the past
sort hostid propertyid reservationid bookeddate date
by hostid propertyid reservationid bookeddate : gen temp1 = 1 if _n ==1 & reservationid !=. & bookeddate!=.
gen temp2 = temp1
sort hostid propertyid date reservationid bookeddate
by hostid propertyid :replace temp2 = sum(temp2 )
gen temp3 = temp2 - 1 if reservationid !=. & bookeddate!=.
replace temp3 = temp2
replace temp3 = temp2 - 1 if reservationid !=. & bookeddate!=.
gen PropGuestPastCount = temp3
label var PropGuestPastCount "(Count)guests stayed in property"
drop temp*

sort hostid date propertyid reservationid bookeddate 
by hostid date: egen  HostGuestPastCount = sum(PropGuestPastCount)
label var HostGuestPastCount "(Count)guests stayed with host"
*-------------------------------------------------------------------------------
*Counting how the property has been used in Airbnb so far(also by host)
sort hostid propertyid date reservationid bookeddate 
by hostid propertyid: gen 		PropASCount = 0 if _n ==1
by hostid propertyid: replace   PropASCount = PropASCount[_n-1] + sdum1 if _n > 1
label var PropASCount "(Count)Past Available days of property"

by hostid propertyid: gen 		PropBSCount = 0 if _n ==1
by hostid propertyid: replace   PropBSCount = PropBSCount[_n-1] + sdum2 if _n > 1
label var PropBSCount "(Count)Past Blocked days of property"

by hostid propertyid: gen 		PropRSCount = 0 if _n ==1
by hostid propertyid: replace   PropRSCount = PropRSCount[_n-1] + sdum3 if _n > 1
label var PropRSCount "(Count)Past Reserved days of property"

sort hostid date propertyid  reservationid bookeddate 
by hostid date : egen   HostASCount = sum(PropASCount)
by hostid date : egen   HostBSCount = sum(PropBSCount)
by hostid date : egen   HostRSCount = sum(PropRSCount)
label var HostASCount "(Count)Past Available days of Host"
label var HostBSCount "(Count)Past Blocked days of Host"
label var HostRSCount "(Count)Past Reserved days of Host"
*-------------------------------------------------------------------------------
* Age and combined age 
gen PropAge = date - createddate
label var PropAge "Age of Property on Airbnb"

by hostid date : egen HostAge = max(PropAge)
label var HostAge "Age of Host on Airbnb"

by hostid date : egen CombinedHostAge = sum(PropAge)
label var CombinedHostAge "Combined Age of Host on Airbnb"
*-------------------------------------------------------------------------------
merge m:1 date using "Y:\agrajg\Research\Data\Seasonals\seasonals_01aug2014to31mar2017.dta"
preserve
keep if _merge ==3
drop _merge
tsset propertyid date, daily
save "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonals.dta", replace
export delimited using "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonals.csv", replace
drop if status == "B"
save "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonalsBlockedDropped.dta", replace
export delimited using "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonalsBlockedDropped.csv", replace
drop if status == "A"
save "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonalsOnlyBooked.dta", replace
export delimited using "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonalsOnlyBooked.csv", replace
restore
*-------------------------------------------------------------------------------
capture drop _merge
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_data_clean_final.dta"
keep if _merge ==3
drop _merge
drop if latitude ==. | longitude ==.
*-------------------------------------------------------------------------------
save "Y:\agrajg\Research\Data\temp\010208_MergedPanelWithTimeVaryingCharAndSeasonals.dta", replace
export delimited using "Y:\agrajg\Research\Data\temp\010208_MergedPanelWithTimeVaryingCharAndSeasonals.csv", replace
drop if status == "B"
save "Y:\agrajg\Research\Data\temp\010208_MergedPanelWithTimeVaryingCharAndSeasonalsBlockedDropped.dta", replace
export delimited using "Y:\agrajg\Research\Data\temp\010208_MergedPanelWithTimeVaryingCharAndSeasonalsBlockedDropped.csv", replace
drop if status == "A"
save "Y:\agrajg\Research\Data\temp\010208_MergedPanelWithTimeVaryingCharAndSeasonalsOnlyBooked.dta", replace
export delimited using "Y:\agrajg\Research\Data\temp\010208_MergedPanelWithTimeVaryingCharAndSeasonalsOnlyBooked.csv", replace
*-------------------------------------------------------------------------------
/*

*merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_data_clean_final.dta"
*"Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_Create_date.dta"

keep if _merge ==3
drop _merge
drop if latitude ==. | longitude ==.
merge m:1 date using "Y:\agrajg\Research\Data\Seasonals\seasonals_01aug2014to31mar2017.dta"
keep if _merge ==3
drop _merge


sort propertyid date
by propertyid : gen timediff1 = date[_n+1] - date
gen exitdum =(timediff1 >1)
by propertyid : gen timediff2 = date - date[_n-1]
gen enterdum =(timediff2 >1)
drop timediff1 timediff2


*** All events 
gen tempvar 		= "Period 1 : Pre Purge" 				if date < td(20nov2015)
replace tempvar 	= "Period 2 : Purge-Data Disclosure" 	if date >= td(20nov2015) & date < td(10feb2016)
replace tempvar 	= "Period 3 : Post Data Disclosure" 	if date >= td(10feb2016) & date < td(1nov2016)
replace tempvar 	= "Period 4 : Post Law Enforcement" 	if date >= td(1nov2016)
encode tempvar, generate(event)
label var event "Events leading to regulation"
drop tempvar

*** Total number of listings per host
gen tempvar = 1 if propertyid != .
bys hostid date : egen PropPerHost = sum (tempvar)
label var PropPerHost  		"Number of listing by host on a day"
drop tempvar
*** Number of Entire Homes per host
gen tempvar = 1 if propertyid != . & listingtype == "Entire home/apt"
bys hostid date : egen EHPropPerHost = sum (tempvar)
label var EHPropPerHost  	"Number of EH listing by host on a day"
drop tempvar
*** Number of Private Rooms per host
gen tempvar = 1 if propertyid != . & listingtype == "Private room"
bys hostid date : egen PRPropPerHost = sum (tempvar)
label var PRPropPerHost  	"Number of PR listing by host on a day"
drop tempvar
*** Number of Shared Rooms per host
gen tempvar = 1 if propertyid != . & listingtype == "Shared room"
bys hostid date : egen SRPropPerHost = sum (tempvar)
label var SRPropPerHost  	"Number of SR listing by host on a day"
drop tempvar


*** Maximum listings this host has held
bys hostid : egen MaxPropPerHost = max( PropPerHost )
*** Minimum listings this host has held
bys hostid : egen MinPropPerHost = min( PropPerHost )

*** Maximum EH listings this host has held
bys hostid : egen MaxEHPropPerHost = max( EHPropPerHost )
*** Minimum EH listings this host has held
bys hostid : egen MinEHPropPerHost = min( EHPropPerHost )

*** Maximum PR listings this host has held
bys hostid : egen MaxPRPropPerHost = max( PRPropPerHost )
*** Minimum PR listings this host has held
bys hostid : egen MinPRPropPerHost = min( PRPropPerHost )

*** Maximum SR listings this host has held
bys hostid : egen MaxSRPropPerHost = max( SRPropPerHost )
*** Minimum SR listings this host has held
bys hostid : egen MinSRPropPerHost = min( SRPropPerHost )





*** Generating Host type classification based on the degree of violation 
gen 		tempvar = "Max 1 Listing" if MaxPropPerHost ==1
replace 	tempvar = "Max More Than 1 Listing" if MaxPropPerHost >1
count if 	tempvar ==""
*encode 		tempvar, gen(HostClass1)
rename tempvar HostClass1
*drop 		tempvar

gen 		tempvar = "Max 0 EH Listing" if MaxEHPropPerHost ==0
replace		tempvar = "Max 1 EH Listing" if MaxEHPropPerHost ==1
replace 	tempvar = "Max More Than 1 EH Listing" if MaxEHPropPerHost >1
count if 	tempvar ==""
*encode 		tempvar, gen(EHHostClass1)
rename tempvar EHHostClass1
*drop 		tempvar

gen 		tempvar = "Max 0 PR Listing" if MaxPRPropPerHost ==0
replace		tempvar = "Max 1 PR Listing" if MaxPRPropPerHost ==1
replace 	tempvar = "Max More Than 1 PR Listing" if MaxPRPropPerHost >1
count if 	tempvar ==""
*encode 		tempvar, gen(PRHostClass1)
rename tempvar PRHostClass1
*drop 		tempvar

gen 		tempvar = "Max 0 SR Listing" if MaxSRPropPerHost ==0
replace		tempvar = "Max 1 SR Listing" if MaxSRPropPerHost ==1
replace 	tempvar = "Max More Than 1 SR Listing" if MaxSRPropPerHost >1
count if 	tempvar ==""
*encode 		tempvar, gen(SRHostClass1)
rename tempvar SRHostClass1
*drop 		tempvar




** Encoding all catagorical variables
global CatVariables propertytype listingtype country state city zipcode neighborhood metropolitanstatisticalarea superhost cancellationpolicy checkintime checkouttime businessready instantbookenabled 
foreach var in $CatVariables {
	rename `var' temp`var'
	encode temp`var', generate(`var')
	order `var', after(temp`var')
	drop temp`var'
}


tsset propertyid date, daily
save "Y:\agrajg\Research\Data\temp\010208_MergedDataForPanelPriceQuantityRegressionBlockedDropped.dta", replace

*===============================================================================

