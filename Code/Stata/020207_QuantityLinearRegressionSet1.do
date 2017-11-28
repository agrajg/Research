*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
*tab T_year , gen(T_yeardum)
*tab T_moy , gen(T_moydum)
*tab T_dom , gen(T_domdum)
*tab T_dow , gen(T_dowdum)
*tab T_wom2 , gen(T_wom2dum) 
*tab T_holiday , gen(T_holidaydum) 
*tab T_holidaywom2 , gen(T_holidaywom2dum)
*drop T_yeardum1 T_moydum1 T_domdum1 T_dowdum1 T_wom2dum1 T_holidaydum1 T_holidaywom2dum1
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2

*tab date, gen (T_tdum)
*drop T_tdum1
global t_T i.date
*-------------------------------------------------------------------------------
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------
qui xtreg sdum3	
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_1", replace
qui xtreg sdum3	T_RegPurgeDum 
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All 
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype 
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_4", replace

qui xtreg sdum3	, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_5", replace
qui xtreg sdum3	T_RegPurgeDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_7", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_8", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_9", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_10", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_11", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_12", replace

qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_13", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_14", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_15", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_11_reg_16", replace
*-------------------------------------------------------------------------------

*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
*tab T_year , gen(T_yeardum)
*tab T_moy , gen(T_moydum)
*tab T_dom , gen(T_domdum)
*tab T_dow , gen(T_dowdum)
*tab T_wom2 , gen(T_wom2dum) 
*tab T_holiday , gen(T_holidaydum) 
*tab T_holidaywom2 , gen(T_holidaywom2dum)
*drop T_yeardum1 T_moydum1 T_domdum1 T_dowdum1 T_wom2dum1 T_holidaydum1 T_holidaywom2dum1
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2

*tab date, gen (T_tdum)
*drop T_tdum1
global t_T i.date
*-------------------------------------------------------------------------------
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------
qui xtreg sdum3	$s_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_1", replace
qui xtreg sdum3	T_RegPurgeDum $s_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All $s_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype $s_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_4", replace


qui xtreg sdum3	$s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_5", replace
qui xtreg sdum3	T_RegPurgeDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_7", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_8", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_9", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_10", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_11", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_12", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_13", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_14", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_15", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_12_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
*tab T_year , gen(T_yeardum)
*tab T_moy , gen(T_moydum)
*tab T_dom , gen(T_domdum)
*tab T_dow , gen(T_dowdum)
*tab T_wom2 , gen(T_wom2dum) 
*tab T_holiday , gen(T_holidaydum) 
*tab T_holidaywom2 , gen(T_holidaywom2dum)
*drop T_yeardum1 T_moydum1 T_domdum1 T_dowdum1 T_wom2dum1 T_holidaydum1 T_holidaywom2dum1
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2

*tab date, gen (T_tdum)
*drop T_tdum1
global t_T i.date
*-------------------------------------------------------------------------------
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------
qui xtreg sdum3	$t_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_1", replace
qui xtreg sdum3	T_RegPurgeDum $t_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All $t_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype $t_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_4", replace


qui xtreg sdum3	$t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_5", replace
qui xtreg sdum3	T_RegPurgeDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_7", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_8", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_9", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_10", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_11", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_12", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_13", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_14", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_15", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_13_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
*tab T_year , gen(T_yeardum)
*tab T_moy , gen(T_moydum)
*tab T_dom , gen(T_domdum)
*tab T_dow , gen(T_dowdum)
*tab T_wom2 , gen(T_wom2dum) 
*tab T_holiday , gen(T_holidaydum) 
*tab T_holidaywom2 , gen(T_holidaywom2dum)
*drop T_yeardum1 T_moydum1 T_domdum1 T_dowdum1 T_wom2dum1 T_holidaydum1 T_holidaywom2dum1
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2

*tab date, gen (T_tdum)
*drop T_tdum1
global t_T i.date
*-------------------------------------------------------------------------------
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------
qui xtreg sdum3	$x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_1", replace
qui xtreg sdum3	T_RegPurgeDum $x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All $x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype $x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_4", replace


qui xtreg sdum3	$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_5", replace
qui xtreg sdum3	T_RegPurgeDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_7", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_8", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_9", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_10", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_11", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_12", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_13", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_14", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_15", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_14_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
*tab T_year , gen(T_yeardum)
*tab T_moy , gen(T_moydum)
*tab T_dom , gen(T_domdum)
*tab T_dow , gen(T_dowdum)
*tab T_wom2 , gen(T_wom2dum) 
*tab T_holiday , gen(T_holidaydum) 
*tab T_holidaywom2 , gen(T_holidaywom2dum)
*drop T_yeardum1 T_moydum1 T_domdum1 T_dowdum1 T_wom2dum1 T_holidaydum1 T_holidaywom2dum1
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2

