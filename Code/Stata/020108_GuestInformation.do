clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonalsOnlyBooked.dta" , clear


preserve
collapse (count) count_date=date (min) min_date=date (max) max_date=date, by (bookeddate reservationid )
format %9.0g count_date
rename count_date LengthStay
label var LengthStay "Length of stay"
histogram LengthStay, discrete width(1) start(0) frequency ylabel(#10, angle(horizontal) grid) ymtick(##2, grid) xtitle(Length of stay) xlabel(0(7)100, angle(horizontal) grid) scheme(tufte) scale(0.8)
restore
