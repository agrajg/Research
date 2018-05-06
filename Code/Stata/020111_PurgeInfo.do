set more off
clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDsBlockedDropped.dta" , clear
********************************************************************************
********************** REGULATIONS VARIABLES ***********************************
********************************************************************************
gen RegPurgeDum = (date>=td(01oct2015))
label var RegPurgeDum "Dummy = 1 after purge"
gen RegDataDiscDum = (date>=td(01dec2015))
label var RegDataDiscDum "Dummy = 1 after data disclosure"
gen RegActRegImpDum = (date>=td(01nov2016))
label var RegActRegImpDum "Dummy = 1 after actual regualtion"
********************************************************************************


preserve
gen group = "A" if (date==td(30sep2015))
replace group = "B" if (date>td(30sep2015) & date <td(01dec2015))
drop if group ==""
contract propertyid hostid group
by propertyid :gen x= _N
replace x= x-1 if x!=2 & group == "B"
tab x
keep if x==1

merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010213_L_listingtype.dta"
drop if _merge ==2
drop _merge

merge m:1 hostid using "Y:\agrajg\Research\Data\temp\010209_H_HostType3Active.dta"
keep if _merge==3
drop _merge

tab L_listingtype
tab H_HostType3Active
tab L_listingtype H_HostType3Active
gen L_PurgedListingDummy = 1
keep propertyid L_PurgedListingDummy

save "Y:\agrajg\Research\Data\temp\020111_L_PurgedListingDummy.dta",replace
restore
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\020111_L_PurgedListingDummy.dta"

replace L_PurgedListingDummy=0 if L_PurgedListingDummy!=1


merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010213_L_listingtype.dta"
drop if _merge ==2
drop _merge

merge m:1 hostid using "Y:\agrajg\Research\Data\temp\010209_H_HostType3Active.dta"
keep if _merge==3
drop _merge

collapse (count) ActiveDays = price (sum)BookedDays = sdum3 (sum) Revenue= revenue , by (propertyid hostid L_listingtype H_HostType3Active L_PurgedListingDummy RegPurgeDum )

collapse (mean) ActiveDays (mean)BookedDays (mean) Revenue, by (L_listingtype H_HostType3Active L_PurgedListingDummy RegPurgeDum)
