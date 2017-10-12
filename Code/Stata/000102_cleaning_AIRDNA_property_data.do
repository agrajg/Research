
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
save "Y:\agrajg\Research\Data\temp\000102_Boroughs_Property_201604_datasetnum.dta", replace
* ==============================================================================

* ==============================================================================
use "Y:\agrajg\Research\Data\RawAIRDNA_dta_data\MSANewYorkNewarkJerseyCityNYNJPAMetroAreaProperty20170427.dta" , clear 
* ==============================================================================

gen datasetnum = 2 

* ==============================================================================
append using "Y:\agrajg\Research\Data\temp\000102_Boroughs_Property_201604_datasetnum.dta" 
* ==============================================================================

label variable datasetnum "Data Set Number"
********************************************************************************
********* TEST ON SAMPLE
*preserve
*sample 200, count
*sort propertyid hostid
*keep if _n<=200
********************************************************************************
********** CLEANING ID VARIABLES ***********************************************
********************************************************************************
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

/*******************************************************************************
******** SAVING A COPY OF DIRTY DATA *******************************************
	preserve
	keep if 	(propertyid==.) 																			///
			| 	(listingtype =="" & neighborhood =="" & propertytype =="" & latitude ==.& longitude  ==.) 	///
			| 	(latitude ==. | longitude ==.)																///
	* ==============================================================================
	save "Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_dta_dirty.dta", replace
	* ==============================================================================
	
	restore	
*/
******** MOVING ON WITH CLEAN DATA *********************************************
********************************************************************************
drop if propertyid==.
drop if latitude ==. 
drop if longitude ==.
drop if longitude <-80
drop if longitude >-70
replace 	state = "New York" if state == "Arizona" /// 
			| state == "District of Columbia" 	| state == "Florida" /// 
			| state == "Illinois" 				| state == "Maryland" /// 
			| state == "Oklahoma"
********************************************************************************

/*
********************************************************************************
************FILLING IN NEIGHBOURHOOD USING COORDINATES**************************
******************NEAREST COORDINATE AVAILABLE *********************************
*** SEARCHING THE KNOWN NEIGHBOURHOOD COORDINATE AND THEN ASSIGNING THE ********
*** SAME NEIGHBOURHOOD AS THE CLOSETS COORDINATE *******************************
********************************************************************************
**** Matched neighborhood created. This portion of code is locked out because 
**** it takes a lot of time (a day or 2). No need to run this all the time
preserve
* all properties that have a defined neighborhood 
keep if neighborhood !=""
contract propertyid neighborhood latitude longitude 
gen dist =.

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\000102_has_neighbourhood_listings.dta", replace
* ==============================================================================

restore 

preserve
* All properties without neighborhood 
keep if neighborhood ==""
contract propertyid neighborhood latitude longitude 

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\000102_no_neighbourhood_listings.dta", replace
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
save "Y:\agrajg\Research\Data\temp\000102_matched_neighbourhood.dta", replace
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
save "Y:\agrajg\Research\Data\temp\000102_matched_neighbourhood_test.dta", replace
* ==============================================================================

restore


preserve

* ==============================================================================
use "Y:\agrajg\Research\Data\temp\000102_no_neighbourhood_listings.dta", clear 
* ==============================================================================

count
global cnt = r(N)
forvalues i = 1(1) $cnt {
*forvalues i = 1(1) 10 {
*local i = 1999

* ==============================================================================
use "Y:\agrajg\Research\Data\temp\000102_no_neighbourhood_listings.dta", clear
* ==============================================================================

global search_lat  = latitude[`i'] 
global search_long = longitude[`i']
global search_pid = propertyid[`i']

* ==============================================================================
use "Y:\agrajg\Research\Data\temp\000102_has_neighbourhood_listings.dta", clear
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
use "Y:\agrajg\Research\Data\temp\000102_matched_neighbourhood_test.dta", clear
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
save "Y:\agrajg\Research\Data\temp\000102_matched_neighbourhood_test.dta", replace
* ==============================================================================

* ==============================================================================
use "Y:\agrajg\Research\Data\temp\000102_matched_neighbourhood.dta", clear
append using "Y:\agrajg\Research\Data\temp\000102_matched_neighbourhood_test.dta"
* ==============================================================================

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\000102_matched_neighbourhood.dta", replace
* ==============================================================================

}


* ==============================================================================
use "Y:\agrajg\Research\Data\temp\000102_matched_neighbourhood.dta", clear
* ==============================================================================

drop closest_lat closest_long closest_propertyid
rename search_lat  latitude 
rename search_long  longitude
rename search_pid  propertyid 

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\000102_matched_neighbourhood.dta", replace
* ==============================================================================

restore
**** Matched neighborhood created. This portion of code is locked out because 
**** it takes a lot of time (a day or 2). No need to run this all the time
*/

