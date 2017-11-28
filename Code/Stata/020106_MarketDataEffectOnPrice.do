clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonalsOnlyBooked.dta", clear
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


local i=8
xtreg lprice lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount $SEASONAL 	if date < td(01oct2015)		, 	fe vce(robust)
predict lpriceBefore_xb , xb
predict lpriceBefore_xbu , xbu
predict lpriceBefore_e , e
predict lpriceBefore_u , u

by propertyid : carryforward lpriceBefore_u , gen(lpriceBefore_u1)
gen lpriceBefore_xbnt = 	 _b[_cons] + /// 
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

gen lpriceBefore_e1 = lprice -lpriceBefore_xb - lpriceBefore_u1
gen lpriceBefore_xbu1 = lpriceBefore_xb + lpriceBefore_u1

xtreg lprice lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount $SEASONAL 	if date >= td(01oct2015)	, 	fe vce(robust)
predict lpriceAfter_xb  , xb
gen lpriceAfter_xbnt = 	 _b[_cons] + ///
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
predict lpriceAfter_xbu , xbu
predict lpriceAfter_e , e
predict lpriceAfter_u , u
xtreg lprice lPropAge lHostAge lCombinedHostAge lPropGuestPastCount lHostGuestPastCount lPropASCount lPropBSCount lPropRSCount lHostASCount lHostBSCount lHostRSCount $SEASONAL  								, 	fe vce(robust)
predict lpriceFullSample_xb  , xb
gen lpriceFullSample_xbnt = 	 _b[_cons] + ///
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
predict lpriceFullSample_xbu , xbu
predict lpriceFullSample_e , e
predict lpriceFullSample_u , u


*keep if propertyid ==364043 | propertyid ==394474 | propertyid ==839336 | propertyid == 400546
*keep if propertyid ==364043 
*twoway 	(line countmktprop date, sort lcolor(red) lwidth(medium) lpattern(solid)) ///
*		(line countmktprop_pred date, sort lcolor(red) lwidth(thin) lpattern(dash)) ///
*		(line countpidR date, sort lcolor(dknavy) lwidth(medium) lpattern(solid)) ///
*		(line countpidR_pred date, sort lcolor(dknavy) lwidth(thin) lpattern(dash)) ///

twoway 	(line lpriceBefore_e1 date , sort lwidth(thin))  ///
		(line lpriceAfter_e date if date >= td(01oct2015), sort)  ///
		(line lpriceFullSample_e date, sort lcolor(mint) lwidth(medium) lpattern(dot)) ///
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

graph save Graph 	"Y:\agrajg\Research\Output\020104_lpriceSeasonal_eSpec`i'.gph", replace
graph export 		"Y:\agrajg\Research\Output\020104_lpriceSeasonal_eSpec`i'.png" , width(2100) height(1500) replace
graph export 		"T:\agrajg\Output\020104_lpriceSeasonal_eSpec`i'.png" , width(2100) height(1500) replace

twoway 	(line lpriceBefore_xbu1 date , sort lwidth(thin))  ///
		(line lpriceAfter_xbu date if date >= td(01oct2015), sort)  ///
		(line lpriceFullSample_xbu date, sort lcolor(mint)  lwidth(medium) lpattern(dot)) ///
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

		
graph save Graph 	"Y:\agrajg\Research\Output\020104_lpriceSeasonal_xbuSpec`i'.gph", replace
graph export 		"Y:\agrajg\Research\Output\020104_lpriceSeasonal_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export 		"T:\agrajg\Output\020104_lpriceSeasonal_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway 	(line lpriceBefore_xbnt date , sort lwidth(thin))  ///
		(line lpriceAfter_xbnt date if date >= td(01oct2015), sort)  ///
		(line lpriceFullSample_xbnt date, sort lcolor(mint)  lwidth(medium) lpattern(dot)) ///
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
		
graph save Graph 	"Y:\agrajg\Research\Output\020104_lpriceSeasonal_xbntSpec`i'.gph", replace
graph export 		"Y:\agrajg\Research\Output\020104_lpriceSeasonal_xbntSpec`i'.png" , width(2100) height(1500) replace
graph export 		"T:\agrajg\Output\020104_lpriceSeasonal_xbntSpec`i'.png" , width(2100) height(1500) replace
		
