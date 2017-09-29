********************************************************************************
************************* BASE REGRESSION **************************************
******************** LISTING TYPE , BEDROOMS, BATHROOMS*************************
******************************* BEGIN ******************************************
********************************************************************************
clear all
set more off


*do "Y:\agrajg\Research\Code\Stata\sample50properties_v11.do"
local datemin = 19936
local datemax = 20909
*local datemax = 19941

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
regress lprice ltypedum* bedrooms bathrooms
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsBase", replace side cttop(`datemin') sortvar(ltypedum* bedrooms bathrooms) e(all)
*outreg2 using "Y:\agrajg\Research\Output\Par\HedonicRegressionsBase", replace side cttop(`datemin') sortvar(ltypedum* bedrooms bathrooms) e(all)

forvalues i = `dateminplus1'(1)`datemaxminus1' {
	di "loop at " `i'
	di "======================>"
	use "Y:\agrajg\Research\Data\temp\DatebrokenbyDates`i'.dta", clear
	rename ltypedum3 privateroomdum
	regress lprice ltypedum* bedrooms bathrooms 
    outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsBase", side cttop(`i') sortvar(ltypedum* bedrooms bathrooms) e(all)
	*outreg2 using "Y:\agrajg\Research\Output\Par\HedonicRegressionsBase", side cttop(`i') sortvar(ltypedum* bedrooms bathrooms) e(all)
}
di "loop at " `datemax'
di "======================>"
use "Y:\agrajg\Research\Data\temp\DatebrokenbyDates`datemax'.dta", clear
rename ltypedum3 privateroomdum
regress lprice ltypedum* bedrooms bathrooms 
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsBase", side cttop(`datemax') sortvar(ltypedum* bedrooms bathrooms) e(all) see excel dta 
*outreg2 using "Y:\agrajg\Research\Output\Par\HedonicRegressionsBase", side cttop(`datemax') sortvar(ltypedum* bedrooms bathrooms) e(all) see excel dta 


********************************************************************************
************************* BASE REGRESSION **************************************
******************** LISTING TYPE , BEDROOMS, BATHROOMS*************************
*****************************END************************************************
********************************************************************************


*bys date : outreg2 using basereg1test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms
*bys date : outreg2 using basereg2test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms dist*
*bys date : outreg2 using basereg3test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms nbhddum*
*bys date : outreg2 using basereg4test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms nbhddum* dist*