use "Y:\agrajg\Research\Data\temp\test_March_09_2018.dta" 
gen demand=0
cmdlog using results
replace demand=1 if status=="R"
sum deand
demand
sum demand
gen week=week(date)
gen year=year(date)
sort date
egen did=group(date)
sort propertyid date
br propertyid date did
egen fe=group(week year propertyid)
sum price
gen lprice=log(price)
areg demand i.did lprice , absorb(fe)
areg demand lprice , absorb(fe)
sum demand
reg demand lprice
areg demand lprice, absorb(propertyid)
areg demand i.did lprice, absorb(propertyid)
  help ivreg
help ivregress
tab year
tab month
gen month=month(date)
tab month
areg demand lprice if month<=10, absorb(propertyid)
  help ivregress
egen pid=group(propertyid)
 sort pid date
xtset pid date
xtregress demand i.did [lprice=l1.lprice] if month<=10
ivregress demand i.did [lprice=l1.lprice] if month<=10
help ivregress
ivregress 2sls demand i.did [lprice=l1.lprice] if month<=10
help ivregress
ivregress 2sls demand i.did (lprice=l1.lprice) if month<=10
ivregress 2sls demand i.week (lprice=l1.lprice) if month<=10
sum pid
ivregress 2sls demand i.pid i.week (lprice=l1.lprice) if month<=10 & pid<=100
areg lprice l1.lprice, absorb(fe)
  predict phat, xbd
areg demand i.did phat if month<=10, absorb(fe)
areg demand l(1/7).dmeand i.did phat if month<=10, absorb(fe)
areg demand l(1/7).demand i.did phat if month<=10, absorb(fe)
areg demand l(1/7).demand i.did phat if month<=10, absorb(pid)
areg demand l(1/7).demand i.did phat if month<=10, absorb(fe)
   sum demand if month<=10
-.08/.3
di .08/.3
sum demand if month<=10
sum price, d
areg price i.did l1.price if price<=750, absorb(fe)
areg lprice l1.lprice if price>=100, absorb(fe)
ivregress 2sls demand i.week (lprice=l1.lprice) if month<=10 & price>=100
   di -.13/.03
sum demand if price>=100 & month<=10
di .13/.3
sum price, d
ivregress 2sls demand i.week (lprice=l1.lprice) if month<=10 & price>=200
  di .16/.3
ivregress 2sls demand i.week (lprice=l1.lprice) if month<=10 & price>=400
areg demand l(1/7).demand i.did phat if month<=10 & price>=400, absorb(fe)
areg demand l(1/7).demand i.did phat if month<=10 & price>=100, absorb(fe)
areg demand l(1/7).demand i.did lprice if month<=10 & price>=100, absorb(fe)
areg lprice i.did l(1/7).lprice, absorb(fe)
   predict phat2, xbd
areg demand l(1/7).demand i.did phat2 if month<=10 & price>=100, absorb(fe)
      gen dif=lprice-l1.price
sum dif, d
drop dif
gen dif=lprice-l1.lprice
sum dif
sum dif, d
areg demand l(1/7).demand i.did phat2 if month<=10 & price>=100 *abs(dif)>.1 absorb(fe)
areg demand l(1/7).demand i.did phat2 if month<=10 & price>=100 & abs(dif)>.1 absorb(fe)
areg demand l(1/7).demand i.did phat2 if month<=10 & price>=100 & abs(dif)>.1, absorb(fe)
areg demand l(1/7).demand i.did phat2 if month<=10 & price>=100 & abs(dif)>.2, absorb(fe)
  di .12/.3
areg demand l(1/7).demand i.did phat2 if month<=10 & price>=300 & abs(dif)>.2, absorb(fe)
areg demand l(1/14).demand i.did phat2 if month<=10 & price>=100 & abs(dif)>.2, absorb(fe)
areg demand l(1/14).demand i.did phat2 if month<=10 & price>=100  , absorb(fe)
areg demand l(1/14).demand i.did phat2 if month<=10 & abs(dif)>.05 , absorb(fe)
