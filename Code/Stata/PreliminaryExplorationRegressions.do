* Effect on Price and Quantity
* Quantity change on price
clear all
set more off
use  Y:\agrajg\Research\Meeting29Sept2017\Transactions.dta, clear

tab1 event1 event2 event3 event4
tab2 HostType1 HostType2 Hosttype3 HostType1E HostType2E Hosttype3E

/* HostType1
* Event 1
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType1, replace 	cttop( )
reg 	lquan 			i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType1, 			cttop( )
reg 	lquan 			i.event1 i.HostType1 i.event1#i.HostType1
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType1, 			cttop( )
reg 	lquan 			i.event1 i.HostType1 i.event1#i.HostType1 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType1, 			cttop( )
reg 	lquan 			i.event1 i.HostType1 i.event1#i.HostType1 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType1, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType1, replace 	cttop( )
reg 	lprice 			i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType1, 			cttop( )
reg 	lprice 			i.event1 i.HostType1 i.event1#i.HostType1
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType1, 			cttop( )
reg 	lprice 			i.event1 i.HostType1 i.event1#i.HostType1 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType1, 			cttop( )
reg 	lprice 			i.event1 i.HostType1 i.event1#i.HostType1 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType1, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1, replace 	cttop( )	
reg 	lprice lquan 	i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1,  			cttop( )
reg 	lprice lquan 	i.event1 i.HostType1 i.event1#i.HostType1
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1,  			cttop( )
reg 	lprice lquan 	i.event1 i.HostType1 i.event1#i.HostType1 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1,  			cttop( )
reg 	lprice lquan 	i.event1 i.HostType1 i.event1#i.HostType1 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1, 		 	cttop( )	
reg 	lprice lquan 	i.event1 i.event1#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1,  			cttop( )	
reg 	lprice lquan 	i.event1 i.HostType1 i.event1#i.HostType1 	i.event1#c.lquan i.HostType1#c.lquan i.event1#i.HostType1#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1,  			cttop( )	
reg 	lprice lquan 	i.event1 i.HostType1 i.event1#i.HostType1 	i.event1#c.lquan i.HostType1#c.lquan i.event1#i.HostType1#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1,  			cttop( )	
reg 	lprice lquan 	i.event1 i.HostType1 i.event1#i.HostType1 	i.event1#c.lquan i.HostType1#c.lquan i.event1#i.HostType1#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1,  			cttop( )	see excel
*/
* Event 2
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType1, replace 	cttop( )
reg 	lquan 			i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType1, 			cttop( )
reg 	lquan 			i.event2 i.HostType1 i.event2#i.HostType1
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType1, 			cttop( )
reg 	lquan 			i.event2 i.HostType1 i.event2#i.HostType1 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType1, 			cttop( )
reg 	lquan 			i.event2 i.HostType1 i.event2#i.HostType1 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType1, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType1, replace 	cttop( )
reg 	lprice 			i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType1, 			cttop( )
reg 	lprice 			i.event2 i.HostType1 i.event2#i.HostType1
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType1, 			cttop( )
reg 	lprice 			i.event2 i.HostType1 i.event2#i.HostType1 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType1, 			cttop( )
reg 	lprice 			i.event2 i.HostType1 i.event2#i.HostType1 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType1, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1, replace 	cttop( )	
reg 	lprice lquan 	i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1,  			cttop( )
reg 	lprice lquan 	i.event2 i.HostType1 i.event2#i.HostType1
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1,  			cttop( )
reg 	lprice lquan 	i.event2 i.HostType1 i.event2#i.HostType1 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1,  			cttop( )
reg 	lprice lquan 	i.event2 i.HostType1 i.event2#i.HostType1 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1, 		 	cttop( )	
reg 	lprice lquan 	i.event2 i.event2#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1,  			cttop( )	
reg 	lprice lquan 	i.event2 i.HostType1 i.event2#i.HostType1 	i.event2#c.lquan i.HostType1#c.lquan i.event2#i.HostType1#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1,  			cttop( )	
reg 	lprice lquan 	i.event2 i.HostType1 i.event2#i.HostType1 	i.event2#c.lquan i.HostType1#c.lquan i.event2#i.HostType1#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1,  			cttop( )	
reg 	lprice lquan 	i.event2 i.HostType1 i.event2#i.HostType1 	i.event2#c.lquan i.HostType1#c.lquan i.event2#i.HostType1#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1,  			cttop( )	see excel

*Event 3
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType1, replace 	cttop( )
reg 	lquan 			i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType1, 			cttop( )
reg 	lquan 			i.event3 i.HostType1 i.event3#i.HostType1
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType1, 			cttop( )
reg 	lquan 			i.event3 i.HostType1 i.event3#i.HostType1 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType1, 			cttop( )
reg 	lquan 			i.event3 i.HostType1 i.event3#i.HostType1 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType1, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType1, replace 	cttop( )
reg 	lprice 			i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType1, 			cttop( )
reg 	lprice 			i.event3 i.HostType1 i.event3#i.HostType1
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType1, 			cttop( )
reg 	lprice 			i.event3 i.HostType1 i.event3#i.HostType1 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType1, 			cttop( )
reg 	lprice 			i.event3 i.HostType1 i.event3#i.HostType1 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType1, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1, replace 	cttop( )	
reg 	lprice lquan 	i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1,  			cttop( )
reg 	lprice lquan 	i.event3 i.HostType1 i.event3#i.HostType1
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1,  			cttop( )
reg 	lprice lquan 	i.event3 i.HostType1 i.event3#i.HostType1 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1,  			cttop( )
reg 	lprice lquan 	i.event3 i.HostType1 i.event3#i.HostType1 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1, 		 	cttop( )	
reg 	lprice lquan 	i.event3 i.event3#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1,  			cttop( )	
reg 	lprice lquan 	i.event3 i.HostType1 i.event3#i.HostType1 	i.event3#c.lquan i.HostType1#c.lquan i.event3#i.HostType1#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1,  			cttop( )	
reg 	lprice lquan 	i.event3 i.HostType1 i.event3#i.HostType1 	i.event3#c.lquan i.HostType1#c.lquan i.event3#i.HostType1#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1,  			cttop( )	
reg 	lprice lquan 	i.event3 i.HostType1 i.event3#i.HostType1 	i.event3#c.lquan i.HostType1#c.lquan i.event3#i.HostType1#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1,  			cttop( )	see excel

