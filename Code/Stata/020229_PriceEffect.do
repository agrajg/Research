// *===============================================================================
// clear all
// set more off
// use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
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
// xtreg lprice $x_HT $z_HLT $t_T, fe
// estimates save "Y:\agrajg\Research\Output\020229_PriceEffect_Spec1_Stage1", replace
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
// estimates save "Y:\agrajg\Research\Output\020229_PriceEffect_Spec1_Stage2", replace
// // restore
// *-------------------------------------------------------------------------------
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
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
*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------
// preserve
xtreg lprice T_RegPurgeDum T_RegCalledIllegal T_RegDebate T_RegRedSupply  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020229_PriceEffect_Spec2", replace
// restore
*-------------------------------------------------------------------------------
