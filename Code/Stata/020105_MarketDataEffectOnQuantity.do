clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonalsBlockedDropped.dta" , clear
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
*-------------------------------------------------------------------------------


local i=8
xtreg sdum3 lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount $SEASONAL 	if date < td(01oct2015)		, 	fe vce(robust)
predict sdum3Before_xb , xb
predict sdum3Before_xbu , xbu
predict sdum3Before_e , e
predict sdum3Before_u , u

by propertyid : carryforward sdum3Before_u , gen(sdum3Before_u1)
gen sdum3Before_xbnt = 	 _b[_cons] + /// 
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

gen sdum3Before_e1 = sdum3 -sdum3Before_xb - sdum3Before_u1
gen sdum3Before_xbu1 = sdum3Before_xb + sdum3Before_u1

xtreg sdum3 lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount $SEASONAL 	if date >= td(01oct2015)	, 	fe vce(robust)
predict sdum3After_xb  , xb
gen sdum3After_xbnt = 	 _b[_cons] + ///
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
predict sdum3After_xbu , xbu
predict sdum3After_e , e
predict sdum3After_u , u
xtreg sdum3 lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount $SEASONAL  								, 	fe vce(robust)
predict sdum3FullSample_xb  , xb
gen sdum3FullSample_xbnt = 	 _b[_cons] + ///
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
predict sdum3FullSample_xbu , xbu
predict sdum3FullSample_e , e
predict sdum3FullSample_u , u


*keep if propertyid ==364043 | propertyid ==394474 | propertyid ==839336 | propertyid == 400546
*keep if propertyid ==364043 
*twoway 	(line countmktprop date, sort lcolor(red) lwidth(medium) lpattern(solid)) ///
*		(line countmktprop_pred date, sort lcolor(red) lwidth(thin) lpattern(dash)) ///
*		(line countpidR date, sort lcolor(dknavy) lwidth(medium) lpattern(solid)) ///
*		(line countpidR_pred date, sort lcolor(dknavy) lwidth(thin) lpattern(dash)) ///

twoway 	(line sdum3Before_e1 date , sort lwidth(thin))  ///
		(line sdum3After_e date if date >= td(01oct2015), sort)  ///
		(line sdum3FullSample_e date, sort lcolor(mint) lwidth(medium) lpattern(dot)) ///
		if propertyid ==364043 , ///
		ylabel(#12) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "Before purge" 2 "After purge" 3 "Full sample") ///
			title(log of price(error)) ///
			position(7) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.8)

graph save Graph 	"Y:\agrajg\Research\Output\020105_sdum3Seasonal_eSpec`i'.gph", replace
graph export 		"Y:\agrajg\Research\Output\020105_sdum3Seasonal_eSpec`i'.png" , width(2100) height(1500) replace
graph export 		"T:\agrajg\Output\020105_sdum3Seasonal_eSpec`i'.png" , width(2100) height(1500) replace

twoway 	(line sdum3Before_xbu1 date , sort lwidth(thin))  ///
		(line sdum3After_xbu date if date >= td(01oct2015), sort)  ///
		(line sdum3FullSample_xbu date, sort lcolor(mint)  lwidth(medium) lpattern(dot)) ///
		if propertyid ==364043 , ///
		ylabel(#12) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "Before purge" 2 "After purge" 3 "Full sample") ///
			title(log of price(Xb + u)) ///
			position(10) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.8)

		
graph save Graph 	"Y:\agrajg\Research\Output\020105_sdum3Seasonal_xbuSpec`i'.gph", replace
graph export 		"Y:\agrajg\Research\Output\020105_sdum3Seasonal_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export 		"T:\agrajg\Output\020105_sdum3Seasonal_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway 	(line sdum3Before_xbnt date , sort lwidth(thin))  ///
		(line sdum3After_xbnt date if date >= td(01oct2015), sort)  ///
		(line sdum3FullSample_xbnt date, sort lcolor(mint)  lwidth(medium) lpattern(dot)) ///
		if propertyid ==364043 , ///
		ylabel(#12) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "Before purge" 2 "After purge" 3 "Full sample") ///
			title(log of price(Explained)) ///
			position(10) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.8)
		
graph save Graph 	"Y:\agrajg\Research\Output\020105_sdum3Seasonal_xbntSpec`i'.gph", replace
graph export 		"Y:\agrajg\Research\Output\020105_sdum3Seasonal_xbntSpec`i'.png" , width(2100) height(1500) replace
graph export 		"T:\agrajg\Output\020105_sdum3Seasonal_xbntSpec`i'.png" , width(2100) height(1500) replace