*Event 4
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType1, replace 	cttop( )
reg 	lquan 			i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType1, 			cttop( )
reg 	lquan 			i.event4 i.HostType1 i.event4#i.HostType1
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType1, 			cttop( )
reg 	lquan 			i.event4 i.HostType1 i.event4#i.HostType1 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType1, 			cttop( )
reg 	lquan 			i.event4 i.HostType1 i.event4#i.HostType1 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType1, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType1, replace 	cttop( )
reg 	lprice 			i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType1, 			cttop( )
reg 	lprice 			i.event4 i.HostType1 i.event4#i.HostType1
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType1, 			cttop( )
reg 	lprice 			i.event4 i.HostType1 i.event4#i.HostType1 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType1, 			cttop( )
reg 	lprice 			i.event4 i.HostType1 i.event4#i.HostType1 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType1, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1, replace 	cttop( )	
reg 	lprice lquan 	i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1,  			cttop( )
reg 	lprice lquan 	i.event4 i.HostType1 i.event4#i.HostType1
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1,  			cttop( )
reg 	lprice lquan 	i.event4 i.HostType1 i.event4#i.HostType1 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1,  			cttop( )
reg 	lprice lquan 	i.event4 i.HostType1 i.event4#i.HostType1 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1, 		 	cttop( )	
reg 	lprice lquan 	i.event4 i.event4#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1,  			cttop( )	
reg 	lprice lquan 	i.event4 i.HostType1 i.event4#i.HostType1 	i.event4#c.lquan i.HostType1#c.lquan i.event4#i.HostType1#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1,  			cttop( )	
reg 	lprice lquan 	i.event4 i.HostType1 i.event4#i.HostType1 	i.event4#c.lquan i.HostType1#c.lquan i.event4#i.HostType1#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1,  			cttop( )	
reg 	lprice lquan 	i.event4 i.HostType1 i.event4#i.HostType1 	i.event4#c.lquan i.HostType1#c.lquan i.event4#i.HostType1#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1,  			cttop( )	see excel

********************************************************************************



* HostType2 
* Event 1
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType2, replace 	cttop( )
reg 	lquan 			i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType2, 			cttop( )
reg 	lquan 			i.event1 i.HostType2 i.event1#i.HostType2
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType2, 			cttop( )
reg 	lquan 			i.event1 i.HostType2 i.event1#i.HostType2 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType2, 			cttop( )
reg 	lquan 			i.event1 i.HostType2 i.event1#i.HostType2 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType2, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType2, replace 	cttop( )
reg 	lprice 			i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType2, 			cttop( )
reg 	lprice 			i.event1 i.HostType2 i.event1#i.HostType2
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType2, 			cttop( )
reg 	lprice 			i.event1 i.HostType2 i.event1#i.HostType2 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType2, 			cttop( )
reg 	lprice 			i.event1 i.HostType2 i.event1#i.HostType2 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType2, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2, replace 	cttop( )	
reg 	lprice lquan 	i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2,  			cttop( )
reg 	lprice lquan 	i.event1 i.HostType2 i.event1#i.HostType2
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2,  			cttop( )
reg 	lprice lquan 	i.event1 i.HostType2 i.event1#i.HostType2 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2,  			cttop( )
reg 	lprice lquan 	i.event1 i.HostType2 i.event1#i.HostType2 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2, 		 	cttop( )	
reg 	lprice lquan 	i.event1 i.event1#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2,  			cttop( )	
reg 	lprice lquan 	i.event1 i.HostType2 i.event1#i.HostType2 	i.event1#c.lquan i.HostType2#c.lquan i.event1#i.HostType2#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2,  			cttop( )	
reg 	lprice lquan 	i.event1 i.HostType2 i.event1#i.HostType2 	i.event1#c.lquan i.HostType2#c.lquan i.event1#i.HostType2#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2,  			cttop( )	
reg 	lprice lquan 	i.event1 i.HostType2 i.event1#i.HostType2 	i.event1#c.lquan i.HostType2#c.lquan i.event1#i.HostType2#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2,  			cttop( )	see excel

* Event 2
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType2, replace 	cttop( )
reg 	lquan 			i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType2, 			cttop( )
reg 	lquan 			i.event2 i.HostType2 i.event2#i.HostType2
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType2, 			cttop( )
reg 	lquan 			i.event2 i.HostType2 i.event2#i.HostType2 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType2, 			cttop( )
reg 	lquan 			i.event2 i.HostType2 i.event2#i.HostType2 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType2, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType2, replace 	cttop( )
reg 	lprice 			i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType2, 			cttop( )
reg 	lprice 			i.event2 i.HostType2 i.event2#i.HostType2
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType2, 			cttop( )
reg 	lprice 			i.event2 i.HostType2 i.event2#i.HostType2 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType2, 			cttop( )
reg 	lprice 			i.event2 i.HostType2 i.event2#i.HostType2 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType2, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2, replace 	cttop( )	
reg 	lprice lquan 	i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2,  			cttop( )
reg 	lprice lquan 	i.event2 i.HostType2 i.event2#i.HostType2
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2,  			cttop( )
reg 	lprice lquan 	i.event2 i.HostType2 i.event2#i.HostType2 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2,  			cttop( )
reg 	lprice lquan 	i.event2 i.HostType2 i.event2#i.HostType2 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2, 		 	cttop( )	
reg 	lprice lquan 	i.event2 i.event2#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2,  			cttop( )	
reg 	lprice lquan 	i.event2 i.HostType2 i.event2#i.HostType2 	i.event2#c.lquan i.HostType2#c.lquan i.event2#i.HostType2#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2,  			cttop( )	
reg 	lprice lquan 	i.event2 i.HostType2 i.event2#i.HostType2 	i.event2#c.lquan i.HostType2#c.lquan i.event2#i.HostType2#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2,  			cttop( )	
reg 	lprice lquan 	i.event2 i.HostType2 i.event2#i.HostType2 	i.event2#c.lquan i.HostType2#c.lquan i.event2#i.HostType2#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2,  			cttop( )	see excel

