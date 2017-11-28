*===============================================================================
clear all
set more off
*-------------------------------------------------------------------------------
global S_T i.T_year i.T_moy i.T_dom i.T_dow i.T_wom2 i.T_holiday i.T_holidaywom2
global X_HT HT_HostAge HT_HostAgeComb HT_Adayshostcount HT_Bdayshostcount HT_Rdayshostcount HT_HostGuestPastCount
global Z_LT LT_PropAge LT_Adayscount LT_Bdayscount LT_Rdayscount LT_PropGuestPastCount
*-------------------------------------------------------------------------------
cap erase Y:\agrajg\Research\Output\020206_ActivityLinearRegressionOutput.txt
cap erase Y:\agrajg\Research\Output\020206_ActivityLinearRegressionOutput.xml
cap erase Y:\agrajg\Research\Output\020206_ActivityLinearRegressionOutput.tex


forval i=0(1)0 {
	forval j=0(1)8{
		forval k=1(1)8{
			forval l=1(1)2{
				estimates use "Y:\agrajg\Research\Output\020205_sdum12_`i'`j'`k'`l'.ster"
				outreg2 using "Y:\agrajg\Research\Output\020206_ActivityLinearRegressionOutput", 	cttop(`i'`j'`k'`l')
			}
		}
	}
}

estimates use "Y:\agrajg\Research\Output\020205_sdum12_0882.ster"
outreg2 using "Y:\agrajg\Research\Output\020206_ActivityLinearRegressionOutput", 	cttop(0882) ///
																					tex excel ///
																					sortvar ( ///
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


																					
/*																			
					
T_RegPurgeDum
T_RegDataDiscDum
T_RegActRegImpDum
HT_HostAge
HT_HostAgeComb
HT_Adayshostcount
HT_Bdayshostcount
o.HT_Rdayshostcount
HT_HostGuestPastCount
o.LT_PropAge
LT_Adayscount
LT_Bdayscount
o.LT_Rdayscount
LT_PropGuestPastCount
HT_ListCountAll
c.T_RegPurgeDum#c.HT_ListCountAll
HT_ListCountActive
c.T_RegPurgeDum#c.HT_ListCountActive
HT_countEHAAll
HT_countNRAll
HT_countPRAll
HT_countSRAll
c.T_RegPurgeDum#c.HT_countEHAAll
c.T_RegPurgeDum#c.HT_countNRAll
c.T_RegPurgeDum#c.HT_countPRAll
c.T_RegPurgeDum#c.HT_countSRAll
HT_countEHAActive
HT_countNRActive
HT_countPRActive
HT_countSRActive
c.T_RegPurgeDum#c.HT_countEHAActive
c.T_RegPurgeDum#c.HT_countNRActive
c.T_RegPurgeDum#c.HT_countPRActive
c.T_RegPurgeDum#c.HT_countSRActive
o.H_ListCountAllmin
o.H_ListCountAllmax
c.T_RegPurgeDum#c.H_ListCountAllmin
c.T_RegPurgeDum#c.H_ListCountAllmax
o.H_ListCountActivemin
o.H_ListCountActivemax
c.T_RegPurgeDum#c.H_ListCountActivemin
c.T_RegPurgeDum#c.H_ListCountActivemax
1b.H_HostType1All#c.T_RegPurgeDum
2.H_HostType1All#c.T_RegPurgeDum
3.H_HostType1All#c.T_RegPurgeDum
4.H_HostType1All#c.T_RegPurgeDum
5.H_HostType1All#c.T_RegPurgeDum
1b.H_HostType1All#co.T_RegPurgeDum
1b.H_HostType1Active#c.T_RegPurgeDum
2.H_HostType1Active#c.T_RegPurgeDum
3.H_HostType1Active#c.T_RegPurgeDum
4.H_HostType1Active#c.T_RegPurgeDum
5.H_HostType1Active#c.T_RegPurgeDum
1b.H_HostType1Active#co.T_RegPurgeDum
