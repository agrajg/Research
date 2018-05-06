* This file produces Host and host tile level variables.
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

*-------------------------------------------------------------------------------
preserve
* counting the number of listing held by a host per day 
* This includes all listings active as well as in active
collapse (count)propertyid, by (hostid date)
rename propertyid HT_ListCountAll
label var HT_ListCountAll "Number of listings per host per day (active and inactive)"
keep hostid date HT_ListCountAll
order hostid date HT_ListCountAll
save "Y:\agrajg\Research\Data\temp\010209_HT_ListingsCountAll.dta", replace

* Categorizing the host based on maximum and minimum number of listings held over the period of data
* Again it contain all the listings active and inactive
g ListCountAll = HT_ListCountAll
collapse (min) ListCountAllmin = ListCountAll (max)ListCountAllmax= ListCountAll , by(hostid )
capture drop HostType1All
gen 	tempvar = ""
replace tempvar = "Min1Max1Listing" 			if ListCountAllmin==1 							& ListCountAllmax==1
replace tempvar = "Min1Max23Listing"			if ListCountAllmin==1 							& (ListCountAllmax==2 | ListCountAllmax==3)
replace tempvar = "Min1MaxGr3Listing"			if ListCountAllmin==1 							& ListCountAllmax>3
replace tempvar = "Min23Max23Listing"			if (ListCountAllmin==2 | ListCountAllmin==3) 	& (ListCountAllmax==2 | ListCountAllmax==3)
replace tempvar = "MinGr1MaxGr3Listing" 		if ListCountAllmin>1 							& ListCountAllmax>3
encode tempvar, generate(H_HostType1All)
drop tempvar
label var H_HostType1All "Host type 1 based on max and min listings(all)"
rename ListCountAllmin H_ListCountAllmin
label var H_ListCountAllmin "Min number of listings during the entire period"
rename ListCountAllmax H_ListCountAllmax
label var H_ListCountAllmax "Max number of listings during the entire period"
keep hostid H_ListCountAllmin H_ListCountAllmax H_HostType1All
order hostid H_ListCountAllmin H_ListCountAllmax H_HostType1All
save "Y:\agrajg\Research\Data\temp\010209_H_HostType1All.dta", replace
restore
*-------------------------------------------------------------------------------
* Host type using pre and post treatment status
preserve
collapse (count)propertyid, by (hostid date)
gen PurgeDum = (date>=td(01oct2015))
collapse (min) ListCountAllmin = propertyid (max)ListCountAllmax= propertyid , by(hostid PurgeDum )
capture drop tempvar
gen 	tempvar = ""
replace tempvar = "Min1Max1Listing" 			if ListCountAllmin==1 							& ListCountAllmax==1
replace tempvar = "Min1Max23Listing" 			if ListCountAllmin==1 							& (ListCountAllmax==2 | ListCountAllmax==3)
replace tempvar = "Min1MaxGr3Listing" 			if ListCountAllmin==1 							& ListCountAllmax>3
replace tempvar = "Min23Max23Listing" 			if (ListCountAllmin==2 | ListCountAllmin==3) 	& (ListCountAllmax==2 | ListCountAllmax==3)
replace tempvar = "MinGr1MaxGr3Listing" 		if ListCountAllmin>1 							& ListCountAllmax>3
rename ListCountAllmin H_ListCountAllmin
rename ListCountAllmax H_ListCountAllmax
gen j = "pre" if PurgeDum == 0
replace j = "post" if PurgeDum ==1
order hostid j
drop PurgeDum
reshape wide H_ListCountAllmin H_ListCountAllmax tempvar , i(hostid ) j(j) s
replace tempvarpre 	= "ZeroListings" if tempvarpre==""
replace tempvarpost = "ZeroListings" if tempvarpost==""
encode tempvarpost, generate(H_HostType2Allpost)
encode tempvarpre, generate(H_HostType2Allpre)
replace H_ListCountAllminpre =0 if H_ListCountAllminpre==.
replace H_ListCountAllmaxpre =0 if H_ListCountAllmaxpre==.
drop tempvar*
label var H_ListCountAllminpost "(count) Minimum All listings held by host post purge" 
label var H_ListCountAllmaxpost "(count) Maximum All listings held by host post purge"	 
label var H_ListCountAllminpre "(count) Minimum All listings held by host before purge" 	 
label var H_ListCountAllmaxpre "(count) Maximum All listings held by host before purge" 
label var H_HostType2Allpost "Host type defined by post purge All listing count" 
label var H_HostType2Allpre "Host type defined by before purge All listing count"