*tab date, gen (T_tdum)
*drop T_tdum1
global t_T i.date
*-------------------------------------------------------------------------------
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily
*-------------------------------------------------------------------------------
qui xtreg sdum3	$x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_1", replace
qui xtreg sdum3	T_RegPurgeDum $x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All $x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype $x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_4", replace


qui xtreg sdum3	$x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_5", replace
qui xtreg sdum3	T_RegPurgeDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_7", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_8", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_9", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_10", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_11", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_12", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_13", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_14", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_15", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_set_15_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
/*===============================================================================




clear all
local i=1
	cap erase Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'.txt
	cap erase Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'.xml
	cap erase Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'.tex
	forval j=1(1)24{
		estimates use "Y:\agrajg\Research\Output\020207_sdum3_`j'_set_`i'.ster"
		outreg2 using "Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'", 	cttop(Reg `j' Set `i') 
		estimates use "Y:\agrajg\Research\Output\020207_sdum3_`j'_set_`i'.ster"
		outreg2 using "Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'", 	cttop(Reg `j' Set `i') 
		estimates use "Y:\agrajg\Research\Output\020207_sdum3_`j'_set_`i'.ster"
		outreg2 using "Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'", 	cttop(Reg `j' Set `i') 
		estimates use "Y:\agrajg\Research\Output\020207_sdum3_`j'_set_`i'.ster"
		outreg2 using "Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'", 	cttop(Reg `j' Set `i') 
		estimates use "Y:\agrajg\Research\Output\020207_sdum3_`j'_set_`i'.ster"
		outreg2 using "Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'", 	cttop(Reg `j' Set `i') 
	}
estimates use "Y:\agrajg\Research\Output\020207_sdum3_25_set_`i'.ster"
outreg2 using "Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'", 	cttop(Reg `j' Set `i')  ///
																					tex excel
*===============================================================================


clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg sdum3	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_16_set_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_17_set_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_18_set_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_19_set_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_20_set_2", replace

qui xtreg sdum3	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_21_set_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_22_set_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_23_set_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_24_set_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_25_set_2", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_16_set_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_17_set_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_18_set_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_19_set_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_20_set_3", replace

qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_21_set_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_22_set_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_23_set_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_24_set_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_25_set_3", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_16_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_17_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_18_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_19_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_20_set_4", replace

qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_21_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_22_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_23_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_24_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_25_set_4", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_16_set_5", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum  $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_17_set_5", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum   i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_18_set_5", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_19_set_5", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_20_set_5", replace

qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_21_set_5", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum  $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_22_set_5", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum   i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_23_set_5", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_24_set_5", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_25_set_5", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_16_set_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum  $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_17_set_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum   i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_18_set_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_19_set_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_20_set_6", replace

qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_21_set_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum  $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_22_set_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum   i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_23_set_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_24_set_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_25_set_6", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg sdum3	T_RegPurgeDum HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_16_set_7", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_17_set_7", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_18_set_7", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_19_set_7", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_20_set_7", replace

qui xtreg sdum3	T_RegPurgeDum HT_ListCountAll i.L_listingtype L_listingtype#c.HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountAll#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_21_set_7", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountAll i.L_listingtype L_listingtype#c.HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountAll#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_22_set_7", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountAll i.L_listingtype L_listingtype#c.HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountAll#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_23_set_7", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountAll i.L_listingtype L_listingtype#c.HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountAll#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_24_set_7", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountAll i.L_listingtype L_listingtype#c.HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountAll#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_25_set_7", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg sdum3	T_RegPurgeDum HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_16_set_8", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_17_set_8", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_18_set_8", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_19_set_8", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_20_set_8", replace

qui xtreg sdum3	T_RegPurgeDum HT_ListCountActive i.L_listingtype L_listingtype#HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#HT_ListCountActive#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_21_set_8", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountActive i.L_listingtype L_listingtype#HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#HT_ListCountActive#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_22_set_8", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountActive i.L_listingtype L_listingtype#HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#HT_ListCountActive#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_23_set_8", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountActive i.L_listingtype L_listingtype#HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#HT_ListCountActive#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_24_set_8", replace
qui xtreg sdum3	T_RegPurgeDum HT_ListCountActive i.L_listingtype L_listingtype#HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#HT_ListCountActive#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_25_set_8", replace
*===============================================================================


