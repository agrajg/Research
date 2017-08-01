clear all 
set more off
use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_market_data_clean1.dta", clear
*** This file so far has been cleaned to a point where there are no dulpicates wrt
*** all the variables. However duplicates exist wrt propertyid and date
*** I begin assigning alternate status. which distinguishes final matched to intermediate match
*** Available status

sort propertyid date status
gen altstatus = ""

*** Observations with status A but but have reservation ID
replace altstatus = "Available" if status=="A"
replace altstatus = "Booked, but later cancelled by guest" if status=="A" & reservationid !=.
*** Observations with status B but but have reservation ID
replace altstatus = "Blocked" if status=="B" 
replace altstatus = "Booked, but later cancelled by host" if status=="B" & reservationid !=.





********************************************************************************
*** Reserved bookings without reservation date
*** If the id is same the boooked date should be same. So if repeated observation
*** then should take min of the booked dates. Same applies if booked date is 
*** missing but has same reservation id
bys propertyid status reservationid: egen bookeddate2 = min(bookeddate) 
duplicates drop propertyid date status price bookeddate2 reservationid, force


********************************************************************************
*** At level - propertyid date status price 
*** There are entries with 2 A status with booking id - means cancelled
/*
	order propertyid date status price reservationid bookeddate 
	sort propertyid date status price reservationid bookeddate
	gen badobservation = 0
	bys propertyid date status price datasetnum: replace badobservation = 1 if /// 
		status == status[_n+1] & 
		status =="A" &
		
*/




*** Checks for inconsistancy 
bys propertyid date: gen check_multientry1 = _N
bys propertyid date status: gen check_multientry2 = _N
bys propertyid date status price : gen check_multientry3 = _N
bys propertyid date status price reservationid: gen check_multientry4 = _N
bys propertyid date status price reservationid bookeddate: gen check_multientry5 = _N
tab1 check_multientry1 check_multientry2 check_multientry3 check_multientry4 check_multientry5
