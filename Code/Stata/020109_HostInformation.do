clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDsBlockedDropped.dta" , clear
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010213_L_listingtype.dta"
drop if _merge ==2
drop _merge
*preserve
gen booking=sdum3
gen revenue=booking*price 
merge m:1 hostid using "Y:\agrajg\Research\Data\temp\010209_H_HostType3Active.dta"
keep if _merge==3
drop _merge

collapse (count) activity= propertyid (sum)bookings = booking (sum) revenue = revenue  , by (L_listingtype H_HostType3Active  )
decode L_listingtype, gen (listingtype)
decode H_HostType3Active, gen (HostType3Active)
drop if listingtype =="NR"
format %12.0g activity
format %12.0g bookings
format %12.0g  revenue
order HostType3Active listingtype
sort HostType3Active listingtype
 
label var listingtype "Listing type"
label var HostType3Active "Host type"
label var activity "Activity(listings times days)"
label var bookings "Bookings"
label var revenue "Revenue"

texsave using "T:\agrajg\Output\020109_HostGroupAvtivityBookingsRevenue.tex" , ///
	title(Hosts choice of listing type) ///
	size(3) ///
	width(\textwidth) ///
	align(CCCCC) ///
	location(p) ///
	marker(020109_HostGroupAvtivityBookingsRevenue) ///
	autonumber ///
	footnote("Note: ", size(2)) ///
	varlabels ///
	replace ///
	headlines("\begin{center}") ///
	footlines("\end{center}") ///
	frag ///
	hlines(3 6 9 12 15) ///
	rowsep(0pt)
	
texsave using "Y:\agrajg\Research\Output\020109_HostGroupAvtivityBookingsRevenue.tex" , ///
	title(Hosts choice of listing type) ///
	size(3) ///
	width(\textwidth) ///
	align(CCCCC) ///
	location(p) ///
	marker(020109_HostGroupAvtivityBookingsRevenue) ///
	autonumber ///
	footnote("Note: ", size(2)) ///
	varlabels ///
	replace ///
	headlines("\begin{center}") ///
	footlines("\end{center}") ///
	frag ///
	hlines(3 6 9 12 15) ///
	rowsep(0pt)

*===============================================================================
clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDsBlockedDropped.dta" , clear
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010213_L_listingtype.dta"
drop if _merge ==2
drop _merge
*preserve
gen booking=sdum3
gen revenue=booking*price 
merge m:1 hostid using "Y:\agrajg\Research\Data\temp\010209_H_HostType3Active.dta"
keep if _merge==3
drop _merge
collapse (count) ActiveDays = date (sum) BookedDays=sdum3 (sum) Revenue = revenue  ,by(propertyid hostid L_listingtype H_HostType3Active)
format %9.0g ActiveDays	
	
collapse (mean)meanActiveDays=ActiveDays  /// 
	(sd)sdActiveDays=ActiveDays /// 
	(mean)meanBookedDays=BookedDays ///
	(sd)sdBookedDays=BookedDays ///
	(mean)meanRevenue=Revenue ///
	(sd)sdRevenue=Revenue ///
	, by(L_listingtype H_HostType3Active)

decode L_listingtype, gen (listingtype)
decode H_HostType3Active, gen (HostType3Active)
drop if listingtype =="NR"
drop L_listingtype H_HostType3Active
foreach var in meanActiveDays sdActiveDays meanBookedDays sdBookedDays meanRevenue sdRevenue {
replace `var' = round(`var', 0.01)
}
order HostType3Active listingtype
sort HostType3Active listingtype 

label var listingtype "Listing type"
label var HostType3Active "Host type"
label var meanActiveDays "(mean)Activity(listings times days)"
label var meanBookedDays "(mean)Bookings"
label var meanRevenue "(mean)Revenue"
label var sdActiveDays  "(sd)Activity(listings times days)"
label var sdBookedDays  "(sd)Bookings"
label var sdRevenue "(sd)Revenue"

texsave using "T:\agrajg\Output\020109_HostGroupMeanSDAvtivityBookingsRevenue.tex" , ///
	title(Hosts choice of listing type) ///
	size(3) ///
	width(\textwidth) ///
	align(CCCCC) ///
	location(p) ///
	marker(020109_HostGroupMeanSDAvtivityBookingsRevenue) ///
	autonumber ///
	footnote("Note: ", size(2)) ///
	varlabels ///
	replace ///
	headlines("\begin{center}") ///
	footlines("\end{center}") ///
	frag ///
	hlines(3 6 9 12 15) ///
	rowsep(0pt)
	
