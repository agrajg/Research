********************************************************************************
************************* BASE REGRESSION **************************************
******************** LISTING TYPE , BEDROOMS, BATHROOMS, DISTANCE **************
******************************* BEGIN ******************************************
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
regress lprice ltypedum* bedrooms bathrooms dist*
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsBaseDist", replace side cttop(`datemin') sortvar(ltypedum* bedrooms bathrooms dist*) e(all)
*outreg2 using "Y:\agrajg\Research\Output\Par\HedonicRegressionsBaseDist", replace side cttop(`datemin') sortvar(ltypedum* bedrooms bathrooms dist*) e(all)

forvalues i = `dateminplus1'(1)`datemaxminus1' {
	di "loop at " `i'
	di "======================>"
	use "Y:\agrajg\Research\Data\temp\DatebrokenbyDates`i'.dta", clear
	rename ltypedum3 privateroomdum
	regress lprice ltypedum* bedrooms bathrooms dist* 
    outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsBaseDist", side cttop(`i') sortvar(ltypedum* bedrooms bathrooms dist*) e(all)
	*outreg2 using "Y:\agrajg\Research\Output\Par\HedonicRegressionsBaseDist", side cttop(`i') sortvar(ltypedum* bedrooms bathrooms dist*) e(all)
}
di "loop at " `datemax'
di "======================>"
use "Y:\agrajg\Research\Data\temp\DatebrokenbyDates`datemax'.dta", clear
rename ltypedum3 privateroomdum
regress lprice ltypedum* bedrooms bathrooms dist* 
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsBaseDist", side cttop(`datemax') sortvar(ltypedum* bedrooms bathrooms dist*) e(all) see excel dta 
*outreg2 using "Y:\agrajg\Research\Output\Par\HedonicRegressionsBaseDist", side cttop(`datemax') sortvar(ltypedum* bedrooms bathrooms dist*) e(all) see excel tex dta 


********************************************************************************
************************* BASE REGRESSION **************************************
******************** LISTING TYPE , BEDROOMS, BATHROOMS, DISTANCE **************
*****************************END************************************************
********************************************************************************


*bys date : outreg2 using basereg1test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms
*bys date : outreg2 using basereg2test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms dist*
*bys date : outreg2 using basereg3test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms nbhddum*
*bys date : outreg2 using basereg4test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms nbhddum* dist*
