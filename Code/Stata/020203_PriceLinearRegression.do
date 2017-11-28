*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg lprice																							, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0011", replace	
xtreg lprice 																			$S_T 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0012", replace
xtreg lprice T_RegPurgeDum																			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0021", replace
xtreg lprice T_RegPurgeDum 																$S_T		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0022", replace
xtreg lprice 				T_RegDataDiscDum T_RegActRegImpDum										, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0031", replace
xtreg lprice 				T_RegDataDiscDum T_RegActRegImpDum 							$S_T		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0032", replace
xtreg lprice T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum										, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0041", replace
xtreg lprice T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum 							$S_T		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0042", replace
xtreg lprice 																$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0051", replace
xtreg lprice 																$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0052", replace
xtreg lprice T_RegPurgeDum													$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0061", replace
xtreg lprice T_RegPurgeDum 													$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0062", replace
xtreg lprice 				T_RegDataDiscDum T_RegActRegImpDum				$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0071", replace
xtreg lprice 				T_RegDataDiscDum T_RegActRegImpDum 				$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0072", replace
xtreg lprice T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum				$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0081", replace
xtreg lprice T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum 				$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0082", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg lprice					HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll																		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0111", replace
xtreg lprice 				HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll																$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0112", replace
xtreg lprice T_RegPurgeDum	HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll																		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0121", replace
xtreg lprice T_RegPurgeDum 	HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll																$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0122", replace
xtreg lprice 				HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum									, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0131", replace
xtreg lprice 				HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0132", replace
xtreg lprice T_RegPurgeDum 	HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum									, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0141", replace
xtreg lprice T_RegPurgeDum 	HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0142", replace
xtreg lprice					HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll													$X_HT $Z_LT , fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0151", replace
xtreg lprice 				HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll													$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0152", replace
xtreg lprice T_RegPurgeDum	HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll													$X_HT $Z_LT , fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0161", replace
xtreg lprice T_RegPurgeDum 	HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll													$X_HT $Z_LT $S_T	 , fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0162", replace
xtreg lprice 				HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum				$X_HT $Z_LT , fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0171", replace
xtreg lprice 				HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 				$X_HT $Z_LT $S_T	 , fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0172", replace
xtreg lprice T_RegPurgeDum 	HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum				$X_HT $Z_LT , fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0181", replace
xtreg lprice T_RegPurgeDum 	HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 				$X_HT $Z_LT $S_T	 , fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0182", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg lprice					HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive																, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0211", replace
xtreg lprice 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive														$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0212", replace
xtreg lprice T_RegPurgeDum	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive																, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0221", replace
xtreg lprice T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive														$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0222", replace
xtreg lprice 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum							, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0231", replace
xtreg lprice 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 					$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0232", replace
xtreg lprice T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum							, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0241", replace
xtreg lprice T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 					$S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0242", replace
xtreg lprice					HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive											$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0251", replace
xtreg lprice 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive											$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0252", replace
xtreg lprice T_RegPurgeDum	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive											$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0261", replace
xtreg lprice T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive											$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0262", replace
xtreg lprice 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum		$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0271", replace
xtreg lprice 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 		$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0272", replace
xtreg lprice T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum		$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0281", replace
xtreg lprice T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 		$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0282", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg lprice					HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																						, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0311", replace
xtreg lprice 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0312", replace
xtreg lprice T_RegPurgeDum	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																						, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0321", replace
xtreg lprice T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0322", replace
xtreg lprice 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum													, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0331", replace
xtreg lprice 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum 							$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0332", replace
xtreg lprice T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum													, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0341", replace
xtreg lprice T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum 							$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0342", replace
xtreg lprice					HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0351", replace
xtreg lprice 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0352", replace
xtreg lprice T_RegPurgeDum	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0361", replace
xtreg lprice T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0362", replace
xtreg lprice 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0371", replace
xtreg lprice 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0372", replace
xtreg lprice T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0381", replace
xtreg lprice T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0382", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg lprice					HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0411", replace
xtreg lprice 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0412", replace
xtreg lprice T_RegPurgeDum	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0421", replace
xtreg lprice T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0422", replace
xtreg lprice 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0431", replace
xtreg lprice 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum 							$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0432", replace
xtreg lprice T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0441", replace
xtreg lprice T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum 							$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0442", replace
xtreg lprice					HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0451", replace
xtreg lprice 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0452", replace
xtreg lprice T_RegPurgeDum	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0461", replace
xtreg lprice T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0462", replace
xtreg lprice 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0471", replace
xtreg lprice 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0472", replace
xtreg lprice T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0481", replace
xtreg lprice T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0482", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg lprice					H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0511", replace
xtreg lprice 				H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0512", replace
xtreg lprice T_RegPurgeDum	H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0521", replace
xtreg lprice T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0522", replace
xtreg lprice 				H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0531", replace
xtreg lprice 				H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0532", replace
xtreg lprice T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0541", replace
xtreg lprice T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0542", replace
xtreg lprice					H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0551", replace
xtreg lprice 				H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0552", replace
xtreg lprice T_RegPurgeDum	H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0561", replace
xtreg lprice T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0562", replace
xtreg lprice 				H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0571", replace
xtreg lprice 				H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0572", replace
xtreg lprice T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0581", replace
xtreg lprice T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0582", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg lprice					H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0611", replace
xtreg lprice 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0612", replace
xtreg lprice T_RegPurgeDum	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0621", replace
xtreg lprice T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0622", replace	
xtreg lprice 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0631", replace
xtreg lprice 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0632", replace
xtreg lprice T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0641", replace
xtreg lprice T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$S_T				, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0642", replace
xtreg lprice					H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0651", replace
xtreg lprice 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0652", replace
xtreg lprice T_RegPurgeDum	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0661", replace
xtreg lprice T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0662", replace
xtreg lprice 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0671", replace
xtreg lprice 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0672", replace
xtreg lprice T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum							$X_HT $Z_LT 		, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0681", replace
xtreg lprice T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$X_HT $Z_LT $S_T	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0682", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg lprice					c.T_RegPurgeDum#H_HostType1All																					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0711", replace
xtreg lprice 				c.T_RegPurgeDum#H_HostType1All															$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0712", replace
xtreg lprice T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1All																					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0721", replace
xtreg lprice T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1All															$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0722", replace
xtreg lprice 				c.T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum											, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0731", replace
xtreg lprice 			 	c.T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum 					$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0732", replace
xtreg lprice T_RegPurgeDum  	c.T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum											, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0741", replace
xtreg lprice T_RegPurgeDum  	c.T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum 					$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0742", replace
xtreg lprice					c.T_RegPurgeDum#H_HostType1All															$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0751", replace
xtreg lprice 				c.T_RegPurgeDum#H_HostType1All															$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0752", replace
xtreg lprice T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1All															$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0761", replace
xtreg lprice T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1All															$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0762", replace
xtreg lprice 				c.T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum					$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0771", replace
xtreg lprice 			 	c.T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum 					$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0772", replace
xtreg lprice T_RegPurgeDum  	c.T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum					$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0781", replace
xtreg lprice T_RegPurgeDum  	c.T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum 					$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0782", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg lprice					c.T_RegPurgeDum#H_HostType1Active																					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0811", replace
xtreg lprice 				c.T_RegPurgeDum#H_HostType1Active															$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0812", replace
xtreg lprice T_RegPurgeDum	c.T_RegPurgeDum#H_HostType1Active																					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0821", replace
xtreg lprice T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active															$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0822", replace
xtreg lprice 				c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0831", replace
xtreg lprice 				c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 						$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0832", replace
xtreg lprice T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0841", replace
xtreg lprice T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 						$S_T					, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0842", replace
xtreg lprice					c.T_RegPurgeDum#H_HostType1Active															$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0851", replace
xtreg lprice 				c.T_RegPurgeDum#H_HostType1Active															$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0852", replace
xtreg lprice T_RegPurgeDum	c.T_RegPurgeDum#H_HostType1Active															$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0861", replace
xtreg lprice T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active															$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0862", replace
xtreg lprice 				c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum						$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0871", replace
xtreg lprice 				c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 						$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0872", replace
xtreg lprice T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum						$X_HT $Z_LT 			, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0881", replace
xtreg lprice T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 						$X_HT $Z_LT $S_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_0882", replace
*-------------------------------------------------------------------------------





