*===============================================================================
clear all
set more off
*-------------------------------------------------------------------------------
global s_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global x_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global z_HLT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------

local i=1
	cap erase Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'.txt
	cap erase Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'.xml
	cap erase Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'.tex
	forval j=1(1)24{
		estimates use "Y:\agrajg\Research\Output\020207_sdum3_`j'_set_`i'.ster"
		outreg2 using "Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'", 	cttop(Reg `j' Set `i') 
	}
estimates use "Y:\agrajg\Research\Output\020207_sdum3_25_set_`i'.ster"
outreg2 using "Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'", 	cttop(Reg `j' Set `i')  drop($s_T $x_HT $z_HLT ) ///
																					tex excel 
/*
forval i=2(1)8 {
	cap erase Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'.txt
	cap erase Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'.xml
	cap erase Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'.tex
	forval j=16(1)24{
		estimates use "Y:\agrajg\Research\Output\020207_sdum3_`j'_set_`i'.ster"
		outreg2 using "Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'", 	cttop(Reg `j' Set `i')
	}
estimates use "Y:\agrajg\Research\Output\020207_sdum3_25_set_`i'.ster"
outreg2 using "Y:\agrajg\Research\Output\020209_QuantityLinearRegressionOutput_set_`i'", 	cttop(Reg `j' Set `i') ///
																					tex excel 
}
																					/* ///
																					sortvar( ///
																						T_RegPurgeDum ///
																						T_RegDataDiscDum ///
																						T_RegActRegImpDum ///
																						HT_HostAge ///
																						HT_HostAgeComb ///
																						HT_Adayshostcount ///
																						HT_Bdayshostcount ///
																						o.HT_Rdayshostcount ///
																						HT_HostGuestPastCount ///
																						o.LT_PropAge ///
																						LT_Adayscount ///
																						LT_Bdayscount ///
																						o.LT_Rdayscount ///
																						LT_PropGuestPastCount ///
																						HT_ListCountAll ///
																						c.T_RegPurgeDum#c.HT_ListCountAll ///
																						HT_ListCountActive ///
																						c.T_RegPurgeDum#c.HT_ListCountActive ///
																						HT_countEHAAll ///
																						HT_countNRAll ///
																						HT_countPRAll ///
																						HT_countSRAll ///
																						c.T_RegPurgeDum#c.HT_countEHAAll ///
																						c.T_RegPurgeDum#c.HT_countNRAll ///
																						c.T_RegPurgeDum#c.HT_countPRAll ///
																						c.T_RegPurgeDum#c.HT_countSRAll ///
																						HT_countEHAActive ///
																						HT_countNRActive ///
																						HT_countPRActive ///
																						HT_countSRActive ///
																						c.T_RegPurgeDum#c.HT_countEHAActive ///
																						c.T_RegPurgeDum#c.HT_countNRActive ///
																						c.T_RegPurgeDum#c.HT_countPRActive ///
																						c.T_RegPurgeDum#c.HT_countSRActive ///
																						o.H_ListCountAllmin ///
																						o.H_ListCountAllmax ///
																						c.T_RegPurgeDum#c.H_ListCountAllmin ///
																						c.T_RegPurgeDum#c.H_ListCountAllmax ///
																						o.H_ListCountActivemin ///
																						o.H_ListCountActivemax ///
																						c.T_RegPurgeDum#c.H_ListCountActivemin ///
																						c.T_RegPurgeDum#c.H_ListCountActivemax ///
																						1b.H_HostType1All#c.T_RegPurgeDum ///
																						2.H_HostType1All#c.T_RegPurgeDum ///
																						3.H_HostType1All#c.T_RegPurgeDum ///
																						4.H_HostType1All#c.T_RegPurgeDum ///
																						5.H_HostType1All#c.T_RegPurgeDum ///
																						1b.H_HostType1All#co.T_RegPurgeDum ///
																						1b.H_HostType1Active#c.T_RegPurgeDum ///
																						2.H_HostType1Active#c.T_RegPurgeDum ///
																						3.H_HostType1Active#c.T_RegPurgeDum ///
																						4.H_HostType1Active#c.T_RegPurgeDum ///
																						5.H_HostType1Active#c.T_RegPurgeDum ///
																						1b.H_HostType1Active#co.T_RegPurgeDum ///
																					)


																					


