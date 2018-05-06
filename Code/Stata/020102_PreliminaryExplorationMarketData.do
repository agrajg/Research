set more off
clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDsBlockedDropped.dta" , clear
// sort propertyid date
// by propertyid : egen p75_price = pctile(price) , p(75)
// gen permaxdiff75 = (price- p75_price)/ p75_price
// drop if permaxdiff75 > 50
// drop permaxdiff75 p75_price



// *** Section - Newyork City Market
// preserve
// drop if date > td(01jan2015)
// collapse (count) date, by (propertyid hostid )
// format %9.0g date
// collapse (count) propertyid ,by(hostid)
// collapse (count)hostid (sum)propertyid
// restore
// preserve
// drop if date > td(01jan2016)
// collapse (count) date, by (propertyid hostid )
// format %9.0g date
// collapse (count) propertyid ,by(hostid)
// collapse (count)hostid (sum)propertyid
// restore
// preserve
// drop if date > td(01jan2017)
// collapse (count) date, by (propertyid hostid )
// format %9.0g date
// collapse (count) propertyid ,by(hostid)
// collapse (count)hostid (sum)propertyid
// restore
********************************************************************************
*-------------------------------------------------------------------------------
preserve
collapse (count) propertyid (sum)sdum3, by(hostid date)
collapse (sum) propertyid (count) hostid (sum)sdum3, by (date)
gen year = year(date)
gen month = month(date)

