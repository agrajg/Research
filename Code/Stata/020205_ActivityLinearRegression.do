*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum12																							, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0011", replace	
xtreg sdum12 																			$S_T 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0012", replace
xtreg sdum12 T_RegPurgeDum																			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0021", replace
xtreg sdum12 T_RegPurgeDum 																$S_T		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0022", replace
xtreg sdum12 				T_RegDataDiscDum T_RegActRegImpDum										, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0031", replace
xtreg sdum12 				T_RegDataDiscDum T_RegActRegImpDum 							$S_T		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0032", replace
xtreg sdum12 T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum										, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0041", replace
xtreg sdum12 T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum 							$S_T		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0042", replace
xtreg sdum12 																$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0051", replace
xtreg sdum12 																$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0052", replace
xtreg sdum12 T_RegPurgeDum													$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0061", replace
xtreg sdum12 T_RegPurgeDum 													$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0062", replace
xtreg sdum12 				T_RegDataDiscDum T_RegActRegImpDum				$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0071", replace
xtreg sdum12 				T_RegDataDiscDum T_RegActRegImpDum 				$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0072", replace
xtreg sdum12 T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum				$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0081", replace
xtreg sdum12 T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum 				$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0082", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum12					HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll																		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0111", replace
xtreg sdum12 				HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll																$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0112", replace
xtreg sdum12 T_RegPurgeDum	HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll																		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0121", replace
xtreg sdum12 T_RegPurgeDum 	HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll																$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0122", replace
xtreg sdum12 				HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum									, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0131", replace
xtreg sdum12 				HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0132", replace
xtreg sdum12 T_RegPurgeDum 	HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum									, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0141", replace
xtreg sdum12 T_RegPurgeDum 	HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0142", replace
xtreg sdum12					HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll													$X_HT $Z_LT , fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0151", replace
xtreg sdum12 				HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll													$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0152", replace
xtreg sdum12 T_RegPurgeDum	HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll													$X_HT $Z_LT , fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0161", replace
xtreg sdum12 T_RegPurgeDum 	HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll													$X_HT $Z_LT $S_T	 , fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0162", replace
xtreg sdum12 				HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum				$X_HT $Z_LT , fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0171", replace
xtreg sdum12 				HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 				$X_HT $Z_LT $S_T	 , fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0172", replace
xtreg sdum12 T_RegPurgeDum 	HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum				$X_HT $Z_LT , fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0181", replace
xtreg sdum12 T_RegPurgeDum 	HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 				$X_HT $Z_LT $S_T	 , fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0182", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum12					HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive																, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0211", replace
xtreg sdum12 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive														$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0212", replace
xtreg sdum12 T_RegPurgeDum	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive																, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0221", replace
xtreg sdum12 T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive														$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0222", replace
xtreg sdum12 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum							, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0231", replace
xtreg sdum12 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 					$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0232", replace
xtreg sdum12 T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum							, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0241", replace
xtreg sdum12 T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 					$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0242", replace
xtreg sdum12					HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive											$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0251", replace
xtreg sdum12 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive											$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0252", replace
xtreg sdum12 T_RegPurgeDum	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive											$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0261", replace
xtreg sdum12 T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive											$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0262", replace
xtreg sdum12 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum		$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0271", replace
xtreg sdum12 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 		$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0272", replace
xtreg sdum12 T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum		$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0281", replace
xtreg sdum12 T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 		$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0282", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum12					HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																						, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0311", replace
xtreg sdum12 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0312", replace
xtreg sdum12 T_RegPurgeDum	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																						, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0321", replace
xtreg sdum12 T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0322", replace
xtreg sdum12 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum													, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0331", replace
xtreg sdum12 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum 							$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0332", replace
xtreg sdum12 T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum													, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0341", replace
xtreg sdum12 T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum 							$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0342", replace
xtreg sdum12					HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0351", replace
xtreg sdum12 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0352", replace
xtreg sdum12 T_RegPurgeDum	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0361", replace
xtreg sdum12 T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0362", replace
xtreg sdum12 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0371", replace
xtreg sdum12 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0372", replace
xtreg sdum12 T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0381", replace
xtreg sdum12 T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0382", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum12					HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0411", replace
xtreg sdum12 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0412", replace
xtreg sdum12 T_RegPurgeDum	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0421", replace
xtreg sdum12 T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0422", replace
xtreg sdum12 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0431", replace
xtreg sdum12 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum 							$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0432", replace
xtreg sdum12 T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0441", replace
xtreg sdum12 T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum 							$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0442", replace
xtreg sdum12					HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0451", replace
xtreg sdum12 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0452", replace
xtreg sdum12 T_RegPurgeDum	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0461", replace
xtreg sdum12 T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0462", replace
xtreg sdum12 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0471", replace
xtreg sdum12 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0472", replace
xtreg sdum12 T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0481", replace
xtreg sdum12 T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0482", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum12					H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0511", replace
xtreg sdum12 				H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0512", replace
xtreg sdum12 T_RegPurgeDum	H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0521", replace
xtreg sdum12 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0522", replace
xtreg sdum12 				H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0531", replace
xtreg sdum12 				H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0532", replace
xtreg sdum12 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0541", replace
xtreg sdum12 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0542", replace
xtreg sdum12					H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0551", replace
xtreg sdum12 				H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0552", replace
xtreg sdum12 T_RegPurgeDum	H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0561", replace
xtreg sdum12 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0562", replace
xtreg sdum12 				H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0571", replace
xtreg sdum12 				H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0572", replace
xtreg sdum12 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0581", replace
xtreg sdum12 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0582", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum12					H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0611", replace
xtreg sdum12 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0612", replace
xtreg sdum12 T_RegPurgeDum	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0621", replace
xtreg sdum12 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0622", replace	
xtreg sdum12 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0631", replace
xtreg sdum12 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0632", replace
xtreg sdum12 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0641", replace
xtreg sdum12 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0642", replace
xtreg sdum12					H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0651", replace
xtreg sdum12 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0652", replace
xtreg sdum12 T_RegPurgeDum	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0661", replace
xtreg sdum12 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0662", replace
xtreg sdum12 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0671", replace
xtreg sdum12 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0672", replace
xtreg sdum12 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0681", replace
xtreg sdum12 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0682", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum12					c.T_RegPurgeDum#H_HostType1All																					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0711", replace
xtreg sdum12 				c.T_RegPurgeDum#H_HostType1All															$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0712", replace
xtreg sdum12 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1All																					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0721", replace
xtreg sdum12 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1All															$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0722", replace
xtreg sdum12 				c.T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum											, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0731", replace
xtreg sdum12 			 	c.T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum 					$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0732", replace
xtreg sdum12 T_RegPurgeDum  	c.T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum											, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0741", replace
xtreg sdum12 T_RegPurgeDum  	c.T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum 					$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0742", replace
xtreg sdum12					c.T_RegPurgeDum#H_HostType1All															$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0751", replace
xtreg sdum12 				c.T_RegPurgeDum#H_HostType1All															$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0752", replace
xtreg sdum12 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1All															$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0761", replace
xtreg sdum12 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1All															$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0762", replace
xtreg sdum12 				c.T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum					$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0771", replace
xtreg sdum12 			 	c.T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum 					$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0772", replace
xtreg sdum12 T_RegPurgeDum  	c.T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum					$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0781", replace
xtreg sdum12 T_RegPurgeDum  	c.T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum 					$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0782", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum12					c.T_RegPurgeDum#H_HostType1Active																					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0811", replace
xtreg sdum12 				c.T_RegPurgeDum#H_HostType1Active															$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0812", replace
xtreg sdum12 T_RegPurgeDum	c.T_RegPurgeDum#H_HostType1Active																					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0821", replace
xtreg sdum12 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active															$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0822", replace
xtreg sdum12 				c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0831", replace
xtreg sdum12 				c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 						$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0832", replace
xtreg sdum12 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0841", replace
xtreg sdum12 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 						$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0842", replace
xtreg sdum12					c.T_RegPurgeDum#H_HostType1Active															$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0851", replace
xtreg sdum12 				c.T_RegPurgeDum#H_HostType1Active															$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0852", replace
xtreg sdum12 T_RegPurgeDum	c.T_RegPurgeDum#H_HostType1Active															$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0861", replace
xtreg sdum12 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active															$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0862", replace
xtreg sdum12 				c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum						$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0871", replace
xtreg sdum12 				c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 						$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0872", replace
xtreg sdum12 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum						$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0881", replace
xtreg sdum12 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 						$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_0882", replace
*-------------------------------------------------------------------------------