*Event 3
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType2, replace 	cttop( )
reg 	lquan 			i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType2, 			cttop( )
reg 	lquan 			i.event3 i.HostType2 i.event3#i.HostType2
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType2, 			cttop( )
reg 	lquan 			i.event3 i.HostType2 i.event3#i.HostType2 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType2, 			cttop( )
reg 	lquan 			i.event3 i.HostType2 i.event3#i.HostType2 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType2, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType2, replace 	cttop( )
reg 	lprice 			i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType2, 			cttop( )
reg 	lprice 			i.event3 i.HostType2 i.event3#i.HostType2
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType2, 			cttop( )
reg 	lprice 			i.event3 i.HostType2 i.event3#i.HostType2 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType2, 			cttop( )
reg 	lprice 			i.event3 i.HostType2 i.event3#i.HostType2 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType2, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2, replace 	cttop( )	
reg 	lprice lquan 	i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2,  			cttop( )
reg 	lprice lquan 	i.event3 i.HostType2 i.event3#i.HostType2
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2,  			cttop( )
reg 	lprice lquan 	i.event3 i.HostType2 i.event3#i.HostType2 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2,  			cttop( )
reg 	lprice lquan 	i.event3 i.HostType2 i.event3#i.HostType2 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2, 		 	cttop( )	
reg 	lprice lquan 	i.event3 i.event3#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2,  			cttop( )	
reg 	lprice lquan 	i.event3 i.HostType2 i.event3#i.HostType2 	i.event3#c.lquan i.HostType2#c.lquan i.event3#i.HostType2#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2,  			cttop( )	
reg 	lprice lquan 	i.event3 i.HostType2 i.event3#i.HostType2 	i.event3#c.lquan i.HostType2#c.lquan i.event3#i.HostType2#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2,  			cttop( )	
reg 	lprice lquan 	i.event3 i.HostType2 i.event3#i.HostType2 	i.event3#c.lquan i.HostType2#c.lquan i.event3#i.HostType2#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2,  			cttop( )	see excel

*Event 4
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType2, replace 	cttop( )
reg 	lquan 			i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType2, 			cttop( )
reg 	lquan 			i.event4 i.HostType2 i.event4#i.HostType2
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType2, 			cttop( )
reg 	lquan 			i.event4 i.HostType2 i.event4#i.HostType2 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType2, 			cttop( )
reg 	lquan 			i.event4 i.HostType2 i.event4#i.HostType2 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType2, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType2, replace 	cttop( )
reg 	lprice 			i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType2, 			cttop( )
reg 	lprice 			i.event4 i.HostType2 i.event4#i.HostType2
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType2, 			cttop( )
reg 	lprice 			i.event4 i.HostType2 i.event4#i.HostType2 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType2, 			cttop( )
reg 	lprice 			i.event4 i.HostType2 i.event4#i.HostType2 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType2, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2, replace 	cttop( )	
reg 	lprice lquan 	i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2,  			cttop( )
reg 	lprice lquan 	i.event4 i.HostType2 i.event4#i.HostType2
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2,  			cttop( )
reg 	lprice lquan 	i.event4 i.HostType2 i.event4#i.HostType2 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2,  			cttop( )
reg 	lprice lquan 	i.event4 i.HostType2 i.event4#i.HostType2 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2, 		 	cttop( )	
reg 	lprice lquan 	i.event4 i.event4#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2,  			cttop( )	
reg 	lprice lquan 	i.event4 i.HostType2 i.event4#i.HostType2 	i.event4#c.lquan i.HostType2#c.lquan i.event4#i.HostType2#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2,  			cttop( )	
reg 	lprice lquan 	i.event4 i.HostType2 i.event4#i.HostType2 	i.event4#c.lquan i.HostType2#c.lquan i.event4#i.HostType2#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2,  			cttop( )	
reg 	lprice lquan 	i.event4 i.HostType2 i.event4#i.HostType2 	i.event4#c.lquan i.HostType2#c.lquan i.event4#i.HostType2#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2,  			cttop( )	see excel




********************************************************************************



* Hosttype3 
* Event 1
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_Hosttype3, replace 	cttop( )
reg 	lquan 			i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_Hosttype3, 			cttop( )
reg 	lquan 			i.event1 i.Hosttype3 i.event1#i.Hosttype3
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_Hosttype3, 			cttop( )
reg 	lquan 			i.event1 i.Hosttype3 i.event1#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_Hosttype3, 			cttop( )
reg 	lquan 			i.event1 i.Hosttype3 i.event1#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_Hosttype3, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_Hosttype3, replace 	cttop( )
reg 	lprice 			i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_Hosttype3, 			cttop( )
reg 	lprice 			i.event1 i.Hosttype3 i.event1#i.Hosttype3
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_Hosttype3, 			cttop( )
reg 	lprice 			i.event1 i.Hosttype3 i.event1#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_Hosttype3, 			cttop( )
reg 	lprice 			i.event1 i.Hosttype3 i.event1#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_Hosttype3, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3, replace 	cttop( )	
reg 	lprice lquan 	i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3,  			cttop( )
reg 	lprice lquan 	i.event1 i.Hosttype3 i.event1#i.Hosttype3
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3,  			cttop( )
reg 	lprice lquan 	i.event1 i.Hosttype3 i.event1#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3,  			cttop( )
reg 	lprice lquan 	i.event1 i.Hosttype3 i.event1#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3, 		 	cttop( )	
reg 	lprice lquan 	i.event1 i.event1#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3,  			cttop( )	
reg 	lprice lquan 	i.event1 i.Hosttype3 i.event1#i.Hosttype3 	i.event1#c.lquan i.Hosttype3#c.lquan i.event1#i.Hosttype3#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3,  			cttop( )	
reg 	lprice lquan 	i.event1 i.Hosttype3 i.event1#i.Hosttype3 	i.event1#c.lquan i.Hosttype3#c.lquan i.event1#i.Hosttype3#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3,  			cttop( )	
reg 	lprice lquan 	i.event1 i.Hosttype3 i.event1#i.Hosttype3 	i.event1#c.lquan i.Hosttype3#c.lquan i.event1#i.Hosttype3#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3,  			cttop( )	see excel

