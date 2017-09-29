********************************************************************************
*********************** AIRDNA HEDONIC ANALYSIS DATA PREP **********************
*****************************BEGIN**********************************************
********************************************************************************
/*
clear all
set more off
parallel setclusters 4
timer clear

timer on 1
*===============================================================================
use "Y:\agrajg\Research\Data\FinalData\AIRDNACleanedMergedDataForRegression.dta" , clear
*===============================================================================
timer off 1

*Sampling 50 properties
do "Y:\agrajg\Research\Code\Stata\sample50properties_v11.do"
********************************************************************************
*/


clear all 
set more off 
timer clear 
* Variables at market / time level 
* I create all the variables that can be created at marktet level. These will be
* prices and all the product attributes 

*===============================================================================
use "Y:\agrajg\Research\Data\FinalData\temp\DataBeforeVariablesCreationBrokenByDates20763.dta"
*===============================================================================

********************************************************************************
************************ PRICE AND STATUS **************************************
********************************************************************************
*** Price and log(Price)
g lprice = log(price)
label var lprice "ln(Price per night)"
order lprice, after(price)

*** STATUS
tab status, gen(sdum)
order sdum*, after (status)

********************************************************************************

*** by date variable 
* Age of the property
gen zage = date - createddate 
label var zage "Age of listing"
order zage, after(createddate)


********************************************************************************
******************************* Guest Attributes *******************************
********************************************************************************
* Number of days of stay
sort gid
by gid : gen gtotaldaysstay = _N 
label var gtotaldaysstay "Guest's Length of stay"
by gid : gen gfracdaysstay = _n/_N
label var gfracdaysstay "Guest's Fraction of total stay length"
* days in advance booking
gen gdaysadvancebooking =  date - bookeddate
replace gdaysadvancebooking = 0 if gdaysadvancebooking <0
label var gdaysadvancebooking "Guest's days of advance booking"

********************************************************************************
********************************************************************************
********************************************************************************

********************************************************************************
******************************** Host Attributes *******************************
********************************************************************************
*** Contemporaneous characteristics
*** Contemporaneous management of listings measures
*** Number of unique listings held by host each day. Includes active and inactive listings
gen tempvar = 1
bys hid tid: egen hnumlistperday =  sum(tempvar)
label var  hnumlistperday "Number of listings that day"
drop tempvar

*** Number of Active listings held by host that day.
gen tempvar = 1 if status != "B"
bys hid tid: egen hnumactlistperday =  sum(tempvar)
label var  hnumactlistperday "Number of active listings that day"
drop tempvar

*** Measures of experience of management
*** How old is the host
gen tempvar = date -  createddate
bys hid tid: egen hage = max(tempvar)
bys hid tid: egen hcumage = sum(tempvar)
label var hage "Host: Age of host(oldest property, all included)"
label var hage "Host: Cumulative age of all host's properties"
drop tempvar

*** How old is host wrt active property today. These will measure age of the properties 
*** that continued to be active atleast on that day. 
gen tempvar = date -  createddate if status != "B"
bys hid tid: egen hageactive = max(tempvar)
bys hid tid: egen hcumageactive = sum(tempvar)
label var hageactive "Host: Age of host(oldest property, only active)"
label var hageactive "Host: Cumulative age of host's properties(only active)"
drop tempvar

*** How far are the listings from each other geometrically. Include blocked listings
*** I compute determinant of the covariance matrix from geographic latitude and longitude 
*** of different properties of each host.
*** First all listings = active and inactive
bys hid tid: egen hmeanlat = mean(latitude)
bys hid tid: egen hmeanlong = mean(longitude)
label var hmeanlat "Host mean latitude location" 
label var hmeanlong "Host mean longitude location" 

gen tempvar1 = latitude - hmeanlat
gen tempvar2 = longitude - hmeanlong

bys hid tid : egen tempvar3 = sum(tempvar1)
bys hid tid : gen hvarlat = tempvar3/ hnumlistperday

