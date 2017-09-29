use "Y:\agrajg\Research\Data\temp\010100_MarketDataAllIDsBlockedDropped.dta" 
gen postpurgeperiod = (date>=td(20nov2015))
gen postexposeperiod = (date>=td(12feb2016))
gen postlawperiod = (date>=td(01oct2016))
tab postpurgeperiod postexposeperiod postlawperiod
tab1 postpurgeperiod postexposeperiod postlawperiod
sum lprice
sum lprice, detail
count if price ==.
bys postpurgeperiod : sum lprice, detail
set more off
h areg
