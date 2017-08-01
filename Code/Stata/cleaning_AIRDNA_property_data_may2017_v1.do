clear all 
set more off
timer clear 1
timer on 1
use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_dta_data\Boroughs_Property_201604.dta" , clear
gen datasetnum = 1
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\Boroughs_Property_201604_datasetnum.dta", replace

use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_dta_data\MSANewYorkNewarkJerseyCityNYNJPAMetroAreaProperty20170427.dta" , clear 
gen datasetnum = 2 
append using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\Boroughs_Property_201604_datasetnum.dta" 

**** Test on Sample
*preserve
*sample 200, count
*sort propertyid hostid
*keep if _n<=200


***

duplicates drop
replace propertyid = trim(propertyid)
replace hostid = trim(hostid)
destring propertyid , generate(pid) force
destring hostid , generate(hid) force
order pid , after (propertyid)
order hid , after (hostid)
drop hostid propertyid
rename pid propertyid
rename hid hostid
********************************************************************************
***	TRIMMING ALL THE STRING VARIABLE TO REMOVE USELSS SPACES *******************
********************************************************************************

global string_variables   listingtitle propertytype listingtype createddate lastscrapeddate country state city neighborhood metropolitanstatisticalarea calendarlastupdated superhost cancellationpolicy checkintime checkouttime businessready instantbookenabled listingurl listingmainimageurl


foreach var in $string_variables {
replace `var' = trim(`var')
format `var' %20s
}
order listingtitle, after(longitude)

	preserve
	keep if propertyid==.
	save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_listings_dta_data\AIRDNA_listings_dta_dirty.dta", replace
	restore

drop if propertyid==.
********************************************************************************
************FILLING IN NEIGHBOURHOOD USING COORDINATES**************************
******************NEAREST COORDINATE AVAILABLE *********************************
*** SEARCHING THE KNOWN NEIGHBOURHOOD COORDINATE AND THEN ASSIGNING THE ********
*** SAME NEIGHBOURHOOD AS THE CLOSETS COORDINATE *******************************
********************************************************************************

preserve
keep if neighborhood !=""
contract propertyid neighborhood latitude longitude 
gen dist =.
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\has_neighbourhood_listings.dta", replace
restore 

preserve
keep if neighborhood ==""
contract propertyid neighborhood latitude longitude 
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\no_neighbourhood_listings.dta", replace
restore 

preserve
clear all
g search_lat =.
g search_long = .
g search_pid = .
g closest_lat = .
g closest_long = .
g closest_neighborhood = ""
g closest_propertyid= .
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\matched_neighbourhood.dta", replace
restore

preserve
clear all
g search_lat =.
g search_long = .
g search_pid = .
g closest_lat = .
g closest_long = .
g closest_neighborhood = ""
g closest_propertyid= .
set obs 1
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\matched_neighbourhood_test.dta", replace
restore

preserve
use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\no_neighbourhood_listings.dta", clear 
count
global cnt = r(N)
forvalues i = 1(1) $cnt {
*forvalues i = 1(1) 2 {
*local i = 1999
use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\no_neighbourhood_listings.dta", clear
global search_lat  = latitude[`i'] 
global search_long = longitude[`i']
global search_pid = propertyid[`i']

use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\has_neighbourhood_listings.dta", clear
replace dist  = (latitude - $search_lat)^2 + (longitude - $search_long)^2
egen min_dist = min(dist)
keep if min_dist == dist
global closest_lat = latitude[1]
global closest_long = longitude[1]
capture global closest_neighborhood = neighbourhood_cleansed[1]
capture global closest_neighborhood = neighbourhood_cleansed[1]
global closest_propertyid = propertyid[1]

*macro list

use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\matched_neighbourhood_test.dta", clear
replace search_lat = $search_lat
replace search_long = $search_long
replace search_pid = $search_pid
replace closest_lat = $closest_lat
replace closest_long = $closest_long
replace closest_neighborhood = "$closest_neighborhood"
replace closest_propertyid= $closest_propertyid
di `i' 
*di $closest_neighborhood
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\matched_neighbourhood_test.dta", replace

use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\matched_neighbourhood.dta", clear
append using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\matched_neighbourhood_test.dta"
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\matched_neighbourhood.dta", replace
}
erase Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\matched_neighbourhood_test.dta
erase Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\has_neighbourhood_listings.dta
erase Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\no_neighbourhood_listings.dta
use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\matched_neighbourhood.dta", clear
drop closest_lat closest_long closest_propertyid
rename search_lat  latitude 
rename search_long  longitude
rename search_pid  propertyid 
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\matched_neighbourhood.dta", replace
restore
merge m:1 propertyid latitude longitude using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\matched_neighbourhood.dta", nogenerate
replace neighborhood = closest_neighborhood  if neighborhood==""
drop closest_neighborhood
********************************************************************************
* host id from MCOX
preserve
use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\MCOX_listings_dta_data\MCOX_property_data_clean1.dta" , clear
contract propertyid host_id
drop _freq
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\host_id_mcox.dta",replace
restore
merge m:1 propertyid using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\host_id_mcox.dta"
rm Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\host_id_mcox.dta
replace hostid = host_id if hostid ==.
drop host_id
********************************************************************************
rename _merge merge_with_MCOX
********************************************************************************

timer off 1
timer list 1


*** Dropping redundent variables
drop averagedailyrate annualrevenueltm occupancyrateltm numberofbookingsltm numberofreviews overallrating calendarlastupdated countreservationdaysltm countavailabledaysltm countblockeddaysltm

*** replacing errors in names / tags 
replace propertytype = "Bed & Breakfast" if propertytype == "Bed &amp; Breakfast"
replace superhost = "False" if superhost=="f"
replace superhost = "True" if superhost=="t"

foreach var in  createddate lastscrapeddate {
	gen temp`var' = date(`var', "YMD")
	order temp`var', before(`var')
	drop `var'
	rename temp`var' `var' 
}

