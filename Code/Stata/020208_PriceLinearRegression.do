*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily
qui xtreg lprice	, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_1_set_1", replace
qui xtreg lprice	$s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_2_set_1", replace
qui xtreg lprice	 i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_3_set_1", replace
qui xtreg lprice	$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_4_set_1", replace
qui xtreg lprice	$x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_5_set_1", replace

qui xtreg lprice	T_RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_6_set_1", replace
qui xtreg lprice	T_RegPurgeDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_7_set_1", replace
qui xtreg lprice	T_RegPurgeDum i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_8_set_1", replace
qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_9_set_1", replace
qui xtreg lprice	T_RegPurgeDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_10_set_1", replace

qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_11_set_1", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_12_set_1", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_13_set_1", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_14_set_1", replace
qui xtreg lprice	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_15_set_1", replace

qui xtreg lprice	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_16_set_1", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_17_set_1", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_18_set_1", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_19_set_1", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_20_set_1", replace

qui xtreg lprice	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_21_set_1", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_22_set_1", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_23_set_1", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_24_set_1", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_25_set_1", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_16_set_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_17_set_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_18_set_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_19_set_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active c.T_RegPurgeDum#H_HostType1Active T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_20_set_2", replace

qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_21_set_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_22_set_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_23_set_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_24_set_2", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType1Active i.L_listingtype L_listingtype#H_HostType1Active c.T_RegPurgeDum#H_HostType1Active c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1Active#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_25_set_2", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_16_set_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_17_set_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_18_set_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_19_set_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_20_set_3", replace

qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_21_set_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_22_set_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_23_set_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_24_set_3", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_25_set_3", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_16_set_4", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_17_set_4", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_18_set_4", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_19_set_4", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_20_set_4", replace

qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_21_set_4", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_22_set_4", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_23_set_4", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_24_set_4", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_25_set_4", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_16_set_5", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum  $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_17_set_5", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum   i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_18_set_5", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_19_set_5", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_20_set_5", replace

qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_21_set_5", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum  $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_22_set_5", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum   i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_23_set_5", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_24_set_5", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Allpre i.L_listingtype L_listingtype#H_HostType2Allpre c.T_RegPurgeDum#H_HostType2Allpre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Allpre#L_listingtype  HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_25_set_5", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_16_set_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum  $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_17_set_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum   i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_18_set_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_19_set_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_20_set_6", replace

qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum , fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_21_set_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum  $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_22_set_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum   i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_23_set_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_24_set_6", replace
qui xtreg lprice	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_25_set_6", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg lprice	T_RegPurgeDum HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_16_set_7", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_17_set_7", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_18_set_7", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_19_set_7", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_20_set_7", replace

qui xtreg lprice	T_RegPurgeDum HT_ListCountAll i.L_listingtype L_listingtype#c.HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountAll#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_21_set_7", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountAll i.L_listingtype L_listingtype#c.HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountAll#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_22_set_7", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountAll i.L_listingtype L_listingtype#c.HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountAll#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_23_set_7", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountAll i.L_listingtype L_listingtype#c.HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountAll#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_24_set_7", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountAll i.L_listingtype L_listingtype#c.HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#c.HT_ListCountAll#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_25_set_7", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily

qui xtreg lprice	T_RegPurgeDum HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_16_set_8", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_17_set_8", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_18_set_8", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_19_set_8", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_20_set_8", replace

qui xtreg lprice	T_RegPurgeDum HT_ListCountActive i.L_listingtype L_listingtype#HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#HT_ListCountActive#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_21_set_8", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountActive i.L_listingtype L_listingtype#HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#HT_ListCountActive#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_22_set_8", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountActive i.L_listingtype L_listingtype#HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#HT_ListCountActive#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_23_set_8", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountActive i.L_listingtype L_listingtype#HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#HT_ListCountActive#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_24_set_8", replace
qui xtreg lprice	T_RegPurgeDum HT_ListCountActive i.L_listingtype L_listingtype#HT_ListCountActive c.T_RegPurgeDum#HT_ListCountActive c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#HT_ListCountActive#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $x_HT $z_HLT  i.date, fe
estimates save "Y:\agrajg\Research\Output\020208_lprice_25_set_8", replace
*===============================================================================


