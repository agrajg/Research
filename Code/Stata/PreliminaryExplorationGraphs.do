use "Y:\agrajg\Research\Output\020101_NumberOfListingHostByDate.dta" , clear
merge 1:1 date using "Y:\agrajg\Research\Data\Seasonals\seasonals_01aug2014to31mar2017.dta"
********************************************************************************
capture drop yhat1 
capture drop yhat2 
capture drop uhat1 
capture drop uhat2

reg 	NumListing 	i.year i.moy i.dow i.holidaywom2 i.wom1 i.holiday
predict yhat1
gen uhat1 = NumListing - yhat1

reg 	NumHost  	i.year i.moy i.dow i.holidaywom2 i.wom1 i.holiday
predict yhat2
gen uhat2 = NumHost - yhat2
twoway (line uhat1 date, sort) (line uhat2 date, sort), ylabel(#11, angle(horizontal) grid glpattern(dot)) xline(20411 20493 20758, lpattern(tight_dot)) xlabel(#18, angle(forty_five) grid glpattern(dot)) scheme(tufte) scale(0.7)
********************************************************************************

use "Y:\agrajg\Research\Output\020101_NumberOfListingsByDateStatus.dta" , clear
merge 1:1 date using "Y:\agrajg\Research\Data\Seasonals\seasonals_01aug2014to31mar2017.dta"
********************************************************************************
capture drop yhat1 
capture drop yhat2 
capture drop uhat1 
capture drop uhat2

reg 	NumListing 	i.year i.moy i.dow i.holidaywom2 i.wom1 i.holiday
predict yhat1
gen uhat1 = NumListing - yhat1

reg 	NumHost  	i.year i.moy i.dow i.holidaywom2 i.wom1 i.holiday
predict yhat2
gen uhat2 = NumHost - yhat2
twoway (line uhat1 date, sort) (line uhat2 date, sort), ylabel(#11, angle(horizontal) grid glpattern(dot)) xline(20411 20493 20758, lpattern(tight_dot)) xlabel(#18, angle(forty_five) grid glpattern(dot)) scheme(tufte) scale(0.7)