bys propertyid : replace createddate = createddate[_n-1] if createddate > createddate[_n-1]
bys propertyid : replace createddate = createddate[_n+1] if createddate > createddate[_n+1]


egen missobs = rowmiss( propertyid - merge_with_MCOX )
foreach var in  * {
gsort propertyid missobs
bysort propertyid : carryforward `var', replace
}

foreach var in  * {
gsort propertyid -missobs
bysort propertyid : carryforward `var', replace
}
duplicates drop propertyid - listingtitle, force
bys propertyid : gen count = _N
drop if count >= 2 & datasetnum ==1
duplicates drop propertyid-listingtitle, force
gsort propertyid  -missobs
by propertyid : gen count3 = _n
drop if count3 >1
duplicates list propertyid

******************************CREATDATE CLEANING********************************
*****bringing earliest available days from market data
*****if create date not present then relace with first available or booked date*
********************************************************************************
preserve
	use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_market_dta_data\AIRDNA_market_data_clean_final.dta", clear 
	collapse (min) first_observed_date = date (count) count = date , by (propertyid status )
	reshape wide first_observed_date count , i( propertyid ) j( status ) s
	format %9.0g countA countB countR
	gen earliestdateAR = first_observed_dateA if first_observed_dateA <= first_observed_dateR
	replace earliestdateAR = first_observed_dateR if first_observed_dateA > first_observed_dateR
	format %td earliestdateAR
	keep propertyid earliestdateAR
	save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\AIRDNA_market_earliestdateAR.dta", replace 
restore

merge 1:1 propertyid using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\AIRDNA_market_earliestdateAR.dta"
replace createddate = earliestdateAR if createddate ==.
drop earliestdateAR
********************************************************************************
********************************************************************************
***** formating and finalizing
keep propertyid-listingtitle 
format createddate  %td
format lastscrapeddate %td

 



