*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
********************************** BEGIN ***************************************
********************** cleaning_MCOX_property_data.do **************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
clear all 
set more off 

*===============================================================================
use "Y:\agrajg\Research\Data\RawMCOX_listings_dta_data\allappended_listings.dta", clear
*===============================================================================

destring id , generate(propertyid) force
order id propertyid
format %30s id

********************************************************************************
*Saving dirty data
preserve
keep if propertyid==.

*===============================================================================
*save "Y:\agrajg\Research\Data\FinalData\MCOX_property_data_dirty.dta", replace
*===============================================================================

restore 
********************************************************************************

drop if propertyid ==.
drop v*



*** Date variables
glo DATE_VARIABLES last_scraped host_since calendar_last_scraped first_review  last_review
foreach var in $DATE_VARIABLES {
	replace `var' = strtrim(`var')
	gen temp`var' = date(`var', "YMD") 
	order temp`var', after (`var')
	drop `var'
	rename temp`var' `var'
	format `var' %td
}



*** Other Numeric Variables
glo NUMVar  scrape_id  host_id  latitude longitude accommodates bathrooms bedrooms beds square_feet price weekly_price monthly_price guests_included extra_people minimum_nights maximum_nights availability_30 availability_60 availability_90 availability_365  number_of_reviews   review_scores_rating review_scores_accuracy review_scores_cleanliness review_scores_checkin review_scores_communication review_scores_location review_scores_value host_listing_count
foreach var in $NUMVar {
	destring `var', replace force 
}


********************************************************************************
gen zip = regexs(1) if regexm( zipcode, "([0-9][0-9][0-9][0-9][0-9])[\-]*[0-9]*[ a-zA-Z]*$")
replace zip = "10001" if strmatch(zipcode ,"100")==1
replace zip = "10011" if strmatch(zipcode ,"100 11")==1
replace zip = "10001" if strmatch(zipcode ,"1001")==1
replace zip = "10003" if strmatch(zipcode ,"1003")==1
replace zip = "10036" if strmatch(zipcode ,"10036 - 6419")==1
replace zip = "10001" if strmatch(zipcode ,"1")==1
replace zip = "10011" if strmatch(zipcode ,"11")==1
replace zip = "11201" if strmatch(zipcode ,"[11201-9998]")==1
order zip, after(zipcode)
********************************************************************************
gen scraped_date     = td(01jan2015) if last_scraped == td(01jan2015) |  last_scraped == td(02jan2015) |  last_scraped == td(03jan2015)  |  last_scraped == td(26jan2015) 
*replace scraped_date = td(01feb2015) if last_scraped == td(26jan2015) 
replace scraped_date = td(01mar2015) if last_scraped == td(01mar2015) | last_scraped == td(02mar2015)  | last_scraped == td(03mar2015) 
replace scraped_date = td(01apr2015) if last_scraped == td(02apr2015) | last_scraped == td(03apr2015) 
replace scraped_date = td(01may2015) if last_scraped == td(01may2015) | last_scraped == td(02may2015)  | last_scraped == td(03may2015) 
replace scraped_date = td(01jun2015) if last_scraped == td(01jun2015) |  last_scraped == td(02jun2015)  | last_scraped == td(03jun2015) 
replace scraped_date = td(01aug2015) if last_scraped == td(01aug2015) |  last_scraped == td(02aug2015)
replace scraped_date = td(01sep2015) if last_scraped == td(01sep2015) |  last_scraped == td(02sep2015) 
replace scraped_date = td(01oct2015) if last_scraped == td(01oct2015) 
replace scraped_date = td(01nov2015) if last_scraped == td(01nov2015) |  last_scraped == td(02nov2015) 
replace scraped_date = td(20nov2015) if last_scraped == td(20nov2015)
replace scraped_date = td(01dec2015) if last_scraped == td(02dec2015)   
replace scraped_date = td(01jan2016) if last_scraped == td(01jan2016) | last_scraped == td(02jan2016)
replace scraped_date = td(01feb2016) if last_scraped == td(02feb2016) | last_scraped == td(03feb2016) 
replace scraped_date = td(01apr2016) if last_scraped == td(03apr2016) 
replace scraped_date = td(01may2016) if last_scraped == td(02may2016) 
replace scraped_date = td(01jun2016) if last_scraped == td(02jun2016) | last_scraped == td(03jun2016) 
replace scraped_date = td(01jul2016) if last_scraped == td(02jul2016) | last_scraped == td(03jul2016) 
replace scraped_date = td(01oct2016) if last_scraped == td(01oct2016) | last_scraped == td(02oct2016)
replace scraped_date = td(01nov2016) if last_scraped == td(02nov2016) 
replace scraped_date = td(01dec2016) if last_scraped == td(03dec2016) | last_scraped == td(04dec2016)
replace scraped_date = td(01mar2017) if last_scraped == td(02mar2017) | last_scraped == td(03mar2016) | last_scraped == td(04mar2017)
order scraped_date, after(last_scraped)
drop if scraped_date==.
format scraped_date %td
********************************************************************************
drop id /* dropping string id variable, propertyid numaric */
duplicates drop propertyid scraped_date, force
********************************************************************************
****TRIMMING ALL STRING VARIABLES***********************************************
global string_var name picture_url host_name host_picture_url street ///
	neighbourhood neighbourhood_cleansed city state zipcode zip market ///
	country is_location_exact property_type room_type bed_type ///
	calendar_updated listing_url summary space description ///
	host_url host_location host_about host_response_time host_response_rate ///
	host_acceptance_rate host_is_superhost neighbourhood_group_cleansed ///
	requires_license license jurisdiction_names calculated_host_listings_count ///
	reviews_per_month experiences_offered neighborhood_overview notes transit ///
	thumbnail_url medium_url xl_picture_url host_thumbnail_url ///
	host_neighbourhood host_listings_count host_total_listings_count /// 
	host_verifications host_has_profile_pic host_identity_verified /// 
	smart_location country_code amenities security_deposit cleaning_fee ///
	has_availability instant_bookable cancellation_policy ///
	require_guest_profile_picture require_guest_phone_verification ///
	access interaction house_rules
