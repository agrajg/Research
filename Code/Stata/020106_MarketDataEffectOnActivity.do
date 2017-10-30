clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonals.dta" , clear
tsset propertyid date, daily
*-------------------------------------------------------------------------------
g lPropAge = ln(PropAge)
g lHostAge = ln(HostAge)
g lCombinedHostAge = ln(CombinedHostAge)

g lPropGuestPastCount = ln(PropGuestPastCount)
g lHostGuestPastCount = ln(HostGuestPastCount)

g lPropASCount = ln(PropASCount)
g lPropBSCount = ln(PropBSCount)
g lPropRSCount = ln(PropRSCount)

g lHostASCount = ln(HostASCount)
g lHostBSCount = ln(HostBSCount)
g lHostRSCount = ln(HostRSCount)

global SET1 lPropAge lHostAge
global SET2 lPropAge lHostAge lCombinedHostAge
global SET3 lPropAge lHostAge lPropGuestPastCount lHostGuestPastCount
global SET4 lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount
global SET5 lPropAge lHostAge lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount
global SET6 lPropAge lHostAge lCombinedHostAge lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount
global SET7 lPropAge lHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount
global SET8 lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount

global SEASONAL year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
gen sdum12 = sdum1 + sdum2


local i=8
xtreg sdum12 lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount $SEASONAL 	if date < td(01oct2015)		, 	fe vce(robust)
predict sdum12Before_xb , xb
predict sdum12Before_xbu , xbu
predict sdum12Before_e , e
predict sdum12Before_u , u

by propertyid : carryforward sdum12Before_u , gen(sdum12Before_u1)
gen sdum12Before_xbnt = 	 _b[_cons] + /// 
							_b[lPropAge]*lPropAge+  ///
						 	_b[lHostAge]*lHostAge+  ///
						 	_b[lCombinedHostAge]*lCombinedHostAge+  ///
						 	_b[lPropGuestPastCount]*lPropGuestPastCount+  ///
						 	_b[lHostGuestPastCount]*lHostGuestPastCount+  ///
						 	_b[lPropASCount]*lPropASCount+  ///
						 	_b[lPropBSCount]*lPropBSCount+  ///
						 	_b[lPropRSCount]*lPropRSCount+  ///
						 	_b[lHostASCount]*lHostASCount+  ///
						 	_b[lHostBSCount]*lHostBSCount+  ///
						 	_b[lHostRSCount]*lHostRSCount

gen sdum12Before_e1 = sdum12 -sdum12Before_xb - sdum12Before_u1
gen sdum12Before_xbu1 = sdum12Before_xb + sdum12Before_u1

xtreg sdum12 lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount $SEASONAL 	if date >= td(01oct2015)	, 	fe vce(robust)
predict sdum12After_xb  , xb
gen sdum12After_xbnt = 	 _b[_cons] + ///
							_b[lPropAge]*lPropAge+  ///
						 	_b[lHostAge]*lHostAge+  ///
						 	_b[lCombinedHostAge]*lCombinedHostAge+  ///
						 	_b[lPropGuestPastCount]*lPropGuestPastCount+  ///
						 	_b[lHostGuestPastCount]*lHostGuestPastCount+  ///
						 	_b[lPropASCount]*lPropASCount+  ///
						 	_b[lPropBSCount]*lPropBSCount+  ///
						 	_b[lPropRSCount]*lPropRSCount+  ///
						 	_b[lHostASCount]*lHostASCount+  ///
						 	_b[lHostBSCount]*lHostBSCount+  ///
						 	_b[lHostRSCount]*lHostRSCount
predict sdum12After_xbu , xbu
predict sdum12After_e , e
predict sdum12After_u , u
xtreg sdum12 lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount $SEASONAL  								, 	fe vce(robust)
predict sdum12FullSample_xb  , xb
gen sdum12FullSample_xbnt = 	 _b[_cons] + ///
							_b[lPropAge]*lPropAge+  ///
						 	_b[lHostAge]*lHostAge+  ///
						 	_b[lCombinedHostAge]*lCombinedHostAge+  ///
						 	_b[lPropGuestPastCount]*lPropGuestPastCount+  ///
						 	_b[lHostGuestPastCount]*lHostGuestPastCount+  ///
						 	_b[lPropASCount]*lPropASCount+  ///
						 	_b[lPropBSCount]*lPropBSCount+  ///
						 	_b[lPropRSCount]*lPropRSCount+  ///
						 	_b[lHostASCount]*lHostASCount+  ///
						 	_b[lHostBSCount]*lHostBSCount+  ///
						 	_b[lHostRSCount]*lHostRSCount
