*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum3																							, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0011", replace	
xtreg sdum3 																			$s_T 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0012", replace
xtreg sdum3 T_RegPurgeDum																			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0021", replace
xtreg sdum3 T_RegPurgeDum 																$s_T		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0022", replace
xtreg sdum3 				T_RegDataDiscDum T_RegActRegImpDum										, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0031", replace
xtreg sdum3 				T_RegDataDiscDum T_RegActRegImpDum 							$s_T		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0032", replace
xtreg sdum3 T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum										, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0041", replace
xtreg sdum3 T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum 							$s_T		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0042", replace
xtreg sdum3 																$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0051", replace
xtreg sdum3 																$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0052", replace
xtreg sdum3 T_RegPurgeDum													$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0061", replace
xtreg sdum3 T_RegPurgeDum 													$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0062", replace
xtreg sdum3 				T_RegDataDiscDum T_RegActRegImpDum				$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0071", replace
xtreg sdum3 				T_RegDataDiscDum T_RegActRegImpDum 				$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0072", replace
xtreg sdum3 T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum				$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0081", replace
xtreg sdum3 T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum 				$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0082", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum3					HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll																		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0111", replace
xtreg sdum3 				HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll																$s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0112", replace
xtreg sdum3 T_RegPurgeDum	HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll																		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0121", replace
xtreg sdum3 T_RegPurgeDum 	HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll																$s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0122", replace
xtreg sdum3 				HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum									, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0131", replace
xtreg sdum3 				HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 							$s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0132", replace
xtreg sdum3 T_RegPurgeDum 	HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum									, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0141", replace
xtreg sdum3 T_RegPurgeDum 	HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 							$s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0142", replace
xtreg sdum3					HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll													$x_HT $z_HLT , fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0151", replace
xtreg sdum3 				HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll													$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0152", replace
xtreg sdum3 T_RegPurgeDum	HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll													$x_HT $z_HLT , fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0161", replace
xtreg sdum3 T_RegPurgeDum 	HT_ListCountAll	c.T_RegPurgeDum#c.HT_ListCountAll													$x_HT $z_HLT $s_T	 , fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0162", replace
xtreg sdum3 				HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum				$x_HT $z_HLT , fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0171", replace
xtreg sdum3 				HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 				$x_HT $z_HLT $s_T	 , fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0172", replace
xtreg sdum3 T_RegPurgeDum 	HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum				$x_HT $z_HLT , fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0181", replace
xtreg sdum3 T_RegPurgeDum 	HT_ListCountAll c.T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 				$x_HT $z_HLT $s_T	 , fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0182", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum3					HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive																, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0211", replace
xtreg sdum3 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive														$s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0212", replace
xtreg sdum3 T_RegPurgeDum	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive																, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0221", replace
xtreg sdum3 T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive														$s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0222", replace
xtreg sdum3 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum							, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0231", replace
xtreg sdum3 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 					$s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0232", replace
xtreg sdum3 T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum							, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0241", replace
xtreg sdum3 T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 					$s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0242", replace
xtreg sdum3					HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive											$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0251", replace
xtreg sdum3 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive											$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0252", replace
xtreg sdum3 T_RegPurgeDum	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive											$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0261", replace
xtreg sdum3 T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive											$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0262", replace
xtreg sdum3 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum		$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0271", replace
xtreg sdum3 				HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 		$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0272", replace
xtreg sdum3 T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum		$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0281", replace
xtreg sdum3 T_RegPurgeDum 	HT_ListCountActive c.T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 		$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0282", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum3					HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																						, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0311", replace
xtreg sdum3 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$s_T					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0312", replace
xtreg sdum3 T_RegPurgeDum	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																						, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0321", replace
xtreg sdum3 T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$s_T					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0322", replace
xtreg sdum3 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum													, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0331", replace
xtreg sdum3 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum 							$s_T					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0332", replace
xtreg sdum3 T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum													, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0341", replace
xtreg sdum3 T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum 							$s_T					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0342", replace
xtreg sdum3					HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0351", replace
xtreg sdum3 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0352", replace
xtreg sdum3 T_RegPurgeDum	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0361", replace
xtreg sdum3 T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll 																$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0362", replace
xtreg sdum3 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum							$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0371", replace
xtreg sdum3 				HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum 							$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0372", replace
xtreg sdum3 T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum							$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0381", replace
xtreg sdum3 T_RegPurgeDum 	HT_countEHAAll HT_countNRAll HT_countPRAll HT_countSRAll  c.T_RegPurgeDum#c.HT_countEHAAll c.T_RegPurgeDum#c.HT_countNRAll c.T_RegPurgeDum#c.HT_countPRAll c.T_RegPurgeDum#c.HT_countSRAll  T_RegDataDiscDum T_RegActRegImpDum 							$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0382", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum3					HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0411", replace
xtreg sdum3 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$s_T				, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0412", replace
xtreg sdum3 T_RegPurgeDum	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0421", replace
xtreg sdum3 T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$s_T				, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0422", replace
xtreg sdum3 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0431", replace
xtreg sdum3 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum 							$s_T				, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0432", replace
xtreg sdum3 T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0441", replace
xtreg sdum3 T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum 							$s_T				, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0442", replace
xtreg sdum3					HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0451", replace
xtreg sdum3 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0452", replace
xtreg sdum3 T_RegPurgeDum	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0461", replace
xtreg sdum3 T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive																$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0462", replace
xtreg sdum3 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum							$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0471", replace
xtreg sdum3 				HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum 							$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0472", replace
xtreg sdum3 T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum							$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0481", replace
xtreg sdum3 T_RegPurgeDum 	HT_countEHAActive HT_countNRActive HT_countPRActive HT_countSRActive c.T_RegPurgeDum#c.HT_countEHAActive c.T_RegPurgeDum#c.HT_countNRActive c.T_RegPurgeDum#c.HT_countPRActive c.T_RegPurgeDum#c.HT_countSRActive T_RegDataDiscDum T_RegActRegImpDum 							$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0482", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum3					H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0511", replace
xtreg sdum3 				H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$s_T				, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0512", replace
xtreg sdum3 T_RegPurgeDum	H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0521", replace
xtreg sdum3 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$s_T				, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0522", replace
xtreg sdum3 				H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0531", replace
xtreg sdum3 				H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$s_T				, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0532", replace
xtreg sdum3 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0541", replace
xtreg sdum3 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$s_T				, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0542", replace
xtreg sdum3					H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0551", replace
xtreg sdum3 				H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0552", replace
xtreg sdum3 T_RegPurgeDum	H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0561", replace
xtreg sdum3 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax	c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax																$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0562", replace
xtreg sdum3 				H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum							$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0571", replace
xtreg sdum3 				H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0572", replace
xtreg sdum3 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum							$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0581", replace
xtreg sdum3 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax c.T_RegPurgeDum#c.H_ListCountAllmin c.T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0582", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum3					H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0611", replace
xtreg sdum3 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$s_T				, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0612", replace
xtreg sdum3 T_RegPurgeDum	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0621", replace
xtreg sdum3 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$s_T				, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0622", replace	
xtreg sdum3 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0631", replace
xtreg sdum3 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$s_T				, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0632", replace
xtreg sdum3 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0641", replace
xtreg sdum3 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$s_T				, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0642", replace
xtreg sdum3					H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0651", replace
xtreg sdum3 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0652", replace
xtreg sdum3 T_RegPurgeDum	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0661", replace
xtreg sdum3 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax																$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0662", replace
xtreg sdum3 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum							$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0671", replace
xtreg sdum3 				H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0672", replace
xtreg sdum3 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum							$x_HT $z_HLT 		, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0681", replace
xtreg sdum3 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax c.T_RegPurgeDum#c.H_ListCountActivemin c.T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$x_HT $z_HLT $s_T	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0682", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum3					c.T_RegPurgeDum#H_HostType1All																					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0711", replace
xtreg sdum3 				c.T_RegPurgeDum#H_HostType1All															$s_T					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0712", replace
xtreg sdum3 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1All																					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0721", replace
xtreg sdum3 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1All															$s_T					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0722", replace
xtreg sdum3 				c.T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum											, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0731", replace
xtreg sdum3 			 	c.T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum 					$s_T					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0732", replace
xtreg sdum3 T_RegPurgeDum  	c.T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum											, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0741", replace
xtreg sdum3 T_RegPurgeDum  	c.T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum 					$s_T					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0742", replace
xtreg sdum3					c.T_RegPurgeDum#H_HostType1All															$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0751", replace
xtreg sdum3 				c.T_RegPurgeDum#H_HostType1All															$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0752", replace
xtreg sdum3 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1All															$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0761", replace
xtreg sdum3 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1All															$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0762", replace
xtreg sdum3 				c.T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum					$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0771", replace
xtreg sdum3 			 	c.T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum 					$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0772", replace
xtreg sdum3 T_RegPurgeDum  	c.T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum					$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0781", replace
xtreg sdum3 T_RegPurgeDum  	c.T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum 					$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0782", replace
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
xtreg sdum3					c.T_RegPurgeDum#H_HostType1Active																					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0811", replace
xtreg sdum3 				c.T_RegPurgeDum#H_HostType1Active															$s_T					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0812", replace
xtreg sdum3 T_RegPurgeDum	c.T_RegPurgeDum#H_HostType1Active																					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0821", replace
xtreg sdum3 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active															$s_T					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0822", replace
xtreg sdum3 				c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0831", replace
xtreg sdum3 				c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 						$s_T					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0832", replace
xtreg sdum3 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum												, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0841", replace
xtreg sdum3 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 						$s_T					, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0842", replace
xtreg sdum3					c.T_RegPurgeDum#H_HostType1Active															$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0851", replace
xtreg sdum3 				c.T_RegPurgeDum#H_HostType1Active															$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0852", replace
xtreg sdum3 T_RegPurgeDum	c.T_RegPurgeDum#H_HostType1Active															$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0861", replace
xtreg sdum3 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active															$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0862", replace
xtreg sdum3 				c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum						$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0871", replace
xtreg sdum3 				c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 						$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0872", replace
xtreg sdum3 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum						$x_HT $z_HLT 			, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0881", replace
xtreg sdum3 T_RegPurgeDum 	c.T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 						$x_HT $z_HLT $s_T	 	, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_0882", replace
*-------------------------------------------------------------------------------





