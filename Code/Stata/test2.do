clear all
set more off
use  "Y:\agrajg\Research\Data\temp\010203_MergedAppendedbyDatesBlockedDropped.dta", clear

gen eventtag 		= "Period 1 : Pre Purge" 							if date < td(20nov2015)
replace eventtag 	= "Period 2 : Post Purge - Pre Expose" 				if date >= td(20nov2015) & date < td(10feb2016)
replace eventtag 	= "Period 3 : Post Expose - Pre Law Enforcement" 	if date >= td(10feb2016) & date < td(1nov2016)
replace eventtag 	= "Period 4 : Post Law Enforcement" 				if date >= td(1nov2016)
encode eventtag, generate(event)

*** Total number of listings and hosts in the market over time
*** Categorised by Events...
preserve
timer on 1
collapse (count)countpid = pid, by (date eventtag hid)
collapse (sum) numlistings=countpid (count) numhosts = hid , by ( eventtag date)
label var date "Date of stay"
label var event "Regulatory events"
label var  numlistings "Number of listing(market)"
label var  numhosts "Number of hosts(market)"
save "Y:\agrajg\Research\Output\020101_NumberOfListingsByDate.dta"
timer off 1
restore

*** Total number of Reserved listings and hosts in the market over time
preserve
timer on 1
collapse (count)countpid = pid, by (date eventtag hid status)
collapse (sum) numlistings=countpid (count) numhosts = hid , by (eventtag date status)
by eventtag : sum numlistings numhosts
save "Y:\agrajg\Research\Output\020101_NumberOfListingsByDate.dta"
timer off 1
restore






timer list
