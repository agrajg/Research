*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
********************************** BEGIN ***************************************
********************** cleaning_AIRDNA_market_data.do **************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
clear all 
set more off
********************************************************************************
*** CLEANING AIRDNA MARKET DATA 
********************************************************************************
* Importing and appending old data from 3 files 
* This data is from August 2014 to April 2016

* ==============================================================================
use  Y:\agrajg\Research\Data\RawAIRDNA_dta_data\Boroughs_Daily_2014.dta, clear
append using  Y:\agrajg\Research\Data\RawAIRDNA_dta_data\Boroughs_Daily_2015.dta
append using  Y:\agrajg\Research\Data\RawAIRDNA_dta_data\Boroughs_Daily_2016.dta
* ==============================================================================

* Setting up date variable 
global DATEVARLIST date bookeddate
foreach dtvar in $DATEVARLIST   {
	gen temp`dtvar'  = date( `dtvar' , "YMD")
	format %td temp`dtvar'
	order temp`dtvar', after(`dtvar')
	drop `dtvar'
	rename temp`dtvar' `dtvar'
}
duplicates drop
gen datasetnum = 1

*Save to temporary data, will late use to check consistancy...
* ==============================================================================
save Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data1.dta, replace
* ==============================================================================

********************************************************************************
********************************************************************************
*** NEW MARKET DATA ***
clear all

* ==============================================================================
use  Y:\agrajg\Research\Data\RawAIRDNA_dta_data\MSANewYorkNewarkJerseyCityNYNJPAMetroAreaDaily20170427.dta, clear
* ==============================================================================

global DATEVARLIST date bookeddate
foreach dtvar in $DATEVARLIST   {
	gen temp`dtvar'  = date( `dtvar' , "YMD")
	format %td temp`dtvar'
	order temp`dtvar', after(`dtvar')
	drop `dtvar'
	rename temp`dtvar' `dtvar'
}
duplicates drop
gen datasetnum = 2

* ==============================================================================
save Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data2.dta, replace
* ==============================================================================

********************************************************************************
*** Appending the old and new market data and then removing duplicates 
*** with respect to all the varibles
clear all 

* ==============================================================================
use Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data2.dta, clear
append using Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data1.dta
* ==============================================================================

duplicates drop
label var date "Date of Stay"
label var bookeddate "Date when booking was picked"
/*
save "Y:\agrajg\Research\Data\AIRDNA_market_dta_data\AIRDNA_market_data_clean1.dta", replace
*capture erase "Y:\agrajg\Research\Data\temp\AIRDNA_market_data1.dta"
*capture erase "Y:\agrajg\Research\Data\temp\AIRDNA_market_data2.dta"
export delimited using "Y:\agrajg\Research\Data\AIRDNA_market_dta_data\AIRDNA_market_data_clean1.csv", replace

********************************************************************************
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
********************************************************************************
clear all 
set more off
use "Y:\agrajg\Research\Data\AIRDNA_market_dta_data\AIRDNA_market_data_clean1.dta", clear
*/
sort propertyid date status price reservationid bookeddate datasetnum
order propertyid date status price reservationid bookeddate datasetnum
drop if propertyid == . & date==.
********************************************************************************
*** Duplicates removed in earlier file.
reshape wide status price reservationid bookeddate , i( propertyid date ) j( datasetnum )
********************************************************************************
********************************STATUS******************************************
********************************************************************************
gen status = status2 if status2 == status1 | status1==""
replace status = status1 if status2 =="" & status ==""
replace status = status2 if status1 =="" & status2 !=""
* CONFLICT IN STATUS
* Only one kind of conflict. The old data has A statuses and new data has them as R without booking id or booking date.
* stick with new for now
replace status = status2 if status==""

********************************************************************************
*******************************PRICES*******************************************
********************************************************************************
gen price = price2 if price2 == price1 | price1==.
replace price = price2 if price ==. & price1 ==.
replace price = price1 if price ==. & price2 ==.
replace price = price2 if price ==.

*count if price ==. & (price1==. | price2 ==.)
* The only conflict is difference of price between 2 datasets. All missing 
* prices have been taken care of
* CONFLICT IN PRICE
* price for blocked status does not matter. 
* one possibility is to pick a price closer to mean of the rest
/*
gen year = year(date)
gen month = month(date)
bys propertyid status year month: egen meanprice = mean(price)
replace price = price2 if price==. & abs(price2 - meanprice) < abs(price1 - meanprice)
replace price = price1 if price==. & abs(price1 - meanprice) < abs(price2 - meanprice)
count if price ==.
replace price = price2 if price==.
count if price ==.
*/