predict sdum12FullSample_xbu , xbu
predict sdum12FullSample_e , e
predict sdum12FullSample_u , u


*keep if propertyid ==364043 | propertyid ==394474 | propertyid ==839336 | propertyid == 400546
*keep if propertyid ==364043 
*twoway 	(line countmktprop date, sort lcolor(red) lwidth(medium) lpattern(solid)) ///
*		(line countmktprop_pred date, sort lcolor(red) lwidth(thin) lpattern(dash)) ///
*		(line countpidR date, sort lcolor(dknavy) lwidth(medium) lpattern(solid)) ///
*		(line countpidR_pred date, sort lcolor(dknavy) lwidth(thin) lpattern(dash)) ///

twoway 	(line sdum12Before_e1 date , sort lwidth(thin))  ///
		(line sdum12After_e date if date >= td(01oct2015), sort)  ///
		(line sdum12FullSample_e date, sort lcolor(mint) lwidth(medium) lpattern(dot)) ///
		if propertyid ==364043 , ///
		ylabel(#12) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "Before purge" 2 "After purge" 3 "Full sample") ///
			title(Market Activity (error)) ///
			position(7) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.8)

graph save Graph 	"Y:\agrajg\Research\Output\020106_sdum12Seasonal_eSpec`i'.gph", replace
graph export 		"Y:\agrajg\Research\Output\020106_sdum12Seasonal_eSpec`i'.png" , width(2100) height(1500) replace
graph export 		"T:\agrajg\Output\020106_sdum12Seasonal_eSpec`i'.png" , width(2100) height(1500) replace

twoway 	(line sdum12Before_xbu1 date , sort lwidth(thin))  ///
		(line sdum12After_xbu date if date >= td(01oct2015), sort)  ///
		(line sdum12FullSample_xbu date, sort lcolor(mint)  lwidth(medium) lpattern(dot)) ///
		if propertyid ==364043 , ///
		ylabel(#12) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "Before purge" 2 "After purge" 3 "Full sample") ///
			title(Market Activity (Xb + u)) ///
			position(10) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.8)

		
graph save Graph 	"Y:\agrajg\Research\Output\020106_sdum12Seasonal_xbuSpec`i'.gph", replace
graph export 		"Y:\agrajg\Research\Output\020106_sdum12Seasonal_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export 		"T:\agrajg\Output\020106_sdum12Seasonal_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway 	(line sdum12Before_xbnt date , sort lwidth(thin))  ///
		(line sdum12After_xbnt date if date >= td(01oct2015), sort)  ///
		(line sdum12FullSample_xbnt date, sort lcolor(mint)  lwidth(medium) lpattern(dot)) ///
		if propertyid ==364043 , ///
		ylabel(#12) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "Before purge" 2 "After purge" 3 "Full sample") ///
			title(Market Activity (Explained)) ///
			position(10) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.8)
		
graph save Graph 	"Y:\agrajg\Research\Output\020106_sdum12Seasonal_xbntSpec`i'.gph", replace
graph export 		"Y:\agrajg\Research\Output\020106_sdum12Seasonal_xbntSpec`i'.png" , width(2100) height(1500) replace
graph export 		"T:\agrajg\Output\020106_sdum12Seasonal_xbntSpec`i'.png" , width(2100) height(1500) replace
		
