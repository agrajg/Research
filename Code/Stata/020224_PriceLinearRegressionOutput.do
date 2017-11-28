*===============================================================================

clear all
forval i=1(1)8 {
	forval j=1(1)5 {
		cap erase Y:\agrajg\Research\Output\Y:\agrajg\Research\Output\020215_lprice_set_15.txt
		cap erase Y:\agrajg\Research\Output\Y:\agrajg\Research\Output\020215_lprice_set_15.xml
		cap erase Y:\agrajg\Research\Output\Y:\agrajg\Research\Output\020215_lprice_set_15.tex
		forval k=1(1)16{
			estimates use "Y:\agrajg\Research\Output\020215_lprice_set_15_reg_13"
			outreg2 using "Y:\agrajg\Research\Output\020215_lprice_set_15", cttop() 
	}
}
estimates use "Y:\agrajg\Research\Output\020215_lprice_set_15_reg_13.ster"
outreg2 using "Y:\agrajg\Research\Output\Y:\agrajg\Research\Output\020215_lprice_set_15", 	cttop() tex excel
*===============================================================================
