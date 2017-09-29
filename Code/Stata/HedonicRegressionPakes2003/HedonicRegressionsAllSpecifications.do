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
use "Y:\agrajg\Research\Data\temp\HedonicRegressionData.dta", clear
*do "Y:\agrajg\Research\Code\Stata\sample50properties_v11.do"
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

regress lprice ltypedum* bedrooms bathrooms
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb", replace 	cttop(Base) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms bedXbath
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Base + Bed X Bath) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms bedXbath bedXltypedum*
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Same + Bed X Listing Type) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms dist* 
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Base + Distance to major locations) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms bedXbath  dist*
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Same + Bed X Bath) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms bedXbath bedXltypedum*  dist*
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb", 			cttop(Same + Bed X Listing Type) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms nbhddum* 
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Base + Neighborhood Dummy) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms bedXbath  nbhddum*
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Same + Bed X Bath) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms bedXbath bedXltypedum*  nbhddum*
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Same + Bed X Listing Type) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

********************************************************************************
regress lprice ltypedum* bedrooms bathrooms $OtherCovariates
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Base + All Covariates) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms bedXbath $OtherCovariates
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Same + Bed X Bath) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms bedXbath bedXltypedum* $OtherCovariates
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Same + Bed X Listing Type) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms  dist* $OtherCovariates
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Base + Distance + All Covariates) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms bedXbath  dist* $OtherCovariates
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Same + Bed X Bath) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms bedXbath bedXltypedum*  dist* $OtherCovariates
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Same + Bed X Listing Type) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms  nbhddum* $OtherCovariates
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Base + Neighborhood + All Covariates) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms bedXbath  nbhddum* $OtherCovariates
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Same + Bed X Bath) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all)

regress lprice ltypedum* bedrooms bathrooms bedXbath bedXltypedum*  nbhddum* $OtherCovariates
outreg2 using "Y:\agrajg\Research\Output\HedonicRegressionsAllSpecificationsAllperiodAbsorb",  			cttop(Same + Bed X Listing Type) sortvar(ltypedum* bedrooms bathrooms bedXbath bedXltypedum* nbhddum*) e(all) see excel dta 


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