/*
forvalues i = 1(1)8 {
*local i=1
xtreg lprice $SET``i'' 		, fe vce(robust)
predict lpriceFullSample_xb if propertyid == 364043, xb
predict lpriceFullSample_xbu if propertyid == 364043, xbu
predict lpriceFullSample_e if propertyid == 364043, e
estimates save "Y:\agrajg\Research\Output\lpriceFullSampleSpec`i'.ster", replace


twoway (line lpriceFullSample_xb date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\lpriceFullSample_xbSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\lpriceFullSample_xbSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\lpriceFullSample_xbSpec`i'.png" , width(2100) height(1500) replace

twoway (line lpriceFullSample_xbu date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\lpriceFullSample_xbuSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\lpriceFullSample_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\lpriceFullSample_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway (line lpriceFullSample_e date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\lpriceFullSample_eSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\lpriceFullSample_eSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\lpriceFullSample_eSpec`i'.png" , width(2100) height(1500) replace
drop *_xb *_xbu *_e
 

xtreg lprice $SET``i'' $SEASONAL  		, fe vce(robust)
predict lpriceFullSample_xb if propertyid == 364043, xb
predict lpriceFullSample_xbu if propertyid == 364043, xbu
predict lpriceFullSample_e if propertyid == 364043, e
estimates save "Y:\agrajg\Research\Output\lpriceSeasonalFullSampleSpec`i'.ster", replace


twoway (line lpriceFullSample_xb date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\lpriceSeasonalFullSample_xbSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\lpriceSeasonalFullSample_xbSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\lpriceSeasonalFullSample_xbSpec`i'.png" , width(2100) height(1500) replace

twoway (line lpriceFullSample_xbu date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\lpriceSeasonalFullSample_xbuSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\lpriceSeasonalFullSample_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\lpriceSeasonalFullSample_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway (line lpriceFullSample_e date, sort)  if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\lpriceSeasonalFullSample_eSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\lpriceSeasonalFullSample_eSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\lpriceSeasonalFullSample_eSpec`i'.png" , width(2100) height(1500) replace

drop *_xb *_xbu *_e
}






*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------

forvalues i = 1(1)8 {
 
xtreg lprice $SET``i'' if date < td(01oct2015)		, fe vce(robust)
predict lpriceBefore_xb if propertyid == 364043, xb
predict lpriceBefore_xbu if propertyid == 364043, xbu
predict lpriceBefore_e if propertyid == 364043, e
estimates save "Y:\agrajg\Research\Output\lpriceBeforeSpec`i'.ster", replace

xtreg lprice $SET``i'' if date >= td(01oct2015)	, fe vce(robust)
predict lpriceAfter_xb  if propertyid == 364043 & date >=td(01oct2015), xb
predict lpriceAfter_xbu if propertyid == 364043  & date >=td(01oct2015), xbu
predict lpriceAfter_e if propertyid == 364043  & date >=td(01oct2015), e
estimates save "Y:\agrajg\Research\Output\lpriceAfterSpec`i'.ster", replace

twoway (line lpriceBefore_xb date, sort) (line lpriceAfter_xb date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\lprice_xbSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\lprice_xbSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\lprice_xbSpec`i'.png" , width(2100) height(1500) replace

twoway (line lpriceBefore_xbu date, sort) (line lpriceAfter_xbu date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\lprice_xbuSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\lprice_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\lprice_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway (line lpriceBefore_e date, sort) (line lpriceAfter_e date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\lprice_eSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\lprice_eSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\lprice_eSpec`i'.png" , width(2100) height(1500) replace

drop *_xb *_xbu *_e
}



forvalues i = 1(1)8 {
 
xtreg lprice $SET``i'' $SEASONAL if date < td(01oct2015)		, fe vce(robust)
predict lpriceBefore_xb if propertyid == 364043, xb
predict lpriceBefore_xbu if propertyid == 364043, xbu
predict lpriceBefore_e if propertyid == 364043, e
estimates save "Y:\agrajg\Research\Output\lpriceSeasonalBeforeSpec`i'.ster", replace

xtreg lprice $SET``i'' $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
predict lpriceAfter_xb  if propertyid == 364043 & date >=td(01oct2015), xb
predict lpriceAfter_xbu if propertyid == 364043  & date >=td(01oct2015), xbu
predict lpriceAfter_e if propertyid == 364043  & date >=td(01oct2015), e
estimates save "Y:\agrajg\Research\Output\lpriceSeasonalAfterSpec`i'.ster", replace

twoway (line lpriceBefore_xb date, sort) (line lpriceAfter_xb date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\lpriceSeasonal_xbSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\lpriceSeasonal_xbSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\lpriceSeasonal_xbSpec`i'.png" , width(2100) height(1500) replace

twoway (line lpriceBefore_xbu date, sort) (line lpriceAfter_xbu date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\lpriceSeasonal_xbuSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\lpriceSeasonal_xbuSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\lpriceSeasonal_xbuSpec`i'.png" , width(2100) height(1500) replace

twoway (line lpriceBefore_e date, sort) (line lpriceAfter_e date, sort) if propertyid == 364043
graph save Graph "Y:\agrajg\Research\Output\lpriceSeasonal_eSpec`i'.gph", replace
graph export "Y:\agrajg\Research\Output\lpriceSeasonal_eSpec`i'.png" , width(2100) height(1500) replace
graph export "T:\agrajg\Output\lpriceSeasonal_eSpec`i'.png" , width(2100) height(1500) replace

drop *_xb *_xbu *_e

}

/*
xtreg lprice $SET1 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceBeforeSpecSeasonal1.ster", replace
xtreg lprice $SET1 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceAfterSpecSeasonal1.ster", replace

xtreg lprice $SET2 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceBeforeSpecSeasonal2.ster", replace
xtreg lprice $SET2 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceAfterSpecSeasonal2.ster", replace

xtreg lprice $SET3 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceBeforeSpecSeasonal3.ster", replace
xtreg lprice $SET3 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceAfterSpecSeasonal3.ster", replace

xtreg lprice $SET4 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceBeforeSpecSeasonal4.ster", replace
xtreg lprice $SET4 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceAfterSpecSeasonal4.ster", replace

xtreg lprice $SET5 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceBeforeSpecSeasonal5.ster", replace
xtreg lprice $SET5 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceAfterSpecSeasonal5.ster", replace

xtreg lprice $SET6 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceBeforeSpecSeasonal6.ster", replace
xtreg lprice $SET6 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceAfterSpecSeasonal6.ster", replace

xtreg lprice $SET7 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceBeforeSpecSeasonal7.ster", replace
xtreg lprice $SET7 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceAfterSpecSeasonal7.ster", replace

xtreg lprice $SET8 $SEASONAL if date < td(01oct2015)		, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceBeforeSpecSeasonal8.ster", replace
xtreg lprice $SET8 $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
estimates save "Y:\agrajg\Research\Output\lpriceAfterSpecSeasonal8.ster", replace
*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------



propertyid
364043
394474
839336
400546

estimates use "Y:\agrajg\Research\Output\lpriceBeforeSpec1.ster"
predict lpriceBefore_xb if propertyid == 364043, xb
predict lpriceBefore_e if propertyid == 364043, e

estimates use "Y:\agrajg\Research\Output\lpriceAfterSpec1.ster"
predict lpriceAfter_xb if  date >=td(01oct2015), xb
predict lpriceAfter_e if   date >=td(01oct2015), e

twoway (line lpriceBefore_e date, sort)  if propertyid == 364043
twoway (line lpriceBefore_xb date, sort) (line lpriceAfter_xb date, sort) if propertyid == 364043


/*
xtreg lprice $SEASONAL if date < td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date < td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date < td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date < td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date < td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date < td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date < td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date < td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date >= td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date < td(01oct2015)	, fe vce(robust)
xtreg lprice $SEASONAL if date >= td(01oct2015)	, fe vce(robust)





PropAge 
HostAge CombinedHostAge 

PropGuestPastCount 
HostGuestPastCount 

PropASCount PropBSCount PropRSCount 
HostASCount HostBSCount HostRSCount 






/*
reg price i.propertytype i.listingtype age i.state i.neighborhood bedrooms bathrooms maxguests i.cancellationpolicy securitydeposit cleaningfee extrapeoplefee i.checkintime checkinperiod i.checkouttime i.minimumstay year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if date < td(01oct2015)


capture drop yhat*
capture drop ue*

xtreg lprice year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2 if date < td(01oct2015), fe
predict ue1, ue 
gen yhat1 = lprice - ue1
xtreg lprice year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2 if date >= td(01oct2015), fe
predict ue2 if date >= td(01oct2015) , ue 
gen yhat2 = lprice - ue2 if date >= td(01oct2015)

twoway (line yhat1 date, sort) (line yhat2 date, sort) if pid==22784



*** Price
xtreg lprice i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsA
xtreg lprice i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsB
*-------------------------------------------------------------------------------
xtreg lprice i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingB

xtreg lprice i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingB
*-------------------------------------------------------------------------------
xtreg lprice i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingB

xtreg lprice i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingB

xtreg lprice i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingB
*-------------------------------------------------------------------------------
xtreg lprice i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingB

xtreg lprice i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingB

xtreg lprice i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingB
*-------------------------------------------------------------------------------
xtreg lprice i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingB

xtreg lprice i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingB

xtreg lprice i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingB
*-------------------------------------------------------------------------------

outreg2 [AllHostsA AllHostsB Max1ListingA Max1ListingB MaxMoreThan1ListingA MaxMoreThan1ListingB ///
		Max0EHListingA Max0EHListingB Max1EHListingA Max1EHListingB MaxMoreThan1EHListingA MaxMoreThan1EHListingB ///
		Max0PRListingA Max0PRListingB Max1PRListingA Max1PRListingB MaxMoreThan1PRListingA MaxMoreThan1PRListingB ///
		Max0SRListingA Max0SRListingB Max1SRListingA Max1SRListingB MaxMoreThan1SRListingA MaxMoreThan1SRListingB ] ///
		using "Y:\agrajg\Research\Output\lprice_HostClass1", replace sortvar(i.event PropPerHost c.PropPerHost#event) see excel tex
