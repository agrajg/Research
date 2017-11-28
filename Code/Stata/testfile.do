*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtset propertyid date, daily
qui xtreg sdum3	, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_1_set_1", replace
qui xtreg sdum3	$s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_2_set_1", replace
qui xtreg sdum3	i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_3_set_1", replace
qui xtreg sdum3	$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_4_set_1", replace
qui xtreg sdum3	$x_HT $z_HLT i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_5_set_1", replace

qui xtreg sdum3	T_RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_6_set_1", replace
qui xtreg sdum3	T_RegPurgeDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_7_set_1", replace
qui xtreg sdum3	T_RegPurgeDumi.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_8_set_1", replace
qui xtreg sdum3	T_RegPurgeDum$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_9_set_1", replace
qui xtreg sdum3	T_RegPurgeDum$x_HT $z_HLT i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_10_set_1", replace

qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_11_set_1", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_12_set_1", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDumi.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_13_set_1", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_14_set_1", replace
qui xtreg sdum3	T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum$x_HT $z_HLT i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_15_set_1", replace

qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_16_set_1", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_17_set_1", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDumi.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_18_set_1", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_19_set_1", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All c.T_RegPurgeDum#H_HostType1All T_RegDataDiscDum T_RegActRegImpDum$x_HT $z_HLT i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_20_set_1", replace

qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_21_set_1", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_22_set_1", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype  T_RegDataDiscDum T_RegActRegImpDumi.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_23_set_1", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_24_set_1", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType1All i.L_listingtype L_listingtype#H_HostType1All c.T_RegPurgeDum#H_HostType1All c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType1All#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum$x_HT $z_HLT i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_25_set_1", replace
*-------------------------------------------------------------------------------