* Graph of listings hosts and reservations with time
twoway (line propertyid date, sort) (line hostid date, sort) (line sdum3 date, sort lwidth(medthick) lpattern(longdash_dot)), ytitle(Count) ylabel(#9, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) legend(order(1 "Listings" 2 "Hosts" 3 "Reservations")) scheme(tufte) scale(0.8)
graph save Graph "Y:\agrajg\Research\Output\020102_ListingsHostsReservationsByDate.gph", replace
graph export "Y:\agrajg\Research\Output\020102_ListingsHostsReservationsByDate.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_ListingsHostsReservationsByDate.png" , width(2100) height(1500) replace

gen hostperlisting = hostid / propertyid
gen resperlisting = sdum3 /propertyid
twoway (scatter resperlisting hostperlisting if year==2014, sort) (scatter resperlisting hostperlisting if year==2015, sort) (scatter resperlisting hostperlisting if year==2016, sort) (scatter resperlisting hostperlisting if year==2017, sort), legend(order(1 "2014" 2 "2015" 3 "2016" 4 "2017")) scheme(tufte) scale(0.5) by(month, iscale(*0.8))


collapse 	(mean)mean_propertyid = propertyid ///
			(sd) sd_propertyid= propertyid 	///
			(mean)mean_hostid= hostid ///
			(sd)sd_hostid= hostid /// 
			(mean)mean_sdum3= sdum3 ///
			(sd)sd_sdum3= sdum3 /// 
			, by (year month)
			
generate MonthYear = ym(year, month)
format %tmMon_CCYY MonthYear
tostring MonthYear, replace force format(%tmMon_CCYY)
label var year "Year"
label var month "Month"
label var MonthYear "Month Year"
label var mean_propertyid "Mean listings"
label var sd_propertyid "SD listings"
label var mean_hostid "Mean hosts"
label var sd_hostid "SD hosts"
label var mean_sdum3 "Mean reservations"
label var sd_sdum3 "SD reservations"

keep MonthYear mean_propertyid sd_propertyid mean_hostid sd_hostid mean_sdum3 sd_sdum3
order MonthYear mean_propertyid sd_propertyid mean_hostid sd_hostid mean_sdum3 sd_sdum3
texsave using "T:\agrajg\Output\020102_HostListingReservationsMeanSdByYear.tex" , ///
	title(Number of NYC hosts, listings and reservations) ///
	size(3) ///
	width(\textwidth) ///
	align(XXCCCCCC) ///
	location(p) ///
	marker(020102_HostListingReservationsMeanSdByYear) ///
	autonumber ///
	footnote("Note: Year 2014 and 2017 figures are computed from last 5 months and first 3 months respectively of that year", size(2)) ///
	varlabels ///
	replace ///
	headlines("\begin{center}") ///
	footlines("\end{center}") ///
	frag ///
	hlines(5 17 29) ///
	rowsep(0pt)
	
texsave using "Y:\agrajg\Research\Output\020102_HostListingReservationsMeanSdByYear.tex" , ///
	title(Number of NYC hosts, listings and reservations) ///
	size(3) ///
	width(\textwidth) ///
	align(XXCCCCCC) ///
	location(p) ///
	marker(020102_HostListingReservationsMeanSdByYear) ///
	autonumber ///
	footnote("Note: Year 2014 and 2017 figures are computed from last 5 months and first 3 months respectively of that year", size(2)) ///
	varlabels ///
	replace ///
	headlines("\begin{center}") ///
	footlines("\end{center}") ///
	frag ///
	hlines(5 17 29) ///
	rowsep(0pt)
restore
*-------------------------------------------------------------------------------
preserve
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010213_L_listingtype.dta"
drop if _merge ==2
drop _merge
tab L_listingtype , gen (ltype)
keep propertyid hostid date sdum3 ltype*
gen booked1= sdum3 *ltype1
gen booked2= sdum3 *ltype2
gen booked3= sdum3 *ltype3
gen booked4= sdum3 *ltype4
collapse (count) propertyid (sum) ltype1 ltype2 ltype3 ltype4 booked1 booked2 booked3 booked4 , by (date)
gen frac1 = booked1 /ltype1
gen frac2 = booked2 /ltype2
gen frac3 = booked3 /ltype3
gen frac4 = booked4 /ltype4
twoway (line ltype1 date, sort) (line ltype3 date, sort) (line ltype4 date,  sort lwidth(medthick) lpattern(longdash_dot)), ytitle(Count) ylabel(#9, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) legend(order(1 "Entire home and apartment" 2 "Private room" 3 "Shared room")) scheme(tufte) scale(0.8)
graph save Graph "Y:\agrajg\Research\Output\020102_ListingtypeCountByDate.gph", replace
graph export "Y:\agrajg\Research\Output\020102_ListingtypeCountByDate.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_ListingtypeCountByDate.png" , width(2100) height(1500) replace
restore
*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDsBlockedDropped.dta" , clear
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010213_L_listingtype.dta"
drop if _merge ==2
drop _merge
preserve
collapse (count)count_price = price  (mean)mean_price = price  (sd)sd_price = price  (min)min_price = price (p1) p1_price = price (p5) p5_price = price (p10) p10_price = price (p25) p25_price = price (p40) p40_price = price (p50) p50_price = price (p60) p60_price = price (p75) p75_price = price (p90) p90_price = price (p95) p95_price = price (p99) p99_price = price  (max)max_price = price  , by (date)
serrbar mean_price sd_price date, recast(rline) lwidth(vvvthin) mvopts(recast(line)) ytitle(Mean Price) ylabel(#10, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) xmtick(##2) legend(off) scheme(tufte) scale(1)
graph save Graph "Y:\agrajg\Research\Output\020102_MeanPriceTimeAllsupplied.gph", replace
graph export "Y:\agrajg\Research\Output\020102_MeanPriceTimeAllsupplied.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_MeanPriceTimeAllsupplied.png" , width(2100) height(1500) replace
restore
preserve
collapse (count)count_price = price  (mean)mean_price = price  (sd)sd_price = price  (min)min_price = price (p1) p1_price = price (p5) p5_price = price (p10) p10_price = price (p25) p25_price = price (p40) p40_price = price (p50) p50_price = price (p60) p60_price = price (p75) p75_price = price (p90) p90_price = price (p95) p95_price = price (p99) p99_price = price  (max)max_price = price  , by (date status)
serrbar mean_price sd_price date if status =="A", recast(rline) lwidth(vvvthin) mvopts(recast(line)) ytitle(Mean Price) ylabel(#10, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) xmtick(##2) legend(off) scheme(tufte) scale(1)
graph save Graph "Y:\agrajg\Research\Output\020102_MeanPriceTimeAvailable.gph", replace
graph export "Y:\agrajg\Research\Output\020102_MeanPriceTimeAvailable.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_MeanPriceTimeAvailable.png" , width(2100) height(1500) replace
serrbar mean_price sd_price date if status =="R", recast(rline) lwidth(vvvthin) mvopts(recast(line)) ytitle(Mean Price) ylabel(#10, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) xmtick(##2) legend(off) scheme(tufte) scale(1)
graph save Graph "Y:\agrajg\Research\Output\020102_MeanPriceTimeBooked.gph", replace
graph export "Y:\agrajg\Research\Output\020102_MeanPriceTimeBooked.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_MeanPriceTimeBooked.png" , width(2100) height(1500) replace
restore
preserve
collapse (count)count_price = price  (mean)mean_price = price  (sd)sd_price = price  (min)min_price = price (p1) p1_price = price (p5) p5_price = price (p10) p10_price = price (p25) p25_price = price (p40) p40_price = price (p50) p50_price = price (p60) p60_price = price (p75) p75_price = price (p90) p90_price = price (p95) p95_price = price (p99) p99_price = price  (max)max_price = price  , by (date L_listingtype)
serrbar mean_price sd_price date if L_listingtype==1, recast(rline) lwidth(vvvthin) mvopts(recast(line)) ytitle(Mean Price) ylabel(#10, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) xmtick(##2) legend(off) scheme(tufte) scale(1)
graph save Graph "Y:\agrajg\Research\Output\020102_MeanPriceTimeAllEH.gph", replace
graph export "Y:\agrajg\Research\Output\020102_MeanPriceTimeAllEH.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_MeanPriceTimeAllEH.png" , width(2100) height(1500) replace
serrbar mean_price sd_price date if L_listingtype==3, recast(rline) lwidth(vvvthin) mvopts(recast(line)) ytitle(Mean Price) ylabel(#10, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) xmtick(##2) legend(off) scheme(tufte) scale(1)
graph save Graph "Y:\agrajg\Research\Output\020102_MeanPriceTimeAllPR.gph", replace
graph export "Y:\agrajg\Research\Output\020102_MeanPriceTimeAllPR.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_MeanPriceTimeAllPR.png" , width(2100) height(1500) replace
serrbar mean_price sd_price date if L_listingtype==4, recast(rline) lwidth(vvvthin) mvopts(recast(line)) ytitle(Mean Price) ylabel(#10, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) xmtick(##2) legend(off) scheme(tufte) scale(1)
graph save Graph "Y:\agrajg\Research\Output\020102_MeanPriceTimeAllSR.gph", replace
graph export "Y:\agrajg\Research\Output\020102_MeanPriceTimeAllSR.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_MeanPriceTimeAllSR.png" , width(2100) height(1500) replace
restore
preserve
collapse (count)count_price = price  (mean)mean_price = price  (sd)sd_price = price  (min)min_price = price (p1) p1_price = price (p5) p5_price = price (p10) p10_price = price (p25) p25_price = price (p40) p40_price = price (p50) p50_price = price (p60) p60_price = price (p75) p75_price = price (p90) p90_price = price (p95) p95_price = price (p99) p99_price = price  (max)max_price = price  , by (date status L_listingtype)
ce (p90) p90_price = price (p95) p95_price = price (p99) p99_price = price  (max)max_price = price  , by (date L_listingtype)
serrbar mean_price sd_price date if status =="A" & L_listingtype==1, recast(rline) lwidth(vvvthin) mvopts(recast(line)) ytitle(Mean Price) ylabel(#10, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) xmtick(##2) legend(off) scheme(tufte) scale(1)
graph save Graph "Y:\agrajg\Research\Output\020102_MeanPriceTimeAvailableEH.gph", replace
graph export "Y:\agrajg\Research\Output\020102_MeanPriceTimeAvailableEH.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_MeanPriceTimeAvailableEH.png" , width(2100) height(1500) replace
serrbar mean_price sd_price date if status =="A" & L_listingtype==3, recast(rline) lwidth(vvvthin) mvopts(recast(line)) ytitle(Mean Price) ylabel(#10, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) xmtick(##2) legend(off) scheme(tufte) scale(1)
graph save Graph "Y:\agrajg\Research\Output\020102_MeanPriceTimeAvailablePR.gph", replace
graph export "Y:\agrajg\Research\Output\020102_MeanPriceTimeAvailablePR.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_MeanPriceTimeAvailablePR.png" , width(2100) height(1500) replace
serrbar mean_price sd_price date if status =="A" & L_listingtype==4, recast(rline) lwidth(vvvthin) mvopts(recast(line)) ytitle(Mean Price) ylabel(#10, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) xmtick(##2) legend(off) scheme(tufte) scale(1)
graph save Graph "Y:\agrajg\Research\Output\020102_MeanPriceTimeAvailableSR.gph", replace
graph export "Y:\agrajg\Research\Output\020102_MeanPriceTimeAvailableSR.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_MeanPriceTimeAvailableSR.png" , width(2100) height(1500) replace
serrbar mean_price sd_price date if status =="R" & L_listingtype==1, recast(rline) lwidth(vvvthin) mvopts(recast(line)) ytitle(Mean Price) ylabel(#10, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) xmtick(##2) legend(off) scheme(tufte) scale(1)
graph save Graph "Y:\agrajg\Research\Output\020102_MeanPriceTimeBookedEH.gph", replace
graph export "Y:\agrajg\Research\Output\020102_MeanPriceTimeBookedEH.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_MeanPriceTimeBookedEH.png" , width(2100) height(1500) replace
serrbar mean_price sd_price date if status =="R" & L_listingtype==3, recast(rline) lwidth(vvvthin) mvopts(recast(line)) ytitle(Mean Price) ylabel(#10, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) xmtick(##2) legend(off) scheme(tufte) scale(1)
graph save Graph "Y:\agrajg\Research\Output\020102_MeanPriceTimeBookedPR.gph", replace
graph export "Y:\agrajg\Research\Output\020102_MeanPriceTimeBookedPR.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_MeanPriceTimeBookedPR.png" , width(2100) height(1500) replace
serrbar mean_price sd_price date if status =="R" & L_listingtype==4, recast(rline) lwidth(vvvthin) mvopts(recast(line)) ytitle(Mean Price) ylabel(#10, angle(horizontal) grid) xtitle(Date) xline(20362 20423 20494 20748, lpattern(shortdash_dot)) xlabel(#18, angle(forty_five) grid) xmtick(##2) legend(off) scheme(tufte) scale(1)
graph save Graph "Y:\agrajg\Research\Output\020102_MeanPriceTimeBookedSR.gph", replace
graph export "Y:\agrajg\Research\Output\020102_MeanPriceTimeBookedSR.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_MeanPriceTimeBookedSR.png" , width(2100) height(1500) replace
restore

*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDsBlockedDropped.dta" , clear
merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010213_L_listingtype.dta"
drop if _merge ==2
drop _merge
// preserve
g revenue = price * sdum3
order revenue , after(price)
* counting the number of listing held by a host per day 
* This includes all listings active as well as in active
collapse (count)NListings = propertyid (sum) NBookedListings = sdum3 (sum) TotalRevenue= revenue, by (hostid date)
* Categorizing the host based on maximum and minimum number of listings held over the period of data
* Again it contain all the listings active and inactive
collapse (min) min_NListings = NListings (max) max_NListings =NListings (sum) NlistingSupplied = NListings (mean) mean_NListings = NListings (count) DaysActive = date   (sum) TotalBookings = NBookedListings (mean) meanBookings = NBookedListings (sum) TotalRevenue =TotalRevenue (mean) meanRevenue = TotalRevenue , by (hostid )
format %9.0g DaysActive
capture drop tempvar
gen 	tempvar = ""
// replace tempvar = "Group 1: Min1Max1Listing" 			if (min==1) 			& (max==1)
// replace tempvar = "Group 2: Min1Max23Listing"			if (min==1) 			& (max==2 | max==3)
// replace tempvar = "Group 3: MinGr2Max23Listing"			if (min>=2)  			& (max==2 | max==3)
// replace tempvar = "Group 4: Min1MaxGr4Listing"			if (min==1) 			& (max>=4)
// replace tempvar = "Group 5: Min2MaxGr4Listing" 			if (min>=2) 			& (max>=4)
replace tempvar = "Group 1" if (max_NListings==1)
replace tempvar = "Group 2" if (max_NListings==2 | max_NListings==3)
replace tempvar = "Group 3" if (max_NListings==4 | max_NListings==5)
replace tempvar = "Group 4" if (max_NListings>=6 & max_NListings<=10)
replace tempvar = "Group 5" if (max_NListings>10)
encode tempvar, generate(HostType)
collapse (count)NHosts = hostid (sum) TotalListingSupplied = NlistingSupplied (sum) TotalBookings = TotalBookings (sum) TotalRevenue = TotalRevenue  , by (HostType)
format %12.0g TotalBookings
format %12.0g TotalRevenue
format %12.0g TotalListingSupplied

foreach var in NHosts TotalListingSupplied TotalBookings TotalRevenue {
	egen Tot`var' = sum(`var')
	gen Per`var' = round((`var' * 100 / Tot`var'),0.1)
	order Tot`var' Per`var' , after (`var')
}
label var HostType "Host type"
label var PerNHosts "Number of hosts (%)"
label var PerTotalListingSupplied "Listings supplied (%)" 
label var PerTotalBookings "Booked listings (%)"
label var PerTotalRevenue "Total revenue (%)"
save "Y:\agrajg\Research\Output\020102_AggregateHostActivity.dta", replace

keep HostType Per*
texsave using "T:\agrajg\Output\020102_AggregateHostActivity.tex" , ///
	title(Hosts, rental supply and sales) ///
	size(3) ///
	width(\textwidth) ///
	align(XCCCCC) ///
	location(p) ///
	marker(020102_AggregateHostActivity) ///
	autonumber ///
	footnote("Note: These figures are computed for a period of 32 months from August 2014 to March 2017", size(2)) ///
	varlabels ///
	replace ///
	headlines("\begin{center}") ///
	footlines("\end{center}") ///
	frag ///
	rowsep(0pt)
	
texsave using "Y:\agrajg\Research\Output\020102_AggregateHostActivity.tex" , ///
	title(Hosts, rental supply and sales) ///
	size(3) ///
	width(\textwidth) ///
	align(XCCCCC) ///
	location(p) ///
	marker(020102_AggregateHostActivity) ///
	autonumber ///
	footnote("Note: These figures are computed for a period of 32 months from August 2014 to March 2017", size(2)) ///
	varlabels ///
	replace ///
	headlines("\begin{center}") ///
	footlines("\end{center}") ///
	frag ///
	rowsep(0pt)


/*===============================================================================
clear all
use "Y:\agrajg\Research\Data\temp\010208_MergedDataForPanelPriceQuantityRegressionBlockedDropped.dta", clear
preserve
collapse (count) pid ,by(date hid)
collapse (count) counthid = hid (sum) countpid = pid , by (date )

twoway (line counthid date, sort) (line countpid date, sort) ///
		, ylabel(#12) ///
		ymtick(##2, grid glpattern(dash)) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "Hosts" 2 "Properties" ) ///
			title(Number of: ) ///
			position(10) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.7)

graph save Graph "Y:\agrajg\Research\Output\020102_PropertiesHostbyDate.gph", replace
graph export "Y:\agrajg\Research\Output\020102_PropertiesHostbyDate.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_PropertiesHostbyDate.png" , width(2100) height(1500) replace



gen ratioPtoH = countpid/ counthid
twoway (line ratioPtoH date, sort) ///
		, ylabel(#12) ///
		ymtick(##2, grid glpattern(dash)) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "Properties to Hosts") ///
			title(Ratio) ///
			position(10) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.7)

graph save Graph "Y:\agrajg\Research\Output\020102_PropertiesHostRatiobyDate.gph", replace
graph export "Y:\agrajg\Research\Output\020102_PropertiesHostRatiobyDate.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_PropertiesHostRatiobyDate.png" , width(2100) height(1500) replace

restore
*/===============================================================================


clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonalsOnlyBooked.dta", clear
tsset propertyid date, daily
preserve
collapse (count) Days_booked= date , by (hostid propertyid reservationid bookeddate)
format %9.0g Days_booked
histogram Days_booked, discrete width(1) frequency addlabel addlabopts(mlabsize(vsmall) mlabangle(vertical) mlabgap(5)) ylabel(#11, angle(horizontal) grid) xtitle(Days booked per consumer) xlabel(#11, angle(horizontal) grid) scheme(tufte) scale(0.8)
graph save Graph "Y:\agrajg\Research\Output\020102_HistDaysPerBooking.gph", replace
graph export "Y:\agrajg\Research\Output\020102_HistDaysPerBooking.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_HistDaysPerBooking.png" , width(2100) height(1500) replace
restore

preserve
collapse (min) FirstStayDate= date  , by (hostid propertyid reservationid bookeddate)
gen DaysAdv = FirstStayDate - bookeddate
replace DaysAdv = 0 if DaysAdv <0
histogram DaysAdv, discrete width(7) frequency addlabel addlabopts(mlabsize(vsmall) mlabangle(vertical) mlabgap(5)) ylabel(#11, angle(horizontal) grid) xtitle(Days prior to stay) xlabel(#11, angle(horizontal) grid) scheme(tufte) scale(0.8)
graph save Graph "Y:\agrajg\Research\Output\020102_AdvBooking.gph", replace
graph export "Y:\agrajg\Research\Output\020102_AdvBooking.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_AdvBooking.png" , width(2100) height(1500) replace
restore

/*===============================================================================
preserve
collapse (count) countpid = pid ,by(date status)
replace countpid = 0 if countpid==.
reshape wide countpid  , i(date ) j(status ) s
gen countmktprop = countpidA  + countpidR
label var countmktprop "Number of active properties in market"
gen fracB = countpidR /countmktprop 
label var fracB "Fraction of active properties booked"
gen policychangedum = (date >=td(01oct2015))
merge 1:1 date using "Y:\agrajg\Research\Data\Seasonals\seasonals_01aug2014to31mar2017.dta" 
drop _merge



capture drop yeardum*
capture drop tid
capture drop t*
capture drop *_res
capture drop *_pred

*tab year, generate(yeardum)

*egen tid = group(date)
*orthpoly tid, generate(t*) degree(7)

global SEASONAL1 year i.moy i.dow i.holiday i.wom2 i.holidaywom2
*global SEASONAL1 t* i.dow i.holiday i.wom2 i.holidaywom2

* Deseasonalizing 
foreach var of varlist  count* frac*   {
gen y = `var'
*-------------------------------------------------------------------------------
reg y $SEASONAL1 if policychangedum ==0
predict yhat if policychangedum ==1
gen uhat = y-yhat
*-------------------------------------------------------------------------------
gen `var'_pred = yhat
gen `var'_res = uhat
drop y yhat uhat
}
*-------------------------------------------------------------------------------
twoway 	(line countmktprop date, sort lcolor(red) lwidth(medium) lpattern(solid)) ///
		(line countmktprop_pred date, sort lcolor(red) lwidth(thin) lpattern(dash)) ///
		(line countpidR date, sort lcolor(dknavy) lwidth(medium) lpattern(solid)) ///
		(line countpidR_pred date, sort lcolor(dknavy) lwidth(thin) lpattern(dash)) ///
		, ylabel(#12) ///
		ymtick(##2, grid glpattern(dash)) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "In Market(Actual)" 2 "In Market(Predicted)" 3 "Booked(Actual)" 4 "Booked(Predicted)") ///
			title(Number of properties) ///
			position(10) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.7)
		
graph save Graph "Y:\agrajg\Research\Output\020102_PropertiesbyDateStatus.gph", replace
graph export "Y:\agrajg\Research\Output\020102_PropertiesbyDateStatus.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_PropertiesbyDateStatus.png" , width(2100) height(1500) replace
*-------------------------------------------------------------------------------


twoway 	(line fracB date, sort lcolor(dknavy) lwidth(medium) lpattern(solid)) ///
		(line fracB_pred date, sort lcolor(dknavy) lwidth(thin) lpattern(dash)) ///
		, ylabel(#12) ///
		ymtick(##2, grid glpattern(dash)) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "Actual" 2 "Predicted") ///
			title(Fraction of properties booked) ///
			position(10) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.7)
restore
*===============================================================================
/*
foreach var of varlist  countpid* frac*    {
gen y = `var'
*-------------------------------------------------------------------------------
global SEASONAL i.year i.moy i.dow i.holiday i.wom2 i.holidaywom2
reg y $SEASONAL 
predict yhat 
gen uhat = y-yhat
*-------------------------------------------------------------------------------
gen `var'_res = uhat
drop y yhat uhat
}






*-------------------------------------------------------------------------------

preserve
collapse (count)tid , by(pid hid gid)
drop if gid ==.
count
twoway (histogram tid, discrete start(1) barwidth(1)), ytitle(Density) ylabel(#10, angle(horizontal) grid) xtitle(Days booked by consumers on Airbnb) xlabel(#12, angle(horizontal) grid) scheme(tufte) scale(0.7)
graph save Graph "Y:\agrajg\Research\Output\020102_DaysBookedHistogram.gph", replace
graph export "Y:\agrajg\Research\Output\020102_DaysBookedHistogram.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_DaysBookedHistogram.png" , width(2100) height(1500) replace
restore
*-------------------------------------------------------------------------------


preserve
collapse (count) countpid = pid, by (date listingtype)
encode listingtype ,gen(ltypecat)
drop listingtype
tab ltypecat
reshape wide countpid  , i(date ) j(ltypecat )
foreach var of varlist  countpid*    {
replace `var' = 0 if `var'==.
}
twoway (line countpid1 date, sort) (line countpid2 date, sort) (line countpid3 date, sort) (line countpid4 date, sort), legend(order(1 "Entire home/apt" 2 "NR" 3 "Private room" 4 "Shared room"))
restore
*/



merge 1:1 date using "Y:\agrajg\Research\Data\Seasonals\seasonals_01aug2014to31mar2017.dta" 
foreach var of varlist  countpid* ratio*    {
gen y = `var'
*-------------------------------------------------------------------------------
global SEASONAL i.year i.moy i.dow i.holiday i.wom2 i.holidaywom2
reg y $SEASONAL 
predict yhat 
gen uhat = y-yhat
*-------------------------------------------------------------------------------
gen `var'_res = uhat
drop y yhat uhat
}

twoway (line countpid1_res date, sort) (line countpid2_res date, sort) (line countpid3_res date, sort) (line countpid4_res date, sort), legend(order(1 "Entire home/apt" 2 "NR" 3 "Private room" 4 "Shared room"))



gen y = countmktprop
*-------------------------------------------------------------------------------
global SEASONAL i.year i.moy i.dow i.holiday i.wom2 i.holidaywom2
reg y $SEASONAL 
predict yhat 
gen uhat = y-yhat
*-------------------------------------------------------------------------------
gen countmktprop_res = uhat
drop y yhat uhat





gen y = countmktprop
global SEASONAL i.year i.moy i.dow i.holiday i.wom2 i.holidaywom2
reg y $SEASONAL 
predict yhat 
gen uhat = y-yhat
gen countmktprop_res = uhat
drop y yhat uhat



gen y = countpidR
global SEASONAL i.year i.moy i.dow i.holiday i.wom2 i.holidaywom2
reg y $SEASONAL 
predict yhat 
gen uhat = y-yhat
gen countpidR_res = uhat
drop y yhat uhat


twoway 	(line countmktprop_res date, sort lcolor(dknavy) lwidth(medium) lpattern(solid)) ///
		(line countpidR_res date, sort lcolor(red) lwidth(medthick) lpattern(dash)) ///
		, ylabel(#12) ///
		ymtick(##2, grid glpattern(dash)) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "In Market" 2 "Booked") ///
			title(Number of properties) ///
			position(10) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.5)
graph save Graph "Y:\agrajg\Research\Output\020102_PropertiesResbyDateStatus.gph", replace
graph export "Y:\agrajg\Research\Output\020102_PropertiesResbyDateStatus.png" , width(2100) height(1500) replace

*-------------------------------------------------------------------------------
gen tempvar 		= "Period 1 : Pre Purge" 				if date < td(20nov2015)
replace tempvar 	= "Period 2 : Purge-Data Disclosure" 	if date >= td(20nov2015) & date < td(10feb2016)
replace tempvar 	= "Period 3 : Post Data Disclosure" 	if date >= td(10feb2016) & date < td(1nov2016)
replace tempvar 	= "Period 4 : Post Law Enforcement" 	if date >= td(1nov2016)
encode tempvar, generate(event)
drop tempvar

twoway 	(scatter countpidR_res countmktprop_res if event ==1, sort mcolor(mint) msize(small) msymbol(circle))  ///
		(scatter countpidR_res countmktprop_res if event==2, sort mcolor(black) msize(medium) msymbol(triangle_hollow))  ///
		(scatter countpidR_res countmktprop_res if event==3, sort mcolor(ltblue) msize(small) msymbol(square))  ///
		(scatter countpidR_res countmktprop_res if event==4, sort mcolor(dknavy) msize(medium) msymbol(plus)),  ///
		ytitle(Number of Properties Booked)  ///
		ylabel(#16, grid) xtitle(Total Number of Properties in Market)  ///
		xlabel(#15, grid)  ///
		note(The seasonality has been controlled using year - month - day of week - week of month - holiday week and holiday)  ///
		legend(	order(	1 "Period 1 : Pre Purge"  ///
						2 "Period 2 : Purge-Data Disclosure"  ///
						3 "Period 3 : Post Data Disclosure"  ///
						4 "Period 4 : Post Law Enforcement" )  ///
				title(Regime)  ///
				position(10)  ///
				ring(0))  ///
		scheme(tufte)  ///
		scale(0.5)
graph save Graph "Y:\agrajg\Research\Output\020102_CountBookedVsActive.gph", replace
graph export "Y:\agrajg\Research\Output\020102_CountBookedVsActive.png" , width(2100) height(1500) replace

restore
/*-------------------------------------------------------------------------------








gen tempvar 		= "Period 1 : Pre Purge" 				if date < td(20nov2015)
replace tempvar 	= "Period 2 : Purge-Data Disclosure" 	if date >= td(20nov2015) & date < td(10feb2016)
replace tempvar 	= "Period 3 : Post Data Disclosure" 	if date >= td(10feb2016) & date < td(1nov2016)
replace tempvar 	= "Period 4 : Post Law Enforcement" 	if date >= td(1nov2016)
encode tempvar, generate(event)
drop tempvar

gen tempvar  = "Entire Home or Apartment" if zltypedum1==1
replace tempvar = "Private Rooms" if zltypedum3==1
replace tempvar = "Shared Rooms and Others" if tempvar==""
encode tempvar, generate(SpaceType)
drop tempvar


********************************************************************************
*** Total number of listings and hosts in the market over time
*** Categorised by Events...
preserve
timer on 1
collapse (count)countpid = pid, by (date event hid)
collapse (sum) NumListing=countpid (count) NumHost = hid , by ( event date)
label var date "Date of stay"
label var event "Regulatory events"
label var  NumListing "Number of listing"
label var  NumHost "Number of hosts"
save "Y:\agrajg\Research\Output\020101_NumberOfListingHostByDate.dta", replace
timer off 1
restore
********************************************************************************
*** Total number of Reserved listings and hosts in the market over time
*** Equilibrium bookings 
*** Were the number of bookings in eqilibrium change with changing events
preserve
timer on 2
collapse (count)countpid = pid, by (date event hid status)
collapse (sum) NumListing=countpid (count) NumHost = hid , by (event date status)
label var date "Date of stay"
label var event "Regulatory events"
label var status "Status"
label var  NumListing "Number of listing"
label var  NumHost "Number of hosts"
save "Y:\agrajg\Research\Output\020101_NumberOfListingsByDateStatus.dta", replace
timer off 2
restore
********************************************************************************
preserve
timer on 3
collapse (count)countpid = pid, by (date event hid SpaceType)
collapse (sum) NumListing=countpid (count) NumHost = hid , by (event date SpaceType)
label var date "Date of stay"
label var event "Regulatory events"
label var SpaceType "Space Type"
label var  NumListing "Number of listing"
label var  NumHost "Number of hosts"
save "Y:\agrajg\Research\Output\020101_NumberOfListingsByDateSpaceType.dta", replace
timer off 3
restore
********************************************************************************
preserve
timer on 4
collapse (count)countpid = pid, by (date event hid status SpaceType)
collapse (sum) NumListing=countpid (count) NumHost = hid , by (event date status SpaceType)
label var date "Date of stay"
label var event "Regulatory events"
label var SpaceType "Space Type"
label var status "Status"
label var  NumListing "Number of listing"
label var  NumHost "Number of hosts"
save "Y:\agrajg\Research\Output\020101_NumberOfListingsByDateSpaceTypeStatus.dta", replace
timer off 4
restore
********************************************************************************






timer list
