clear all 
set more off
********************************************************************************
*** CLEANING AIRDNA MARKET DATA 
*** CLEANS DATA TO PRODUCE DTA FILES
*** .CSV TO .DTA FILE
********************************************************************************
use  Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_dta_data\Boroughs_Daily_2014.dta, clear
append using  Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_dta_data\Boroughs_Daily_2015.dta
append using  Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_dta_data\Boroughs_Daily_2016.dta

global DATEVARLIST date bookeddate
foreach dtvar in $DATEVARLIST   {
	gen temp`dtvar'  = date( `dtvar' , "YMD")
	format %td temp`dtvar'
	order temp`dtvar', after(`dtvar')
	drop `dtvar'
	rename temp`dtvar' `dtvar'
}
duplicates drop
gen datasetnum = 1
save Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\AIRDNA_market_data1.dta, replace
********************************************************************************
*** NEW MARKET DATA ***
clear all
use  Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_dta_data\MSANewYorkNewarkJerseyCityNYNJPAMetroAreaDaily20170427.dta, clear
global DATEVARLIST date bookeddate
foreach dtvar in $DATEVARLIST   {
	gen temp`dtvar'  = date( `dtvar' , "YMD")
	format %td temp`dtvar'
	order temp`dtvar', after(`dtvar')
	drop `dtvar'
	rename temp`dtvar' `dtvar'
}
duplicates drop
gen datasetnum = 2
save Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\AIRDNA_market_data2.dta, replace

********************************************************************************
*** Appending the old and new market data and then removing duplicates 
*** with respect to all the varibles
clear all 
use Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\AIRDNA_market_data2.dta, clear
append using Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\AIRDNA_market_data1.dta
duplicates drop
label var date "Date of Stay"
label var bookeddate "Date when booking was picked"
save "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_market_dta_data\AIRDNA_market_data_clean1.dta", replace
capture erase "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\AIRDNA_market_data1.dta"
capture erase "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\temp\AIRDNA_market_data2.dta"
export delimited using "Y:\agrajg\Airbnb_data\AirbnbDataCodeMay2017\Data\AIRDNA_market_dta_data\AIRDNA_market_data_clean1.csv", replace

********************************************************************************
