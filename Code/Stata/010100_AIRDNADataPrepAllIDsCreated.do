********************************************************************************
****************AIRDNA DATA PREP FOR REGRESSION ********************************
*********************Creating all ids in market data****************************
*****************************BEGIN**********************************************
********************************************************************************
* Creating IDs for internal use
* Creats ln(price) and status dummy
********************************************************************************
clear all
set more off
*** Extracting host IDs and adding them to the market data
*** This is done to make the ids of time/market, host , product and consumer.
*** These IDs will be used through out this work and therefore I am creating them here, once and for all
use "Y:\agrajg\Research\Data\FinalData\AIRDNA_listings_data_clean_final.dta", clear 
keep propertyid hostid
save "Y:\agrajg\Research\Data\temp\011_PropertyIDHostIDKey.dta", replace
********************************************************************************

clear all 
set more off
*===============================================================================
use "Y:\agrajg\Research\Data\FinalData\AIRDNA_market_data_clean_final.dta" , clear
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010100_PropertyIDHostIDKey.dta" 
*===============================================================================
drop if _merge == 1
drop if _merge == 2
drop _merge
order  propertyid hostid
********************************************************************************
********************************************************************************
***************** GENERATING ID'S FOR INTERNAL REFERENCE ***********************
********************************************************************************
*** Generating universal id's . 
*** Write down resaon for other status with reservation id 
*** Just to reming your self again....
sort propertyid date hostid reservationid

egen pid = group(propertyid)
label var pid "Property ID"

egen tid = group(date)
label var tid "Time ID"

egen hid = group(hostid)
label var hid "Host ID"


*** Reservations are understood to be made if the reservation id is present and 
*** reservation date is also present
*** In other cases the date and property is taken to be available or blocked. If 
*** availabele and has reservation id then it means that the guest has cancelled 
*** the booking 
*** If the status is B and reservation id is present then the host has cancelled
*** For our purpose the status is R if reservation id and date both present
replace reservationid = reservationidalt if reservationid ==.
egen gid = group(propertyid reservationid) if status=="R"
label var gid "Guest ID"
********************************************************************************
*** ORDERING VARIABLES A LITTLE BIT
*** ALL ID'S IN THE BEGINNING - PROPERTY ID , TIME ID , HOST ID , GUEST ID 
*** PRODUCT CHARACTERISTICS - HOST CHARACTERISTICS - GUEST CHARACTERISTICS 
order pid tid hid gid
********************************************************************************

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
*===============================================================================
compress
save "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDs.dta", replace
*===============================================================================
drop if status =="B"

*===============================================================================
save "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDsBlockedDropped.dta" , replace
*===============================================================================

drop if status =="A"

*===============================================================================
save "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDsOnlyBooked.dta" , replace
*===============================================================================
********************************************************************************
do "Y:\agrajg\Research\Code\Stata\010101_MarketDataAllIDsBreakingDataByDates.do"
do "Y:\agrajg\Research\Code\Stata\010102_MarketDataAllIDsBreakingDataByHid.do"
********************************************************************************
********************************************************************************

********************************************************************************
******************** END 010100 ************************************************
********************************************************************************


