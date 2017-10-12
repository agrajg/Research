*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
********************************** BEGIN ***************************************
****************************** mainAIRDNA.do ***********************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
* This do file runs all AIRDNA data cleaning do files in appropriate order 
clear all
set more off 
capture log close
timer clear


* ==============================================================================
	do 						"Y:\agrajg\Research\Code\Stata\000101_csvtodta_AIRDNA_AllData.do"
* ==============================================================================


* ==============================================================================
	do 						"Y:\agrajg\Research\Code\Stata\000102_cleaning_AIRDNA_property_data.do" 
* ==============================================================================	


* ==============================================================================
	do 						"Y:\agrajg\Research\Code\Stata\000103_cleaning_AIRDNA_market_data.do"
* ==============================================================================



*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
*********************************** END 000100 *********************************
****************************** mainAIRDNA.do ***********************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
