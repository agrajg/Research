********************************************************************************
************************* BASE REGRESSION **************************************
******************** LISTING TYPE , BEDROOMS, BATHROOMS*************************
**************************PLUS BEDROOMS X BATHROOMS ****************************
**************************PLUS BEDROOMS X ltypedum1 ****************************
**************************PLUS BEDROOMS X ltypedum2 ****************************
**************************PLUS BEDROOMS X ltypedum4 ****************************
**************************PLUS NEIGHBORHOODS ***********************************
*********************************** BEGIN **************************************
********************************************************************************
clear all
set more off

*do "Y:\agrajg\Research\Code\Stata\sample50properties_v11.do"

local datemin = 19936
local datemax = 20909

*local datemin = 20451
*local datemax = 20455

local dateminplus1 = `datemin' + 1
local datemaxminus1 = `datemax' - 1

di `datemin'
di `datemax'
di `dateminplus1'
di `datemaxminus1'

di "loop at " `datemin'
di "======================>"
use "Y:\agrajg\Research\Data\temp\DatebrokenbyDates`datemin'.dta", clear
rename ltypedum3 privateroomdum
rename nbhddum124 Midtowndum
gen bedXbath = bedrooms * bathrooms
gen bedXltypedum1 = ltypedum1 * bedrooms
gen bedXltypedum2 = ltypedum2 * bedrooms
gen bedXltypedum4 = ltypedum4 * bedrooms
tab propertytype, generate(prtyprdum) 
gen age = date - createddate 
tab checkintime, generate(chintimedum) 
tab checkouttime, generate(chouttimedum)
tab instantbookenabled, generate(instbookdum) 
global OtherCovariates prtyprdum* age maxguests responserate responsetimemin chintimedum* checkinperiod chouttimedum* minimumstay instbookdum*
regress lprice ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum* $OtherCovariates
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsBasePlus2NbhdAll", replace side cttop(`datemin') sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)
*outreg2 using "Y:\agrajg\Research\Output\Par\HedonicRegressionsBasePlus2NbhdAll", replace side cttop(`datemin') sortvar(ltypedum* bedrooms bathrooms) e(all)

forvalues i = `dateminplus1'(1)`datemaxminus1' {
	di "loop at " `i'
	di "======================>"
	use "Y:\agrajg\Research\Data\temp\DatebrokenbyDates`i'.dta", clear
	rename ltypedum3 privateroomdum
	rename nbhddum124 Midtowndum
	gen bedXbath = bedrooms * bathrooms
	gen bedXltypedum1 = ltypedum1 * bedrooms
	gen bedXltypedum2 = ltypedum2 * bedrooms
	gen bedXltypedum4 = ltypedum4 * bedrooms
	tab propertytype, generate(prtyprdum) 
	gen age = date - createddate 
	tab checkintime, generate(chintimedum) 
	tab checkouttime, generate(chouttimedum)
	tab instantbookenabled, generate(instbookdum) 
	global OtherCovariates prtyprdum* age maxguests responserate responsetimemin chintimedum* checkinperiod chouttimedum* minimumstay instbookdum*
	regress lprice ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum* $OtherCovariates
    outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsBasePlus2NbhdAll", side cttop(`i') sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)
	*outreg2 using "Y:\agrajg\Research\Output\Par\HedonicRegressionsBasePlus2NbhdAll", side cttop(`i') sortvar(ltypedum* bedrooms bathrooms) e(all)
}
di "loop at " `datemax'
di "======================>"
use "Y:\agrajg\Research\Data\temp\DatebrokenbyDates`datemax'.dta", clear
rename ltypedum3 privateroomdum
rename nbhddum124 Midtowndum
gen bedXbath = bedrooms * bathrooms
gen bedXltypedum1 = ltypedum1 * bedrooms
gen bedXltypedum2 = ltypedum2 * bedrooms
gen bedXltypedum4 = ltypedum4 * bedrooms
tab propertytype, generate(prtyprdum) 
gen age = date - createddate 
tab checkintime, generate(chintimedum) 
tab checkouttime, generate(chouttimedum)
tab instantbookenabled, generate(instbookdum) 
global OtherCovariates prtyprdum* age maxguests responserate responsetimemin chintimedum* checkinperiod chouttimedum* minimumstay instbookdum*
regress lprice ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum* $OtherCovariates
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsBasePlus2NbhdAll", side cttop(`datemax') sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all) see excel dta 
*outreg2 using "Y:\agrajg\Research\Output\Par\HedonicRegressionsBasePlus2NbhdAll", side cttop(`datemax') sortvar(ltypedum* bedrooms bathrooms) e(all) see excel tex dta 

********************************************************************************
************************* BASE REGRESSION **************************************
******************** LISTING TYPE , BEDROOMS, BATHROOMS*************************
**************************PLUS BEDROOMS X BATHROOMS ****************************
**************************PLUS BEDROOMS X ltypedum1 ****************************
**************************PLUS BEDROOMS X ltypedum2 ****************************
**************************PLUS BEDROOMS X ltypedum4 ****************************
**************************PLUS NEIGHBORHOODS ***********************************
***********************************  END  **************************************
********************************************************************************


*bys date : outreg2 using basereg1test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms
*bys date : outreg2 using basereg2test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms dist*
*bys date : outreg2 using basereg3test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms nbhddum*
*bys date : outreg2 using basereg4test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms nbhddum* dist*
