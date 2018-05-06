*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
char T_year[omit] 1
char T_moy[omit] 1
char T_dom[omit] 1
char T_dow[omit] 1
char T_wom2[omit] 1
char T_holiday[omit] 1
char T_holidaywom2[omit] 1
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2


char date[omit] 19953
global t_T i.date
*-------------------------------------------------------------------------------
/*tab T_year , gen(T_yeardum)
tab T_moy , gen(T_moydum)
tab T_dom , gen(T_domdum)
tab T_dow , gen(T_dowdum)
tab T_wom2 , gen(T_wom2dum) 
tab T_holiday , gen(T_holidaydum) 
tab T_holidaywom2 , gen(T_holidaywom2dum)
drop T_yeardum1 T_moydum1 T_domdum1 T_dowdum1 T_wom2dum1 T_holidaydum1 T_holidaywom2dum1
global s_T T_yeardum* T_moydum* T_domdum* T_dowdum* T_wom2dum* T_holidaydum* T_holidaywom2dum*

tab date, gen (T_tdum)
drop T_tdum1
global t_T T_tdum* */
*-------------------------------------------------------------------------------
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount

tab H_HostType3Active, gen(htype)
tab L_listingtype, gen(ltype)

gen INT2W1 = ltype2*T_RegPurgeDum
gen INT2W2 = ltype3*T_RegPurgeDum
gen INT2W3 = ltype4*T_RegPurgeDum

gen INT2W4 = htype2*T_RegPurgeDum
gen INT2W5 = htype3*T_RegPurgeDum
gen INT2W6 = htype4*T_RegPurgeDum
gen INT2W7 = htype5*T_RegPurgeDum

gen INT3W1 = ltype2*htype2*T_RegPurgeDum 
gen INT3W2 = ltype2*htype3*T_RegPurgeDum 
gen INT3W3 = ltype2*htype4*T_RegPurgeDum 
gen INT3W4 = ltype2*htype5*T_RegPurgeDum 
gen INT3W5 = ltype3*htype2*T_RegPurgeDum 
gen INT3W6 = ltype3*htype3*T_RegPurgeDum 
gen INT3W7 = ltype3*htype4*T_RegPurgeDum 
gen INT3W8 = ltype3*htype5*T_RegPurgeDum 
gen INT3W9 = ltype4*htype2*T_RegPurgeDum 
gen INT3W10 = ltype4*htype3*T_RegPurgeDum 
gen INT3W11 = ltype4*htype4*T_RegPurgeDum 
gen INT3W12 = ltype4*htype5*T_RegPurgeDum 

*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------

*-------------------------------------------------------------------------------
preserve
xtreg sdum3 INT2W* INT3W* $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020225_sdum3_stage1_reg3", replace

foreach v of varlist  INT2W*    {
gen predvar`v' = _b[`v'] * `v'
}

foreach v of varlist  INT3W*    {
gen predvar`v' = _b[`v'] * `v'
}

foreach v in $x_HT    {
gen predvar`v' = _b[`v'] * `v'
}

foreach v in $z_HLT   {
gen predvar`v' = _b[`v'] * `v'
}

predict xb, xb
egen sumpredvar =  rowtotal(predvar*)
gen timeFE = xb - sumpredvar

collapse (mean) meantimeFE = timeFE (sd) sdtimeFE =timeFE, by (date)
merge 1:1 date using "Y:\agrajg\Research\Data\temp\010211_T_AllTimeVariables.dta"
keep if _merge ==3
drop _merge 
save "Y:\agrajg\Research\Data\temp\020225_sdum3_stage1_reg3_TimeFE.dta", replace

reg meantimeFE T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum i.T_year i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
estimates save "Y:\agrajg\Research\Output\020225_sdum3_stage2_reg3", replace
restore
*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
preserve
xtreg sdum3 $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020225_sdum3_stage1_reg1", replace


foreach v in $x_HT    {
gen predvar`v' = _b[`v'] * `v'
}

foreach v in $z_HLT   {
gen predvar`v' = _b[`v'] * `v'
}

predict xb, xb
egen sumpredvar =  rowtotal(predvar*)
gen timeFE = xb - sumpredvar

collapse (mean) meantimeFE = timeFE (sd) sdtimeFE =timeFE, by (date)
merge 1:1 date using "Y:\agrajg\Research\Data\temp\010211_T_AllTimeVariables.dta"
keep if _merge ==3
drop _merge 
save "Y:\agrajg\Research\Data\temp\020225_sdum3_stage1_reg1_TimeFE.dta", replace

reg meantimeFE T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum i.T_year i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
estimates save "Y:\agrajg\Research\Output\020225_sdum3_stage2_reg1", replace
restore
*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
preserve
xtreg sdum3 INT2W* $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020225_sdum3_stage1_reg2", replace

foreach v of varlist  INT2W*    {
gen predvar`v' = _b[`v'] * `v'
}

foreach v in $x_HT    {
gen predvar`v' = _b[`v'] * `v'
}

foreach v in $z_HLT   {
gen predvar`v' = _b[`v'] * `v'
}

predict xb, xb
egen sumpredvar =  rowtotal(predvar*)
gen timeFE = xb - sumpredvar

collapse (mean) meantimeFE = timeFE (sd) sdtimeFE =timeFE, by (date)
merge 1:1 date using "Y:\agrajg\Research\Data\temp\010211_T_AllTimeVariables.dta"
keep if _merge ==3
drop _merge 
save "Y:\agrajg\Research\Data\temp\020225_sdum3_stage1_reg2_TimeFE.dta", replace

reg meantimeFE T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum i.T_year i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
estimates save "Y:\agrajg\Research\Output\020225_sdum3_stage2_reg2", replace
restore
*-------------------------------------------------------------------------------