* ==============================================================================
merge m:1 propertyid latitude longitude using "Y:\agrajg\Research\Data\temp\000102_matched_neighbourhood.dta", nogenerate
* ==============================================================================

replace neighborhood = closest_neighborhood  if neighborhood==""
drop closest_neighborhood

* ==============================================================================
save Y:\agrajg\Research\Data\temp\000102_AIRDNAListingsWithCleanedNeighborhood.dta, replace
* ==============================================================================

********************************************************************************
********************************************************************************
********************************************************************************

* ==============================================================================
use  Y:\agrajg\Research\Data\temp\000102_AIRDNAListingsWithCleanedNeighborhood.dta, clear
* ==============================================================================

********************************************************************************
*** Dropping redundent variables
********************************************************************************
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

/*
** The file is already created no need to run every time
preserve
	
	* ==============================================================================
	use "Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data_clean_final.dta", clear
	* ==============================================================================
	
	*collapse (min) first_observed_date = date (count) count = date , by (propertyid status )
	collapse (min) first_observed_date = date (max) last_observed_date = date , by (propertyid  )

	*reshape wide first_observed_date count , i( propertyid ) j( status ) s
	*format %9.0g countA countB countR
	*gen earliestdateAR = first_observed_dateA if first_observed_dateA <= first_observed_dateR
	*replace earliestdateAR = first_observed_dateR if first_observed_dateA > first_observed_dateR
	
	format %td first_observed_date last_observed_date
	
	* ==============================================================================
	save "Y:\agrajg\Research\Data\temp\000102_AIRDNA_market_earliestlatestdate.dta", replace 
	* ==============================================================================

restore
*/
* ==============================================================================
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\000102_AIRDNA_market_earliestlatestdate.dta"
* ==============================================================================

tab _merge
drop _merge
replace createddate = first_observed_date if createddate ==.
drop first_observed_date
******************************SCRAPEDATE CLEANING*******************************
replace lastscrapeddate = last_observed_date if lastscrapeddate ==.
drop last_observed_date
********************************************************************************


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

/*
** The file is already created no need to run every time
********************************************************************************
**************************** CLEANING HOST ID  *********************************
********************************************************************************
*** host id from MCOX
preserve
*** the host id are missing for many properties, I have assumed that properties 
*** without host id have unique host which holds only one property 
* ==============================================================================
use "Y:\agrajg\Research\Data\temp\000102_MCOX_property_data_clean_final.dta" , clear
* ==============================================================================

contract propertyid host_id
drop _freq

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\000102_host_id_mcox.dta",replace
* ==============================================================================

restore


preserve
contract propertyid hostid
drop _freq
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\000102_host_id_mcox.dta"

gen temphostid = .
replace temphostid = hostid if hostid != host_id & hostid !=. & host_id !=.
replace temphostid = hostid if hostid !=. & host_id ==.
replace temphostid = host_id if hostid ==. & host_id !=.
replace temphostid = hostid if hostid == host_id
sum temphostid
sort propertyid hostid
replace temphostid = _n + `r(max)' if temphostid==.
keep propertyid temphostid

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\000102_host_id_all.dta",replace
* ==============================================================================

restore
*/


* ==============================================================================
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\000102_host_id_all.dta"
* ==============================================================================

replace hostid = temphostid if hostid ==.
drop temphostid
********************************************************************************
*** Removing observations coming from using file

drop if _merge==2
drop _merge
********************************************************************************
***************************** When response id not observed ********************
********************************************************************************






