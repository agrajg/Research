clear all
set more off


import delimited Y:\agrajg\Research\Output\HedonicRegressionsBasePlus2.txt

drop in 1


forval i =2(2)1948 {
	local m = `i' + 1
	replace v`i' = "coeff" in 2
	replace v`i' = subinstr(v`i', "*", "",.)
	replace v`i' = subinstr(v`i', ",", "",.)
	replace v`m' = v`i' in 1 
	replace v`m' = subinstr(v`m', "(", "",.)
	replace v`m' = subinstr(v`m', ")", "",.)
	local varnum = 19936 -1  + (`i'/2)
	
	
	rename v`i' coeff`varnum'
	rename v`m' se`varnum'
	replace coeff`varnum' = strtrim(coeff`varnum')
	replace se`varnum' = strtrim(se`varnum')
}
drop in 1
drop in 1
drop in 1
rename v1 varname
drop if varname ==""
drop if varname == "Standard errors in parentheses"
drop if varname == "*** p<0.01, ** p<0.05, * p<0.1"
replace varname = subinstr(varname, "-", "",.)

destring coeff*, replace force
destring se*, replace force
egen countrowmiss = rowmiss(coeff*)
drop if countrowmiss == 974
drop countrowmiss
reshape long coeff se, i(varname) j(date) s
reshape wide coeff se, i(date) j(varname) s
destring date , replace
format %td date

/*
g coeffltypedum1plusse = coeffltypedum1 + seltypedum1 
g coeffltypedum1minusse = coeffltypedum1 - seltypedum1 

g coeffltypedum4plusse =  coeffltypedum4 + seltypedum4  
g coeffltypedum4minusse =  coeffltypedum4 - seltypedum4  

g coeffbedroomsplusse = coeffbedrooms + sebedrooms 
g coeffbedroomsminusse = coeffbedrooms - sebedrooms 

g coeffbathroomsplusse = coeffbathrooms + sebathrooms 
g coeffbathroomsminusse = coeffbathrooms - sebathrooms 
*/

merge m:1 date using "Y:\agrajg\Research\Code\Stata\Seasonals\seasonals_01aug2014to31mar2017.dta"
drop if _merge ==2
drop _merge
format %td date


** INDEPENDENT VARIABLES
capture drop tid 
egen tid = group(date)
capture drop time*
orthpoly tid, generate(time*) degree(10)
********************************************************************************
reg coeffltypedum1 time* i.year i.moy i.holidaywom2 i.dow i.holiday 
gen coeffltypedum1_hat= _b[time3]*time3+_b[time4]*time4+_b[time6]*time6+_b[time9]*time9+_b[time10]*time10
ereturn list
*plot
twoway (scatter coeffltypedum1 date, sort msymbol(circle_hollow)) (line coeffltypedum1_hat date, sort yaxis(2)), ytitle(Coefficient) ylabel(#11, angle(horizontal)) ytitle(Trend, axis(2)) ylabel(#11, angle(horizontal) axis(2)) xtitle(Date) xline(20393 20423, lpattern(shortdash)) xlabel(#20, angle(forty_five) grid) legend(order(1 "Cefficient" 2 "Trend")) scale(0.8)
graph export "Y:\agrajg\Research\Output\Graphs\HedonicRegressionsBasePlus2_coeffltypedum1.png", as(png) replace width(1300) height(800)
********************************************************************************
reg coeffltypedum4 time* i.year i.moy i.holidaywom2 i.dow i.holiday 
gen coeffltypedum4_hat=_b[time1]*time1+_b[time2]*time2+_b[time3]*time3+_b[time4]*time4+_b[time5]*time5+_b[time7]*time7+_b[time9]*time9+_b[time10]*time10
ereturn list
*plot
twoway (scatter coeffltypedum4 date, sort msymbol(circle_hollow)) (line coeffltypedum4_hat date, sort yaxis(2)), ytitle(Coefficient) ylabel(#11, angle(horizontal)) ytitle(Trend, axis(2)) ylabel(#11, angle(horizontal) axis(2)) xtitle(Date) xline(20393 20423, lpattern(shortdash)) xlabel(#20, angle(forty_five) grid) legend(order(1 "Cefficient" 2 "Trend")) scale(0.8)
graph export "Y:\agrajg\Research\Output\Graphs\HedonicRegressionsBasePlus2_coeffltypedum4.png", as(png) replace width(1300) height(800)
********************************************************************************
reg coeffbedrooms time* i.year i.moy i.holidaywom2 i.dow i.holiday 
gen coeffbedrooms_hat=_b[time1]*time1+_b[time4]*time4+_b[time10]*time10
ereturn list
*plot
twoway (scatter coeffbedrooms date, sort msymbol(circle_hollow)) (line coeffbedrooms_hat date, sort yaxis(2)), ytitle(Coefficient) ylabel(#11, angle(horizontal)) ytitle(Trend, axis(2)) ylabel(#11, angle(horizontal) axis(2)) xtitle(Date) xline(20393 20423, lpattern(shortdash)) xlabel(#20, angle(forty_five) grid) legend(order(1 "Cefficient" 2 "Trend")) scale(0.8)
graph export "Y:\agrajg\Research\Output\Graphs\HedonicRegressionsBasePlus2_coeffbedrooms.png", as(png) replace width(1300) height(800)
********************************************************************************
reg coeffbathrooms time* i.year i.moy i.holidaywom2 i.dow i.holiday 
gen coeffbathrooms_hat=_b[time2]*time2+_b[time3]*time3+_b[time4]*time4+_b[time5]*time5+_b[time6]*time6+_b[time8]*time8+_b[time9]*time9+_b[time10]*time10
ereturn list
*plot
twoway (scatter coeffbathrooms date, sort msymbol(circle_hollow)) (line coeffbathrooms_hat date, sort yaxis(2)), ytitle(Coefficient) ylabel(#11, angle(horizontal)) ytitle(Trend, axis(2)) ylabel(#11, angle(horizontal) axis(2)) xtitle(Date) xline(20393 20423, lpattern(shortdash)) xlabel(#20, angle(forty_five) grid) legend(order(1 "Cefficient" 2 "Trend")) scale(0.8)
graph export "Y:\agrajg\Research\Output\Graphs\HedonicRegressionsBasePlus2_coeffbathrooms.png", as(png) replace width(1300) height(800)
********************************************************************************

keep date coeffr2_a 
rename coeffr2_a HedonicRegressionsBasePlus2_r2_a
save "Y:\agrajg\Research\Output\HedonicRegressionsBasePlus2_r2_a", replace
exit, clear

