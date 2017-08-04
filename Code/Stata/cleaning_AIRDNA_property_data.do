*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
********************************** BEGIN ***************************************
********************** cleaning_AIRDNA_property_data.do ************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
* This do file cleans property data obtained from AIRDNA. I use both old as well
* as new data sets and clear up irregularities between datasets.
clear all 
set more off
capture log close
********************************************************************************
* Appending 2 versions of the property data. 

* ==============================================================================
use "Y:\agrajg\Research\Data\RawAIRDNA_dta_data\Boroughs_Property_201604.dta" , clear
* ==============================================================================

gen datasetnum = 1

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\Boroughs_Property_201604_datasetnum.dta", replace
* ==============================================================================

* ==============================================================================
use "Y:\agrajg\Research\Data\RawAIRDNA_dta_data\MSANewYorkNewarkJerseyCityNYNJPAMetroAreaProperty20170427.dta" , clear 
* ==============================================================================

gen datasetnum = 2 

* ==============================================================================
append using "Y:\agrajg\Research\Data\temp\Boroughs_Property_201604_datasetnum.dta" 
* ==============================================================================

label variable datasetnum "Data Set Number"
********************************************************************************
********* TEST ON SAMPLE
*preserve
*sample 200, count
*sort propertyid hostid
*keep if _n<=200
********************************************************************************
******** CLEANING ID VARIABLES
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
*********	TRIMMING ALL THE STRING VARIABLE TO REMOVE USELSS SPACES ***********
********************************************************************************
global string_variables   listingtitle propertytype listingtype createddate lastscrapeddate country state city neighborhood metropolitanstatisticalarea calendarlastupdated superhost cancellationpolicy checkintime checkouttime businessready instantbookenabled listingurl listingmainimageurl