/*
local i=8
xtreg sdum3 lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount $SEASONAL 	if date < td(01oct2015)		, 	fe vce(robust)
predict sdum3Before_xb , xb
predict sdum3Before_xbu , xbu
predict sdum3Before_e , e
predict sdum3Before_u , u

by propertyid : carryforward sdum3Before_u , gen(sdum3Before_u1)
gen sdum3Before_e1 = sdum3 -sdum3Before_xb - sdum3Before_u1
gen sdum3Before_xbu1 = sdum3Before_xb + sdum3Before_u1
gen sdum3Before_xbnt = 	 _b[_cons] + /// 
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


xtreg sdum3 lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount  $SEASONAL 	if date >= td(01oct2015)	, 	fe vce(robust)
predict sdum3After_xb  , xb
predict sdum3After_xbu , xbu
predict sdum3After_e , e
predict sdum3After_u , u
gen sdum3After_xbnt = 	 _b[_cons] + /// 
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
							
xtreg sdum3 lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount $SEASONAL  				, 	fe vce(robust)
predict sdum3FullSample_xb  , xb
predict sdum3FullSample_xbu , xbu
predict sdum3FullSample_e , e
predict sdum3FullSample_u , u
gen sdum3FullSample_xbnt = 	 _b[_cons] + /// 
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


*keep if propertyid ==364043 | propertyid ==394474 | propertyid ==839336 | propertyid == 400546
*keep if propertyid ==364043 
*twoway 	(line countmktprop date, sort lcolor(red) lwidth(medium) lpattern(solid)) 
*		(line countmktprop_pred date, sort lcolor(red) lwidth(thin) lpattern(dash)) 
*		(line countpidR date, sort lcolor(dknavy) lwidth(medium) lpattern(solid)) 
*		(line countpidR_pred date, sort lcolor(dknavy) lwidth(thin) lpattern(dash)) 


twoway 	(line sdum3Before_e1 date , sort lwidth(thin))  ///
		(line sdum3After_e date if date >= td(01oct2015), sort)  ///
		(line sdum3FullSample_e date, sort lwidth(medium) lpattern(dot)) ///
		if propertyid ==364043 , ///
		ylabel(#12) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "Before purge" 2 "After purge" 3 "Full sample") ///
			title(Output\020105_(error)) ///
			position(7) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.8)

graph save Graph 	"Y:\agrajg\Research\Output\020105_sdum3Seasonal_eSpec`i'.gph", replace
graph export 		"Y:\agrajg\Research\Output\020105_sdum3Seasonal_eSpec`i'.png" , width(2100) height(1500) replace
graph export 		"T:\agrajg\Output\020105_sdum3Seasonal_eSpec`i'.png" , width(2100) height(1500) replace

twoway 	(line sdum3Before_xbu1 date , sort lwidth(thin))  ///
		(line sdum3After_xbu date if date >= td(01oct2015), sort)  ///
		(line sdum3FullSample_xbu date, sort lwidth(medium) lpattern(dot)) ///
		if propertyid ==364043 , ///
		ylabel(#12) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "Before purge" 2 "After purge" 3 "Full sample") ///
			title(Output\020105_(Xb + u)) ///
			position(10) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.8)

		
graph save Graph 	"Y:\agrajg\Research\Output\020105_sdum3Seasonal_xbuSpec`i'.gph", replace
graph export 		"Y:\agrajg\Research\Output\020105_sdum3Seasonal_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export 		"T:\agrajg\Output\020105_sdum3Seasonal_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway 	(line sdum3Before_xbnt date , sort lwidth(thin))  ///
		(line sdum3After_xbnt date if date >= td(01oct2015), sort)  ///
		(line sdum3FullSample_xbnt date, sort lwidth(medium) lpattern(dot)) ///
		if propertyid ==364043 , ///
		ylabel(#12) ///
		xline(20362 20423 20494 20748, lpattern(vshortdash)) ///
		xlabel(#19, angle(forty_five) grid) ///
		xmtick(, grid) ///
		legend(order(1 "Before purge" 2 "After purge" 3 "Full sample") ///
			title(Output\020105_(Explained)) ///
			position(10) ///
			ring(0)) ///
		scheme(tufte) ///
		scale(0.8)
		
graph save Graph 	"Y:\agrajg\Research\Output\020105_sdum3Seasonal_xbSpec`i'.gph", replace
graph export 		"Y:\agrajg\Research\Output\020105_sdum3Seasonal_xbSpec`i'.png" , width(2100) height(1500) replace
graph export 		"T:\agrajg\Output\020105_sdum3Seasonal_xbSpec`i'.png" , width(2100) height(1500) replace
/*
forvalues i = 1(1)8 {

xtreg sdum3 $SET``i'' 		, fe vce(robust)
predict sdum3FullSample_xb if propertyid == 364043, xb
predict sdum3FullSample_xbu if propertyid == 364043, xbu
predict sdum3FullSample_e if propertyid == 364043, e
estimates save "Y:\agrajg\Research\Output\sdum3FullSampleSpec`i'.ster", replace


twoway (line sdum3FullSample_xb date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum3FullSample_xbSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum3FullSample_xbSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum3FullSample_xbSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum3FullSample_xbu date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum3FullSample_xbuSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum3FullSample_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum3FullSample_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum3FullSample_e date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum3FullSample_eSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum3FullSample_eSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum3FullSample_eSpec`i'.png" , width(2100) height(1500) replace
drop *_xb *_xbu *_e
 

xtreg sdum3 $SET``i'' $SEASONAL  		, fe vce(robust)
predict sdum3FullSample_xb if propertyid == 364043, xb
predict sdum3FullSample_xbu if propertyid == 364043, xbu
predict sdum3FullSample_e if propertyid == 364043, e
estimates save "Y:\agrajg\Research\Output\sdum3SeasonalFullSampleSpec`i'.ster", replace


twoway (line sdum3FullSample_xb date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum3SeasonalFullSample_xbSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum3SeasonalFullSample_xbSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum3SeasonalFullSample_xbSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum3FullSample_xbu date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum3SeasonalFullSample_xbuSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum3SeasonalFullSample_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum3SeasonalFullSample_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum3FullSample_e date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum3SeasonalFullSample_eSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum3SeasonalFullSample_eSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum3SeasonalFullSample_eSpec`i'.png" , width(2100) height(1500) replace

drop *_xb *_xbu *_e
}






*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------

forvalues i = 1(1)8 {
 
xtreg sdum3 $SET``i'' if date < td(01oct2015)		, fe vce(robust)
predict sdum3Before_xb if propertyid == 364043, xb
predict sdum3Before_xbu if propertyid == 364043, xbu
predict sdum3Before_e if propertyid == 364043, e
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpec`i'.ster", replace

xtreg sdum3 $SET``i'' if date >= td(01oct2015)	, fe vce(robust)
predict sdum3After_xb  if propertyid == 364043 & date >=td(01oct2015), xb
predict sdum3After_xbu if propertyid == 364043  & date >=td(01oct2015), xbu
predict sdum3After_e if propertyid == 364043  & date >=td(01oct2015), e
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpec`i'.ster", replace

twoway (line sdum3Before_xb date, sort) (line sdum3After_xb date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum3_xbSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum3_xbSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum3_xbSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum3Before_xbu date, sort) (line sdum3After_xbu date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum3_xbuSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum3_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum3_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum3Before_e date, sort) (line sdum3After_e date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum3_eSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum3_eSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum3_eSpec`i'.png" , width(2100) height(1500) replace

drop *_xb *_xbu *_e
}



forvalues i = 1(1)8 {
 
xtreg sdum3 $SET``i'' $SEASONAL if date < td(01oct2015)		, fe vce(robust)
predict sdum3Before_xb if propertyid == 364043, xb
predict sdum3Before_xbu if propertyid == 364043, xbu
predict sdum3Before_e if propertyid == 364043, e
estimates save "Y:\agrajg\Research\Output\sdum3SeasonalBeforeSpec`i'.ster", replace

xtreg sdum3 $SET``i'' $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
predict sdum3After_xb  if propertyid == 364043 & date >=td(01oct2015), xb
predict sdum3After_xbu if propertyid == 364043  & date >=td(01oct2015), xbu
predict sdum3After_e if propertyid == 364043  & date >=td(01oct2015), e
estimates save "Y:\agrajg\Research\Output\sdum3SeasonalAfterSpec`i'.ster", replace

twoway (line sdum3Before_xb date, sort) (line sdum3After_xb date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum3Seasonal_xbSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum3Seasonal_xbSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum3Seasonal_xbSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum3Before_xbu date, sort) (line sdum3After_xbu date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum3Seasonal_xbuSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum3Seasonal_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum3Seasonal_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway (line sdum3Before_e date, sort) (line sdum3After_e date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\sdum3Seasonal_eSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\sdum3Seasonal_eSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\sdum3Seasonal_eSpec`i'.png" , width(2100) height(1500) replace

drop *_xb *_xbu *_e

}
/*
xtreg sdum3 $SET1 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpec1.ster", replace
xtreg sdum3 $SET1 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpec1.ster", replace

xtreg sdum3 $SET2 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpec2.ster", replace
xtreg sdum3 $SET2 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpec2.ster", replace

xtreg sdum3 $SET3 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpec3.ster", replace
xtreg sdum3 $SET3 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpec3.ster", replace

xtreg sdum3 $SET4 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpec4.ster", replace
xtreg sdum3 $SET4 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpec4.ster", replace

xtreg sdum3 $SET5 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpec5.ster", replace
xtreg sdum3 $SET5 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpec5.ster", replace

xtreg sdum3 $SET6 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpec6.ster", replace
xtreg sdum3 $SET6 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpec6.ster", replace

xtreg sdum3 $SET7 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpec7.ster", replace
xtreg sdum3 $SET7 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpec7.ster", replace

xtreg sdum3 $SET8 if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpec8.ster", replace
xtreg sdum3 $SET8 if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpec8.ster", replace

*-------------------------------------------------------------------------------

xtreg sdum3 $SET1 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpecSeasonal1.ster", replace
xtreg sdum3 $SET1 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpecSeasonal1.ster", replace

xtreg sdum3 $SET2 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpecSeasonal2.ster", replace
xtreg sdum3 $SET2 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpecSeasonal2.ster", replace

xtreg sdum3 $SET3 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpecSeasonal3.ster", replace
xtreg sdum3 $SET3 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpecSeasonal3.ster", replace

xtreg sdum3 $SET4 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpecSeasonal4.ster", replace
xtreg sdum3 $SET4 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpecSeasonal4.ster", replace

xtreg sdum3 $SET5 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpecSeasonal5.ster", replace
xtreg sdum3 $SET5 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpecSeasonal5.ster", replace

xtreg sdum3 $SET6 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpecSeasonal6.ster", replace
xtreg sdum3 $SET6 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpecSeasonal6.ster", replace

xtreg sdum3 $SET7 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpecSeasonal7.ster", replace
xtreg sdum3 $SET7 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpecSeasonal7.ster", replace

xtreg sdum3 $SET8 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3BeforeSpecSeasonal8.ster", replace
xtreg sdum3 $SET8 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\sdum3AfterSpecSeasonal8.ster", replace

*-------------------------------------------------------------------------------



/*
clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010208_MergedDataForPanesdum3QuantityRegression.dta", clear
tsset propertyid date, daily
*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
*sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event
*sdum3 i.event PropPerHost c.PropPerHost#event event#c.sdum3 c.PropPerHost#c.sdum3 event#c.PropPerHost#c.sdum3


*** Price quatity
xtreg sdum3 sdum3 i.event 												i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsA
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event  			i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsB
xtreg sdum3 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event  		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsC
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsD


*-------------------------------------------------------------------------------
xtreg sdum3 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingB
xtreg sdum3 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingC
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingD



xtreg sdum3 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingB
xtreg sdum3 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingC
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingD
*-------------------------------------------------------------------------------
xtreg sdum3 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingB
xtreg sdum3 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingC
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingD


xtreg sdum3 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingB
xtreg sdum3 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingC
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingD


xtreg sdum3 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingB
xtreg sdum3 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingC
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingD

*-------------------------------------------------------------------------------
xtreg sdum3 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingB
xtreg sdum3 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingC
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingD

xtreg sdum3 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingB
xtreg sdum3 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingC
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingD


xtreg sdum3 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingB
xtreg sdum3 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingC
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingD

*-------------------------------------------------------------------------------
xtreg sdum3 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingB
xtreg sdum3 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingC
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingD

xtreg sdum3 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingB
xtreg sdum3 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingC
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingD

xtreg sdum3 i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingB
xtreg sdum3 sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingC
xtreg sdum3 sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingD

*-------------------------------------------------------------------------------

outreg2 [AllHostsA AllHostsB AllHostsC AllHostsD Max1ListingA Max1ListingB Max1ListingC Max1ListingD  MaxMoreThan1ListingA MaxMoreThan1ListingB MaxMoreThan1ListingC MaxMoreThan1ListingD ///
		Max0EHListingA Max0EHListingB Max0EHListingC Max0EHListingD Max1EHListingA Max1EHListingB Max1EHListingC Max1EHListingD MaxMoreThan1EHListingA MaxMoreThan1EHListingB MaxMoreThan1EHListingC MaxMoreThan1EHListingD ///
		Max0PRListingA Max0PRListingB Max0PRListingC Max0PRListingD Max1PRListingA Max1PRListingB Max1PRListingC Max1PRListingD MaxMoreThan1PRListingA MaxMoreThan1PRListingB MaxMoreThan1PRListingC MaxMoreThan1PRListingD ///
		Max0SRListingA Max0SRListingB Max0SRListingC Max0SRListingD Max1SRListingA Max1SRListingB Max1SRListingC Max1SRListingD MaxMoreThan1SRListingA MaxMoreThan1SRListingB MaxMoreThan1SRListingC MaxMoreThan1SRListingD ] ///
		using "Y:\agrajg\Research\Output\sdum3_sdum3_HostClass1", replace sortvar(i.event PropPerHost c.PropPerHost#event) see excel tex
