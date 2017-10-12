clear all
set more off
use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDsBlockedDropped.dta", clear
/*
*-------------------------------------------------------------------------------
preserve
collapse (count) count_pid = pid ,by(date status)
reshape wide count_pid  , i(date ) j(status ) s
gen countmktprop = count_pidA  + count_pidR
twoway 	(line countmktprop date, sort lcolor(dknavy) lwidth(medthick) lpattern(solid)) ///
		(line count_pidR date, sort lcolor(red) lwidth(medthick) lpattern(dash)) ///
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
		scale(0.7)
graph save Graph "Y:\agrajg\Research\Output\020102_PropertiesbyDateStatus.gph", replace
graph export "Y:\agrajg\Research\Output\020102_PropertiesbyDateStatus.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\020102_PropertiesbyDateStatus.png" , width(2100) height(1500) replace
restore
*-------------------------------------------------------------------------------
*/

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





merge 1:1 date using "Y:\agrajg\Research\Data\Seasonals\seasonals_01aug2014to31mar2017.dta" 


gen y = countmktprop
global SEASONAL i.year i.moy i.dow i.holiday i.wom2 i.holidaywom2
reg y $SEASONAL 
predict yhat 
gen uhat = y-yhat
gen countmktprop_res = uhat
drop y yhat uhat



gen y = count_pidR
global SEASONAL i.year i.moy i.dow i.holiday i.wom2 i.holidaywom2
reg y $SEASONAL 
predict yhat 
gen uhat = y-yhat
gen count_pidR_res = uhat
drop y yhat uhat


twoway 	(line countmktprop_res date, sort lcolor(dknavy) lwidth(medium) lpattern(solid)) ///
		(line count_pidR_res date, sort lcolor(red) lwidth(medthick) lpattern(dash)) ///
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

twoway 	(scatter count_pidR_res countmktprop_res if event ==1, sort mcolor(mint) msize(small) msymbol(circle))  ///
		(scatter count_pidR_res countmktprop_res if event==2, sort mcolor(black) msize(medium) msymbol(triangle_hollow))  ///
		(scatter count_pidR_res countmktprop_res if event==3, sort mcolor(ltblue) msize(small) msymbol(square))  ///
		(scatter count_pidR_res countmktprop_res if event==4, sort mcolor(dknavy) msize(medium) msymbol(plus)),  ///
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
