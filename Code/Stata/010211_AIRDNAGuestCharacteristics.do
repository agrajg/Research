** needs to be changed later
clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonalsOnlyBooked.dta" , clear


*preserve
collapse (count) count_date=date (min) min_date=date (max) max_date=date, by (bookeddate reservationid )
format %9.0g count_date
count

rename count_date LengthStay
label var LengthStay "Length of stay"
histogram LengthStay, discrete width(1) start(0) frequency ylabel(#10, angle(horizontal) grid) ymtick(##2, grid) xtitle(Length of stay) xlabel(0(7)100, angle(horizontal) grid) scheme(tufte) scale(0.8)
graph save Graph "Y:\agrajg\Research\Output\020108_HistLengthStay.gph", replace
graph export "Y:\agrajg\Research\Output\020108_HistLengthStay.png" , 		width(2100) height(1500) replace
graph export "T:\agrajg\Output\020108_HistLengthStay.png" , 				width(2100) height(1500) replace


gen AdvBookingDays = min_date - bookeddate
replace AdvBookingDays = 0 if AdvBookingDays < 0 
format %9.0g AdvBookingDays
label var AdvBookingDays "Number of days in advance"
histogram AdvBookingDays, discrete width(7) frequency ylabel(#12, angle(horizontal) grid) xtitle(Number of days in advance) xlabel(0(28)400, angle(horizontal) grid) scheme(tufte)
graph save Graph "Y:\agrajg\Research\Output\020108_HistAdvBookingDays.gph", replace
graph export "Y:\agrajg\Research\Output\020108_HistAdvBookingDays.png" , 	width(2100) height(1500) replace
graph export "T:\agrajg\Output\020108_HistAdvBookingDays.png" , 			width(2100) height(1500) replace


outreg2 using "Y:\agrajg\Research\Output\020108_ConsumerStats", 			///
	sum(detail) keep(LengthStay AdvBookingDays) 							///
	eqkeep(N mean sd min p10 p25 p50 p75 p90 max)							///
	replace tex
outreg2 using "T:\agrajg\Output\020108_ConsumerStats", 						///
	sum(detail) keep(LengthStay AdvBookingDays) 							///
	eqkeep(N mean sd min p10 p25 p50 p75 p90 max)							///
	replace tex


restore