/*
forvalues i = 1(1)8 {

xtreg sdum12 $SET``i'' 		, fe vce(robust)
predict sdum12FullSample_xb if propertyid == 364043, xb
predict sdum12FullSample_xbu if propertyid == 364043, xbu
predict sdum12FullSample_e if propertyid == 364043, e
estimates save "Y:\agrajg\Research\Output\sdum12FullSampleSpec`i'.ster", replace


twoway (line sdum12FullSample_xb date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum12FullSample_xbSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum12FullSample_xbSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum12FullSample_xbSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum12FullSample_xbu date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum12FullSample_xbuSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum12FullSample_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum12FullSample_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum12FullSample_e date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum12FullSample_eSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum12FullSample_eSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum12FullSample_eSpec`i'.png" , width(2100) height(1500) replace
drop *_xb *_xbu *_e
 

xtreg sdum12 $SET``i'' $SEASONAL  		, fe vce(robust)
predict sdum12FullSample_xb if propertyid == 364043, xb
predict sdum12FullSample_xbu if propertyid == 364043, xbu
predict sdum12FullSample_e if propertyid == 364043, e
estimates save "Y:\agrajg\Research\Output\sdum12SeasonalFullSampleSpec`i'.ster", replace


twoway (line sdum12FullSample_xb date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum12SeasonalFullSample_xbSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum12SeasonalFullSample_xbSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum12SeasonalFullSample_xbSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum12FullSample_xbu date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum12SeasonalFullSample_xbuSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum12SeasonalFullSample_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum12SeasonalFullSample_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum12FullSample_e date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum12SeasonalFullSample_eSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum12SeasonalFullSample_eSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum12SeasonalFullSample_eSpec`i'.png" , width(2100) height(1500) replace

drop *_xb *_xbu *_e
}






*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------

forvalues i = 1(1)8 {
 
xtreg sdum12 $SET``i'' if date < td(01oct2015)		, fe vce(robust)
predict sdum12Before_xb if propertyid == 364043, xb
predict sdum12Before_xbu if propertyid == 364043, xbu
predict sdum12Before_e if propertyid == 364043, e
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpec`i'.ster", replace

xtreg sdum12 $SET``i'' if date >= td(01oct2015)	, fe vce(robust)
predict sdum12After_xb  if propertyid == 364043 & date >=td(01oct2015), xb
predict sdum12After_xbu if propertyid == 364043  & date >=td(01oct2015), xbu
predict sdum12After_e if propertyid == 364043  & date >=td(01oct2015), e
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpec`i'.ster", replace

twoway (line sdum12Before_xb date, sort) (line sdum12After_xb date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum12_xbSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum12_xbSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum12_xbSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum12Before_xbu date, sort) (line sdum12After_xbu date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum12_xbuSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum12_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum12_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum12Before_e date, sort) (line sdum12After_e date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum12_eSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum12_eSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum12_eSpec`i'.png" , width(2100) height(1500) replace

drop *_xb *_xbu *_e
}



forvalues i = 1(1)8 {
 
xtreg sdum12 $SET``i'' $SEASONAL if date < td(01oct2015)		, fe vce(robust)
predict sdum12Before_xb if propertyid == 364043, xb
predict sdum12Before_xbu if propertyid == 364043, xbu
predict sdum12Before_e if propertyid == 364043, e
estimates save "Y:\agrajg\Research\Output\sdum12SeasonalBeforeSpec`i'.ster", replace

xtreg sdum12 $SET``i'' $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
predict sdum12After_xb  if propertyid == 364043 & date >=td(01oct2015), xb
predict sdum12After_xbu if propertyid == 364043  & date >=td(01oct2015), xbu
predict sdum12After_e if propertyid == 364043  & date >=td(01oct2015), e
estimates save "Y:\agrajg\Research\Output\sdum12SeasonalAfterSpec`i'.ster", replace

twoway (line sdum12Before_xb date, sort) (line sdum12After_xb date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum12Seasonal_xbSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum12Seasonal_xbSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum12Seasonal_xbSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum12Before_xbu date, sort) (line sdum12After_xbu date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum12Seasonal_xbuSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum12Seasonal_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum12Seasonal_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum12Before_e date, sort) (line sdum12After_e date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum12Seasonal_eSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum12Seasonal_eSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum12Seasonal_eSpec`i'.png" , width(2100) height(1500) replace

drop *_xb *_xbu *_e

}
/*



xtreg sdum12 $SET1 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpec1.ster", replace
xtreg sdum12 $SET1 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpec1.ster", replace

xtreg sdum12 $SET2 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpec2.ster", replace
xtreg sdum12 $SET2 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpec2.ster", replace

xtreg sdum12 $SET3 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpec3.ster", replace
xtreg sdum12 $SET3 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpec3.ster", replace

xtreg sdum12 $SET4 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpec4.ster", replace
xtreg sdum12 $SET4 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpec4.ster", replace

xtreg sdum12 $SET5 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpec5.ster", replace
xtreg sdum12 $SET5 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpec5.ster", replace

xtreg sdum12 $SET6 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpec6.ster", replace
xtreg sdum12 $SET6 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpec6.ster", replace

xtreg sdum12 $SET7 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpec7.ster", replace
xtreg sdum12 $SET7 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpec7.ster", replace

xtreg sdum12 $SET8 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpec8.ster", replace
xtreg sdum12 $SET8 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpec8.ster", replace

*-------------------------------------------------------------------------------

xtreg sdum12 $SET1 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpecSeasonal1.ster", replace
xtreg sdum12 $SET1 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpecSeasonal1.ster", replace

xtreg sdum12 $SET2 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpecSeasonal2.ster", replace
xtreg sdum12 $SET2 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpecSeasonal2.ster", replace

xtreg sdum12 $SET3 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpecSeasonal3.ster", replace
xtreg sdum12 $SET3 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpecSeasonal3.ster", replace

xtreg sdum12 $SET4 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpecSeasonal4.ster", replace
xtreg sdum12 $SET4 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpecSeasonal4.ster", replace

xtreg sdum12 $SET5 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpecSeasonal5.ster", replace
xtreg sdum12 $SET5 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpecSeasonal5.ster", replace

xtreg sdum12 $SET6 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpecSeasonal6.ster", replace
xtreg sdum12 $SET6 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpecSeasonal6.ster", replace

xtreg sdum12 $SET7 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpecSeasonal7.ster", replace
xtreg sdum12 $SET7 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpecSeasonal7.ster", replace

xtreg sdum12 $SET8 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12BeforeSpecSeasonal8.ster", replace
xtreg sdum12 $SET8 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum12AfterSpecSeasonal8.ster", replace

*-------------------------------------------------------------------------------



/*
clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010208_MergedDataForPanesdum12QuantityRegression.dta", clear
tsset propertyid date, daily
*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
*sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event
*sdum3 i.event PropPerHost c.PropPerHost#event event#c.sdum3 c.PropPerHost#c.sdum3 event#c.PropPerHost#c.sdum3


*** Price quatity
xtreg sdum12 sdum3 i.event 												i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsA
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event  			i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsB
xtreg sdum12 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event  		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsC
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsD


*-------------------------------------------------------------------------------
xtreg sdum12 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingA
xtreg sdum12 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingB
xtreg sdum12 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingC
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingD



xtreg sdum12 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingA
xtreg sdum12 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingB
xtreg sdum12 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingC
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingD
*-------------------------------------------------------------------------------
xtreg sdum12 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingA
xtreg sdum12 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingB
xtreg sdum12 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingC
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingD


xtreg sdum12 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingA
xtreg sdum12 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingB
xtreg sdum12 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingC
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingD


xtreg sdum12 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingA
xtreg sdum12 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingB
xtreg sdum12 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingC
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingD

*-------------------------------------------------------------------------------
xtreg sdum12 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingA
xtreg sdum12 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingB
xtreg sdum12 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingC
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingD

xtreg sdum12 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingA
xtreg sdum12 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingB
xtreg sdum12 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingC
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingD


xtreg sdum12 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingA
xtreg sdum12 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingB
xtreg sdum12 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingC
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingD

*-------------------------------------------------------------------------------
xtreg sdum12 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingA
xtreg sdum12 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingB
xtreg sdum12 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingC
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingD

xtreg sdum12 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingA
xtreg sdum12 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingB
xtreg sdum12 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingC
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingD

xtreg sdum12 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingA
xtreg sdum12 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingB
xtreg sdum12 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingC
xtreg sdum12 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingD

*-------------------------------------------------------------------------------

outreg2 [AllHostsA AllHostsB AllHostsC AllHostsD Max1ListingA Max1ListingB Max1ListingC Max1ListingD  MaxMoreThan1ListingA MaxMoreThan1ListingB MaxMoreThan1ListingC MaxMoreThan1ListingD ///
		Max0EHListingA Max0EHListingB Max0EHListingC Max0EHListingD Max1EHListingA Max1EHListingB Max1EHListingC Max1EHListingD MaxMoreThan1EHListingA MaxMoreThan1EHListingB MaxMoreThan1EHListingC MaxMoreThan1EHListingD ///
		Max0PRListingA Max0PRListingB Max0PRListingC Max0PRListingD Max1PRListingA Max1PRListingB Max1PRListingC Max1PRListingD MaxMoreThan1PRListingA MaxMoreThan1PRListingB MaxMoreThan1PRListingC MaxMoreThan1PRListingD ///
		Max0SRListingA Max0SRListingB Max0SRListingC Max0SRListingD Max1SRListingA Max1SRListingB Max1SRListingC Max1SRListingD MaxMoreThan1SRListingA MaxMoreThan1SRListingB MaxMoreThan1SRListingC MaxMoreThan1SRListingD ] ///
		using "Y:\agrajg\Research\Output\sdum12_sdum3_HostClass1", replace sortvar(i.event PropPerHost c.PropPerHost#event) see excel tex