/*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum12, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_1", replace
xtreg sdum12 $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_2", replace
xtreg sdum12 RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_3", replace
xtreg sdum12 RegPurgeDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_4", replace
xtreg sdum12 RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_5", replace
xtreg sdum12 RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_6", replace
xtreg sdum12 RegPurgeDum RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_7", replace
xtreg sdum12 RegPurgeDum RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_8", replace

*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
* ListCountAll 
xtreg sdum12 ListCountAll, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_9", replace
xtreg sdum12 ListCountAll $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_10", replace
xtreg sdum12 ListCountAll RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_11", replace
xtreg sdum12 ListCountAll RegPurgeDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_12", replace
xtreg sdum12 ListCountAll RegPurgeDum RegPurgeDum#c.ListCountAll, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_13", replace
xtreg sdum12 ListCountAll RegPurgeDum RegPurgeDum#c.ListCountAll $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_14", replace
xtreg sdum12 ListCountAll RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_15", replace
xtreg sdum12 ListCountAll RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_16", replace
xtreg sdum12 ListCountAll RegPurgeDum RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_17", replace
xtreg sdum12 ListCountAll RegPurgeDum RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_18", replace
xtreg sdum12 ListCountAll RegPurgeDum RegPurgeDum#c.ListCountAll RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_19", replace
xtreg sdum12 ListCountAll RegPurgeDum RegPurgeDum#c.ListCountAll RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_20", replace

*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
*ListCountAllmin ListCountAllmax 
xtreg sdum12 ListCountAllmin ListCountAllmax, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_21", replace
xtreg sdum12 ListCountAllmin ListCountAllmax $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_22", replace
xtreg sdum12 ListCountAllmin ListCountAllmax RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_23", replace
xtreg sdum12 ListCountAllmin ListCountAllmax RegPurgeDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_24", replace
xtreg sdum12 ListCountAllmin ListCountAllmax RegPurgeDum RegPurgeDum#c.ListCountAllmin RegPurgeDum#c.ListCountAllmax, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_25", replace
xtreg sdum12 ListCountAllmin ListCountAllmax RegPurgeDum RegPurgeDum#c.ListCountAllmin RegPurgeDum#c.ListCountAllmax $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_26", replace
xtreg sdum12 ListCountAllmin ListCountAllmax RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_27", replace
xtreg sdum12 ListCountAllmin ListCountAllmax RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_28", replace
xtreg sdum12 ListCountAllmin ListCountAllmax RegPurgeDum RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_29", replace
xtreg sdum12 ListCountAllmin ListCountAllmax RegPurgeDum RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_30", replace
xtreg sdum12 ListCountAllmin ListCountAllmax RegPurgeDum RegPurgeDum#c.ListCountAllmin RegPurgeDum#c.ListCountAllmax RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_31", replace
xtreg sdum12 ListCountAllmin ListCountAllmax RegPurgeDum RegPurgeDum#c.ListCountAllmin RegPurgeDum#c.ListCountAllmax RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_32", replace

*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
*HostType1All
xtreg sdum12, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_33", replace
xtreg sdum12 $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_34", replace
xtreg sdum12 RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_35", replace
xtreg sdum12 RegPurgeDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_36", replace
xtreg sdum12 RegPurgeDum RegPurgeDum#HostType1All, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_37", replace
xtreg sdum12 RegPurgeDum RegPurgeDum#HostType1All $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_38", replace
xtreg sdum12 RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_39", replace
xtreg sdum12 RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_40", replace
xtreg sdum12 RegPurgeDum RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_41", replace
xtreg sdum12 RegPurgeDum RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_42", replace
xtreg sdum12 RegPurgeDum RegPurgeDum#HostType1All RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_43", replace
xtreg sdum12 RegPurgeDum RegPurgeDum#HostType1All RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020205_sdum12_44", replace



/*===============================================================================

*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum12																							, fe
xtreg sdum12 																			$S_T	, fe
xtreg sdum12 T_RegPurgeDum																			, fe
xtreg sdum12 T_RegPurgeDum 																$S_T	, fe
xtreg sdum12 				T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum12 				T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
xtreg sdum12 T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum12 T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum12					HT_ListCountAll	T_RegPurgeDum#c.HT_ListCountAll																			, fe
xtreg sdum12 				HT_ListCountAll	T_RegPurgeDum#c.HT_ListCountAll																$S_T	, fe
xtreg sdum12 T_RegPurgeDum	HT_ListCountAll	T_RegPurgeDum#c.HT_ListCountAll																			, fe
xtreg sdum12 T_RegPurgeDum 	HT_ListCountAll	T_RegPurgeDum#c.HT_ListCountAll																$S_T	, fe
xtreg sdum12 				HT_ListCountAll T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum12 				HT_ListCountAll T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
xtreg sdum12 T_RegPurgeDum 	HT_ListCountAll T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum12 T_RegPurgeDum 	HT_ListCountAll T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum12					HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive																			, fe
xtreg sdum12 				HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive																$S_T	, fe
xtreg sdum12 T_RegPurgeDum	HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive																			, fe
xtreg sdum12 T_RegPurgeDum 	HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive																$S_T	, fe
xtreg sdum12 				HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum12 				HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
xtreg sdum12 T_RegPurgeDum 	HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum12 T_RegPurgeDum 	HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum12					H_ListCountAllmin H_ListCountAllmax	T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax																			, fe
xtreg sdum12 				H_ListCountAllmin H_ListCountAllmax	T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax																$S_T	, fe
xtreg sdum12 T_RegPurgeDum	H_ListCountAllmin H_ListCountAllmax	T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax																			, fe
xtreg sdum12 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax	T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax																$S_T	, fe
xtreg sdum12 				H_ListCountAllmin H_ListCountAllmax T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum12 				H_ListCountAllmin H_ListCountAllmax T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
xtreg sdum12 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum12 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum12					H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax																			, fe
xtreg sdum12 				H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax																$S_T	, fe
xtreg sdum12 T_RegPurgeDum	H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax																			, fe
xtreg sdum12 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax																$S_T	, fe
xtreg sdum12 				H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum12 				H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
xtreg sdum12 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum12 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum12					T_RegPurgeDum#H_HostType1All																		, fe
xtreg sdum12 				T_RegPurgeDum#H_HostType1All															$S_T	, fe
xtreg sdum12 T_RegPurgeDum 	T_RegPurgeDum#H_HostType1All																		, fe
xtreg sdum12 T_RegPurgeDum 	T_RegPurgeDum#H_HostType1All															$S_T	, fe
xtreg sdum12 				T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum								, fe
xtreg sdum12 			 	T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum 					$S_T	, fe
xtreg sdum12 T_RegPurgeDum  	T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum								, fe
xtreg sdum12 T_RegPurgeDum  	T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum 					$S_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010303_DataforActivityRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum12					T_RegPurgeDum#H_HostType1Active																		, fe
xtreg sdum12 				T_RegPurgeDum#H_HostType1Active															$S_T	, fe
xtreg sdum12 T_RegPurgeDum	T_RegPurgeDum#H_HostType1Active																		, fe
xtreg sdum12 T_RegPurgeDum 	T_RegPurgeDum#H_HostType1Active															$S_T	, fe
xtreg sdum12 				T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum								, fe
xtreg sdum12 				T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 					$S_T	, fe
xtreg sdum12 T_RegPurgeDum 	T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum								, fe
xtreg sdum12 T_RegPurgeDum 	T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 					$S_T	, fe
*-------------------------------------------------------------------------------
 

