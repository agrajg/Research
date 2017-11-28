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
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_1", replace
qui xtreg lprice	T_RegPurgeDum 
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_2", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive 
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_3", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype 
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_4", replace

qui xtreg lprice	, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_5", replace
qui xtreg lprice	T_RegPurgeDum , fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_6", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive , fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_7", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype , fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_10", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_11", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_12", replace

qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_14", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_15", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_81_reg_16", replace
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
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_1", replace
qui xtreg lprice	T_RegPurgeDum $s_T
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_2", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive $s_T
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_3", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype $s_T
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_4", replace


qui xtreg lprice	$s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_5", replace
qui xtreg lprice	T_RegPurgeDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_6", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_7", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_10", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_11", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_12", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_14", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_15", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_82_reg_16", replace
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
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_1", replace
qui xtreg lprice	T_RegPurgeDum $t_T
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_2", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive $t_T
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_3", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype $t_T
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_4", replace


qui xtreg lprice	$t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_5", replace
qui xtreg lprice	T_RegPurgeDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_6", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_7", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_10", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_11", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_12", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_14", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_15", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_83_reg_16", replace
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
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_1", replace
qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_2", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive $x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_3", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype $x_HT $z_HLT $s_T
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_4", replace


qui xtreg lprice	$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_5", replace
qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_6", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_7", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_10", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_11", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_12", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_14", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_15", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_84_reg_16", replace
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
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_1", replace
qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_2", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive $x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_3", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype $x_HT $z_HLT $t_T
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_4", replace


qui xtreg lprice	$x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_5", replace
qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_6", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_7", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_8", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_9", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_10", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_11", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_12", replace


qui xtreg lprice	T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_13", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_14", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_15", replace
qui xtreg lprice	T_RegPurgeDum c.HT_ListCountActive i.L_listingtype L_listingtype#c.HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountActive#L_listingtype T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $t_T, fe
estimates save "Y:\agrajg\Research\Output\020222_lprice_set_85_reg_16", replace
*-------------------------------------------------------------------------------


*===============================================================================
*===============================================================================