foreach var in $string_var {
	replace `var' = trim( `var' )
	format %24s `var'
	replace `var' = subinstr(`var' , "{", "",.)
	replace `var' = subinstr(`var' , `"""', "-",.)
	replace `var' = subinstr(`var' , "}", "",.)
}
******************CLEANING NEIGHBOURHOOD****************************************
********************************************************************************
************FILLING IN NEIGHBOURHOOD USING COORDINATES**************************
******************NEAREST COORDINATE AVAILABLE *********************************
*** SEARCHING THE KNOWN NEIGHBOURHOOD COORDINATE AND THEN ASSIGNING THE ********
*** SAME NEIGHBOURHOOD AS THE CLOSETS COORDINATE *******************************
********************************************************************************

preserve
keep if neighbourhood_cleansed !=""
contract propertyid neighbourhood_cleansed latitude longitude 
gen dist =.

*===============================================================================
save "Y:\agrajg\Research\Data\temp\has_neighbourhood_listings.dta", replace
*===============================================================================

restore 

preserve
keep if neighbourhood_cleansed ==""
contract propertyid neighbourhood_cleansed latitude longitude 

*===============================================================================
save "Y:\agrajg\Research\Data\temp\no_neighbourhood_listings.dta", replace
*===============================================================================

restore 

preserve
clear all
g search_lat =.
g search_long = .
g search_pid = .
g closest_lat = .
g closest_long = .
g closest_neighbourhood_cleansed = ""
g closest_propertyid= .

*===============================================================================
save "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta", replace
*===============================================================================

restore

preserve
clear all
g search_lat =.
g search_long = .
g search_pid = .
g closest_lat = .
g closest_long = .
g closest_neighbourhood_cleansed = ""
g closest_propertyid= .
set obs 1

*===============================================================================
save "Y:\agrajg\Research\Data\temp\matched_neighbourhood_test.dta", replace
*===============================================================================

restore

preserve

*===============================================================================
use "Y:\agrajg\Research\Data\temp\no_neighbourhood_listings.dta", clear 
*===============================================================================

