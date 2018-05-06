*===============================================================================
clear all
set more off
forval i=1(1)8 {
	forval j=1(1)5 {
		local m = 020206 + `i'
		cap erase "Y:\agrajg\Research\Output\020223_sdum3_set_`i'`j'.txt"
		cap erase "Y:\agrajg\Research\Output\020223_sdum3_set_`i'`j'.xml"
		cap erase "Y:\agrajg\Research\Output\020223_sdum3_set_`i'`j'.tex"
		estimates use "Y:\agrajg\Research\Output\0`m'_sdum3_set_`i'`j'_reg_16.ster"
		outreg2 using "Y:\agrajg\Research\Output\020223_sdum3_set_`i'`j'", 	cttop(First)
		forval k=5(1)16{
			estimates use "Y:\agrajg\Research\Output\0`m'_sdum3_set_`i'`j'_reg_`k'"
			outreg2 using "Y:\agrajg\Research\Output\020223_sdum3_set_`i'`j'", cttop(Reg `k') 
		}
		estimates use "Y:\agrajg\Research\Output\0`m'_sdum3_set_`i'`j'_reg_16.ster"
		outreg2 using "Y:\agrajg\Research\Output\020223_sdum3_set_`i'`j'", 	cttop(Last) tex excel
	}
}
*===============================================================================
