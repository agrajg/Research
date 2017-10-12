clear all
set more off
*-------------------------------------------------------------------------------
use "Y:\agrajg\Research\Data\temp\010208_MergedDataForPanelPriceQuantityRegression.dta", clear
tsset propertyid date, daily
*-------------------------------------------------------------------------------
*-------------------------------------------------------------------------------
*** Quantity
xtreg sdum3 i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2, fe vce(robust)
est store AllHostsB
*-------------------------------------------------------------------------------
xtreg sdum3 i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max 1 Listing" , fe vce(robust)
est store Max1ListingB

xtreg sdum3 i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if HostClass1=="Max More Than 1 Listing" , fe vce(robust)
est store MaxMoreThan1ListingB
*-------------------------------------------------------------------------------
xtreg sdum3 i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 0 EH Listing" , fe vce(robust)
est store Max0EHListingB

xtreg sdum3 i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max 1 EH Listing" , fe vce(robust)
est store Max1EHListingB

xtreg sdum3 i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if EHHostClass1=="Max More Than 1 EH Listing" , fe vce(robust)
est store MaxMoreThan1EHListingB
*-------------------------------------------------------------------------------
xtreg sdum3 i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 0 PR Listing" , fe vce(robust)
est store Max0PRListingB

xtreg sdum3 i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max 1 PR Listing" , fe vce(robust)
est store Max1PRListingB

xtreg sdum3 i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if PRHostClass1=="Max More Than 1 PR Listing" , fe vce(robust)
est store MaxMoreThan1PRListingB
*-------------------------------------------------------------------------------
xtreg sdum3 i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 0 SR Listing" , fe vce(robust)
est store Max0SRListingB

xtreg sdum3 i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max 1 SR Listing" , fe vce(robust)
est store Max1SRListingB

xtreg sdum3 i.event 									i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingA
xtreg sdum3 i.event PropPerHost c.PropPerHost#event  	i.year i.moy i.dow i.wom2 i.holiday i.holidaywom2 if SRHostClass1=="Max More Than 1 SR Listing" , fe vce(robust)
est store MaxMoreThan1SRListingB
*-------------------------------------------------------------------------------

outreg2 [AllHostsA AllHostsB Max1ListingA Max1ListingB MaxMoreThan1ListingB MaxMoreThan1ListingB ///
		Max0EHListingA Max0EHListingB Max1EHListingA Max1EHListingB MaxMoreThan1EHListingA MaxMoreThan1EHListingB ///
		Max0PRListingA Max0PRListingB Max1PRListingA Max1PRListingB MaxMoreThan1PRListingA MaxMoreThan1PRListingB ///
		Max0SRListingA Max0SRListingB Max1SRListingA Max1SRListingB MaxMoreThan1SRListingA MaxMoreThan1SRListingB ] ///
		using "Y:\agrajg\Research\Output\sdum3_HostClass1", replace sortvar(i.event PropPerHost c.PropPerHost#event) see excel tex