* Event 2
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_Hosttype3, replace 	cttop( )
reg 	lquan 			i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_Hosttype3, 			cttop( )
reg 	lquan 			i.event2 i.Hosttype3 i.event2#i.Hosttype3
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_Hosttype3, 			cttop( )
reg 	lquan 			i.event2 i.Hosttype3 i.event2#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_Hosttype3, 			cttop( )
reg 	lquan 			i.event2 i.Hosttype3 i.event2#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_Hosttype3, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_Hosttype3, replace 	cttop( )
reg 	lprice 			i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_Hosttype3, 			cttop( )
reg 	lprice 			i.event2 i.Hosttype3 i.event2#i.Hosttype3
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_Hosttype3, 			cttop( )
reg 	lprice 			i.event2 i.Hosttype3 i.event2#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_Hosttype3, 			cttop( )
reg 	lprice 			i.event2 i.Hosttype3 i.event2#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_Hosttype3, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3, replace 	cttop( )	
reg 	lprice lquan 	i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3,  			cttop( )
reg 	lprice lquan 	i.event2 i.Hosttype3 i.event2#i.Hosttype3
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3,  			cttop( )
reg 	lprice lquan 	i.event2 i.Hosttype3 i.event2#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3,  			cttop( )
reg 	lprice lquan 	i.event2 i.Hosttype3 i.event2#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3, 		 	cttop( )	
reg 	lprice lquan 	i.event2 i.event2#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3,  			cttop( )	
reg 	lprice lquan 	i.event2 i.Hosttype3 i.event2#i.Hosttype3 	i.event2#c.lquan i.Hosttype3#c.lquan i.event2#i.Hosttype3#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3,  			cttop( )	
reg 	lprice lquan 	i.event2 i.Hosttype3 i.event2#i.Hosttype3 	i.event2#c.lquan i.Hosttype3#c.lquan i.event2#i.Hosttype3#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3,  			cttop( )	
reg 	lprice lquan 	i.event2 i.Hosttype3 i.event2#i.Hosttype3 	i.event2#c.lquan i.Hosttype3#c.lquan i.event2#i.Hosttype3#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3,  			cttop( )	see excel

*Event 3
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_Hosttype3, replace 	cttop( )
reg 	lquan 			i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_Hosttype3, 			cttop( )
reg 	lquan 			i.event3 i.Hosttype3 i.event3#i.Hosttype3
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_Hosttype3, 			cttop( )
reg 	lquan 			i.event3 i.Hosttype3 i.event3#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_Hosttype3, 			cttop( )
reg 	lquan 			i.event3 i.Hosttype3 i.event3#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_Hosttype3, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_Hosttype3, replace 	cttop( )
reg 	lprice 			i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_Hosttype3, 			cttop( )
reg 	lprice 			i.event3 i.Hosttype3 i.event3#i.Hosttype3
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_Hosttype3, 			cttop( )
reg 	lprice 			i.event3 i.Hosttype3 i.event3#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_Hosttype3, 			cttop( )
reg 	lprice 			i.event3 i.Hosttype3 i.event3#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_Hosttype3, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3, replace 	cttop( )	
reg 	lprice lquan 	i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3,  			cttop( )
reg 	lprice lquan 	i.event3 i.Hosttype3 i.event3#i.Hosttype3
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3,  			cttop( )
reg 	lprice lquan 	i.event3 i.Hosttype3 i.event3#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3,  			cttop( )
reg 	lprice lquan 	i.event3 i.Hosttype3 i.event3#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3, 		 	cttop( )	
reg 	lprice lquan 	i.event3 i.event3#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3,  			cttop( )	
reg 	lprice lquan 	i.event3 i.Hosttype3 i.event3#i.Hosttype3 	i.event3#c.lquan i.Hosttype3#c.lquan i.event3#i.Hosttype3#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3,  			cttop( )	
reg 	lprice lquan 	i.event3 i.Hosttype3 i.event3#i.Hosttype3 	i.event3#c.lquan i.Hosttype3#c.lquan i.event3#i.Hosttype3#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3,  			cttop( )	
reg 	lprice lquan 	i.event3 i.Hosttype3 i.event3#i.Hosttype3 	i.event3#c.lquan i.Hosttype3#c.lquan i.event3#i.Hosttype3#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3,  			cttop( )	see excel

*Event 4
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_Hosttype3, replace 	cttop( )
reg 	lquan 			i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_Hosttype3, 			cttop( )
reg 	lquan 			i.event4 i.Hosttype3 i.event4#i.Hosttype3
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_Hosttype3, 			cttop( )
reg 	lquan 			i.event4 i.Hosttype3 i.event4#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_Hosttype3, 			cttop( )
reg 	lquan 			i.event4 i.Hosttype3 i.event4#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_Hosttype3, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_Hosttype3, replace 	cttop( )
reg 	lprice 			i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_Hosttype3, 			cttop( )
reg 	lprice 			i.event4 i.Hosttype3 i.event4#i.Hosttype3
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_Hosttype3, 			cttop( )
reg 	lprice 			i.event4 i.Hosttype3 i.event4#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_Hosttype3, 			cttop( )
reg 	lprice 			i.event4 i.Hosttype3 i.event4#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_Hosttype3, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3, replace 	cttop( )	
reg 	lprice lquan 	i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3,  			cttop( )
reg 	lprice lquan 	i.event4 i.Hosttype3 i.event4#i.Hosttype3
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3,  			cttop( )
reg 	lprice lquan 	i.event4 i.Hosttype3 i.event4#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3,  			cttop( )
reg 	lprice lquan 	i.event4 i.Hosttype3 i.event4#i.Hosttype3 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3, 		 	cttop( )	
reg 	lprice lquan 	i.event4 i.event4#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3,  			cttop( )	
reg 	lprice lquan 	i.event4 i.Hosttype3 i.event4#i.Hosttype3 	i.event4#c.lquan i.Hosttype3#c.lquan i.event4#i.Hosttype3#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3,  			cttop( )	
reg 	lprice lquan 	i.event4 i.Hosttype3 i.event4#i.Hosttype3 	i.event4#c.lquan i.Hosttype3#c.lquan i.event4#i.Hosttype3#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3,  			cttop( )	
reg 	lprice lquan 	i.event4 i.Hosttype3 i.event4#i.Hosttype3 	i.event4#c.lquan i.Hosttype3#c.lquan i.event4#i.Hosttype3#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3,  			cttop( )	see excel




********************************************************************************