bys hid tid : egen tempvar4 = sum(tempvar2)
bys hid tid : gen hvarlong = tempvar4/ hnumlistperday
label var hvarlat "Host var latitude location" 
label var hvarlong "Host var longitude location" 

gen tempvar5 = tempvar1*tempvar2
bys hid tid : egen tempvar6 = sum(tempvar5)
bys hid tid : gen hcovlatlong = tempvar6/(hnumlistperday-1)
label var hcovlatlong "Host cov latitude longitude location" 

gen hlistingsparseness =  hvarlat*hvarlong - (hcovlatlong)^2
replace hlistingsparseness = 0 if hlistingsparseness==.
label var hlistingsparseness "Host's listings sparseness"
drop temp*

*** Now only active listings
gen latitudeact = latitude if status !="B"
gen longitudeact = longitude if status !="B"

bys hid tid: egen hmeanlatact = mean(latitudeact)
bys hid tid: egen hmeanlongact = mean(longitudeact)
label var hmeanlatact "Host mean latitudeact location" 
label var hmeanlongact "Host mean longitudeact location" 

gen tempvar1 = latitudeact - hmeanlatact
gen tempvar2 = longitudeact - hmeanlongact

bys hid tid : egen tempvar3 = sum(tempvar1)
bys hid tid : gen hvarlatact = tempvar3/ hnumactlistperday

bys hid tid : egen tempvar4 = sum(tempvar2)
bys hid tid : gen hvarlongact = tempvar4/ hnumactlistperday

label var hvarlatact "Host var latitudeact location" 
label var hvarlongact "Host var longitude location" 

gen tempvar5 = tempvar1*tempvar2
bys hid tid : egen tempvar6 = sum(tempvar5)
bys hid tid : gen hcovlatlongact = tempvar6/(hnumactlistperday-1) 
label var hcovlatlongact "Host cov latitudeact longitudeact location" 

gen hlistingsparsenessact =  hvarlatact*hvarlongact - (hcovlatlongact)^2
replace hlistingsparsenessact = 0 if hlistingsparsenessact==. & status!="B"
label var hlistingsparsenessact "Host's active listings sparseness"

drop temp*
drop latitudeact longitudeact
********************************************************************************


* Number of different properties hosted by that host
* 	- On that day 
*	- Since the begenning of time
* 	- Mean number of properties since the beginning of time 
* 	- SD of number of properties

* Number of active properties in the market 
* 	- On that day 
*	- Since the begenning of time
* 	- Mean number of properties 
* 	- SD of number of properties

* Oldest property , experience 
* Cumulative age of property, cumulative experience
* Fraction of entire homes , private homes , on that day , since the begenning of the time.



/********************************************************************************
*** Finalizing
********************************************************************************
*** Dropping unnecessary variables
drop propertyid date status hostid propertytype listingtype createddate lastscrapeddate country state city zipcode neighborhood superhost cancellationpolicy checkintime checkinperiod checkouttime businessready instantbookenabled metropolitanstatisticalarea listingurl listingmainimageurl latitude longitude listingtitle reservationid reservationidalt bookeddate bookeddatealt 
*** removing property type = "Apartment" dummy 
*** Removing listing type = "Private room" dummy
* generating neighborhood dummys, I want to make Midtown neighborhood as base 
* drop the dummy for Midtown.
compress
********************************************************************************
***************** SAVING DATA FOR HEDONIC REGRESSION ***************************
********************************************************************************
save "Y:\agrajg\Research\Data\temp\HedonicRegressionData.dta", replace
********************************************************************************
/*

sort date
sum date
local datemin = `r(min)'
local datemax = `r(max)'

di `datemin'
di `datemax'

forvalues i = `datemin'(1)`datemax' {
	preserve
	keep if date == `i'
	save "Y:\agrajg\Research\Data\temp\HedonicRegressionDatabrokenbyDates`i'.dta", replace
	restore
}
*/

********************************************************************************
********************************************************************************
********************************************************************************
timer list
********************************************************************************
*********************** AIRDNA HEDONIC ANALYSIS DATA PREP **********************
*****************************END************************************************
********************************************************************************
