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


g sdum3ltype1 = sdum3*ltype1
g sdum3ltype3 = sdum3*ltype3
g sdum3ltype4 = sdum3*ltype4
g lpriceltype1 = lprice*ltype1
g lpriceltype3 = lprice*ltype3
g lpriceltype4 = lprice*ltype4

*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------

*-------------------------------------------------------------------------------
xtreg sdum3ltype1 lpriceltype1 lpriceltype3 lpriceltype4 $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020225_demandspecltype1", replace

xtreg sdum3ltype3 lpriceltype1 lpriceltype3 lpriceltype4 $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020225_demandspecltype3", replace

xtreg sdum3ltype4 lpriceltype1 lpriceltype3 lpriceltype4 $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020225_demandspecltype4", replace



