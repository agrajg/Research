clear all
set more off
********************************************************************************
use "Y:\agrajg\Research\Data\temp\000102_AIRDNA_listings_data_clean_final.dta", clear

/*-------------------------------------------------------------------------------
twoway 	(scatter latitude longitude if state=="New York", 		sort mcolor(navy) 			msize(tiny) 	msymbol(circle_hollow)) ///
		(scatter latitude longitude if state=="New Jersey", 	sort mcolor(red) 			msize(vtiny)	msymbol(point)) ///
		(scatter latitude longitude if state == "Pennsylvania", sort mcolor(forest_green) 	msize(tiny) 	msymbol(triangle)), ///
		ylabel(#12, grid) ///
		xlabel(#20, grid) ///
		title(Spatial Locations of Properties) ///
		note(Many properties in New Jersey or Pennsylvania may be adverized as New York Listing. The GPS location gives a precise location of the property.) ///
		legend(on order(1 "New York" 2 "New Jersey" 3 "Pennsylvania") ///
		title(Listed State) position(4) ring(0)) ///
		scheme(tufte) ///
		scale(0.5)
graph save Graph "Y:\agrajg\Research\Output\020101_SpatialLocationOfProperties.gph", replace
graph export "Y:\agrajg\Research\Output\020101_SpatialLocationOfProperties.png" , width(1600) height(1500) replace
*/-------------------------------------------------------------------------------



