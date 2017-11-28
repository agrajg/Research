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
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDumi.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_18_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_19_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre T_RegDataDiscDum T_RegActRegImpDum$x_HT $z_HLT i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_20_set_4", replace

qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_21_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_22_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDumi.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_23_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum$x_HT $z_HLT $s_T, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_24_set_4", replace
qui xtreg sdum3	T_RegPurgeDum i.H_HostType2Activepre i.L_listingtype L_listingtype#H_HostType2Activepre c.T_RegPurgeDum#H_HostType2Activepre c.T_RegPurgeDum#L_listingtype c.T_RegPurgeDum#H_HostType2Activepre#L_listingtype  T_RegDataDiscDum T_RegActRegImpDum$x_HT $z_HLT i.date, fe
estimates save "Y:\agrajg\Research\Output\020207_sdum3_25_set_4", replace
*-------------------------------------------------------------------------------
