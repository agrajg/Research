// *===============================================================================
// clear all
// set more off
// use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
// keep in 1/2
// estimates use "Y:\agrajg\Research\Output\020229_PriceEffect_Spec1_Stage2.ster"
// estimates replay
// outreg2 using MarketOutcomeOnPurge, replace cttop(Price) dec(3) ///
// 	keep(T_RegPurgeDum T_RegCalledIllegal T_RegDebate T_RegRedSupply  T_RegDataDiscDum T_RegActRegImpDum) ///
// 	sortvar(T_RegPurgeDum T_RegCalledIllegal T_RegDebate T_RegRedSupply  T_RegDataDiscDum T_RegActRegImpDum)
// use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
// keep in 1/2
// estimates use "Y:\agrajg\Research\Output\020230_QuantityEffect_Spec1_Stage2.ster"
// // estimates use "Y:\agrajg\Research\Output\020229_QuantityEffect_Spec1_Stage2.ster"
// estimates replay
// outreg2 using MarketOutcomeOnPurge,  cttop(Bookings) dec(3) ///
// 	keep(T_RegPurgeDum T_RegCalledIllegal T_RegDebate T_RegRedSupply  T_RegDataDiscDum T_RegActRegImpDum) ///
// 	sortvar(T_RegPurgeDum T_RegCalledIllegal T_RegDebate T_RegRedSupply  T_RegDataDiscDum T_RegActRegImpDum) tex
//

	
use "Y:\agrajg\Research\Data\temp\010302_DataforPriceRegressions.dta", clear
keep in 1/2
estimates use "Y:\agrajg\Research\Output\020229_PriceEffect_Spec2.ster"
estimates replay
outreg2 using Y:\agrajg\Research\Output\020231_MarketOutcomeOnPurgeSpec2, replace ///
	cttop(Price) ///
	dec(3) ///
	keep(T_RegPurgeDum T_RegCalledIllegal T_RegDebate T_RegRedSupply  T_RegDataDiscDum T_RegActRegImpDum) ///
	sortvar(T_RegPurgeDum T_RegCalledIllegal T_RegDebate T_RegRedSupply  T_RegDataDiscDum T_RegActRegImpDum) ///
	label ///
	addnote(somenotes) ///
	addtext(Listing FE, YES, ///
			Year FE, YES, ///
			Month FE, YES, ///
			Day of Month FE, YES,  ///
			Week of Month FE, YES, ///
			Day of Week FE, YES, ///
			Holiday Week FE, YES, ///
			Holiday FE, YES , ///
			Time varying product attributes , YES , ///
			Reviews, NO)

			
use "Y:\agrajg\Research\Data\temp\010301_DataforQuantityRegressions.dta", clear
keep in 1/2
estimates use "Y:\agrajg\Research\Output\020230_QuantityEffect_Spec2.ster"
// estimates use "Y:\agrajg\Research\Output\020229_QuantityEffect_Spec1_Stage2.ster"
estimates replay
outreg2 using Y:\agrajg\Research\Output\020231_MarketOutcomeOnPurgeSpec2,  ///
	cttop(Bookings) ///
	dec(3) ///
	keep(T_RegPurgeDum T_RegCalledIllegal T_RegDebate T_RegRedSupply  T_RegDataDiscDum T_RegActRegImpDum) ///
	sortvar(T_RegPurgeDum T_RegCalledIllegal T_RegDebate T_RegRedSupply  T_RegDataDiscDum T_RegActRegImpDum) tex(frag pr) ///
	label ///
	addtext(Listing FE, YES, ///
			Year FE, YES, ///
			Month FE, YES, ///
			Day of Month FE, YES,  ///
			Week of Month FE, YES, ///
			Day of Week FE, YES, ///
			Holiday Week FE, YES, ///
			Holiday FE, YES , ///
			Time varying product attributes , YES , ///
			Reviews, NO)