********************************************************************************
*******************************RESERVATION ID***********************************
********************************************************************************
gen reservationid = reservationid2
replace reservationid = reservationid1 if reservationid==.
gen reservationidalt = reservationid1 if reservationid1 != reservationid2

* CONFLICT IN RESERVATION ID
* take 2 as primary and 1 as secondary 
*		gen reservationidalt = reservationid1
replace reservationidalt = reservationid if status =="B" | status == "A"
replace reservationid = . if status =="B" | status == "A"

********************************************************************************
******************************BOOKED DATE***************************************
********************************************************************************
gen bookeddate = bookeddate2
replace bookeddate = bookeddate1 if bookeddate==.
gen bookeddatealt = bookeddate1 if bookeddate1 != bookeddate2

* CONFLICT IN BOOKED date
* take 2 as primary and 1 as secondary 
*		gen bookeddatealt = bookeddate1
replace bookeddatealt = bookeddate if status =="B" | status == "A"
replace bookeddate = . if status =="B" | status == "A"

********************************************************************************
*** Cleaning up conflics between status, reservationid and boookeddate *********
********************************************************************************
*** if status is A or B, and reservation id is present. it means cancellation, 
*** there should be no reservation date, lets check
count if (status =="A" | status =="B" ) & reservationid !=. & bookeddate !=. 
*** should be zero
replace status = "B" if status == "R" & reservationid ==.
replace status = "B" if status == "R" & bookeddate==.
* If there is a reservation there should be a reservationid and booked date
count if status == "R" & (reservationid==. | bookeddate ==. )
********************************************************************************
*Prices
sort propertyid date
by propertyid : egen p75_price = pctile(price) , p(75)
gen permaxdiff75 = (price- p75_price)/ p75_price
drop if permaxdiff75 > 50
drop p75_price permaxdiff75
********************************************************************************

* checks 
count if status =="" 
count if price ==.
count if (reservationid==. & reservationidalt==. ) & (reservationid1 !=. | reservationid2!=.)
count if (bookeddate==. & bookeddatealt==.) & (bookeddate1 !=. | bookeddate2 !=.) 

capture drop meanprice
capture drop year
capture drop month

capture drop *1 
capture drop *2
   
label var status "Daily status"
label var price "Price (per night)"
label var reservationid "Reservation ID"
label var reservationidalt "Alternate Reservation ID"
label var bookeddate "Date when booking realized"
label var bookeddatealt "Alternate date when booking realized"

*duplicates drop
*duplicates list propertyid date
xtset propertyid date, daily
tsfill, full
replace status ="B" if status==""
replace price =. if status=="B"
format bookeddate %td
format bookeddatealt %td
********************************************************************************
**************** Dropping observations before scrape date **********************
preserve

* ==============================================================================
use "Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_data_clean_final.dta", clear
* ==============================================================================

keep propertyid createddate

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\000103_AIRDNAcreatedate.dta", replace
* ==============================================================================

restore

* ==============================================================================
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\000103_AIRDNAcreatedate.dta"
* ==============================================================================

drop if _merge ==2
drop _merge
keep if date >= createddate
drop createddate

********************************************************************************
********************************************************************************
*saving all data
********************************************************************************

* ==============================================================================
compress
save 					"Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data_clean_final.dta", replace 
export delimited using 	"Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data_clean_final.csv", replace
* ==============================================================================

*sampling 50 properties

* ==============================================================================
preserve
do 						"Y:\agrajg\Research\Code\Stata\sample50properties_v11.do"
compress
save 					"Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data_clean_final_sample50.dta", replace 
export delimited using 	"Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data_clean_final_sample50.csv", replace
restore
* ==============================================================================

* ==============================================================================
preserve
drop if status=="B"
compress
save 					"Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data_clean_final_BlockedDropped.dta", replace 
export delimited using 	"Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data_clean_final_BlockedDropped.csv", replace
restore
* ==============================================================================

* ==============================================================================
preserve
keep if status=="A"
compress
save 					"Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data_clean_final_OnlyBooked.dta", replace 
export delimited using 	"Y:\agrajg\Research\Data\temp\000103_AIRDNA_market_data_clean_final_OnlyBooked.csv", replace
restore
* ==============================================================================


*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
*********************************** END ****************************************
********************** cleaning_AIRDNA_market_data.do **************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