keep hostid H_ListCountAllminpost H_ListCountAllmaxpost H_ListCountAllminpre H_ListCountAllmaxpre H_HostType2Allpost H_HostType2Allpre
order hostid H_ListCountAllminpost H_ListCountAllmaxpost H_ListCountAllminpre H_ListCountAllmaxpre H_HostType2Allpost H_HostType2Allpre
save "Y:\agrajg\Research\Data\temp\010209_H_HostType2All.dta", replace
restore
*-------------------------------------------------------------------------------
preserve
drop if status=="B"
collapse (count)propertyid, by (hostid date)
rename propertyid HT_ListCountActive
label var HT_ListCountActive "Number of listings per host per day (active)"
save "Y:\agrajg\Research\Data\temp\010209_HT_PropCountActive.dta", replace

g ListCountActive = HT_ListCountActive
collapse (min) ListCountActivemin = ListCountActive (max)ListCountActivemax= ListCountActive , by(hostid )
capture drop HostType1Active
gen 	tempvar = ""
replace tempvar = "Min1Max1Listing" 			if ListCountActivemin==1 							& ListCountActivemax==1
replace tempvar = "Min1Max23Listing"			if ListCountActivemin==1 							& (ListCountActivemax==2 | ListCountActivemax==3)
replace tempvar = "Min1MaxGr3Listing"			if ListCountActivemin==1 							& ListCountActivemax>3
replace tempvar = "Min23Max23Listing"			if (ListCountActivemin==2 | ListCountActivemin==3) 	& (ListCountActivemax==2 | ListCountActivemax==3)
replace tempvar = "MinGr1MaxGr3Listing"			if ListCountActivemin>1 							& ListCountActivemax>3
encode tempvar, generate(H_HostType1Active)
drop tempvar

label var H_HostType1Active "Host type 1 based on max and min listings(Active)"
rename ListCountActivemin H_ListCountActivemin
label var H_ListCountActivemin "Min (Active) number of listings during the entire period"
rename ListCountActivemax H_ListCountActivemax
label var H_ListCountActivemax "Max (Active) number of listings during the entire period"
keep hostid H_ListCountActivemin H_ListCountActivemax H_HostType1Active
order hostid H_ListCountActivemin H_ListCountActivemax H_HostType1Active
save "Y:\agrajg\Research\Data\temp\010209_H_HostType1Active.dta", replace
restore
*-------------------------------------------------------------------------------

*-------------------------------------------------------------------------------
* Host type using pre and post treatment status (Actice listings only)
preserve
drop if status=="B"
collapse (count)propertyid, by (hostid date)
gen PurgeDum = (date>=td(01oct2015))
collapse (min) ListCountActivemin = propertyid (max)ListCountActivemax= propertyid , by(hostid PurgeDum )
capture drop tempvar
gen 	tempvar = ""
replace tempvar = "Min1Max1Listing" 			if ListCountActivemin==1 							& ListCountActivemax==1
replace tempvar = "Min1Max23Listing" 			if ListCountActivemin==1 							& (ListCountActivemax==2 | ListCountActivemax==3)
replace tempvar = "Min1MaxGr3Listing" 			if ListCountActivemin==1 							& ListCountActivemax>3
replace tempvar = "Min23Max23Listing" 			if (ListCountActivemin==2 | ListCountActivemin==3) 	& (ListCountActivemax==2 | ListCountActivemax==3)
replace tempvar = "MinGr1MaxGr3Listing"			if ListCountActivemin>1 							& ListCountActivemax>3
rename ListCountActivemin H_ListCountActivemin
rename ListCountActivemax H_ListCountActivemax
gen j = "pre" if PurgeDum == 0
replace j = "post" if PurgeDum ==1
order hostid j
drop PurgeDum
reshape wide H_ListCountActivemin H_ListCountActivemax tempvar , i(hostid ) j(j) s
replace tempvarpre 	= "ZeroListings" if tempvarpre==""
replace tempvarpost = "ZeroListings" if tempvarpost==""
encode tempvarpost, generate(H_HostType2Activepost)
encode tempvarpre, generate(H_HostType2Activepre)
replace H_ListCountActiveminpre =0 if H_ListCountActiveminpre==.
replace H_ListCountActivemaxpre =0 if H_ListCountActivemaxpre==.
drop tempvar*
label var H_ListCountActiveminpost "(count) Minimum Active listings held by host post purge" 
label var H_ListCountActivemaxpost "(count) Maximum Active listings held by host post purge"	 
label var H_ListCountActiveminpre "(count) Minimum Active listings held by host before purge" 	 
label var H_ListCountActivemaxpre "(count) Maximum Active listings held by host before purge" 
label var H_HostType2Activepost "Host type defined by post purge Active listing count" 
label var H_HostType2Activepre "Host type defined by before purge Active listing count"
keep hostid H_ListCountActiveminpost H_ListCountActivemaxpost H_ListCountActiveminpre H_ListCountActivemaxpre H_HostType2Activepost H_HostType2Activepre
order hostid H_ListCountActiveminpost H_ListCountActivemaxpost H_ListCountActiveminpre H_ListCountActivemaxpre H_HostType2Activepost H_HostType2Activepre
save "Y:\agrajg\Research\Data\temp\010209_H_HostType2Active.dta", replace
restore
*-------------------------------------------------------------------------------

