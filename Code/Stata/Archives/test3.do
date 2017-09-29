clear all
set more off


import delimited Y:\agrajg\Research\Output\HedonicRegressionsBase.txt

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

destring coeff*, replace 
destring se*, replace
reshape long coeff se, i(varname) j(date) s
reshape wide coeff se, i(date) j(varname) s
destring date , replace
format %td date

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
gen coeffltypedum1_hat=_b[time1]*time1+_b[time2]*time2+_b[time3]*time3+_b[time4]*time4+_b[time5]*time5+_b[time6]*time6+_b[time7]*time7+_b[time8]*time8+_b[time9]*time9+_b[time10]*time10
ereturn list
*plot
twoway (line coeffltypedum1_hat date, sort lwidth(thick)) (scatter coeffltypedum1 date, sort yaxis(2) msize(small) msymbol(circle_hollow)), ytitle(Trend) ylabel(#10, angle(horizontal)) ytitle(Coefficient, axis(2)) ylabel(#12, angle(horizontal) axis(2)) xline(20393 20423, lpattern(shortdash)) xlabel(#20, labsize(small) angle(forty_five) grid) legend(order(1 "Trend" 2 "Coefficient")) scheme(sj) scale(0.8)
graph export "Y:\agrajg\Research\Output\Graphs\HedonicRegressionsBase_coeffltypedum1.png", as(png) replace width(1300) height(800)
********************************************************************************
reg coeffltypedum4 time* i.year i.moy i.holidaywom2 i.dow i.holiday 
gen coeffltypedum4_hat=_b[time1]*time1+_b[time2]*time2+_b[time3]*time3+_b[time4]*time4+_b[time5]*time5+_b[time6]*time6+_b[time7]*time7+_b[time8]*time8+_b[time9]*time9+_b[time10]*time10
ereturn list
*plot
twoway (line coeffltypedum4_hat date, sort lwidth(thick)) (scatter coeffltypedum4 date, sort yaxis(2) msize(small) msymbol(circle_hollow)), ytitle(Trend) ylabel(#10, angle(horizontal)) ytitle(Coefficient, axis(2)) ylabel(#12, angle(horizontal) axis(2)) xline(20393 20423, lpattern(shortdash)) xlabel(#20, labsize(small) angle(forty_five) grid) legend(order(1 "Trend" 2 "Coefficient")) scheme(sj) scale(0.8)
graph export "Y:\agrajg\Research\Output\Graphs\HedonicRegressionsBase_coeffltypedum4.png", as(png) replace width(1300) height(800)
********************************************************************************
reg coeffbedrooms time* i.year i.moy i.holidaywom2 i.dow i.holiday 
gen coeffbedrooms_hat=_b[time1]*time1+_b[time2]*time2+_b[time3]*time3+_b[time4]*time4+_b[time5]*time5+_b[time6]*time6+_b[time7]*time7+_b[time8]*time8+_b[time9]*time9+_b[time10]*time10
ereturn list
*plot
twoway (line coeffbedrooms_hat date, sort lwidth(thick)) (scatter coeffbedrooms date, sort yaxis(2) msize(small) msymbol(circle_hollow)), ytitle(Trend) ylabel(#10, angle(horizontal)) ytitle(Coefficient, axis(2)) ylabel(#12, angle(horizontal) axis(2)) xline(20393 20423, lpattern(shortdash)) xlabel(#20, labsize(small) angle(forty_five) grid) legend(order(1 "Trend" 2 "Coefficient")) scheme(sj) scale(0.8)
graph export "Y:\agrajg\Research\Output\Graphs\HedonicRegressionsBase_coeffbedrooms.png", as(png) replace width(1300) height(800)
********************************************************************************
reg coeffbathrooms time* i.year i.moy i.holidaywom2 i.dow i.holiday 
gen coeffbathrooms_hat=_b[time1]*time1+_b[time2]*time2+_b[time3]*time3+_b[time4]*time4+_b[time5]*time5+_b[time6]*time6+_b[time7]*time7+_b[time8]*time8+_b[time9]*time9+_b[time10]*time10
ereturn list
*plot
twoway (line coeffbathrooms_hat date, sort lwidth(thick)) (scatter coeffbathrooms date, sort yaxis(2) msize(small) msymbol(circle_hollow)), ytitle(Trend) ylabel(#10, angle(horizontal)) ytitle(Coefficient, axis(2)) ylabel(#12, angle(horizontal) axis(2)) xline(20393 20423, lpattern(shortdash)) xlabel(#20, labsize(small) angle(forty_five) grid) legend(order(1 "Trend" 2 "Coefficient")) scheme(sj) scale(0.8)
graph export "Y:\agrajg\Research\Output\Graphs\HedonicRegressionsBase_coeffbathrooms.png", as(png) replace width(1300) height(800)
********************************************************************************




