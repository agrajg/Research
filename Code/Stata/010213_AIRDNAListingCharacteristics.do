* This file produces Listing and Listing Time level variables.
clear all 
set more off 
use "Y:\agrajg\Research\Data\temp\000102_AIRDNA_listingtype.dta", clear
*===============================================================================
capture drop tempvar
gen tempvar = ""
replace tempvar = "EHA" if listingtype == "Entire home/apt"
replace tempvar = "PR" if listingtype == "Private room"
replace tempvar = "SR" if listingtype == "Shared room"
replace tempvar = "NR" if listingtype == "NR"
count if tempvar ==""
drop listingtype
encode tempvar, gen(L_listingtype)
label var L_listingtype "Type of listing space"
drop tempvar
keep propertyid L_listingtype 
order propertyid L_listingtype 
save "Y:\agrajg\Research\Data\temp\010213_L_listingtype.dta", replace
*===============================================================================

clear all 
set more off 
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDs.dta", clear
capture drop pid 
capture drop tid 
capture drop hid 
capture drop gid
*-------------------------------------------------------------------------------
order hostid propertyid date reservationid bookeddate
*-------------------------------------------------------------------------------

preserve
* Age and combined age 
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_Create_date.dta"
keep if _merge ==3
drop _merge

gen LT_PropAge = date - createddate
label var LT_PropAge "Age of Property on Airbnb"
sort hostid date propertyid 
*-------------------------------------------------------------------------------
sort propertyid date
by propertyid : gen Adayscount = 0 if _n==1
by propertyid : replace Adayscount  = Adayscount[_n-1] + sdum1[_n-1] if _n > 1

by propertyid : gen Bdayscount = 0 if _n==1
by propertyid : replace Bdayscount  = Bdayscount[_n-1] + sdum2[_n-1] if _n > 1

by propertyid : gen Rdayscount = 0 if _n==1
by propertyid : replace Rdayscount  = Rdayscount[_n-1] + sdum3[_n-1] if _n > 1

rename Adayscount LT_Adayscount
label var LT_Adayscount "Listing Cumulative Available days"
rename Bdayscount LT_Bdayscount
label var LT_Bdayscount "Listing Cumulative Blocked days"
rename Rdayscount LT_Rdayscount
label var LT_Rdayscount "Listing Cumulative Reserved days"
*-------------------------------------------------------------------------------
* Guests in the past 
sort hostid propertyid reservationid bookeddate date
by hostid propertyid reservationid bookeddate : gen temp1 = 1 if _n ==1 & reservationid !=. & bookeddate!=.
gen temp2 = temp1
sort hostid propertyid date reservationid bookeddate
by hostid propertyid :replace temp2 = sum(temp2 )
gen temp3 = temp2 - 1 if reservationid !=. & bookeddate!=.
replace temp3 = temp2
replace temp3 = temp2 - 1 if reservationid !=. & bookeddate!=.
gen LT_PropGuestPastCount = temp3
label var LT_PropGuestPastCount "(Count)guests stayed in property"
drop temp*
*-------------------------------------------------------------------------------
keep propertyid date LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
duplicates drop
*duplicates tag hostid date, generate(tempvar)
*tab tempvar
*drop tempvar
save "Y:\agrajg\Research\Data\temp\010213_LT_TimeVaryingListingCharacteristics.dta", replace
restore
