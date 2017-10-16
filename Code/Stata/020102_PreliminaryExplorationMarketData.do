clear all
set more off
*use "Y:\agrajg\Research\Data\temp\010208_MergedDataForPanelPriceQuantityRegression.dta", clear
use "Y:\agrajg\Research\Data\temp\010208_MergedDataForPanelPriceQuantityRegressionBlockedDropped.dta", clear
*===============================================================================
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
