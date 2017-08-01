clear all 
set more off
use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\AIRDNA_market_data_clean1.dta", clear
sort propertyid date status price reservationid bookeddate datasetnum
order propertyid date status price reservationid bookeddate datasetnum
drop if propertyid == . & date==.
********************************************************************************
*** Duplicates removed in earlier file.
reshape wide status price reservationid bookeddate , i( propertyid date ) j( datasetnum )

gen status = status2 if status2 == status1 | status1==""
replace status = status1 if status2 =="" & status1 !=""

gen price = price2 if price2 == price1 | price1==.
replace price = price1 if price2 ==. & price1 !=.

gen reservationid = reservationid2 if reservationid2 == reservationid1 | reservationid1==.
replace reservationid = reservationid1 if reservationid2 ==. & reservationid1 !=.

gen bookeddate = bookeddate2 if bookeddate2 == bookeddate1 | bookeddate1==.
replace bookeddate = bookeddate1 if bookeddate2 ==. & bookeddate1 !=.

* CONFLICT IN STATUS
* Only one kind of conflict. The old data has A statuses and new data has them as R without booking id or booking date.
* stick with new for now
replace status = status2 if status==""
 

* CONFLICT IN PRICE
* price for blocked status does not matter. 
* one possibility is to pick a price closer to mean of the rest
bys propertyid status: egen meanprice = mean(price)
replace price = price2 if price==. & abs(price2 - meanprice) > abs(price1 - meanprice)
replace price = price1 if price==. & abs(price1 - meanprice) > abs(price2 - meanprice)



* CONFLICT IN RESERVATION ID


* CONFLICT IN BOOKED DATE
 






/********************************************************************************
collapse (last) lastbookeddate = bookeddate (first) firstbookeddate = bookeddate ///
	, by ( propertyid date status price reservationid )

collapse (last) lastreservationid = reservationid (first) firstreservationid = reservationid ///
	(last) lastlastbookeddate = lastbookeddate (first) firstlastbookeddate = lastbookeddate /// 
	(last) lastfirstbookeddate = firstbookeddate (first) firstfirstbookeddate = firstbookeddate ///
	, by ( propertyid date status price)

collapse (last) lastprice  = price (first) firstprice = price ///
	(last) lastlastreservationid = lastreservationid (first) firstlastreservationid = lastreservationid ///
	(last) lastfirstreservationid = firstreservationid (first) firstfirstreservationid = firstreservationid ///
	(last) lastlastlastbookeddate = lastlastbookeddate (first) firstlastlastbookeddate = lastlastbookeddate /// 
	(last) lastfirstlastbookeddate = firstlastbookeddate (first) firstfirstlastbookeddate = firstlastbookeddate /// 
	(last) lastlastfirstbookeddate = lastfirstbookeddate (first) firstlastfirstbookeddate = lastfirstbookeddate ///
	(last) lastfirstfirstbookeddate = firstfirstbookeddate (first) firstfirstfirstbookeddate = firstfirstbookeddate ///
	, by ( propertyid date status )

collapse (first) firststatus = status (last) laststatus = status ///
	(last) lastlastprice  = lastprice (first) firstlastprice = lastprice ///
	(last) lastfirstprice  = firstprice (first) firstfirstprice = firstprice ///
	(last) lastlastlastreservationid = lastlastreservationid (first) firstlastlastreservationid = lastlastreservationid ///
	(last) lastfirstlastreservationid = firstlastreservationid (first) firstfirstlastreservationid = firstlastreservationid ///
	(last) lastlastfirstreservationid = lastfirstreservationid (first) firstlastfirstreservationid = lastfirstreservationid ///
	(last) lastfirstfirstreservationid = firstfirstreservationid (first) firstfirstfirstreservationid = firstfirstreservationid ///
	(last) lastlastlastlastbookeddate = lastlastlastbookeddate (first) firstlastlastlastbookeddate = lastlastlastbookeddate /// 
	(last) lastfirstlastlastbookeddate = firstlastlastbookeddate (first) firstfirstlastlastbookeddate = firstlastlastbookeddate /// 
	(last) lastlastfirstlastbookeddate = lastfirstlastbookeddate (first) firstlastfirstlastbookeddate = lastfirstlastbookeddate /// 
	(last) lastfirstfirstlastbookeddate = firstfirstlastbookeddate (first) firstfirstfirstlastbookeddate = firstfirstlastbookeddate /// 
	(last) lastlastlastfirstbookeddate = lastlastfirstbookeddate (first) firstlastlastfirstbookeddate = lastlastfirstbookeddate ///
	(last) lastfirstlastfirstbookeddate = firstlastfirstbookeddate (first) firstfirstlastfirstbookeddate = firstlastfirstbookeddate ///
	(last) lastlastfirstfirstbookeddate = lastfirstfirstbookeddate (first) firstlastfirstfirstbookeddate = lastfirstfirstbookeddate ///
	(last) lastfirstfirstfirstbookeddate = firstfirstfirstbookeddate (first) firstfirstfirstfirstbookeddate = firstfirstfirstbookeddate ///
	, by ( propertyid date )
********************************************************************************	
	
	
/*** Checks for inconsistancy 
bys propertyid date: gen check_multientry1 = _N
bys propertyid date status: gen check_multientry2 = _N
bys propertyid date status price : gen check_multientry3 = _N
bys propertyid date status price reservationid: gen check_multientry4 = _N
bys propertyid date status price reservationid bookeddate: gen check_multientry5 = _N
tab1 check_multientry1 check_multientry2 check_multientry3 check_multientry4 check_multientry5
