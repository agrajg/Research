use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDs.dta", clear
keep if hid >13000 & hid <=15000
keep hostid propertyid date reservationid bookeddate sdum*
sort hostid propertyid date reservationid bookeddate
order hostid propertyid date reservationid bookeddate
preserve


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
by hostid date : replace   HostASCount = sum(PropASCount)
by hostid date : replace   HostBSCount = sum(PropBSCount)
by hostid date : replace   HostRSCount = sum(PropRSCount)
label var HostASCount "(Count)Past Available days of Host"
label var HostBSCount "(Count)Past Blocked days of Host"
label var HostRSCount "(Count)Past Reserved days of Host"



 
* Age and combined age 