/*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum3, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_1", replace
xtreg sdum3 $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_2", replace
xtreg sdum3 RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_3", replace
xtreg sdum3 RegPurgeDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_4", replace
xtreg sdum3 RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_5", replace
xtreg sdum3 RegDataDiscDum RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_6", replace
xtreg sdum3 RegPurgeDum RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_7", replace
xtreg sdum3 RegPurgeDum RegDataDiscDum RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_8", replace

*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
* ListCountAll 
xtreg sdum3 ListCountAll, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_9", replace
xtreg sdum3 ListCountAll $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_10", replace
xtreg sdum3 ListCountAll RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_11", replace
xtreg sdum3 ListCountAll RegPurgeDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_12", replace
xtreg sdum3 ListCountAll RegPurgeDum RegPurgeDum#c.ListCountAll, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_13", replace
xtreg sdum3 ListCountAll RegPurgeDum RegPurgeDum#c.ListCountAll $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_14", replace
xtreg sdum3 ListCountAll RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_15", replace
xtreg sdum3 ListCountAll RegDataDiscDum RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_16", replace
xtreg sdum3 ListCountAll RegPurgeDum RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_17", replace
xtreg sdum3 ListCountAll RegPurgeDum RegDataDiscDum RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_18", replace
xtreg sdum3 ListCountAll RegPurgeDum RegPurgeDum#c.ListCountAll RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_19", replace
xtreg sdum3 ListCountAll RegPurgeDum RegPurgeDum#c.ListCountAll RegDataDiscDum RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_20", replace

*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
*ListCountAllmin ListCountAllmax 
xtreg sdum3 ListCountAllmin ListCountAllmax, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_21", replace
xtreg sdum3 ListCountAllmin ListCountAllmax $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_22", replace
xtreg sdum3 ListCountAllmin ListCountAllmax RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_23", replace
xtreg sdum3 ListCountAllmin ListCountAllmax RegPurgeDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_24", replace
xtreg sdum3 ListCountAllmin ListCountAllmax RegPurgeDum RegPurgeDum#c.ListCountAllmin RegPurgeDum#c.ListCountAllmax, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_25", replace
xtreg sdum3 ListCountAllmin ListCountAllmax RegPurgeDum RegPurgeDum#c.ListCountAllmin RegPurgeDum#c.ListCountAllmax $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_26", replace
xtreg sdum3 ListCountAllmin ListCountAllmax RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_27", replace
xtreg sdum3 ListCountAllmin ListCountAllmax RegDataDiscDum RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_28", replace
xtreg sdum3 ListCountAllmin ListCountAllmax RegPurgeDum RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_29", replace
xtreg sdum3 ListCountAllmin ListCountAllmax RegPurgeDum RegDataDiscDum RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_30", replace
xtreg sdum3 ListCountAllmin ListCountAllmax RegPurgeDum RegPurgeDum#c.ListCountAllmin RegPurgeDum#c.ListCountAllmax RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_31", replace
xtreg sdum3 ListCountAllmin ListCountAllmax RegPurgeDum RegPurgeDum#c.ListCountAllmin RegPurgeDum#c.ListCountAllmax RegDataDiscDum RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_32", replace

*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.year i.moy i.dom i.dow i.wom2 i.holiday i.holidaywom2
*-------------------------------------------------------------------------------
*HostType1All
xtreg sdum3, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_33", replace
xtreg sdum3 $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_34", replace
xtreg sdum3 RegPurgeDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_35", replace
xtreg sdum3 RegPurgeDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_36", replace
xtreg sdum3 RegPurgeDum RegPurgeDum#HostType1All, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_37", replace
xtreg sdum3 RegPurgeDum RegPurgeDum#HostType1All $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_38", replace
xtreg sdum3 RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_39", replace
xtreg sdum3 RegDataDiscDum RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_40", replace
xtreg sdum3 RegPurgeDum RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_41", replace
xtreg sdum3 RegPurgeDum RegDataDiscDum RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_42", replace
xtreg sdum3 RegPurgeDum RegPurgeDum#HostType1All RegDataDiscDum RegActRegImpDum, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_43", replace
xtreg sdum3 RegPurgeDum RegPurgeDum#HostType1All RegDataDiscDum RegActRegImpDum $s_T, fe
estimates save "Y:\agrajg\Research\Output\020201_sdum3_44", replace



/*===============================================================================

*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum3																							, fe
xtreg sdum3 																			$s_T	, fe
xtreg sdum3 T_RegPurgeDum																			, fe
xtreg sdum3 T_RegPurgeDum 																$s_T	, fe
xtreg sdum3 				T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum3 				T_RegDataDiscDum T_RegActRegImpDum 							$s_T	, fe
xtreg sdum3 T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum3 T_RegPurgeDum 	T_RegDataDiscDum T_RegActRegImpDum 							$s_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum3					HT_ListCountAll	T_RegPurgeDum#c.HT_ListCountAll																			, fe
xtreg sdum3 				HT_ListCountAll	T_RegPurgeDum#c.HT_ListCountAll																$s_T	, fe
xtreg sdum3 T_RegPurgeDum	HT_ListCountAll	T_RegPurgeDum#c.HT_ListCountAll																			, fe
xtreg sdum3 T_RegPurgeDum 	HT_ListCountAll	T_RegPurgeDum#c.HT_ListCountAll																$s_T	, fe
xtreg sdum3 				HT_ListCountAll T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum3 				HT_ListCountAll T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 							$s_T	, fe
xtreg sdum3 T_RegPurgeDum 	HT_ListCountAll T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum3 T_RegPurgeDum 	HT_ListCountAll T_RegPurgeDum#c.HT_ListCountAll T_RegDataDiscDum T_RegActRegImpDum 							$s_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum3					HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive																			, fe
xtreg sdum3 				HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive																$s_T	, fe
xtreg sdum3 T_RegPurgeDum	HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive																			, fe
xtreg sdum3 T_RegPurgeDum 	HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive																$s_T	, fe
xtreg sdum3 				HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum3 				HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 							$s_T	, fe
xtreg sdum3 T_RegPurgeDum 	HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum3 T_RegPurgeDum 	HT_ListCountActive T_RegPurgeDum#c.HT_ListCountActive T_RegDataDiscDum T_RegActRegImpDum 							$s_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum3					H_ListCountAllmin H_ListCountAllmax	T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax																			, fe
xtreg sdum3 				H_ListCountAllmin H_ListCountAllmax	T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax																$s_T	, fe
xtreg sdum3 T_RegPurgeDum	H_ListCountAllmin H_ListCountAllmax	T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax																			, fe
xtreg sdum3 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax	T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax																$s_T	, fe
xtreg sdum3 				H_ListCountAllmin H_ListCountAllmax T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum3 				H_ListCountAllmin H_ListCountAllmax T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$s_T	, fe
xtreg sdum3 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum3 T_RegPurgeDum 	H_ListCountAllmin H_ListCountAllmax T_RegPurgeDum#c.H_ListCountAllmin T_RegPurgeDum#c.H_ListCountAllmax T_RegDataDiscDum T_RegActRegImpDum 							$s_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum3					H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax																			, fe
xtreg sdum3 				H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax																$s_T	, fe
xtreg sdum3 T_RegPurgeDum	H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax																			, fe
xtreg sdum3 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax																$s_T	, fe
xtreg sdum3 				H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum3 				H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$s_T	, fe
xtreg sdum3 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum										, fe
xtreg sdum3 T_RegPurgeDum 	H_ListCountActivemin H_ListCountActivemax T_RegPurgeDum#c.H_ListCountActivemin T_RegPurgeDum#c.H_ListCountActivemax T_RegDataDiscDum T_RegActRegImpDum 							$s_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum3					T_RegPurgeDum#H_HostType1All																		, fe
xtreg sdum3 				T_RegPurgeDum#H_HostType1All															$s_T	, fe
xtreg sdum3 T_RegPurgeDum 	T_RegPurgeDum#H_HostType1All																		, fe
xtreg sdum3 T_RegPurgeDum 	T_RegPurgeDum#H_HostType1All															$s_T	, fe
xtreg sdum3 				T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum								, fe
xtreg sdum3 			 	T_RegPurgeDum#H_HostType1All 		T_RegDataDiscDum T_RegActRegImpDum 					$s_T	, fe
xtreg sdum3 T_RegPurgeDum  	T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum								, fe
xtreg sdum3 T_RegPurgeDum  	T_RegPurgeDum#H_HostType1All		T_RegDataDiscDum T_RegActRegImpDum 					$s_T	, fe
*===============================================================================
clear all
set more off
use "Y:\agrajg\Research\Data\temp\010213_DataforQuantityRegressions.dta", clear
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
*-------------------------------------------------------------------------------
xtreg sdum3					T_RegPurgeDum#H_HostType1Active																		, fe
xtreg sdum3 				T_RegPurgeDum#H_HostType1Active															$s_T	, fe
xtreg sdum3 T_RegPurgeDum	T_RegPurgeDum#H_HostType1Active																		, fe
xtreg sdum3 T_RegPurgeDum 	T_RegPurgeDum#H_HostType1Active															$s_T	, fe
xtreg sdum3 				T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum								, fe
xtreg sdum3 				T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 					$s_T	, fe
xtreg sdum3 T_RegPurgeDum 	T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum								, fe
xtreg sdum3 T_RegPurgeDum 	T_RegPurgeDum#H_HostType1Active 	T_RegDataDiscDum T_RegActRegImpDum 					$s_T	, fe
*-------------------------------------------------------------------------------
 