********************************************************************************
************************ STRING MISSING VALUES *********************************
***************************  REPLACE BY NA  ************************************
global string_variables2   listingtitle propertytype listingtype  country state city neighborhood metropolitanstatisticalarea superhost cancellationpolicy checkintime checkouttime businessready instantbookenabled listingurl listingmainimageurl
foreach var in $string_variables2 {
replace `var' = "NR" if `var' == ""
}
********************************************************************************
********************************************************************************
********************************************************************************

********************************************************************************
************************ NUMERIC (other fee) MISSING VALUES ********************
***************************  REPLACE BY 0  ************************************
foreach var in securitydeposit cleaningfee extrapeoplefee {
replace `var' = 0 if `var' == .
}


********************************************************************************
************************ NUMERIC (other attributes) MISSING VALUES *************
***************************  REPLACE BY 0  ************************************

foreach var in bedrooms bathrooms maxguests minimumstay numberofphotos{
replace `var' = 0 if `var' == .
}
********************************************************************************
************************     Filling in other varibles   ***********************
********************************************************************************
tostring zipcode , replace
replace zipcode = "NR" if zipcode==""
replace responserate = 0 if responserate ==.
replace responsetimemin = 16200 if  responsetimemin==. // no response = no response in 3 months  

********************************************************************************
**************** CLEANING CHECK OUT TIME ***************************************
********************************************************************************


replace checkouttime  =  subinstr(checkouttime  ," ","",.)
*replace checkouttime  =  subinstr(checkouttime  ,":00",".0",.)
replace checkouttime  =  subinstr(checkouttime  ,"PM(noon)","PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"AM(midnight)","AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"AM(nextday)","AM",.)

replace checkouttime  = "1:00PM" if checkouttime =="1" | checkouttime =="1:00"
replace checkouttime  = "2:00PM" if checkouttime =="2" | checkouttime =="2:00"
replace checkouttime  = "3:00PM" if checkouttime =="3" | checkouttime =="3:00"
replace checkouttime  = "4:00PM" if checkouttime =="4" | checkouttime =="4:00"
replace checkouttime  = "5:00PM" if checkouttime =="5" | checkouttime =="5:00"
replace checkouttime  = "6:00PM" if checkouttime =="6" | checkouttime =="6:00"
replace checkouttime  = "7:00PM" if checkouttime =="7" | checkouttime =="7:00"
replace checkouttime  = "8:00AM" if checkouttime =="8" | checkouttime =="8:00"
replace checkouttime  = "9:00AM" if checkouttime =="9" | checkouttime =="9:00"
replace checkouttime  = "10:00AM" if checkouttime =="10" | checkouttime =="10:00"
replace checkouttime  = "11:00AM" if checkouttime =="11" | checkouttime =="11:00"
replace checkouttime  = "12:00PM" if checkouttime =="12" | checkouttime =="12:00"

replace checkouttime  = "1:30PM" if checkouttime =="1.5" | checkouttime =="1:30"
replace checkouttime  = "2:30PM" if checkouttime =="2.5" | checkouttime =="2:30"
replace checkouttime  = "3:30PM" if checkouttime =="3.5" | checkouttime =="3:30"
replace checkouttime  = "4:30PM" if checkouttime =="4.5" | checkouttime =="4:30"
replace checkouttime  = "5:30PM" if checkouttime =="5.5" | checkouttime =="5:30"
replace checkouttime  = "6:30PM" if checkouttime =="6.5" | checkouttime =="6:30"
replace checkouttime  = "7:30PM" if checkouttime =="7.5" | checkouttime =="7:30"
replace checkouttime  = "8:30AM" if checkouttime =="8.5" | checkouttime =="8:30"
replace checkouttime  = "9:30AM" if checkouttime =="9.5" | checkouttime =="9:30"
replace checkouttime  = "10:30AM" if checkouttime =="10.5" | checkouttime =="10:30"
replace checkouttime  = "11:30AM" if checkouttime =="11.5" | checkouttime =="11:30"
replace checkouttime  = "12:30PM" if checkouttime =="12.5" | checkouttime =="12:30"

replace checkouttime  =  subinstr(checkouttime  ,"Anytimeafter","",.)
*replace checkouttime  =  subinstr(checkouttime  ,".0",":00",.)
*replace checkouttime  =  subinstr(checkouttime  ,".5",":30",.)
replace checkouttime  =  subinstr(checkouttime  ,"Anytimeafter","",.)
replace checkouttime  =  subinstr(checkouttime  ,"-"," ",.)

