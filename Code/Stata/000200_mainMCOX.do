*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
********************************** BEGIN ***************************************
****************************** mainMCOX.do *************************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
clear all
set more off 
********************************************************************************
************************* MCOX Reviews data ************************************
********************************************************************************
*CSV TO DTA AND APPEND

*===============================================================================
do "Y:\agrajg\Research\Code\Stata\csvtodta_append_MCOX_reviews_data.do"
*===============================================================================

********************************************************************************
************************* MCOX Property data ***********************************
********************************************************************************
*CSV TO DTA AND APPEND

*===============================================================================
do "Y:\agrajg\Research\Code\Stata\csvtodta_append_MCOX_property_data.do"
*===============================================================================

********************************************************************************

*===============================================================================
do "Y:\agrajg\Research\Code\Stata\cleaning_MCOX_property_data.do"
*===============================================================================

********************************************************************************

*===============================================================================
compress
save "Y:\agrajg\Research\Data\FinalData\MCOX_property_data_clean_final.dta", replace
export delimited using "Y:\agrajg\Research\Data\FinalData\MCOX_property_data_clean_final.csv", replace
*===============================================================================
********************************************************************************
*sampling 50 properties

*===============================================================================
do "Y:\agrajg\Research\Code\Stata\sample50properties_v11.do"
compress
save "Y:\agrajg\Research\Data\FinalData\MCOX_property_data_clean_final_sample50.dta", replace 
export delimited using "Y:\agrajg\Research\Data\FinalData\MCOX_property_data_clean_final_sample50.csv", replace
*===============================================================================

********************************************************************************

*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
**********************************  END  ***************************************
******************************** mainMCOX.do ***********************************
*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
