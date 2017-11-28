************ THIS FILE GENERATES date AND ALL POSSIBLE SEASONALS ***************
************ TO LATER REMOVE SEASONAL VARIATION FROM THE DATA ******************
cd "Y:\agrajg\Research\Code\Stata\Seasonals\"
clear all
set more off
glo last_date = 25000
set obs $last_date
gen date = _n
format %td date
********************************************************************************
*** MERGING WITH THE LIST OF HOLIDAYS
sort date
merge 1:1 date using "Y:\agrajg\Research\Code\Stata\Seasonals\holidaylistcleaned.dta"
drop if _merge ==2
drop _merge
*rename Holiday holiday
format %15s holiday
label var holiday "Holiday Name"
********************************************************************************
/*** CLEANING holiday variable
replace holiday = strtrim(holiday )
replace holiday = "Christmas"  if holiday=="Christmas Day" | holiday =="Day after Christmas"
replace holiday = "Thanksgiving" if  holiday=="Day after Thanksgiving"| holiday =="Thanksgiving"
replace holiday = "Independence Day" if holiday == "Independence Day (observed)"
replace holiday = "Election Day" if holiday == "Election Day"
replace holiday = "New Years" if holiday == "New Years Day"
*/
********************************************************************************
*** SIMPLE TIME MEASURES
gen year = year(date)
label variable year "year"

gen moy = month(date)
label variable moy "month of the year"

gen dom = day(date)
label variable dom "day of the month"

gen qoy = quarter(date)
label variable qoy "quarter of the year"

gen dow = dow(date)
label variable dow "day of the week(Monday = 1, Sunday = 0)"

gen woy1 = week(date)
label variable woy1 "week of the year(starting First day of year)"

sort year moy date
gen woy2 = (dow==1)
by year : replace woy2 = sum(woy2)
label variable woy2 "week of the year(starting First Monday of year)"

gen doy = doy(date)
label variable doy "day of the year"
********************************************************************************
*** Week of month starting First day of month 
sort moy year date
gen wom1 = (dom==1 | dom==8 | dom==15 | dom==22| dom==29)
by moy year: replace wom1 = sum(wom1)
label variable wom1 " Week of month(starting First day of month)"
*** Week of month starting First Monday of month 
sort moy year date
gen wom2 = (dow==1)
by moy year: replace wom2 = sum(wom2)
label variable wom2 " Week of month(starting First Monday of month)"
********************************************************************************
clonevar holidaywoy1 = holiday
sort year woy1 date
by year woy1: replace holidaywoy1 = holidaywoy1[_n-1] if missing(holidaywoy1 )
gsort year woy1 - date
by year woy1: replace holidaywoy1 = holidaywoy1[_n-1] if missing(holidaywoy1 )
sort date
replace holidaywoy1  = "No holiday" if holidaywoy1 ==""
label variable holidaywoy1 "Holiday week (starting First day of year)"
********************************************************************************
clonevar holidaywom1 = holiday
sort year moy wom1 date
by year moy wom1: replace holidaywom1 = holidaywom1[_n-1] if missing(holidaywom1 )
gsort year moy wom1 - date
by year moy wom1: replace holidaywom1 = holidaywom1[_n-1] if missing(holidaywom1 )
sort date
replace holidaywom1  = "No holiday" if holidaywom1 ==""
label variable holidaywom1 "Holiday week (starting First day of year)"
********************************************************************************
clonevar holidaywoy2 = holiday
sort year woy2 date
by year woy2: replace holidaywoy2 = holidaywoy2[_n-1] if missing(holidaywoy2 )
gsort year woy2 - date
by year woy2: replace holidaywoy2 = holidaywoy2[_n-1] if missing(holidaywoy2 )
sort date
replace holidaywoy2  = "No holiday" if holidaywoy2 ==""
label variable holidaywoy2 "Holiday week (starting First Monday of year)"
********************************************************************************
clonevar holidaywom2 = holiday
sort year moy wom2 date
by year moy wom2: replace holidaywom2 = holidaywom2[_n-1] if missing(holidaywom2 )
gsort year moy wom2 - date
by year moy wom2: replace holidaywom2 = holidaywom2[_n-1] if missing(holidaywom2 )
sort date
replace holidaywom2  = "No holiday" if holidaywom2 ==""
label variable holidaywom2 "Holiday week (starting First Monday of year)"
********************************************************************************
replace holiday = "No holiday" if holiday ==""
********************************************************************************
** use one of the holiday dummy
global YR year
*tuples qoy moy, display  min(1) max(1)
global QM qoy moy
*tuples woy1 woy2 wom1 wom2 holidaywoy1 holidaywom1 holidaywoy2 holidaywom2, display  min(1) max(1)
global WEEK woy1 woy2 wom1 wom2 holidaywoy1 holidaywom1 holidaywoy2 holidaywom2
global DAY doy dom holiday
global WEEKDAY dow
*** converting string varaible to factor variable

glo STRVAR holiday holidaywoy1 holidaywom1 holidaywoy2 holidaywom2
foreach strvar in $STRVAR {
	encode `strvar' , gen (`strvar'1)
	drop  `strvar'
	rename  `strvar'1  `strvar'
}


*** DATES IN MY SAMPLE
sort date
keep if date >= td(01aug2014) & date <= td(31mar2017)

********************************************************************************
********************** REGULATIONS VARIABLES ***********************************
********************************************************************************
gen RegPurgeDum = (date>=td(01oct2015))
label var RegPurgeDum "Dummy = 1 after purge"
gen RegDataDiscDum = (date>=td(01dec2015))
label var RegDataDiscDum "Dummy = 1 after data disclosure"
gen RegActRegImpDum = (date>=td(01nov2016))
label var RegActRegImpDum "Dummy = 1 after actual regualtion"
********************************************************************************
********************************************************************************

foreach var of varlist  *  { 
rename `var' T_`var'
}
rename T_date date

********************************************************************************
save "Y:\agrajg\Research\Data\temp\010211_T_AllTimeVariables.dta", replace
********************************************************************************


