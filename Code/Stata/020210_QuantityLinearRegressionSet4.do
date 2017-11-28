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
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_1", replace
qui xtreg sdum3	T_RegPurgeDum 
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre 
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype 
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_4", replace

qui xtreg sdum3	, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_5", replace
qui xtreg sdum3	T_RegPurgeDum , fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre , fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_7", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype , fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_8", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_9", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_10", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_11", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_12", replace

qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_13", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_14", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_15", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_41_reg_16", replace
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
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_1", replace
qui xtreg sdum3	T_RegPurgeDum $s_T
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre $s_T
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype $s_T
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_4", replace


qui xtreg sdum3	$s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_5", replace
qui xtreg sdum3	T_RegPurgeDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_7", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_8", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_9", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_10", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_11", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_12", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_13", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_14", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_15", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_42_reg_16", replace
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
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_1", replace
qui xtreg sdum3	T_RegPurgeDum $t_T
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre $t_T
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype $t_T
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_4", replace


qui xtreg sdum3	$t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_5", replace
qui xtreg sdum3	T_RegPurgeDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_7", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_8", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_9", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_10", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_11", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_12", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_13", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_14", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_15", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_43_reg_16", replace
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
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_1", replace
qui xtreg sdum3	T_RegPurgeDum $x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre $x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype $x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_4", replace


qui xtreg sdum3	$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_5", replace
qui xtreg sdum3	T_RegPurgeDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_7", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_8", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_9", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_10", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_11", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_12", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_13", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_14", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_15", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_44_reg_16", replace
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
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_1", replace
qui xtreg sdum3	T_RegPurgeDum $x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_2", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre $x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_3", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype $x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_4", replace


qui xtreg sdum3	$x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_5", replace
qui xtreg sdum3	T_RegPurgeDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_6", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_7", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_8", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_9", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_10", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_11", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_12", replace


qui xtreg sdum3	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_13", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_14", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_15", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020210_sdum3_set_45_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