foreach var in $string_variables {
replace `var' = trim(`var')
format `var' %20s
}
order listingtitle, after(longitude)
********************************************************************************
******** SAVING A COPY OF DIRTY DATA *******************************************
	preserve
	keep if propertyid==.

	* ==============================================================================
	save "Y:\agrajg\Research\Data\FinalData\AIRDNA_listings_dta_dirty.dta", replace
	* ==============================================================================
	
	restore
******** MOVING ON WITH CLEAN DATA
drop if propertyid==.
********************************************************************************
************FILLING IN NEIGHBOURHOOD USING COORDINATES**************************
******************NEAREST COORDINATE AVAILABLE *********************************
*** SEARCHING THE KNOWN NEIGHBOURHOOD COORDINATE AND THEN ASSIGNING THE ********
*** SAME NEIGHBOURHOOD AS THE CLOSETS COORDINATE *******************************
********************************************************************************
preserve
* all properties that have a defined neighborhood 
keep if neighborhood !=""
contract propertyid neighborhood latitude longitude 
gen dist =.

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\has_neighbourhood_listings.dta", replace
* ==============================================================================

restore 

preserve
* All properties without neighborhood 
keep if neighborhood ==""
contract propertyid neighborhood latitude longitude 

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\no_neighbourhood_listings.dta", replace
* ==============================================================================

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

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta", replace
* ==============================================================================

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

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\matched_neighbourhood_test.dta", replace
* ==============================================================================

restore

preserve

* ==============================================================================
use "Y:\agrajg\Research\Data\temp\no_neighbourhood_listings.dta", clear 
* ==============================================================================

count
global cnt = r(N)
forvalues i = 1(1) $cnt {
*forvalues i = 1(1) 2 {
*local i = 1999

* ==============================================================================
use "Y:\agrajg\Research\Data\temp\no_neighbourhood_listings.dta", clear
* ==============================================================================

global search_lat  = latitude[`i'] 
global search_long = longitude[`i']
global search_pid = propertyid[`i']

* ==============================================================================
use "Y:\agrajg\Research\Data\temp\has_neighbourhood_listings.dta", clear
* ==============================================================================

replace dist  = (latitude - $search_lat)^2 + (longitude - $search_long)^2
egen min_dist = min(dist)
keep if min_dist == dist
global closest_lat = latitude[1]
global closest_long = longitude[1]
capture global closest_neighborhood = neighbourhood_cleansed[1]
capture global closest_neighborhood = neighbourhood_cleansed[1]
global closest_propertyid = propertyid[1]

*macro list

* ==============================================================================
use "Y:\agrajg\Research\Data\temp\matched_neighbourhood_test.dta", clear
* ==============================================================================

replace search_lat = $search_lat
replace search_long = $search_long
replace search_pid = $search_pid
replace closest_lat = $closest_lat
replace closest_long = $closest_long
replace closest_neighborhood = "$closest_neighborhood"
replace closest_propertyid= $closest_propertyid
di `i' 
*di $closest_neighborhood

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\matched_neighbourhood_test.dta", replace
* ==============================================================================

* ==============================================================================
use "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta", clear
append using "Y:\agrajg\Research\Data\temp\matched_neighbourhood_test.dta"
* ==============================================================================

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta", replace
* ==============================================================================

}
*erase Y:\agrajg\Research\Data\temp\matched_neighbourhood_test.dta
*erase Y:\agrajg\Research\Data\temp\has_neighbourhood_listings.dta
*erase Y:\agrajg\Research\Data\temp\no_neighbourhood_listings.dta

* ==============================================================================
use "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta", clear
* ==============================================================================

drop closest_lat closest_long closest_propertyid
rename search_lat  latitude 
rename search_long  longitude
rename search_pid  propertyid 

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta", replace
* ==============================================================================

restore

* ==============================================================================
merge m:1 propertyid latitude longitude using "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta", nogenerate
* ==============================================================================

replace neighborhood = closest_neighborhood  if neighborhood==""
drop closest_neighborhood
*erase "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta"
********************************************************************************
********************************************************************************

********************************************************************************
**************************** CLEANING HOST ID  *********************************
********************************************************************************
*** host id from MCOX
preserve

* ==============================================================================
use "Y:\agrajg\Research\Data\FinalData\MCOX_property_data_clean_final.dta" , clear
* ==============================================================================

contract propertyid host_id
drop _freq

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\host_id_mcox.dta",replace
* ==============================================================================

restore

* ==============================================================================
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\host_id_mcox.dta"
* ==============================================================================

replace hostid = host_id if hostid ==.
drop host_id
********************************************************************************
*** Removing observations coming from using file

drop if _merge==2
drop _merge
********************************************************************************
*** Dropping redundent variables

drop averagedailyrate annualrevenueltm occupancyrateltm numberofbookingsltm numberofreviews overallrating calendarlastupdated countreservationdaysltm countavailabledaysltm countblockeddaysltm
********************************************************************************
*** Replacing errors in names / tags 

replace propertytype = "Bed & Breakfast" if propertytype == "Bed &amp; Breakfast"
replace superhost = "False" if superhost=="f"
replace superhost = "True" if superhost=="t"
********************************************************************************




******************************CREATDATE CLEANING********************************
*** Converting date variables into stata dates
*** Bringing earliest available days from market data
*** If create date not present then relace with first available or booked date*
********************************************************************************
foreach var in  createddate lastscrapeddate {
	gen temp`var' = date(`var', "YMD")
	order temp`var', before(`var')
	drop `var'
	rename temp`var' `var' 
}
*** cleaning create date conflict by picking the earlier date

bys propertyid : replace createddate = createddate[_n-1] if createddate > createddate[_n-1]
bys propertyid : replace createddate = createddate[_n+1] if createddate > createddate[_n+1]


preserve
	
	* ==============================================================================
	use "Y:\agrajg\Research\Data\FinalData\AIRDNA_market_data_clean_final.dta", clear
	* ==============================================================================
	
	collapse (min) first_observed_date = date (count) count = date , by (propertyid status )
	reshape wide first_observed_date count , i( propertyid ) j( status ) s
	format %9.0g countA countB countR
	gen earliestdateAR = first_observed_dateA if first_observed_dateA <= first_observed_dateR
	replace earliestdateAR = first_observed_dateR if first_observed_dateA > first_observed_dateR
	format %td earliestdateAR
	keep propertyid earliestdateAR
	
	* ==============================================================================
	save "Y:\agrajg\Research\Data\temp\AIRDNA_market_earliestdateAR.dta", replace 
	* ==============================================================================

restore

* ==============================================================================
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\AIRDNA_market_earliestdateAR.dta"
* ==============================================================================

tab _merge
drop _merge
replace createddate = earliestdateAR if createddate ==.
drop earliestdateAR

********************************************************************************
* Filling in the missing values
egen missobs = rowmiss( propertyid - datasetnum )
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
**** There should be none
********************************************************************************
********************************************************************************
***** formating and finalizing
keep propertyid-listingtitle 
format createddate  %td
format lastscrapeddate %td
label var createddate "Date listing created"
label var lastscrapeddate "Date when listing was last scraped"
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
*********************************** END ****************************************
********************** cleaning_AIRDNA_property_data.do ************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



