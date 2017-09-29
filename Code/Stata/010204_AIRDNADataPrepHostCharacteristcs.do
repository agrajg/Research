*** This do file is to generate host characteristics.
*** Host characteristics are not constant over time because as many host characteristics
*** grows with time like age, experience.
*** The time invariant characteristics are mostly unobserved.

clear all 
set more off


* We use data with all stasus because these are sufficient to create all characteristic 
* that we need
use "Y:\agrajg\Research\Data\temp\010202_MarketDataAllIDsBrokenByHid71501to71600MergedAttTimeInv.dta" , clear
sort hid tid pid

* Multihost
* How many listings does a host have on a particular day.
gen tempvar1 = (pid != .)
by hid tid : egen hnumlist = sum(tempvar1)
label var  hnumlist "Host's listing count on a day (Active and Inactive)"
*** This variable captures all the listings a host has had untill that day. 
*** because we are not removing listing that have been blocked or inact
*** Not all of them will be act

* Activity 
* Number of act listings hosted by a host on a particular day
gen tempvar2 = (sdum2 == 0)
by hid tid: egen hnumlistact = sum(tempvar2)
label var hnumlistact "Host's listing count on a day (Active)"

* Type 
* number of listing are Entire home and then private room
gen tempvar3 = (zltypedum1==1)
by hid tid: egen hnumlistenthome = sum(tempvar3)
label var hnumlistenthome "Host's listing count on a day (Entire Home)"

gen tempvar4 = (zltypedum3==1)
by hid tid: egen hnumlistpriroom = sum(tempvar4)
label var hnumlistpriroom "Host's listing count on a day (Private Room)"

* Active Type
gen tempvar23 = tempvar2*tempvar3
gen tempvar24 = tempvar2*tempvar4
by hid tid : egen hnumlistactenthome = sum(tempvar23)
label var hnumlistactenthome "Host's listing count on a day (Active Entire Home)"

by hid tid : egen hnumlistactpriroom = sum(tempvar24)
label var hnumlistactpriroom "Host's listing count on a day (Active Private Room)"

/*Age related variables
gen tempvar5 = date - createddate
by hid tid: egen hage = max(tempvar5)
label var hage "Host's age / Age of oldest listing"
by hid tid: egen hagecombined = sum(tempvar5)
label var hagecombined "Host's combined age"
gen havgage = hagecombined/hnumlist
label var havgage "Host's average age"
* Age of active listings 
gen tempvar6 = (date - createddate)*tempvar2
by hid tid: egen hageact = max(tempvar6)
label var hage "Host's age(act) / Age of oldest act listing"
by hid tid: egen hagecombinedact = sum(tempvar6)
label var hagecombinedact "Host's combined act age"
gen havgageact = hagecombinedact/hnumlistact
label var havgageact "Host's active average age"
*/

* Host's history
* Activity in the past starting from the data beginning
* Assuming that before that it was all 
* Total act 
sort hid pid tid

by hid pid: gen hnumlistpast = hnumlist if _n==1
by hid pid: replace hnumlistpast = hnumlistpast[_n-1] + hnumlist if _n>1
replace hnumlistpast = hnumlistpast - hnumlist
label var  hnumlistpast "Host's listing count in the past (Active and Inactive)"

by hid pid: gen hnumlistactpast = hnumlistact if _n==1
by hid pid: replace hnumlistactpast = hnumlistactpast[_n-1] + hnumlistact if _n>1
replace hnumlistactpast = hnumlistactpast - hnumlistact
label var  hnumlistactpast "Host's listing count in the past (Active and Inactive)"

by hid pid: gen hnumlistenthomepast = hnumlistenthome if _n==1
by hid pid: replace hnumlistenthomepast = hnumlistenthomepast[_n-1] + hnumlistenthome if _n>1
replace hnumlistenthomepast = hnumlistenthomepast - hnumlistenthome
label var  hnumlistenthomepast "Host's listing count in the past (Active and Inactive)"


by hid pid: gen hnumlistpriroompast = hnumlistpriroom if _n==1
by hid pid: replace hnumlistpriroompast = hnumlistpriroompast[_n-1] + hnumlistpriroom if _n>1
replace hnumlistpriroompast = hnumlistpriroompast - hnumlistpriroom
label var  hnumlistpriroompast "Host's listing count in the past (Active and Inactive)"


by hid pid: gen hnumlistactenthomepast = hnumlistactenthome if _n==1
by hid pid: replace hnumlistactenthomepast = hnumlistactenthomepast[_n-1] + hnumlistactenthome if _n>1
replace hnumlistactenthomepast = hnumlistactenthomepast - hnumlistactenthome
label var  hnumlistactenthomepast "Host's listing count in the past (Active and Inactive)"


sort hid pid tid
by hid pid: gen hnumlistactpriroompast = hnumlistactpriroom if _n==1
by hid pid: replace hnumlistactpriroompast = hnumlistactpriroompast[_n-1] + hnumlistactpriroom if _n>1
replace hnumlistactpriroompast = hnumlistactpriroompast - hnumlistactpriroom
label var  hnumlistactpriroompast "Host's listing count in the past (Active and Inactive)"




