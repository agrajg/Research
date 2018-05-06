** needs to be changed later
clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonalsOnlyBooked.dta" , clear
gen WeekendDum = (dow==5 | dow ==6)

gen HolidayDum = (holiday != 14)

collapse (count) count_date=date (min) min_date=date (max) max_date=date (sum) sum_WeekendDum = WeekendDum (sum) sum_HolidayDum =HolidayDum, by (propertyid reservationid bookeddate)
format %9.0g count_date

rename count_date StayLength
label var StayLength "Stay Length"
 
gen AdvBookingDays = min_date - bookeddate
replace AdvBookingDays = 0 if AdvBookingDays < 0 
format %9.0g AdvBookingDays
label var AdvBookingDays "Days in advance"

rename sum_WeekendDum NWeekendDays
label var NWeekendDays "Fridays and Saturdays"

rename sum_HolidayDum NHolidays
label var NHolidays "Holidays"

merge m:1 propertyid using "Y:\agrajg\Research\Data\temp\010213_L_listingtype.dta"
keep if _merge ==3
drop _merge

preserve
collapse (mean) meanStayLength = StayLength meanAdvBookingDays = AdvBookingDays meanNWeekendDays=NWeekendDays meanNHolidays =NHolidays ///
	(sd) sdStayLength = StayLength sdAdvBookingDays = AdvBookingDays sdNWeekendDays=NWeekendDays sdNHolidays =NHolidays ///
	(count) countStayLength = StayLength countAdvBookingDays = AdvBookingDays countNWeekendDays=NWeekendDays countNHolidays =NHolidays

gen i="All guests"
order i
reshape long count mean sd, i(i) j(var) s
save "Y:\agrajg\Research\Output\010211_AllGuestCharSumStats.dta", replace
restore
preserve
collapse (mean) meanStayLength = StayLength meanAdvBookingDays = AdvBookingDays meanNWeekendDays=NWeekendDays meanNHolidays =NHolidays ///
	(sd) sdStayLength = StayLength sdAdvBookingDays = AdvBookingDays sdNWeekendDays=NWeekendDays sdNHolidays =NHolidays ///
	(count) countStayLength = StayLength countAdvBookingDays = AdvBookingDays countNWeekendDays=NWeekendDays countNHolidays =NHolidays, ///
	by (L_listingtype)
reshape long count mean sd, i(L_listingtype) j(var) s
decode L_listingtype, gen(i)

append using Y:\agrajg\Research\Output\010211_AllGuestCharSumStats.dta
drop L_listingtype
drop if i == "NR"
order var i count mean sd 
gsort - var i


label var var "Characteristic" 
label var i "Listing type"
label var count "N"
label var mean "Mean"
label var sd "Sd"

foreach var in mean sd {
replace `var' = round(`var', 0.01)
}

replace var = "Stay length" if var =="StayLength"
replace var = "Weekends booked" if var =="NWeekendDays"
replace var = "Holidays booked" if var =="NHolidays"
replace var = "Days in advance" if var =="AdvBookingDays"

texsave using "T:\agrajg\Output\010211_AllAndLTypeGuestCharSumStats.tex" , ///
	title(Guest Characteristics and choice of listing type) ///
	size(3) ///
	width(\textwidth) ///
	align(XXCCC) ///
	location(t) ///
	marker(010211_AllAndLTypeGuestCharSumStats) ///
	autonumber ///
	footnote("Note: Stay Length is calculated directly from the number of days booked. Weekends booked is the number of Fridays and Saturdays in the period of booking. Holidays booked is calculated from number of holidays that have fallen during stay period. Days in advance is computed from the difference of first day of stay and date when the booking was picked by Airdna", size(2)) ///
	varlabels ///
	replace ///
	headlines("\begin{center}") ///
	footlines("\end{center}") ///
	frag ///
	rowsep(0pt)
	
texsave using "Y:\agrajg\Research\Output\010211_AllAndLTypeGuestCharSumStats.tex" , ///
	title(Guest Characteristics and choice of listing type) ///
	size(3) ///
	width(\textwidth) ///
	align(XXCCC) ///
	location(t) ///
	marker(010211_AllAndLTypeGuestCharSumStats) ///
	autonumber ///
	footnote("Note: Stay Length is calculated directly from the number of days booked. Weekends booked is the number of Fridays and Saturdays in the period of booking. Holidays booked is calculated from number of holidays that have fallen during stay period. Days in advance is computed from the difference of first day of stay and date when the booking was picked by Airdna", size(2)) ///
	varlabels ///
	replace ///
	headlines("\begin{center}") ///
	footlines("\end{center}") ///
	frag ///
	rowsep(0pt)
restore




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
