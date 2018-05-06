// *===============================================================================
// clear all
// set more off
// use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
// *-------------------------------------------------------------------------------
// global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2 
// global t_T i.date
// *-------------------------------------------------------------------------------
// foreach var of varlist  HT_*  LT_*  {
// orthpoly `var', generate(O_`var'*) degree(4)
// }
// global x_HT O_HT_*
// global z_HLT O_LT_*
//
// *global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
// *global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
// *-------------------------------------------------------------------------------
// xtset propertyid date, daily
// *-------------------------------------------------------------------------------
// // preserve
// xtreg sdum3 $x_HT $z_HLT $t_T, fe
// estimates save "Y:\agrajg\Research\Output\020230_QuantityEffect_Spec1_Stage1", replace
// predict xb, xb
// // predict ue, ue
// // predict xbu, xbu
// // predict u, u
// // predict e, e
// gen pred = _b[_cons] 
// foreach var of varlist  O_HT_*  O_LT_*  {
// replace pred = pred + _b[`var']*`var'
// }
// gen tfe = xb - pred
// collapse (mean)tfe , by (date)
// *-------------------------------------------------------------------------------
// * Adding all time variables, regulatory events, seasonality etc
// merge m:1 date using "Y:\agrajg\Research\Data\temp\010211_T_AllTimeVariables.dta"
// keep if _merge==3
// drop _merge
// count
// reg tfe  T_RegPurgeDum T_RegCalledIllegal T_RegDebate T_RegRedSupply  T_RegDataDiscDum T_RegActRegImpDum $s_T
// estimates save "Y:\agrajg\Research\Output\020230_QuantityEffect_Spec1_Stage2", replace
// // restore
// *-------------------------------------------------------------------------------



*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2 
global t_T i.date
*-------------------------------------------------------------------------------
foreach var of varlist  HT_*  LT_*  {
orthpoly `var', generate(O_`var'*) degree(4)
}
global x_HT O_HT_*
global z_HLT O_LT_*

*global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
*global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
xtset propertyid date, daily
*-------------------------------------------------------------------------------

// reg sdum3 lprice
// estimates save "Y:\agrajg\Research\Output\020232_PrilinimaryDemandEstimates_Spec1", replace
//
// xtreg sdum3 lprice, fe
// estimates save "Y:\agrajg\Research\Output\020232_PrilinimaryDemandEstimates_Spec2", replace
//
// xtreg sdum3 lprice  $t_T, fe
// estimates save "Y:\agrajg\Research\Output\020232_PrilinimaryDemandEstimates_Spec3", replace

xtreg sdum3 lprice $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020232_PrilinimaryDemandEstimates_Spec4", replace

//
// preserve
// keep in 1/2
// estimates use "Y:\agrajg\Research\Output\020232_PrilinimaryDemandEstimates_Spec1.ster"
// outreg2 using Y:\agrajg\Research\Output\020232_PrilinimaryDemandEstimates, replace ///
// 	addnote(somenotes..) ///
// 	cttop(OLS) ///
// 	dec(3) ///
// 	keep(lprice) ///
// 	sortvar(lprice) ///
// 	label ///
// 	addtext(Listing FE, NO, ///
// 			Market/time FE, NO, ///
// 			Time varying product attributes , NO , ///
// 			Reviews, NO)
//
// estimates use "Y:\agrajg\Research\Output\020232_PrilinimaryDemandEstimates_Spec2.ster"
// outreg2 using Y:\agrajg\Research\Output\020232_PrilinimaryDemandEstimates,  ///
// 	cttop(OLS) ///
// 	dec(3) ///
// 	keep(lprice) ///
// 	sortvar(lprice) ///
// 	label ///
// 	addtext(Listing FE, YES, ///
// 			Market/time FE, NO, ///
// 			Time varying product attributes , NO , ///
// 			Reviews, NO)
//			
// estimates use "Y:\agrajg\Research\Output\020232_PrilinimaryDemandEstimates_Spec3.ster"
// outreg2 using Y:\agrajg\Research\Output\020232_PrilinimaryDemandEstimates,  ///
// 	cttop(OLS) ///
// 	dec(3) ///
// 	keep(lprice) ///
// 	sortvar(lprice) ///
// 	label ///
// 	addtext(Listing FE, YES, ///
// 			Market/time FE, YES, ///
// 			Time varying product attributes , NO , ///
// 			Reviews, NO)
//			
// estimates use "Y:\agrajg\Research\Output\020232_PrilinimaryDemandEstimates_Spec4.ster"
// outreg2 using Y:\agrajg\Research\Output\020232_PrilinimaryDemandEstimates,  ///
// 	cttop(OLS) ///
// 	dec(3) ///
// 	keep(lprice) ///
// 	sortvar(lprice) ///
// 	label ///
// 	tex(frag pr) ///
// 	addtext(Listing FE, YES, ///
// 			Market/time FE, YES, ///
// 			Time varying product attributes , YES , ///
// 			Reviews, NO)
// restore
*-------------------------------------------------------------------------------

* Computing consumer surplus
predict uhat, u
capture drop pred
gen pred = _b[_cons] 
foreach var of varlist O_*  {
replace pred = pred + _b[`var']*`var'
}
forval d = 19936(1)20909 {
replace pred = pred + _b[`d'.date]*`d'.date
}
gen WTP = (exp((1-pred-uhat)/_b[lprice])) if sdum3 == 1

g CS_Price_before = WTP - price if sdum3==1 & T_RegPurgeDum == 0
g CS_Price_after = WTP - price if sdum3==1 & T_RegPurgeDum == 1
g CS_Price_after_CF = WTP - price*(1+ 0.005) if sdum3==1 & T_RegPurgeDum == 1

sum CS_Price_before CS_Price_after CS_Price_after_CF if WTP <= 100000000


g CS_Booking_Change = _b[lprice] * exp(-((pred+uhat)/_b[lprice])) * exp(1-0.021)  if sdum3==1 & T_RegPurgeDum == 1