preserve
drop if status =="B"
collapse (count) count_propertyid = propertyid , by(hostid date )
collapse (min) min_count_propertyid =count_propertyid  (max) max_count_propertyid = count_propertyid , by(hostid )
gen tempvar = "Group 1" if (max_count_propertyid==1)
replace tempvar = "Group 2" if (max_count_propertyid==2 | max_count_propertyid==3)
replace tempvar = "Group 3" if (max_count_propertyid==4 | max_count_propertyid==5)
replace tempvar = "Group 4" if (max_count_propertyid>=6 & max_count_propertyid<=10)
replace tempvar = "Group 5" if (max_count_propertyid>10)
encode tempvar, generate(HostType3Active)
drop tempvar
drop min_count_propertyid max_count_propertyid
rename HostType3Active H_HostType3Active
label var H_HostType3Active "Host type Active based on max listings"
save "Y:\agrajg\Research\Data\temp\010209_H_HostType3Active.dta", replace
restore

*-------------------------------------------------------------------------------
* Number of entire homes , private rooms ... etc
* Number of active ent homes private rooms

preserve
* Age and combined age 
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\000102_AIRDNA_listingtype.dta"
keep if _merge ==3
drop _merge
tab listingtype , gen (ltypedum)
sort hostid date propertyid 
by hostid date : egen HT_countEHAAll = sum( ltypedum1 )
by hostid date : egen HT_countNRAll = sum( ltypedum2 )
by hostid date : egen HT_countPRAll = sum( ltypedum3 )
by hostid date : egen HT_countSRAll = sum( ltypedum4 )
drop if status=="B"
sort hostid date propertyid 
by hostid date : egen HT_countEHAActive = sum( ltypedum1 )
by hostid date : egen HT_countNRActive = sum( ltypedum2 )
by hostid date : egen HT_countPRActive = sum( ltypedum3 )
by hostid date : egen HT_countSRActive = sum( ltypedum4 )


label var HT_countEHAAll "Count EHA listings Active and Inactive"
label var HT_countNRAll "Count NR listings Active and Inactive"
label var HT_countPRAll "Count PR listings Active and Inactive"
label var HT_countSRAll "Count SR listings Active and Inactive"
label var HT_countEHAActive "Count EHA listings Active"
label var HT_countNRActive "Count NR listings Active"
label var HT_countPRActive "Count PR listings Active"
label var HT_countSRActive "Count SR listings Active"


keep hostid date HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive
order hostid date HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive

duplicates drop
save "Y:\agrajg\Research\Data\temp\010209_HT_EHA_PR_SHCount.dta", replace
restore
*-------------------------------------------------------------------------------
preserve
* Age and combined age 
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_Create_date.dta"
keep if _merge ==3
drop _merge

gen LT_PropAge = date - createddate
label var LT_PropAge "Age of Property on Airbnb"
sort hostid date propertyid 
by hostid date : egen HT_HostAge = max(LT_PropAge)
label var HT_HostAge "Age of Host on Airbnb"
by hostid date : egen HT_HostAgeComb = sum(LT_PropAge)
label var HT_HostAgeComb "Combined Age of Host on Airbnb"
*-------------------------------------------------------------------------------
sort propertyid date
by propertyid : gen Adayscount = 0 if _n==1
by propertyid : replace Adayscount  = Adayscount[_n-1] + sdum1[_n-1] if _n > 1

by propertyid : gen Bdayscount = 0 if _n==1
by propertyid : replace Bdayscount  = Bdayscount[_n-1] + sdum2[_n-1] if _n > 1

by propertyid : gen Rdayscount = 0 if _n==1
by propertyid : replace Rdayscount  = Rdayscount[_n-1] + sdum3[_n-1] if _n > 1

sort hostid date propertyid 
by hostid date: egen Adayshostcount = total(Adayscount)
by hostid date: egen Bdayshostcount = total(Bdayscount)
by hostid date: egen Rdayshostcount = total(Rdayscount)
rename Adayshostcount HT_Adayshostcount
label var HT_Adayshostcount "Hosts Cumulative Available days"
rename Bdayshostcount HT_Bdayshostcount
label var HT_Bdayshostcount "Hosts Cumulative Blocked days"
rename Rdayshostcount HT_Rdayshostcount
label var HT_Rdayshostcount "Hosts Cumulative Reserved days"
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

sort hostid date propertyid reservationid bookeddate 
by hostid date: egen  HT_HostGuestPastCount = sum(LT_PropGuestPastCount)
label var HT_HostGuestPastCount "(Count)guests stayed with host"
*-------------------------------------------------------------------------------
keep hostid date HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
duplicates drop
*duplicates tag hostid date, generate(tempvar)
*tab tempvar
*drop tempvar
save "Y:\agrajg\Research\Data\temp\010209_HT_TimeVaryingHostCharacteristics.dta", replace
restore
*-------------------------------------------------------------------------------


*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------




/* Time varying characteristics
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