count
global cnt = r(N)
forvalues i = 1(1) $cnt {
*forvalues i = 1(1) 2 {

*===============================================================================
use "Y:\agrajg\Research\Data\temp\no_neighbourhood_listings.dta", clear
*===============================================================================

global search_lat  = latitude[`i'] 
global search_long = longitude[`i']
global search_pid = propertyid[`i']

*===============================================================================
use "Y:\agrajg\Research\Data\temp\has_neighbourhood_listings.dta", clear
*===============================================================================

replace dist  = (latitude - $search_lat)^2 + (longitude - $search_long)^2
egen min_dist = min(dist)
keep if min_dist == dist
global closest_lat = latitude[1]
global closest_long = longitude[1]
capture global closest_neighbourhood_cleansed = neighbourhood[1] 
capture global closest_neighbourhood_cleansed = neighbourhood_cleansed[1]
global closest_propertyid = propertyid[1]

*macro list

*===============================================================================
use "Y:\agrajg\Research\Data\temp\matched_neighbourhood_test.dta", clear
*===============================================================================

replace search_lat = $search_lat
replace search_long = $search_long
replace search_pid = $search_pid
replace closest_lat = $closest_lat
replace closest_long = $closest_long
replace closest_neighbourhood_cleansed = "$closest_neighbourhood_cleansed"
replace closest_propertyid= $closest_propertyid

*===============================================================================
save "Y:\agrajg\Research\Data\temp\matched_neighbourhood_test.dta", replace
*===============================================================================

*===============================================================================
use "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta", clear
append using "Y:\agrajg\Research\Data\temp\matched_neighbourhood_test.dta"
save "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta", replace
*===============================================================================

}


*===============================================================================
use "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta", clear
*===============================================================================

drop closest_lat closest_long closest_propertyid
rename search_lat  latitude 
rename search_long  longitude
rename search_pid  propertyid 

*===============================================================================
save "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta", replace
*===============================================================================

restore

*===============================================================================
merge m:1 propertyid latitude longitude using "Y:\agrajg\Research\Data\temp\matched_neighbourhood.dta", nogenerate
*===============================================================================

replace neighbourhood_cleansed = closest_neighbourhood_cleansed  if neighbourhood_cleansed==""
drop closest_neighbourhood_cleansed
********************************************************************************
*********************CLEANING LATIUDE AND LONGITUDE*****************************
********************************************************************************
*latitude
bys propertyid latitude : gen count_within_group = _N if latitude !=.
bys propertyid : egen max_count = max(count_within_group)
by propertyid: gen new_lat = latitude if max_count==count_within_group
bysort propertyid: carryforward new_lat, gen(new_lat2)
gsort +propertyid -latitude
bysort propertyid: carryforward new_lat, gen(new_lat3)
gen lat_final = new_lat2
replace lat_final = new_lat3 if lat_final==.
replace latitude= lat_final
drop count_within_group max_count new_lat new_lat2 new_lat3 lat_final 
*longitude
bys propertyid longitude  : gen count_within_group = _N if longitude  !=.
bys propertyid : egen max_count = max(count_within_group)
by propertyid: gen new_long = longitude  if max_count==count_within_group
bysort propertyid: carryforward new_long, gen(new_long2)
gsort +propertyid -longitude 
bysort propertyid: carryforward new_long, gen(new_long3)
gen long_final = new_long2
replace long_final = new_long3 if long_final==.
replace longitude = long_final
drop count_within_group max_count new_long new_long2 new_long3 long_final
********************************************************************************
*Filling in for missing data using closest data available
*Check later to see if this creates issues
*** These are all string variables
glo string_var street
glo string_vars listing_url name summary space description experiences_offered neighborhood_overview notes transit access interaction house_rules thumbnail_url medium_url picture_url xl_picture_url host_url host_name host_location host_about host_response_time host_response_rate host_acceptance_rate host_is_superhost host_thumbnail_url host_picture_url host_neighbourhood host_listings_count host_total_listings_count host_verifications host_has_profile_pic host_identity_verified street neighbourhood neighbourhood_cleansed neighbourhood_group_cleansed city state zipcode zip market smart_location country_code country is_location_exact property_type room_type bed_type amenities security_deposit cleaning_fee calendar_updated has_availability requires_license license jurisdiction_names instant_bookable cancellation_policy require_guest_profile_picture require_guest_phone_verification calculated_host_listings_count reviews_per_month
*** These are all numaric variables
glo numaric_var host_since
glo numaric_vars host_id host_since latitude longitude accommodates bathrooms bedrooms beds square_feet price weekly_price monthly_price guests_included extra_people minimum_nights maximum_nights availability_30 availability_60 availability_90 availability_365 calendar_last_scraped number_of_reviews last_review first_review review_scores_rating review_scores_accuracy review_scores_cleanliness review_scores_checkin review_scores_communication review_scores_location review_scores_value host_listing_count

foreach item in $string_vars{
	replace `item' = trim( `item' )
	format %24s `item'
	sort propertyid scraped_date
	by propertyid : replace `item' = `item'[_n-1] if `item' ==""
	sort propertyid -scraped_date
	by propertyid : replace `item' = `item'[_n-1] if `item' ==""
	sort propertyid scraped_date
	by propertyid : replace `item' = `item'[_n+1] if `item' ==""
	sort propertyid -scraped_date
	by propertyid : replace `item' = `item'[_n+1] if `item' ==""
}

foreach item in $numaric_vars{
	sort propertyid scraped_date
	by propertyid : replace `item' = `item'[_n-1] if `item' ==.
	sort propertyid -scraped_date
	by propertyid : replace `item' = `item'[_n-1] if `item' ==.
	sort propertyid scraped_date
	by propertyid : replace `item' = `item'[_n+1] if `item' ==.
	sort propertyid -scraped_date
	by propertyid : replace `item' = `item'[_n+1] if `item' ==.
}





********************************************************************************
order propertyid scraped_date
duplicates drop
duplicates drop propertyid scraped_date, force

*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
**********************************  END  ***************************************
********************** cleaning_MCOX_property_data.do **************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
