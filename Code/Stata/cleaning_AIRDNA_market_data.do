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
save Y:\agrajg\Research\Data\temp\AIRDNA_market_data1.dta, replace
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
save Y:\agrajg\Research\Data\temp\AIRDNA_market_data2.dta, replace
* ==============================================================================

********************************************************************************
*** Appending the old and new market data and then removing duplicates 
*** with respect to all the varibles
clear all 

* ==============================================================================
use Y:\agrajg\Research\Data\temp\AIRDNA_market_data2.dta, clear
append using Y:\agrajg\Research\Data\temp\AIRDNA_market_data1.dta
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
*count if price ==. & (price1==. | price2 ==.)
* The only conflict is difference of price between 2 datasets. All missing 
* prices have been taken care of
* CONFLICT IN PRICE
* price for blocked status does not matter. 
* one possibility is to pick a price closer to mean of the rest
gen year = year(date)
gen month = month(date)
bys propertyid status year month: egen meanprice = mean(price)
replace price = price2 if price==. & abs(price2 - meanprice) < abs(price1 - meanprice)
replace price = price1 if price==. & abs(price1 - meanprice) < abs(price2 - meanprice)
count if price ==.
replace price = price2 if price==.
count if price ==.

********************************************************************************
*******************************RESERVATION ID***********************************
********************************************************************************
gen reservationid = reservationid2 if reservationid2 == reservationid1 | reservationid1==.
replace reservationid = reservationid1 if reservationid2 ==. & reservationid==.
gen reservationidalt = reservationid1 if reservationid ==.
replace reservationid = reservationid2 if reservationid ==.
* CONFLICT IN RESERVATION ID
* take 2 as primary and 1 as secondary 
*		gen reservationidalt = reservationid1
replace reservationidalt = reservationid if status =="B" | status == "A"
replace reservationid = . if status =="B" | status == "A"

********************************************************************************
******************************BOOKED DATE***************************************
********************************************************************************

gen bookeddate = bookeddate2 if bookeddate2 == bookeddate1 | bookeddate1==.
replace bookeddate = bookeddate1 if bookeddate2 ==. & bookeddate==.
gen bookeddatealt = bookeddate1 if bookeddate ==.
replace bookeddate = bookeddate2 if bookeddate ==.
* CONFLICT IN BOOKED date
* take 2 as primary and 1 as secondary 
*		gen bookeddatealt = bookeddate1
replace bookeddatealt = bookeddate if status =="B" | status == "A"
replace bookeddate = . if status =="B" | status == "A"

********************************************************************************

********************************************************************************

* checks 
count if status =="" 
count if price ==.
count if (reservationid==. & reservationidalt==. ) & (reservationid1 !=. | reservationid2!=.)
count if (bookeddate==. & bookeddatealt==.) & (bookeddate1 !=. | bookeddate2 !=.) 

drop *1 *2 meanprice year month
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
use "Y:\agrajg\Research\Data\FinalData\AIRDNA_listings_data_clean_final.dta", clear
* ==============================================================================

keep propertyid createddate

* ==============================================================================
save "Y:\agrajg\Research\Data\temp\AIRDNAcreatedate.dta", replace
* ==============================================================================

restore

* ==============================================================================
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\AIRDNAcreatedate.dta"
* ==============================================================================

drop if _merge ==2
drop _merge
keep if date >= createddate
drop createddate
********************************************************************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
*********************************** END ****************************************
********************** cleaning_AIRDNA_market_data.do **************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
