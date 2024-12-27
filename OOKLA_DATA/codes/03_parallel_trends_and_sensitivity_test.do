*ssc install honestdid
*ssc install coefplot
*ssc install ftools
*ssc install reghdfe
*ssc install drdid, all replace
*ssc install csdid, all replace

*Análisis de sensibilidad 

import delimited "C:\Users\USER\Downloads\quadkeys_final_df.csv", clear

qui sum year_quarter_numeric, meanonly
replace firsttreat_numeric = cond(mi(firsttreat_numeric), r(max) + 1, firsttreat_numeric)
qui csdid avg_d_mbps, time(year_quarter_numeric) gvar(firsttreat_numeric)  long2 notyet
csdid_estat event, window(-4 5) estore(csdid)
estimates restore csdid

local plotopts xtitle(Mbar) ytitle(95% Robust CI)
honestdid, pre(3/6) post(7/12) mvec(0.5(0.5)2) coefplot `plotopts'




*Test de tendencias paralelas

import delimited "C:\Users\USER\Downloads\quadkeys_final_df.csv", clear
reghdfe avg_d_mbps, absorb(firsttreat_numeric year_quarter_numeric) cluster(firsttreat_numeric) dof(none)