* HostType1E 
* Event 1
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType1E, replace 	cttop( )
reg 	lquan 			i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType1E, 			cttop( )
reg 	lquan 			i.event1 i.HostType1E i.event1#i.HostType1E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType1E, 			cttop( )
reg 	lquan 			i.event1 i.HostType1E i.event1#i.HostType1E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType1E, 			cttop( )
reg 	lquan 			i.event1 i.HostType1E i.event1#i.HostType1E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType1E, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType1E, replace 	cttop( )
reg 	lprice 			i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType1E, 			cttop( )
reg 	lprice 			i.event1 i.HostType1E i.event1#i.HostType1E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType1E, 			cttop( )
reg 	lprice 			i.event1 i.HostType1E i.event1#i.HostType1E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType1E, 			cttop( )
reg 	lprice 			i.event1 i.HostType1E i.event1#i.HostType1E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType1E, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1E, replace 	cttop( )	
reg 	lprice lquan 	i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1E,  			cttop( )
reg 	lprice lquan 	i.event1 i.HostType1E i.event1#i.HostType1E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1E,  			cttop( )
reg 	lprice lquan 	i.event1 i.HostType1E i.event1#i.HostType1E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1E,  			cttop( )
reg 	lprice lquan 	i.event1 i.HostType1E i.event1#i.HostType1E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1E,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1E, 		 	cttop( )	
reg 	lprice lquan 	i.event1 i.event1#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1E,  			cttop( )	
reg 	lprice lquan 	i.event1 i.HostType1E i.event1#i.HostType1E 	i.event1#c.lquan i.HostType1E#c.lquan i.event1#i.HostType1E#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1E,  			cttop( )	
reg 	lprice lquan 	i.event1 i.HostType1E i.event1#i.HostType1E 	i.event1#c.lquan i.HostType1E#c.lquan i.event1#i.HostType1E#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1E,  			cttop( )	
reg 	lprice lquan 	i.event1 i.HostType1E i.event1#i.HostType1E 	i.event1#c.lquan i.HostType1E#c.lquan i.event1#i.HostType1E#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType1E,  			cttop( )	see excel

* Event 2
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType1E, replace 	cttop( )
reg 	lquan 			i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType1E, 			cttop( )
reg 	lquan 			i.event2 i.HostType1E i.event2#i.HostType1E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType1E, 			cttop( )
reg 	lquan 			i.event2 i.HostType1E i.event2#i.HostType1E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType1E, 			cttop( )
reg 	lquan 			i.event2 i.HostType1E i.event2#i.HostType1E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType1E, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType1E, replace 	cttop( )
reg 	lprice 			i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType1E, 			cttop( )
reg 	lprice 			i.event2 i.HostType1E i.event2#i.HostType1E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType1E, 			cttop( )
reg 	lprice 			i.event2 i.HostType1E i.event2#i.HostType1E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType1E, 			cttop( )
reg 	lprice 			i.event2 i.HostType1E i.event2#i.HostType1E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType1E, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1E, replace 	cttop( )	
reg 	lprice lquan 	i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1E,  			cttop( )
reg 	lprice lquan 	i.event2 i.HostType1E i.event2#i.HostType1E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1E,  			cttop( )
reg 	lprice lquan 	i.event2 i.HostType1E i.event2#i.HostType1E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1E,  			cttop( )
reg 	lprice lquan 	i.event2 i.HostType1E i.event2#i.HostType1E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1E,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1E, 		 	cttop( )	
reg 	lprice lquan 	i.event2 i.event2#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1E,  			cttop( )	
reg 	lprice lquan 	i.event2 i.HostType1E i.event2#i.HostType1E 	i.event2#c.lquan i.HostType1E#c.lquan i.event2#i.HostType1E#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1E,  			cttop( )	
reg 	lprice lquan 	i.event2 i.HostType1E i.event2#i.HostType1E 	i.event2#c.lquan i.HostType1E#c.lquan i.event2#i.HostType1E#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1E,  			cttop( )	
reg 	lprice lquan 	i.event2 i.HostType1E i.event2#i.HostType1E 	i.event2#c.lquan i.HostType1E#c.lquan i.event2#i.HostType1E#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType1E,  			cttop( )	see excel

*Event 3
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType1E, replace 	cttop( )
reg 	lquan 			i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType1E, 			cttop( )
reg 	lquan 			i.event3 i.HostType1E i.event3#i.HostType1E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType1E, 			cttop( )
reg 	lquan 			i.event3 i.HostType1E i.event3#i.HostType1E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType1E, 			cttop( )
reg 	lquan 			i.event3 i.HostType1E i.event3#i.HostType1E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType1E, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType1E, replace 	cttop( )
reg 	lprice 			i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType1E, 			cttop( )
reg 	lprice 			i.event3 i.HostType1E i.event3#i.HostType1E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType1E, 			cttop( )
reg 	lprice 			i.event3 i.HostType1E i.event3#i.HostType1E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType1E, 			cttop( )
reg 	lprice 			i.event3 i.HostType1E i.event3#i.HostType1E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType1E, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1E, replace 	cttop( )	
reg 	lprice lquan 	i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1E,  			cttop( )
reg 	lprice lquan 	i.event3 i.HostType1E i.event3#i.HostType1E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1E,  			cttop( )
reg 	lprice lquan 	i.event3 i.HostType1E i.event3#i.HostType1E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1E,  			cttop( )
reg 	lprice lquan 	i.event3 i.HostType1E i.event3#i.HostType1E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1E,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1E, 		 	cttop( )	
reg 	lprice lquan 	i.event3 i.event3#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1E,  			cttop( )	
reg 	lprice lquan 	i.event3 i.HostType1E i.event3#i.HostType1E 	i.event3#c.lquan i.HostType1E#c.lquan i.event3#i.HostType1E#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1E,  			cttop( )	
reg 	lprice lquan 	i.event3 i.HostType1E i.event3#i.HostType1E 	i.event3#c.lquan i.HostType1E#c.lquan i.event3#i.HostType1E#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1E,  			cttop( )	
reg 	lprice lquan 	i.event3 i.HostType1E i.event3#i.HostType1E 	i.event3#c.lquan i.HostType1E#c.lquan i.event3#i.HostType1E#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType1E,  			cttop( )	see excel

