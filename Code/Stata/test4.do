clear all
set more off
use "Y:\agrajg\Research\Data\FinalData\AIRDNACleanedMergedDataForRegressionBlockedDropped.dta" , clear
keep if state ==8
sort hostid date propertyid
by hostid : egen OldestProp = min (createddate )
by hostid : egen NewestProp = max (createddate )

gen tempvar1 = (status=="R" | status== "A")
by hostid date : egen NumListPerHost = sum(tempvar1)

gen tempvar2 = (listingtype==1) & (status=="R" | status== "A")
by hostid date : egen NumEntHomePerHost = sum(tempvar2)

contract propertyid hostid date OldestProp NewestProp NumListPerHost NumEntHomePerHost
format %td OldestProp
format %td NewestProp
sort hostid
by hostid : egen MinListPerHost = min( NumListPerHost )
by hostid : egen MaxListPerHost = max( NumListPerHost )

by hostid : egen MinEntHomePerHost = min( NumEntHomePerHost )
by hostid : egen MaxEntHomePerHost = max( NumEntHomePerHost )


gen HostType1 = "Always Single Listing Host" if MaxListPerHost ==1
replace HostType1 = "Others" if MaxListPerHost > 1

gen HostType2 = "Max One listing Host" if MaxListPerHost ==1
replace HostType2 = "Max two listings Host" if MaxListPerHost == 2
replace HostType2 = "Max more than 2 listings Host" if MaxListPerHost > 2
replace HostType2 = "Others" if HostType2 == ""

gen Hosttype3 = "Min 2 or more listings Host" if MinListPerHost >= 2  
replace Hosttype3 = "Min 4 or more listings Host" if MinListPerHost >= 4
replace Hosttype3 = "Others" if Hosttype3 ==""


***
gen HostType1E = "Always Private/Shared Room Host" if MaxEntHomePerHost == 0
replace HostType1E = "Max 1 Entire Home Host" if  MaxEntHomePerHost ==1
replace HostType1E = "Others" if  MaxEntHomePerHost > 1

gen  HostType2E = "Always Private/Shared Room Host" if  MaxEntHomePerHost ==0
replace HostType2E = "Max 1 Entire Home Host" if  MaxEntHomePerHost ==1
replace HostType2E = "Max 2 Entire Home Host" if  MaxEntHomePerHost == 2
replace HostType2E = "Max more than 2 Entire Home Host" if  MaxEntHomePerHost > 2
replace HostType2E = "Others" if HostType2 == ""

gen Hosttype3E = "Min 2 Entire Home Host" if MinEntHomePerHost >= 2  
replace Hosttype3E = "Min 4 Entire Home Host" if MinEntHomePerHost >= 4
replace Hosttype3E = "Others" if Hosttype3 ==""


capture drop _freq
contract propertyid hostid OldestProp NewestProp MinListPerHost MaxListPerHost MinEntHomePerHost MaxEntHomePerHost HostType1 HostType2 Hosttype3 HostType1E HostType2E Hosttype3E
save "Y:\agrajg\Research\Data\temp\test4_hostCharacteristics.dta", replace
