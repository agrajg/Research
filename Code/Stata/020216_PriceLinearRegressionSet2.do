*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
char T_year[omit] 1
char T_moy[omit] 1
char T_dom[omit] 1
char T_dow[omit] 1
char T_wom2[omit] 1
char T_holiday[omit] 1
char T_holidaywom2[omit] 1

global t_T i.date
char date[omit] 1
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
*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------
// qui xtreg lprice	
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_1", replace
// qui xtreg lprice	T_RegPurgeDum 
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_2", replace
// qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active 
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_3", replace
// qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype 
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_4", replace

qui xtreg lprice	, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_5", replace
qui xtreg lprice	T_RegPurgeDum , fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active , fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_7", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype , fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_10", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_11", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_12", replace

qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_14", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_15", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_21_reg_16", replace
*-------------------------------------------------------------------------------

*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
char T_year[omit] 1
char T_moy[omit] 1
char T_dom[omit] 1
char T_dow[omit] 1
char T_wom2[omit] 1
char T_holiday[omit] 1
char T_holidaywom2[omit] 1

global t_T i.date
char date[omit] 1
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
*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------
// qui xtreg lprice	$s_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_1", replace
// qui xtreg lprice	T_RegPurgeDum $s_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_2", replace
// qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active $s_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_3", replace
// qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype $s_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_4", replace


qui xtreg lprice	$s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_5", replace
qui xtreg lprice	T_RegPurgeDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_7", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_10", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_11", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_12", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_14", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_15", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_22_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
char T_year[omit] 1
char T_moy[omit] 1
char T_dom[omit] 1
char T_dow[omit] 1
char T_wom2[omit] 1
char T_holiday[omit] 1
char T_holidaywom2[omit] 1

global t_T i.date
char date[omit] 1
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
*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------
// qui xtreg lprice	$t_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_1", replace
// qui xtreg lprice	T_RegPurgeDum $t_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_2", replace
// qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active $t_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_3", replace
// qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype $t_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_4", replace


qui xtreg lprice	$t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_5", replace
qui xtreg lprice	T_RegPurgeDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_7", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_10", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_11", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_12", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_14", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_15", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_23_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
char T_year[omit] 1
char T_moy[omit] 1
char T_dom[omit] 1
char T_dow[omit] 1
char T_wom2[omit] 1
char T_holiday[omit] 1
char T_holidaywom2[omit] 1

global t_T i.date
char date[omit] 1
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
*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------
// qui xtreg lprice	$x_HT $z_HLT $s_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_1", replace
// qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $s_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_2", replace
// qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active $x_HT $z_HLT $s_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_3", replace
// qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype $x_HT $z_HLT $s_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_4", replace


qui xtreg lprice	$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_5", replace
qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_7", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_10", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_11", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_12", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_14", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_15", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_24_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
char T_year[omit] 1
char T_moy[omit] 1
char T_dom[omit] 1
char T_dow[omit] 1
char T_wom2[omit] 1
char T_holiday[omit] 1
char T_holidaywom2[omit] 1

global t_T i.date
char date[omit] 1
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
*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------
// qui xtreg lprice	$x_HT $z_HLT $t_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_1", replace
// qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $t_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_2", replace
// qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active $x_HT $z_HLT $t_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_3", replace
// qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype $x_HT $z_HLT $t_T
// estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_4", replace


qui xtreg lprice	$x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_5", replace
qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_7", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_10", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_11", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_12", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_14", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_15", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020216_lprice_set_25_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
