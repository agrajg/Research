clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010208_MergedDataForPanelPriceQuantityRegression.dta", clear
tsset propertyid date, daily
*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
*sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event
*sdum3 i.event PropPerHost c.PropPerHost#event event#c.sdum3 c.PropPerHost#c.sdum3 event#c.PropPerHost#c.sdum3


*** Price quatity
xtreg lprice sdum3 i.event 												i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsA
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event  			i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsB
xtreg lprice sdum3 c.sdum3#event PropPerHost c.PropPerHost#event  		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsC
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsD


*-------------------------------------------------------------------------------
xtreg lprice i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingB
xtreg lprice sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingC
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingD



xtreg lprice i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingB
xtreg lprice sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingC
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingD
*-------------------------------------------------------------------------------
xtreg lprice i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingB
xtreg lprice sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingC
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingD


xtreg lprice i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingB
xtreg lprice sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingC
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingD


xtreg lprice i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingB
xtreg lprice sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingC
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingD

*-------------------------------------------------------------------------------
xtreg lprice i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingB
xtreg lprice sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingC
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingD

xtreg lprice i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingB
xtreg lprice sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingC
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingD


xtreg lprice i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingB
xtreg lprice sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingC
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingD

*-------------------------------------------------------------------------------
xtreg lprice i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingB
xtreg lprice sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingC
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingD

xtreg lprice i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingB
xtreg lprice sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingC
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingD

xtreg lprice i.event 													i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingA
xtreg lprice i.event PropPerHost c.PropPerHost#event  					i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingB
xtreg lprice sdum3 c.sdum3#event PropPerHost c.PropPerHost#event 		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingC
xtreg lprice sdum3 i.event PropPerHost c.PropPerHost#event c.sdum3#event c.sdum3#c.PropPerHost c.sdum3#c.PropPerHost#event ///
																		i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingD

*-------------------------------------------------------------------------------

outreg2 [AllHostsA AllHostsB AllHostsC AllHostsD Max1ListingA Max1ListingB Max1ListingC Max1ListingD  MaxMoreThan1ListingA MaxMoreThan1ListingB MaxMoreThan1ListingC MaxMoreThan1ListingD ///
		Max0EHListingA Max0EHListingB Max0EHListingC Max0EHListingD Max1EHListingA Max1EHListingB Max1EHListingC Max1EHListingD MaxMoreThan1EHListingA MaxMoreThan1EHListingB MaxMoreThan1EHListingC MaxMoreThan1EHListingD ///
		Max0PRListingA Max0PRListingB Max0PRListingC Max0PRListingD Max1PRListingA Max1PRListingB Max1PRListingC Max1PRListingD MaxMoreThan1PRListingA MaxMoreThan1PRListingB MaxMoreThan1PRListingC MaxMoreThan1PRListingD ///
		Max0SRListingA Max0SRListingB Max0SRListingC Max0SRListingD Max1SRListingA Max1SRListingB Max1SRListingC Max1SRListingD MaxMoreThan1SRListingA MaxMoreThan1SRListingB MaxMoreThan1SRListingC MaxMoreThan1SRListingD ] ///
		using "Y:\agrajg\Research\Output\lprice_sdum3_HostClass1", replace sortvar(i.event PropPerHost c.PropPerHost#event) see excel tex