texsave using "Y:\agrajg\Research\Output\020109_HostGroupMeanSDAvtivityBookingsRevenue.tex" , ///
	title(Hosts choice of listing type) ///
	size(3) ///
	width(\textwidth) ///
	align(CCCCC) ///
	location(p) ///
	marker(020109_HostGroupMeanSDAvtivityBookingsRevenue) ///
	autonumber ///
	footnote("Note: ", size(2)) ///
	varlabels ///
	replace ///
	headlines("\begin{center}") ///
	footlines("\end{center}") ///
	frag ///
	hlines(3 6 9 12 15) ///
	rowsep(0pt)
	
tab L_listingtype, gen (ltype)
forvalues i = 1(1)4 {
gen booking`i' = sdum3*ltype`i'
gen revenue`i'= booking`i'*price
}
collapse (count) countpropertyiddate = propertyid /// 
	(sum) sumsupplyltype1= ltype1 ///
	(sum) sumbookingltype1= booking1 /// 
	(sum) sumrevenueltype1= revenue1 ///
	(sum) sumsupplyltype3= ltype3 ///
	(sum) sumbookingltype3= booking3 /// 
	(sum) sumrevenueltype3= revenue3 ///
	(sum) sumsupplyltype4= ltype4 ///
	(sum) sumbookingltype4= booking4 /// 
	(sum) sumrevenueltype4= revenue4 ///
	, by (hostid)

	
merge m:1 hostid using "Y:\agrajg\Research\Data\temp\010209_H_HostType3Active.dta"
keep if _merge==3
drop _merge
order H_HostType3Active hostid
save "Y:\agrajg\Research\Output\020109_SupplyBookingRevenuebyHost.dta", replace
collapse (sum) countpropertyid (mean) meansumsupplyltype1=sumsupplyltype1 meansumbookingltype1=sumbookingltype1 meansumrevenueltype1=sumrevenueltype1 meansumsupplyltype3=sumsupplyltype3 meansumbookingltype3=sumbookingltype3 meansumrevenueltype3=sumrevenueltype3 meansumsupplyltype4=sumsupplyltype4 meansumbookingltype4=sumbookingltype4 meansumrevenueltype4=sumrevenueltype4 (sd) sdsumsupplyltype1=sumsupplyltype1 sdsumbookingltype1=sumbookingltype1 sdsumrevenueltype1=sumrevenueltype1  sdsumsupplyltype3=sumsupplyltype3 sdsumbookingltype3=sumbookingltype3 sdsumrevenueltype3=sumrevenueltype3 sdsumsupplyltype4=sumsupplyltype4 sdsumbookingltype4=sumbookingltype4 sdsumrevenueltype4=sumrevenueltype4, by(H_HostType3Active )
reshape long mean sd, i( H_HostType3Active countpropertyid ) j(var) s
format %12.0g countpropertyiddate




collapse (count)countpropertyid=propertyid (sum) sumsdum3 =sdum3 (mean) meansdum3 =sdum3 (sd) sdsdum3 =sdum3  (mean) meanprice =price (sd) sdprice =price (mean) meanrevenue =revenue (sd) sdrevenue =revenue (sum)sumrevenueltype = revenue , by (L_listingtype hostid date )
merge m:1 hostid using "Y:\agrajg\Research\Data\temp\010209_H_HostType3Active.dta"
keep if _merge==3
drop _merge
count
drop if L_listingtype == 2
gen meansdum3plussd = meansdum3+sdsdum3
gen meansdum3minussd = meansdum3-sdsdum3
gen meanpriceplussd = meanprice+sdprice
gen meanpriceminussd = meanprice-sdprice
gen meanrevenueplussd = meanrevenue+sdrevenue
gen meanrevenueminussd = meanrevenue-sdrevenue
save "Y:\agrajg\Research\Output\020109_SupplyBookingRevenuebyLTypeHtype3.dta", replace
*restore

collapse (sum) sumcountpropertyid= countpropertyid (sum) sumsdum3 (sum) sumrevenueltype , by ( L_listingtype H_HostType3Active )
format %12.0g sumcountpropertyid
format %12.0g sumsdum3
format %12.0g sumrevenueltype

use  "Y:\agrajg\Research\Output\020109_SupplyBookingRevenuebyLTypeHtype3.dta", clear
collapse (mean)meancountpropertyid=countpropertyid  (sd)sdcountpropertyid=countpropertyid (mean) meansumsdum3=sumsdum3 (sd) sdsumsdum3=sumsdum3 (mean)meansumrevenueltype=sumrevenueltype (sd) sdsumrevenueltype=sumrevenueltype , by ( L_listingtype H_HostType3Active )