*Event 4
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType1E, replace 	cttop( )
reg 	lquan 			i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType1E, 			cttop( )
reg 	lquan 			i.event4 i.HostType1E i.event4#i.HostType1E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType1E, 			cttop( )
reg 	lquan 			i.event4 i.HostType1E i.event4#i.HostType1E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType1E, 			cttop( )
reg 	lquan 			i.event4 i.HostType1E i.event4#i.HostType1E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType1E, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType1E, replace 	cttop( )
reg 	lprice 			i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType1E, 			cttop( )
reg 	lprice 			i.event4 i.HostType1E i.event4#i.HostType1E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType1E, 			cttop( )
reg 	lprice 			i.event4 i.HostType1E i.event4#i.HostType1E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType1E, 			cttop( )
reg 	lprice 			i.event4 i.HostType1E i.event4#i.HostType1E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType1E, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1E, replace 	cttop( )	
reg 	lprice lquan 	i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1E,  			cttop( )
reg 	lprice lquan 	i.event4 i.HostType1E i.event4#i.HostType1E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1E,  			cttop( )
reg 	lprice lquan 	i.event4 i.HostType1E i.event4#i.HostType1E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1E,  			cttop( )
reg 	lprice lquan 	i.event4 i.HostType1E i.event4#i.HostType1E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1E,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1E, 		 	cttop( )	
reg 	lprice lquan 	i.event4 i.event4#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1E,  			cttop( )	
reg 	lprice lquan 	i.event4 i.HostType1E i.event4#i.HostType1E 	i.event4#c.lquan i.HostType1E#c.lquan i.event4#i.HostType1E#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1E,  			cttop( )	
reg 	lprice lquan 	i.event4 i.HostType1E i.event4#i.HostType1E 	i.event4#c.lquan i.HostType1E#c.lquan i.event4#i.HostType1E#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1E,  			cttop( )	
reg 	lprice lquan 	i.event4 i.HostType1E i.event4#i.HostType1E 	i.event4#c.lquan i.HostType1E#c.lquan i.event4#i.HostType1E#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType1E,  			cttop( )	see excel




********************************************************************************
********************************************************************************



* HostType2E 
* Event 1
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType2E, replace 	cttop( )
reg 	lquan 			i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType2E, 			cttop( )
reg 	lquan 			i.event1 i.HostType2E i.event1#i.HostType2E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType2E, 			cttop( )
reg 	lquan 			i.event1 i.HostType2E i.event1#i.HostType2E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType2E, 			cttop( )
reg 	lquan 			i.event1 i.HostType2E i.event1#i.HostType2E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_HostType2E, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType2E, replace 	cttop( )
reg 	lprice 			i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType2E, 			cttop( )
reg 	lprice 			i.event1 i.HostType2E i.event1#i.HostType2E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType2E, 			cttop( )
reg 	lprice 			i.event1 i.HostType2E i.event1#i.HostType2E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType2E, 			cttop( )
reg 	lprice 			i.event1 i.HostType2E i.event1#i.HostType2E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_HostType2E, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2E, replace 	cttop( )	
reg 	lprice lquan 	i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2E,  			cttop( )
reg 	lprice lquan 	i.event1 i.HostType2E i.event1#i.HostType2E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2E,  			cttop( )
reg 	lprice lquan 	i.event1 i.HostType2E i.event1#i.HostType2E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2E,  			cttop( )
reg 	lprice lquan 	i.event1 i.HostType2E i.event1#i.HostType2E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2E,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2E, 		 	cttop( )	
reg 	lprice lquan 	i.event1 i.event1#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2E,  			cttop( )	
reg 	lprice lquan 	i.event1 i.HostType2E i.event1#i.HostType2E 	i.event1#c.lquan i.HostType2E#c.lquan i.event1#i.HostType2E#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2E,  			cttop( )	
reg 	lprice lquan 	i.event1 i.HostType2E i.event1#i.HostType2E 	i.event1#c.lquan i.HostType2E#c.lquan i.event1#i.HostType2E#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2E,  			cttop( )	
reg 	lprice lquan 	i.event1 i.HostType2E i.event1#i.HostType2E 	i.event1#c.lquan i.HostType2E#c.lquan i.event1#i.HostType2E#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_HostType2E,  			cttop( )	see excel

* Event 2
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType2E, replace 	cttop( )
reg 	lquan 			i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType2E, 			cttop( )
reg 	lquan 			i.event2 i.HostType2E i.event2#i.HostType2E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType2E, 			cttop( )
reg 	lquan 			i.event2 i.HostType2E i.event2#i.HostType2E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType2E, 			cttop( )
reg 	lquan 			i.event2 i.HostType2E i.event2#i.HostType2E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_HostType2E, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType2E, replace 	cttop( )
reg 	lprice 			i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType2E, 			cttop( )
reg 	lprice 			i.event2 i.HostType2E i.event2#i.HostType2E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType2E, 			cttop( )
reg 	lprice 			i.event2 i.HostType2E i.event2#i.HostType2E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType2E, 			cttop( )
reg 	lprice 			i.event2 i.HostType2E i.event2#i.HostType2E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_HostType2E, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2E, replace 	cttop( )	
reg 	lprice lquan 	i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2E,  			cttop( )
reg 	lprice lquan 	i.event2 i.HostType2E i.event2#i.HostType2E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2E,  			cttop( )
reg 	lprice lquan 	i.event2 i.HostType2E i.event2#i.HostType2E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2E,  			cttop( )
reg 	lprice lquan 	i.event2 i.HostType2E i.event2#i.HostType2E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2E,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2E, 		 	cttop( )	
reg 	lprice lquan 	i.event2 i.event2#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2E,  			cttop( )	
reg 	lprice lquan 	i.event2 i.HostType2E i.event2#i.HostType2E 	i.event2#c.lquan i.HostType2E#c.lquan i.event2#i.HostType2E#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2E,  			cttop( )	
reg 	lprice lquan 	i.event2 i.HostType2E i.event2#i.HostType2E 	i.event2#c.lquan i.HostType2E#c.lquan i.event2#i.HostType2E#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2E,  			cttop( )	
reg 	lprice lquan 	i.event2 i.HostType2E i.event2#i.HostType2E 	i.event2#c.lquan i.HostType2E#c.lquan i.event2#i.HostType2E#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_HostType2E,  			cttop( )	see excel

