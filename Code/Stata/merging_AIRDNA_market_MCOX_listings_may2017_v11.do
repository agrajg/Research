clear all 
set more off
use "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_market_dta_data\AIRDNA_market_data_clean2.dta", clear 
 
gen scraped_date =.
replace	scraped_date = td(01jan2015)  
replace scraped_date = td(01mar2015) if date >=td(01mar2015) 
replace scraped_date = td(01apr2015) if date >=td(01apr2015) 
replace scraped_date = td(01may2015) if date >=td(01may2015) 
replace scraped_date = td(01jun2015) if date >=td(01jun2015) 
replace scraped_date = td(01aug2015) if date >=td(01aug2015) 
replace scraped_date = td(01sep2015) if date >=td(01sep2015) 
replace scraped_date = td(01oct2015) if date >=td(01oct2015) 
replace scraped_date = td(01nov2015) if date >=td(01nov2015) 
replace scraped_date = td(20nov2015) if date >=td(20nov2015) 
replace scraped_date = td(01dec2015) if date >=td(01dec2015) 
replace scraped_date = td(01jan2016) if date >=td(01jan2016) 
replace scraped_date = td(01feb2016) if date >=td(01feb2016) 
replace scraped_date = td(01apr2016) if date >=td(01apr2016) 
replace scraped_date = td(01may2016) if date >=td(01may2016) 
replace scraped_date = td(01jun2016) if date >=td(01jun2016) 
replace scraped_date = td(01jul2016) if date >=td(01jul2016) 
replace scraped_date = td(01oct2016) if date >=td(01oct2016) 
replace scraped_date = td(01nov2016) if date >=td(01nov2016) 
replace scraped_date = td(01dec2016) if date >=td(01dec2016) 
replace scraped_date = td(01mar2017) if date >=td(01mar2017) 

save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_market_dta_data\AIRDNA_market_data_clean3.dta", replace

export delimited using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_market_dta_data\AIRDNA_market_data_clean3.csv", replace
