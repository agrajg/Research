clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010208_PanelWithTimeVaryingCharAndSeasonals.dta" , clear
bys hostid : egen TotalAvailableDays = sum (sdum1)
bys hostid : egen TotalBlockedDays = sum (sdum2 )
bys hostid : egen TotalReservedDays = sum (sdum3 )
