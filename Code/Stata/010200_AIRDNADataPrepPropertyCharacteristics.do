*********************** AIRDNA DATA PREP ***************************************
*** For all the time invariant property characteristics like location, neighborhood etc
********************************************************************************



clear all
set more off
*** Extracting host IDs and adding them to the market data
*** This is done to make the ids of time/market, host , product and consumer.
*** These IDs will be used through out this work and therefore I am creating them here, once and for all
use "Y:\agrajg\Research\Data\FinalData\AIRDNA_listings_data_clean_final.dta", clear 
********************************************************************************
*************** PRODUCT ATTRIBUTES *********************************************
********************************************************************************
* Property Type 
tab propertytype , gen(zptypedum)
order zptypedum*, after (propertytype )
drop propertytype


* Listing Type
tab listingtype, gen(zltypedum)
order zltypedum* ,after (listingtype )
drop listingtype

* Country dummy, US and NR, state and city 
tab country, gen(zcountrydum)
order zcountrydum* , after(country )
drop country

tab state, gen(zstatedum)
order zstatedum* , after(state)
drop state

tab city, gen (zcitydum)
order zcitydum*, after(city)
drop city

tab zipcode, gen(zzipdum) 
order zzipdum*, after (zipcode)
drop zipcode

tab neighborhood, gen(znbhddum)  
order znbhddum*, after(neighborhood) 
drop neighborhood

tab metropolitanstatisticalarea, gen(zmetareadum)
order zmetareadum*, after(metropolitanstatisticalarea) 
drop metropolitanstatisticalarea

rename bedrooms zbedroom  

rename bathrooms zbathroom  

rename maxguests zmaxguest  

rename responserate zresponserate  

rename responsetimemin zresponsetimemin   

tab superhost, gen(zsuperhost)
order zsuperhost*, after(superhost) 
drop superhost

tab cancellationpolicy , gen( zcancellationpolicy)
order zcancellationpolicy*, after(cancellationpolicy) 
drop cancellationpolicy

rename securitydeposit zsecuritydeposit  

rename cleaningfee zcleaningfee   

rename extrapeoplefee zextrapeoplefee   

rename publishednightlyrate zpublishednightlyrate   

rename publishedmonthlyrate zpublishedmonthlyrate   

rename publishedweeklyrate zpublishedweeklyrate   

tab checkintime , gen(zcheckintime)
order zcheckintime*, after(checkintime)
drop checkintime 

tab checkouttime , gen(zcheckouttime)
order zcheckouttime*, after(checkouttime) 
drop checkouttime

rename minimumstay zminimumstay 

rename numberofphotos znumberofphotos 

tab businessready , gen(zbusinessready)
order zbusinessready*, after(businessready) 
drop businessready

tab instantbookenabled , gen(zinstantbookenabled)
order zinstantbookenabled*, after(instantbookenabled) 
drop instantbookenabled
********************************************************************************
*** Calculating distance from major areas of attraction in New York and the Airports
gen i = 1
capture drop _merge
merge m:1 i using Y:\agrajg\Research\Data\OtherData\centeroids.dta
drop _merge
sort propertyid

forvalues i = 1(1)9 {
	gen zdist`i' = sqrt((latitude - mean_attlatitude`i')^2+(longitude - mean_attlongitude`i')^2)
	drop mean_attlatitude`i' mean_attlongitude`i'
}
drop i
********************************************************************************
* Drop other variables that may not be used in future
drop listingurl listingmainimageurl latitude longitude listingtitle 


*===============================================================================
save "Y:\agrajg\Research\Data\temp\010200_AIRDNATimeInvariantPropertyCharacteristics.dta", replace
*===============================================================================

********************************************************************************
******************** END 010200 ************************************************
********************************************************************************
