cap erase "Y:\agrajg\Research\Output\020228_sdum3_regressionOutput_stage1"
estimates use "Y:\agrajg\Research\Output\020225_sdum3_stage1_reg1.ster"
outreg2 using "Y:\agrajg\Research\Output\020228_sdum3_regressionOutput_stage1", dec(3) sortvar(INT2* INT3*) ctitle(booking dummy) cttop(OLS)  addtext(Listing FE , YES, Time FE , Yes, Host Controls, Yes, Listing Controls, Yes) addnote(Dummy variables not shown)
estimates use "Y:\agrajg\Research\Output\020225_sdum3_stage1_reg2.ster"
outreg2 using "Y:\agrajg\Research\Output\020228_sdum3_regressionOutput_stage1", dec(3) sortvar(INT2* INT3*) ctitle(booking dummy) cttop(OLS)  addtext(Listing FE , YES, Time FE , Yes, Host Controls, Yes, Listing Controls, Yes) 
estimates use "Y:\agrajg\Research\Output\020225_sdum3_stage1_reg3.ster"
outreg2 using "Y:\agrajg\Research\Output\020228_sdum3_regressionOutput_stage1" ,dec(3) sortvar(INT2* INT3*) ctitle(booking dummy) cttop(OLS)  addtext(Listing FE , YES, Time FE , Yes, Host Controls, Yes, Listing Controls, Yes) tex(frag)

cap erase "Y:\agrajg\Research\Output\020228_sdum3_regressionOutput_stage2.txt"
estimates use "Y:\agrajg\Research\Output\020225_sdum3_stage2_reg1.ster"
outreg2 using "Y:\agrajg\Research\Output\020228_sdum3_regressionOutput_stage2", dec(3) sortvar(T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum) ctitle(Est Time FE) cttop(SUR)  addtext(Seasonal FE , YES) addnote(Dummy variables not shown)
estimates use "Y:\agrajg\Research\Output\020225_sdum3_stage2_reg2.ster"
outreg2 using "Y:\agrajg\Research\Output\020228_sdum3_regressionOutput_stage2", dec(3) sortvar(T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum) ctitle(Est Time FE) cttop(SUR)  addtext(Seasonal FE , YES) 
estimates use "Y:\agrajg\Research\Output\020225_sdum3_stage2_reg3.ster"
outreg2 using "Y:\agrajg\Research\Output\020228_sdum3_regressionOutput_stage2" ,dec(3) sortvar(T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum) ctitle(Est Time FE) cttop(SUR)  addtext(Seasonal FE , YES) tex(frag)

cap erase "Y:\agrajg\Research\Output\020228_lprice_regressionOutput_stage1"
estimates use "Y:\agrajg\Research\Output\020226_lprice_stage1_reg1.ster"
outreg2 using "Y:\agrajg\Research\Output\020228_lprice_regressionOutput_stage1", dec(3) sortvar(INT2* INT3*) ctitle(log price) cttop(OLS)  addtext(Listing FE , YES, Time FE , Yes, Host Controls, Yes, Listing Controls, Yes) addnote(Dummy variables not shown)
estimates use "Y:\agrajg\Research\Output\020226_lprice_stage1_reg2.ster"
outreg2 using "Y:\agrajg\Research\Output\020228_lprice_regressionOutput_stage1", dec(3) sortvar(INT2* INT3*) ctitle(log price) cttop(OLS)  addtext(Listing FE , YES, Time FE , Yes, Host Controls, Yes, Listing Controls, Yes) 
estimates use "Y:\agrajg\Research\Output\020226_lprice_stage1_reg3.ster"
outreg2 using "Y:\agrajg\Research\Output\020228_lprice_regressionOutput_stage1" ,dec(3) sortvar(INT2* INT3*) ctitle(log price) cttop(OLS)  addtext(Listing FE , YES, Time FE , Yes, Host Controls, Yes, Listing Controls, Yes) tex(frag)

cap erase "Y:\agrajg\Research\Output\020228_lprrice_regressionOutput_stage2.txt"
estimates use "Y:\agrajg\Research\Output\020226_lprice_stage2_reg1.ster"
outreg2 using "Y:\agrajg\Research\Output\020228_lprrice_regressionOutput_stage2", dec(3) sortvar(T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum) ctitle(Est Time FE) cttop(SUR)  addtext(Seasonal FE , YES) addnote(Dummy variables not shown)
estimates use "Y:\agrajg\Research\Output\020226_lprice_stage2_reg2.ster"
outreg2 using "Y:\agrajg\Research\Output\020228_lprrice_regressionOutput_stage2", dec(3) sortvar(T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum) ctitle(Est Time FE) cttop(SUR)  addtext(Seasonal FE , YES) 
estimates use "Y:\agrajg\Research\Output\020226_lprice_stage2_reg3.ster"
outreg2 using "Y:\agrajg\Research\Output\020228_lprrice_regressionOutput_stage2" ,dec(3) sortvar(T_RegPurgeDum T_RegDataDiscDum T_RegActRegImpDum) ctitle(Est Time FE) cttop(SUR)  addtext(Seasonal FE , YES) tex(frag)