*Event 3
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType2E, replace 	cttop( )
reg 	lquan 			i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType2E, 			cttop( )
reg 	lquan 			i.event3 i.HostType2E i.event3#i.HostType2E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType2E, 			cttop( )
reg 	lquan 			i.event3 i.HostType2E i.event3#i.HostType2E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType2E, 			cttop( )
reg 	lquan 			i.event3 i.HostType2E i.event3#i.HostType2E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_HostType2E, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType2E, replace 	cttop( )
reg 	lprice 			i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType2E, 			cttop( )
reg 	lprice 			i.event3 i.HostType2E i.event3#i.HostType2E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType2E, 			cttop( )
reg 	lprice 			i.event3 i.HostType2E i.event3#i.HostType2E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType2E, 			cttop( )
reg 	lprice 			i.event3 i.HostType2E i.event3#i.HostType2E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_HostType2E, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2E, replace 	cttop( )	
reg 	lprice lquan 	i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2E,  			cttop( )
reg 	lprice lquan 	i.event3 i.HostType2E i.event3#i.HostType2E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2E,  			cttop( )
reg 	lprice lquan 	i.event3 i.HostType2E i.event3#i.HostType2E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2E,  			cttop( )
reg 	lprice lquan 	i.event3 i.HostType2E i.event3#i.HostType2E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2E,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2E, 		 	cttop( )	
reg 	lprice lquan 	i.event3 i.event3#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2E,  			cttop( )	
reg 	lprice lquan 	i.event3 i.HostType2E i.event3#i.HostType2E 	i.event3#c.lquan i.HostType2E#c.lquan i.event3#i.HostType2E#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2E,  			cttop( )	
reg 	lprice lquan 	i.event3 i.HostType2E i.event3#i.HostType2E 	i.event3#c.lquan i.HostType2E#c.lquan i.event3#i.HostType2E#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2E,  			cttop( )	
reg 	lprice lquan 	i.event3 i.HostType2E i.event3#i.HostType2E 	i.event3#c.lquan i.HostType2E#c.lquan i.event3#i.HostType2E#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_HostType2E,  			cttop( )	see excel

*Event 4
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType2E, replace 	cttop( )
reg 	lquan 			i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType2E, 			cttop( )
reg 	lquan 			i.event4 i.HostType2E i.event4#i.HostType2E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType2E, 			cttop( )
reg 	lquan 			i.event4 i.HostType2E i.event4#i.HostType2E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType2E, 			cttop( )
reg 	lquan 			i.event4 i.HostType2E i.event4#i.HostType2E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_HostType2E, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType2E, replace 	cttop( )
reg 	lprice 			i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType2E, 			cttop( )
reg 	lprice 			i.event4 i.HostType2E i.event4#i.HostType2E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType2E, 			cttop( )
reg 	lprice 			i.event4 i.HostType2E i.event4#i.HostType2E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType2E, 			cttop( )
reg 	lprice 			i.event4 i.HostType2E i.event4#i.HostType2E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_HostType2E, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2E, replace 	cttop( )	
reg 	lprice lquan 	i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2E,  			cttop( )
reg 	lprice lquan 	i.event4 i.HostType2E i.event4#i.HostType2E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2E,  			cttop( )
reg 	lprice lquan 	i.event4 i.HostType2E i.event4#i.HostType2E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2E,  			cttop( )
reg 	lprice lquan 	i.event4 i.HostType2E i.event4#i.HostType2E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2E,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2E, 		 	cttop( )	
reg 	lprice lquan 	i.event4 i.event4#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2E,  			cttop( )	
reg 	lprice lquan 	i.event4 i.HostType2E i.event4#i.HostType2E 	i.event4#c.lquan i.HostType2E#c.lquan i.event4#i.HostType2E#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2E,  			cttop( )	
reg 	lprice lquan 	i.event4 i.HostType2E i.event4#i.HostType2E 	i.event4#c.lquan i.HostType2E#c.lquan i.event4#i.HostType2E#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2E,  			cttop( )	
reg 	lprice lquan 	i.event4 i.HostType2E i.event4#i.HostType2E 	i.event4#c.lquan i.HostType2E#c.lquan i.event4#i.HostType2E#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_HostType2E,  			cttop( )	see excel


********************************************************************************



* Hosttype3E 
* Event 1
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_Hosttype3E, replace 	cttop( )
reg 	lquan 			i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_Hosttype3E, 			cttop( )
reg 	lquan 			i.event1 i.Hosttype3E i.event1#i.Hosttype3E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_Hosttype3E, 			cttop( )
reg 	lquan 			i.event1 i.Hosttype3E i.event1#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_Hosttype3E, 			cttop( )
reg 	lquan 			i.event1 i.Hosttype3E i.event1#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event1_Hosttype3E, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_Hosttype3E, replace 	cttop( )
reg 	lprice 			i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_Hosttype3E, 			cttop( )
reg 	lprice 			i.event1 i.Hosttype3E i.event1#i.Hosttype3E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_Hosttype3E, 			cttop( )
reg 	lprice 			i.event1 i.Hosttype3E i.event1#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_Hosttype3E, 			cttop( )
reg 	lprice 			i.event1 i.Hosttype3E i.event1#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event1_Hosttype3E, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3E, replace 	cttop( )	
reg 	lprice lquan 	i.event1 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3E,  			cttop( )
reg 	lprice lquan 	i.event1 i.Hosttype3E i.event1#i.Hosttype3E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3E,  			cttop( )
reg 	lprice lquan 	i.event1 i.Hosttype3E i.event1#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3E,  			cttop( )
reg 	lprice lquan 	i.event1 i.Hosttype3E i.event1#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3E,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3E, 		 	cttop( )	
reg 	lprice lquan 	i.event1 i.event1#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3E,  			cttop( )	
reg 	lprice lquan 	i.event1 i.Hosttype3E i.event1#i.Hosttype3E 	i.event1#c.lquan i.Hosttype3E#c.lquan i.event1#i.Hosttype3E#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3E,  			cttop( )	
reg 	lprice lquan 	i.event1 i.Hosttype3E i.event1#i.Hosttype3E 	i.event1#c.lquan i.Hosttype3E#c.lquan i.event1#i.Hosttype3E#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3E,  			cttop( )	
reg 	lprice lquan 	i.event1 i.Hosttype3E i.event1#i.Hosttype3E 	i.event1#c.lquan i.Hosttype3E#c.lquan i.event1#i.Hosttype3E#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event1_Hosttype3E,  			cttop( )	see excel