/*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
xtreg lprice, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_1", replace
xtreg lprice $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_2", replace
xtreg lprice RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_3", replace
xtreg lprice RegPurgeDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_4", replace
xtreg lprice RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_5", replace
xtreg lprice RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_6", replace
xtreg lprice RegPurgeDum RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_7", replace
xtreg lprice RegPurgeDum RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_8", replace

*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
* ListCountAll 
xtreg lprice ListCountAll, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_9", replace
xtreg lprice ListCountAll $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_10", replace
xtreg lprice ListCountAll RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_11", replace
xtreg lprice ListCountAll RegPurgeDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_12", replace
xtreg lprice ListCountAll RegPurgeDum RegPurgeDum#c.ListCountAll, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_13", replace
xtreg lprice ListCountAll RegPurgeDum RegPurgeDum#c.ListCountAll $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_14", replace
xtreg lprice ListCountAll RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_15", replace
xtreg lprice ListCountAll RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_16", replace
xtreg lprice ListCountAll RegPurgeDum RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_17", replace
xtreg lprice ListCountAll RegPurgeDum RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_18", replace
xtreg lprice ListCountAll RegPurgeDum RegPurgeDum#c.ListCountAll RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_19", replace
xtreg lprice ListCountAll RegPurgeDum RegPurgeDum#c.ListCountAll RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_20", replace

*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
*ListCountAllmin ListCountAllmax 
xtreg lprice ListCountAllmin ListCountAllmax, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_21", replace
xtreg lprice ListCountAllmin ListCountAllmax $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_22", replace
xtreg lprice ListCountAllmin ListCountAllmax RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_23", replace
xtreg lprice ListCountAllmin ListCountAllmax RegPurgeDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_24", replace
xtreg lprice ListCountAllmin ListCountAllmax RegPurgeDum RegPurgeDum#c.ListCountAllmin RegPurgeDum#c.ListCountAllmax, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_25", replace
xtreg lprice ListCountAllmin ListCountAllmax RegPurgeDum RegPurgeDum#c.ListCountAllmin RegPurgeDum#c.ListCountAllmax $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_26", replace
xtreg lprice ListCountAllmin ListCountAllmax RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_27", replace
xtreg lprice ListCountAllmin ListCountAllmax RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_28", replace
xtreg lprice ListCountAllmin ListCountAllmax RegPurgeDum RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_29", replace
xtreg lprice ListCountAllmin ListCountAllmax RegPurgeDum RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_30", replace
xtreg lprice ListCountAllmin ListCountAllmax RegPurgeDum RegPurgeDum#c.ListCountAllmin RegPurgeDum#c.ListCountAllmax RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_31", replace
xtreg lprice ListCountAllmin ListCountAllmax RegPurgeDum RegPurgeDum#c.ListCountAllmin RegPurgeDum#c.ListCountAllmax RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_32", replace

*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
*HostType1All
xtreg lprice, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_33", replace
xtreg lprice $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_34", replace
xtreg lprice RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_35", replace
xtreg lprice RegPurgeDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_36", replace
xtreg lprice RegPurgeDum RegPurgeDum#HostType1All, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_37", replace
xtreg lprice RegPurgeDum RegPurgeDum#HostType1All $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_38", replace
xtreg lprice RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_39", replace
xtreg lprice RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_40", replace
xtreg lprice RegPurgeDum RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_41", replace
xtreg lprice RegPurgeDum RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_42", replace
xtreg lprice RegPurgeDum RegPurgeDum#HostType1All RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_43", replace
xtreg lprice RegPurgeDum RegPurgeDum#HostType1All RegDataDiscDum RegActRegImpDum $S_T, fe
estimates save "Y:\agrajg\Research\Output\020203_lprice_44", replace



/*===============================================================================

*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg lprice																							, fe
xtreg lprice 																			$S_T	, fe
xtreg lprice T_RegPurgeDum																			, fe
xtreg lprice T_RegPurgeDum 																$S_T	, fe
xtreg lprice 				T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg lprice 				T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
xtreg lprice T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg lprice T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg lprice					HT_ListCountAll	T_RegPurgeDum#c.HT_ListCountAll																			, fe
xtreg lprice 				HT_ListCountAll	T_RegPurgeDum#c.HT_ListCountAll																$S_T	, fe
xtreg lprice T_RegPurgeDum	HT_ListCountAll	T_RegPurgeDum#c.HT_ListCountAll																			, fe
xtreg lprice T_RegPurgeDum 	HT_ListCountAll	T_RegPurgeDum#c.HT_ListCountAll																$S_T	, fe
xtreg lprice 				HT_ListCountAll T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg lprice 				HT_ListCountAll T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
xtreg lprice T_RegPurgeDum 	HT_ListCountAll T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg lprice T_RegPurgeDum 	HT_ListCountAll T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg lprice					HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive																			, fe
xtreg lprice 				HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive																$S_T	, fe
xtreg lprice T_RegPurgeDum	HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive																			, fe
xtreg lprice T_RegPurgeDum 	HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive																$S_T	, fe
xtreg lprice 				HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg lprice 				HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
xtreg lprice T_RegPurgeDum 	HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg lprice T_RegPurgeDum 	HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg lprice					H_ListCountAllmin H_ListCountAllmax	T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax																			, fe
xtreg lprice 				H_ListCountAllmin H_ListCountAllmax	T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax																$S_T	, fe
xtreg lprice T_RegPurgeDum	H_ListCountAllmin H_ListCountAllmax	T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax																			, fe
xtreg lprice T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax	T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax																$S_T	, fe
xtreg lprice 				H_ListCountAllmin H_ListCountAllmax T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg lprice 				H_ListCountAllmin H_ListCountAllmax T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
xtreg lprice T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg lprice T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg lprice					H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax																			, fe
xtreg lprice 				H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax																$S_T	, fe
xtreg lprice T_RegPurgeDum	H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax																			, fe
xtreg lprice T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax																$S_T	, fe
xtreg lprice 				H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg lprice 				H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
xtreg lprice T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg lprice T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$S_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg lprice					T_RegPurgeDum#H_HostType1All																		, fe
xtreg lprice 				T_RegPurgeDum#H_HostType1All															$S_T	, fe
xtreg lprice T_RegPurgeDum 	T_RegPurgeDum#H_HostType1All																		, fe
xtreg lprice T_RegPurgeDum 	T_RegPurgeDum#H_HostType1All															$S_T	, fe
xtreg lprice 				T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum								, fe
xtreg lprice 			 	T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum 					$S_T	, fe
xtreg lprice T_RegPurgeDum  	T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum								, fe
xtreg lprice T_RegPurgeDum  	T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum 					$S_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg lprice					T_RegPurgeDum#H_HostType1Active																		, fe
xtreg lprice 				T_RegPurgeDum#H_HostType1Active															$S_T	, fe
xtreg lprice T_RegPurgeDum	T_RegPurgeDum#H_HostType1Active																		, fe
xtreg lprice T_RegPurgeDum 	T_RegPurgeDum#H_HostType1Active															$S_T	, fe
xtreg lprice 				T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum								, fe
xtreg lprice 				T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 					$S_T	, fe
xtreg lprice T_RegPurgeDum 	T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum								, fe
xtreg lprice T_RegPurgeDum 	T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 					$S_T	, fe
*-------------------------------------------------------------------------------
 

