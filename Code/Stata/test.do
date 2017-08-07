clear all
set more off

use "Y:\agrajg\Research\Data\FinalData\AIRDNA_listings_data_clean_final1.dta" 

label var createddate "Date listing created"
label var lastscrapeddate "Date when listing was last scraped"

********************************************************************************
************************ STRING MISSING VALUES *********************************
***************************  REPLACE BY NA  ************************************
global string_variables2   listingtitle propertytype listingtype  country state city neighborhood metropolitanstatisticalarea superhost cancellationpolicy checkouttime  checkouttime businessready instantbookenabled listingurl listingmainimageurl
foreach var in $string_variables2 {
replace `var' = "NR" if `var' == ""
}
********************************************************************************
********************************************************************************
********************************************************************************

********************************************************************************
************************ NUMERIC (other fee) MISSING VALUES ********************
***************************  REPLACE BY 0  ************************************
foreach var in securitydeposit cleaningfee extrapeoplefee {
replace `var' = 0 if `var' == .
}


********************************************************************************
************************ NUMERIC (other attributes) MISSING VALUES *************
***************************  REPLACE BY 0  ************************************

foreach var in bedrooms bathrooms maxguests minimumstay numberofphotos{
replace `var' = 0 if `var' == .
}
********************************************************************************
************************     Filling in other varibles   ***********************
********************************************************************************
tostring zipcode , replace
replace zipcode = "NR" if zipcode==""
replace responserate = 0 if responserate ==.
replace responsetimemin = 16200 if  responsetimemin==. // no response = no response in 3 months  

********************************************************************************
**************** CLEANING CHECK IN TIME ****************************************
********************************************************************************
gen checkouttime1 = checkouttime  
replace checkouttime  =  subinstr(checkouttime  ," ","",.)
*replace checkouttime  =  subinstr(checkouttime  ,":00",".0",.)
replace checkouttime  =  subinstr(checkouttime  ,"PM(noon)","PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"AM(midnight)","AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"AM(nextday)","AM",.)

replace checkouttime  = "1:00PM" if checkouttime =="1" | checkouttime =="1:00"
replace checkouttime  = "2:00PM" if checkouttime =="2" | checkouttime =="2:00"
replace checkouttime  = "3:00PM" if checkouttime =="3" | checkouttime =="3:00"
replace checkouttime  = "4:00PM" if checkouttime =="4" | checkouttime =="4:00"
replace checkouttime  = "5:00PM" if checkouttime =="5" | checkouttime =="5:00"
replace checkouttime  = "6:00PM" if checkouttime =="6" | checkouttime =="6:00"
replace checkouttime  = "7:00PM" if checkouttime =="7" | checkouttime =="7:00"
replace checkouttime  = "8:00AM" if checkouttime =="8" | checkouttime =="8:00"
replace checkouttime  = "9:00AM" if checkouttime =="9" | checkouttime =="9:00"
replace checkouttime  = "10:00AM" if checkouttime =="10" | checkouttime =="10:00"
replace checkouttime  = "11:00AM" if checkouttime =="11" | checkouttime =="11:00"
replace checkouttime  = "12:00PM" if checkouttime =="12" | checkouttime =="12:00"

replace checkouttime  = "1:30PM" if checkouttime =="1.5" | checkouttime =="1:30"
replace checkouttime  = "2:30PM" if checkouttime =="2.5" | checkouttime =="2:30"
replace checkouttime  = "3:30PM" if checkouttime =="3.5" | checkouttime =="3:30"
replace checkouttime  = "4:30PM" if checkouttime =="4.5" | checkouttime =="4:30"
replace checkouttime  = "5:30PM" if checkouttime =="5.5" | checkouttime =="5:30"
replace checkouttime  = "6:30PM" if checkouttime =="6.5" | checkouttime =="6:30"
replace checkouttime  = "7:30PM" if checkouttime =="7.5" | checkouttime =="7:30"
replace checkouttime  = "8:30AM" if checkouttime =="8.5" | checkouttime =="8:30"
replace checkouttime  = "9:30AM" if checkouttime =="9.5" | checkouttime =="9:30"
replace checkouttime  = "10:30AM" if checkouttime =="10.5" | checkouttime =="10:30"
replace checkouttime  = "11:30AM" if checkouttime =="11.5" | checkouttime =="11:30"
replace checkouttime  = "12:30PM" if checkouttime =="12.5" | checkouttime =="12:30"

replace checkouttime  =  subinstr(checkouttime  ,"Anytimeafter","",.)
*replace checkouttime  =  subinstr(checkouttime  ,".0",":00",.)
*replace checkouttime  =  subinstr(checkouttime  ,".5",":30",.)
replace checkouttime  =  subinstr(checkouttime  ,"Anytimeafter","",.)
replace checkouttime  =  subinstr(checkouttime  ,"-"," ",.)

replace checkouttime  =  subinstr(checkouttime  ,"1AM","1:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"2AM","2:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"3AM","3:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"4AM","4:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"5AM","5:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"6AM","6:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"7AM","7:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"8AM","8:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"9AM","9:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"10AM","10:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"11AM","11:00AM",.)
replace checkouttime  =  subinstr(checkouttime  ,"11AM","12:00AM",.)
	
replace checkouttime  =  subinstr(checkouttime  ,"1PM","1:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"2PM","2:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"3PM","3:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"4PM","4:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"5PM","5:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"6PM","6:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"7PM","7:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"8PM","8:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"9PM","9:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"10PM","10:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"11PM","11:00PM",.)
replace checkouttime  =  subinstr(checkouttime  ,"11PM","12:00PM",.)



generate str1 startcheckouttime  = ""
replace startcheckouttime  = substr(checkouttime ,1,strpos(checkouttime ," ") - 1)
generate str1 endcheckouttime  = ""
replace endcheckouttime  = substr(checkouttime ,strpos(checkouttime ," ") + 1,.)
capture drop tempvar
gen tempvar = (startcheckouttime =="")
replace startcheckouttime  = endcheckouttime  if tempvar == 1
replace endcheckouttime  = "" if tempvar == 1
replace endcheckouttime  = "12:00AM" if endcheckouttime ==""	


gen checkinperiod = .
replace checkinperiod = 24 if checkouttime  == "Flexible"
replace checkouttime  ="" if checkouttime  == "Flexible"

gen double t1 = clock( startcheckouttime  , "hm")
gen double t2 = clock( endcheckouttime  , "hm")

format %tc t1
format %tc t2

gen diff1 = t2 - t1
replace t2 = t2 + 86400000 if diff1 <=0
replace checkinperiod = (t2-t1)/(3600000) if checkinperiod==.
replace checkouttime  = startcheckouttime 
replace checkinperiod = 24 if checkouttime  == "NR"
order checkinperiod, after (checkouttime )

label var checkouttime  "Check-in time"
label var checkinperiod "Check-in flexible preiod"


drop startcheckouttime  endcheckouttime  tempvar t1 t2 diff1
*contract checkouttime  checkinperiod
br if checkouttime  =="NR"


********************************************************************************
********************************************************************************
********************************************************************************