* Event 2
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_Hosttype3E, replace 	cttop( )
reg 	lquan 			i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_Hosttype3E, 			cttop( )
reg 	lquan 			i.event2 i.Hosttype3E i.event2#i.Hosttype3E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_Hosttype3E, 			cttop( )
reg 	lquan 			i.event2 i.Hosttype3E i.event2#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_Hosttype3E, 			cttop( )
reg 	lquan 			i.event2 i.Hosttype3E i.event2#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event2_Hosttype3E, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_Hosttype3E, replace 	cttop( )
reg 	lprice 			i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_Hosttype3E, 			cttop( )
reg 	lprice 			i.event2 i.Hosttype3E i.event2#i.Hosttype3E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_Hosttype3E, 			cttop( )
reg 	lprice 			i.event2 i.Hosttype3E i.event2#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_Hosttype3E, 			cttop( )
reg 	lprice 			i.event2 i.Hosttype3E i.event2#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event2_Hosttype3E, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3E, replace 	cttop( )	
reg 	lprice lquan 	i.event2 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3E,  			cttop( )
reg 	lprice lquan 	i.event2 i.Hosttype3E i.event2#i.Hosttype3E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3E,  			cttop( )
reg 	lprice lquan 	i.event2 i.Hosttype3E i.event2#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3E,  			cttop( )
reg 	lprice lquan 	i.event2 i.Hosttype3E i.event2#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3E,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3E, 		 	cttop( )	
reg 	lprice lquan 	i.event2 i.event2#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3E,  			cttop( )	
reg 	lprice lquan 	i.event2 i.Hosttype3E i.event2#i.Hosttype3E 	i.event2#c.lquan i.Hosttype3E#c.lquan i.event2#i.Hosttype3E#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3E,  			cttop( )	
reg 	lprice lquan 	i.event2 i.Hosttype3E i.event2#i.Hosttype3E 	i.event2#c.lquan i.Hosttype3E#c.lquan i.event2#i.Hosttype3E#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3E,  			cttop( )	
reg 	lprice lquan 	i.event2 i.Hosttype3E i.event2#i.Hosttype3E 	i.event2#c.lquan i.Hosttype3E#c.lquan i.event2#i.Hosttype3E#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event2_Hosttype3E,  			cttop( )	see excel

*Event 3
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_Hosttype3E, replace 	cttop( )
reg 	lquan 			i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_Hosttype3E, 			cttop( )
reg 	lquan 			i.event3 i.Hosttype3E i.event3#i.Hosttype3E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_Hosttype3E, 			cttop( )
reg 	lquan 			i.event3 i.Hosttype3E i.event3#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_Hosttype3E, 			cttop( )
reg 	lquan 			i.event3 i.Hosttype3E i.event3#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event3_Hosttype3E, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_Hosttype3E, replace 	cttop( )
reg 	lprice 			i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_Hosttype3E, 			cttop( )
reg 	lprice 			i.event3 i.Hosttype3E i.event3#i.Hosttype3E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_Hosttype3E, 			cttop( )
reg 	lprice 			i.event3 i.Hosttype3E i.event3#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_Hosttype3E, 			cttop( )
reg 	lprice 			i.event3 i.Hosttype3E i.event3#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event3_Hosttype3E, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3E, replace 	cttop( )	
reg 	lprice lquan 	i.event3 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3E,  			cttop( )
reg 	lprice lquan 	i.event3 i.Hosttype3E i.event3#i.Hosttype3E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3E,  			cttop( )
reg 	lprice lquan 	i.event3 i.Hosttype3E i.event3#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3E,  			cttop( )
reg 	lprice lquan 	i.event3 i.Hosttype3E i.event3#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3E,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3E, 		 	cttop( )	
reg 	lprice lquan 	i.event3 i.event3#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3E,  			cttop( )	
reg 	lprice lquan 	i.event3 i.Hosttype3E i.event3#i.Hosttype3E 	i.event3#c.lquan i.Hosttype3E#c.lquan i.event3#i.Hosttype3E#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3E,  			cttop( )	
reg 	lprice lquan 	i.event3 i.Hosttype3E i.event3#i.Hosttype3E 	i.event3#c.lquan i.Hosttype3E#c.lquan i.event3#i.Hosttype3E#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3E,  			cttop( )	
reg 	lprice lquan 	i.event3 i.Hosttype3E i.event3#i.Hosttype3E 	i.event3#c.lquan i.Hosttype3E#c.lquan i.event3#i.Hosttype3E#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event3_Hosttype3E,  			cttop( )	see excel

*Event 4
reg 	lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_Hosttype3E, replace 	cttop( )
reg 	lquan 			i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_Hosttype3E, 			cttop( )
reg 	lquan 			i.event4 i.Hosttype3E i.event4#i.Hosttype3E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_Hosttype3E, 			cttop( )
reg 	lquan 			i.event4 i.Hosttype3E i.event4#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_Hosttype3E, 			cttop( )
reg 	lquan 			i.event4 i.Hosttype3E i.event4#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lquan_event4_Hosttype3E, 			cttop( ) see excel


reg 	lprice
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_Hosttype3E, replace 	cttop( )
reg 	lprice 			i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_Hosttype3E, 			cttop( )
reg 	lprice 			i.event4 i.Hosttype3E i.event4#i.Hosttype3E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_Hosttype3E, 			cttop( )
reg 	lprice 			i.event4 i.Hosttype3E i.event4#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_Hosttype3E, 			cttop( )
reg 	lprice 			i.event4 i.Hosttype3E i.event4#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_event4_Hosttype3E, 			cttop( ) see excel


reg  	lprice lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3E, replace 	cttop( )	
reg 	lprice lquan 	i.event4 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3E,  			cttop( )
reg 	lprice lquan 	i.event4 i.Hosttype3E i.event4#i.Hosttype3E
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3E,  			cttop( )
reg 	lprice lquan 	i.event4 i.Hosttype3E i.event4#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3E,  			cttop( )
reg 	lprice lquan 	i.event4 i.Hosttype3E i.event4#i.Hosttype3E 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3E,  			cttop( )
reg  	lprice lquan	
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3E, 		 	cttop( )	
reg 	lprice lquan 	i.event4 i.event4#c.lquan 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3E,  			cttop( )	
reg 	lprice lquan 	i.event4 i.Hosttype3E i.event4#i.Hosttype3E 	i.event4#c.lquan i.Hosttype3E#c.lquan i.event4#i.Hosttype3E#c.lquan
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3E,  			cttop( )	
reg 	lprice lquan 	i.event4 i.Hosttype3E i.event4#i.Hosttype3E 	i.event4#c.lquan i.Hosttype3E#c.lquan i.event4#i.Hosttype3E#c.lquan 	listingage i.listingtype bedrooms bathrooms 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3E,  			cttop( )	
reg 	lprice lquan 	i.event4 i.Hosttype3E i.event4#i.Hosttype3E 	i.event4#c.lquan i.Hosttype3E#c.lquan i.event4#i.Hosttype3E#c.lquan 	listingage i.listingtype bedrooms bathrooms i.neighborhood 
outreg2 using Y:\agrajg\Research\Meeting29Sept2017\lprice_lquan_event4_Hosttype3E,  			cttop( )	see excel




********************************************************************************
********************************************************************************
********************************************************************************



