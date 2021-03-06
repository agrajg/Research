clear all 
set more off
********************************************************************************
*** .CSV TO .DTA FILE
*** ALL AIRDNA DATA 
*** NEW AND OLD 
********************************************************************************
import delimited "Y:\agrajg\Research\Data\RawAIRDNA_csv_data\Boroughs_Daily_2014.csv", varnames(1) clear
save  "Y:\agrajg\Research\Data\RawAIRDNA_dta_data\Boroughs_Daily_2014.dta", replace
********************************************************************************
import delimited "Y:\agrajg\Research\Data\RawAIRDNA_csv_data\Boroughs_Daily_2015.csv", varnames(1) clear
save  "Y:\agrajg\Research\Data\RawAIRDNA_dta_data\Boroughs_Daily_2015.dta", replace
********************************************************************************
import delimited "Y:\agrajg\Research\Data\RawAIRDNA_csv_data\Boroughs_Daily_2016.csv", varnames(1) clear
save  "Y:\agrajg\Research\Data\RawAIRDNA_dta_data\Boroughs_Daily_2016.dta", replace
********************************************************************************
import delimited "Y:\agrajg\Research\Data\RawAIRDNA_csv_data\Boroughs_Property_201604.csv", varnames(1) clear
save  "Y:\agrajg\Research\Data\RawAIRDNA_dta_data\Boroughs_Property_201604.dta", replace
********************************************************************************
import delimited "Y:\agrajg\Research\Data\RawAIRDNA_csv_data\MSA_New York-Newark-Jersey City, NY-NJ-PA Metro Area_Daily_2017-04-27.csv", varnames(1) clear
save  "Y:\agrajg\Research\Data\RawAIRDNA_dta_data\MSANewYorkNewarkJerseyCityNYNJPAMetroAreaDaily20170427.dta", replace
********************************************************************************
import delimited "Y:\agrajg\Research\Data\RawAIRDNA_csv_data\MSA_New York-Newark-Jersey City, NY-NJ-PA Metro Area_Monthly_2017-04-27.csv", varnames(1) clear
save  "Y:\agrajg\Research\Data\RawAIRDNA_dta_data\MSANewYorkNewarkJerseyCityNYNJPAMetroAreaMonthly20170427.dta", replace
********************************************************************************
import delimited "Y:\agrajg\Research\Data\RawAIRDNA_csv_data\MSA_New York-Newark-Jersey City, NY-NJ-PA Metro Area_Property_2017-04-27.csv", varnames(1) clear
save  "Y:\agrajg\Research\Data\RawAIRDNA_dta_data\MSANewYorkNewarkJerseyCityNYNJPAMetroAreaProperty20170427.dta", replace
********************************************************************************
