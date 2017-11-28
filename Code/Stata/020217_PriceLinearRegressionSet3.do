*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
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
qui xtreg lprice	
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_1", replace
qui xtreg lprice	T_RegPurgeDum 
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre 
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype 
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_4", replace

qui xtreg lprice	, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_5", replace
qui xtreg lprice	T_RegPurgeDum , fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre , fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_7", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype , fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_10", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_11", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_12", replace

qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_14", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_15", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_31_reg_16", replace
*-------------------------------------------------------------------------------

*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
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
qui xtreg lprice	$s_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_1", replace
qui xtreg lprice	T_RegPurgeDum $s_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre $s_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype $s_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_4", replace


qui xtreg lprice	$s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_5", replace
qui xtreg lprice	T_RegPurgeDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_7", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_10", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_11", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_12", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_14", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_15", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_32_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
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
qui xtreg lprice	$t_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_1", replace
qui xtreg lprice	T_RegPurgeDum $t_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre $t_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype $t_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_4", replace


qui xtreg lprice	$t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_5", replace
qui xtreg lprice	T_RegPurgeDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_7", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_10", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_11", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_12", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_14", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_15", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_33_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
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
qui xtreg lprice	$x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_1", replace
qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre $x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype $x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_4", replace


qui xtreg lprice	$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_5", replace
qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_7", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_10", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_11", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_12", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_14", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_15", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_34_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
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
qui xtreg lprice	$x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_1", replace
qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre $x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype $x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_4", replace


qui xtreg lprice	$x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_5", replace
qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_7", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_10", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_11", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_12", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_14", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_15", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre HT_ListCountAll i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020217_lprice_set_35_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================