replace checkouttime  =  subinstr(checkouttime  ,"1AM","1:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"2AM","2:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"3AM","3:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"4AM","4:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"5AM","5:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"6AM","6:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"7AM","7:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"8AM","8:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"9AM","9:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"10AM","10:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"11AM","11:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"11AM","12:00AM",.)
	
replace checkouttime  =  subinstr(checkouttime  ,"1PM","1:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"2PM","2:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"3PM","3:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"4PM","4:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"5PM","5:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"6PM","6:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"7PM","7:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"8PM","8:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"9PM","9:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"10PM","10:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"11PM","11:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"11PM","12:00PM",.)

********************************************************************************
**************** CLEANING CHECK IN TIME ****************************************
********************************************************************************

replace checkintime =  subinstr(checkintime ," ","",.)
*replace checkintime =  subinstr(checkintime ,":00",".0",.)
replace checkintime =  subinstr(checkintime ,"PM(noon)","PM",.)
replace checkintime =  subinstr(checkintime ,"AM(midnight)","AM",.)
replace checkintime =  subinstr(checkintime ,"AM(nextday)","AM",.)

replace checkintime = "1:00PM" if checkintime=="1" | checkintime=="1:00"
replace checkintime = "2:00PM" if checkintime=="2" | checkintime=="2:00"
replace checkintime = "3:00PM" if checkintime=="3" | checkintime=="3:00"
replace checkintime = "4:00PM" if checkintime=="4" | checkintime=="4:00"
replace checkintime = "5:00PM" if checkintime=="5" | checkintime=="5:00"
replace checkintime = "6:00PM" if checkintime=="6" | checkintime=="6:00"
replace checkintime = "7:00PM" if checkintime=="7" | checkintime=="7:00"
replace checkintime = "8:00AM" if checkintime=="8" | checkintime=="8:00"
replace checkintime = "9:00AM" if checkintime=="9" | checkintime=="9:00"
replace checkintime = "10:00AM" if checkintime=="10" | checkintime=="10:00"
replace checkintime = "11:00AM" if checkintime=="11" | checkintime=="11:00"
replace checkintime = "12:00PM" if checkintime=="12" | checkintime=="12:00"

replace checkintime = "1:30PM" if checkintime=="1.5" | checkintime=="1:30"
replace checkintime = "2:30PM" if checkintime=="2.5" | checkintime=="2:30"
replace checkintime = "3:30PM" if checkintime=="3.5" | checkintime=="3:30"
replace checkintime = "4:30PM" if checkintime=="4.5" | checkintime=="4:30"
replace checkintime = "5:30PM" if checkintime=="5.5" | checkintime=="5:30"
replace checkintime = "6:30PM" if checkintime=="6.5" | checkintime=="6:30"
replace checkintime = "7:30PM" if checkintime=="7.5" | checkintime=="7:30"
replace checkintime = "8:30AM" if checkintime=="8.5" | checkintime=="8:30"
replace checkintime = "9:30AM" if checkintime=="9.5" | checkintime=="9:30"
replace checkintime = "10:30AM" if checkintime=="10.5" | checkintime=="10:30"
replace checkintime = "11:30AM" if checkintime=="11.5" | checkintime=="11:30"
replace checkintime = "12:30PM" if checkintime=="12.5" | checkintime=="12:30"

replace checkintime =  subinstr(checkintime ,"Anytimeafter","",.)
*replace checkintime =  subinstr(checkintime ,".0",":00",.)
*replace checkintime =  subinstr(checkintime ,".5",":30",.)
replace checkintime =  subinstr(checkintime ,"Anytimeafter","",.)
replace checkintime =  subinstr(checkintime ,"-"," ",.)

replace checkintime =  subinstr(checkintime ,"1AM","1:00AM",.)
replace checkintime =  subinstr(checkintime ,"2AM","2:00AM",.)
replace checkintime =  subinstr(checkintime ,"3AM","3:00AM",.)
replace checkintime =  subinstr(checkintime ,"4AM","4:00AM",.)
replace checkintime =  subinstr(checkintime ,"5AM","5:00AM",.)
replace checkintime =  subinstr(checkintime ,"6AM","6:00AM",.)
replace checkintime =  subinstr(checkintime ,"7AM","7:00AM",.)
replace checkintime =  subinstr(checkintime ,"8AM","8:00AM",.)
replace checkintime =  subinstr(checkintime ,"9AM","9:00AM",.)
replace checkintime =  subinstr(checkintime ,"10AM","10:00AM",.)
replace checkintime =  subinstr(checkintime ,"11AM","11:00AM",.)
replace checkintime =  subinstr(checkintime ,"11AM","12:00AM",.)
	
replace checkintime =  subinstr(checkintime ,"1PM","1:00PM",.)
replace checkintime =  subinstr(checkintime ,"2PM","2:00PM",.)
replace checkintime =  subinstr(checkintime ,"3PM","3:00PM",.)
replace checkintime =  subinstr(checkintime ,"4PM","4:00PM",.)
replace checkintime =  subinstr(checkintime ,"5PM","5:00PM",.)
replace checkintime =  subinstr(checkintime ,"6PM","6:00PM",.)
replace checkintime =  subinstr(checkintime ,"7PM","7:00PM",.)
replace checkintime =  subinstr(checkintime ,"8PM","8:00PM",.)
replace checkintime =  subinstr(checkintime ,"9PM","9:00PM",.)
replace checkintime =  subinstr(checkintime ,"10PM","10:00PM",.)
replace checkintime =  subinstr(checkintime ,"11PM","11:00PM",.)
replace checkintime =  subinstr(checkintime ,"11PM","12:00PM",.)



generate str1 startcheckintime = ""
replace startcheckintime = substr(checkintime,1,strpos(checkintime," ") - 1)
generate str1 endcheckintime = ""
replace endcheckintime = substr(checkintime,strpos(checkintime," ") + 1,.)
capture drop tempvar
gen tempvar = (startcheckintime=="")
replace startcheckintime = endcheckintime if tempvar == 1
replace endcheckintime = "" if tempvar == 1
replace endcheckintime = "12:00AM" if endcheckintime==""	


gen checkinperiod = .
replace checkinperiod = 24 if checkintime == "Flexible"
replace checkintime ="" if checkintime == "Flexible"

gen double t1 = clock( startcheckintime , "hm")
gen double t2 = clock( endcheckintime , "hm")

format %tc t1
format %tc t2

gen diff1 = t2 - t1
replace t2 = t2 + 86400000 if diff1 <=0
replace checkinperiod = (t2-t1)/(3600000) if checkinperiod==.
replace checkintime = startcheckintime
replace checkinperiod = 24 if checkintime == "NR"
order checkinperiod, after (checkintime)

label var checkintime "Check-in time"
label var checkinperiod "Check-in flexible preiod"


drop startcheckintime endcheckintime tempvar t1 t2 diff1
*contract checkintime checkinperiod
*br if checkintime =="NR"
********************************************************************************


********************************************************************************
/*
** Encoding all catagorical variables
global CatVariables propertytype listingtype country state city zipcode neighborhood metropolitanstatisticalarea superhost cancellationpolicy checkintime checkouttime businessready instantbookenabled 
foreach var in $CatVariables {
	rename `var' temp`var'
	encode temp`var', generate(`var')
	order `var', after(temp`var')
	drop temp`var'
}
*/


********************************************************************************
***** formating and finalizing
keep propertyid-listingtitle 
format createddate  %td
format lastscrapeddate %td
label var createddate "Date listing created"
label var lastscrapeddate "Date when listing was last scraped"



* Saving all data
* ==============================================================================	
	compress
	save 					"Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_data_clean_final.dta", replace
	export delimited using 	"Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_data_clean_final.csv", replace
* ==============================================================================
********************************************************************************
* sampling 50 properties
* ==============================================================================
	do 						"Y:\agrajg\Research\Code\Stata\sample50properties_v11.do"
	compress
	save 					"Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_data_clean_final_sample50.dta", replace 
	export delimited using 	"Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_data_clean_final_sample50.csv", replace
* ==============================================================================

*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
*********************************** END ****************************************
********************** cleaning_AIRDNA_property_data.do ************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
