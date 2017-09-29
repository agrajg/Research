********************************************************************************
************************* BASE REGRESSION **************************************
******************** LISTING TYPE , BEDROOMS, BATHROOMS*************************
********************************************************************************
clear all
timer on 1
use "DataForRegressionParallal.dta", clear
*do "Y:\agrajg\Research\Code\Stata\sample50properties_v11.do"
*keep if date >=td(1aug2016) & date <td(5Aug2016) 
sum date
local datemin = `r(min)'
local datemax = `r(max)'
local dateminplus1 = `r(min)' + 1
local datemaxminus1 = `r(max)' - 1

di `datemin'
di `datemax'
di `dateminplus1'
di `datemaxminus1'

rename ltypedum3 privateroomdum
di "loop at " `datemin'
regress lprice ltypedum* bedrooms bathrooms if date ==`datemin'
outreg2 using "Y:\agrajg\Research\Output\RegressionBasePar", replace side cttop(`datemin') sortvar(ltypedum* bedrooms bathrooms) e(all)

forvalues i = `dateminplus1'(1)`datemaxminus1' {
	di "loop at " `i'
	regress lprice ltypedum* bedrooms bathrooms if date==`i'
    outreg2 using "Y:\agrajg\Research\Output\RegressionBasePar", side cttop(`i') sortvar(ltypedum* bedrooms bathrooms) e(all)
}
di "loop at " `datemax'
regress lprice ltypedum* bedrooms bathrooms if date==`datemax'
outreg2 using "Y:\agrajg\Research\Output\RegressionBasePar", side cttop(`datemax') sortvar(ltypedum* bedrooms bathrooms) e(all) see excel tex dta 

timer off 1
timer list
********************************************************************************
********************************************************************************
********************************************************************************


*bys date : outreg2 using basereg1test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms
*bys date : outreg2 using basereg2test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms dist*
*bys date : outreg2 using basereg3test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms nbhddum*
*bys date : outreg2 using basereg4test,  e(all) side replace see : reg lprice ltypedum1 ltypedum3 ltypedum4 bedrooms bathrooms nbhddum* dist*
