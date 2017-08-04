*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
********************************** BEGIN ***************************************
****************************** mainAIRDNA.do ***********************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
* This do file runs all AIRDNA data cleaning do files in appropriate order 
clear all
set more off 
capture log close
timer clear

********************************************************************************
********************** Convert raw csv into dta files **************************
********************** both market and property data  **************************
********************************************************************************
timer on 1

* ==============================================================================
	do 						"Y:\agrajg\Research\Code\Stata\csvtodta_AIRDNA_AllData.do"
* ==============================================================================

timer off 1
********************************************************************************
**************************** AIRDNA LISTINGS DATA ******************************
********************************************************************************
timer on 2

* ==============================================================================
	do 						"Y:\agrajg\Research\Code\Stata\cleaning_AIRDNA_property_data.do" 
* ==============================================================================	

	* saving all data
	
* ==============================================================================	
	save 					"Y:\agrajg\Research\Data\FinalData\AIRDNA_listings_data_clean_final.dta", replace
	export delimited using 	"Y:\agrajg\Research\Data\FinalData\AIRDNA_listings_data_clean_final.csv", replace
* ==============================================================================

timer off 2
********************************************************************************
* sampling 50 properties
timer on 3

* ==============================================================================
	do 						"Y:\agrajg\Research\Code\Stata\sample50properties_v11.do"
	save 					"Y:\agrajg\Research\Data\FinalData\AIRDNA_listings_data_clean_final_sample50.dta", replace 
	export delimited using 	"Y:\agrajg\Research\Data\FinalData\AIRDNA_listings_data_clean_final_sample50.csv", replace
* ==============================================================================

timer off 3 
********************************************************************************
***************************** AIRDNA MARKET DATA *******************************
********************************************************************************
* I now work here ........ 

* ==============================================================================
do 						"Y:\agrajg\Research\Code\Stata\cleaning_AIRDNA_market_data.do"
* ==============================================================================

*saving all data

* ==============================================================================
save 					"Y:\agrajg\Research\Data\FinalData\AIRDNA_market_data_clean_final.dta", replace 
export delimited using 	"Y:\agrajg\Research\Data\FinalData\AIRDNA_market_data_clean_final.csv", replace
* ==============================================================================

*sampling 50 properties

* ==============================================================================
do 						"Y:\agrajg\Research\Code\Stata\sample50properties_v11.do"
save 					"Y:\agrajg\Research\Data\FinalData\AIRDNA_market_data_clean_final_sample50.dta", replace 
export delimited using 	"Y:\agrajg\Research\Data\FinalData\AIRDNA_market_data_clean_final_sample50.csv", replace
* ==============================================================================

*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
*********************************** END ****************************************
****************************** mainAIRDNA.do ***********************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
