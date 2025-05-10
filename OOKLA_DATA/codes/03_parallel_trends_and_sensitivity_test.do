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
qui csdid avg_d_mbps, ivar(quadkey) time(year_quarter_numeric) gvar(firsttreat_numeric)  long2 notyet
csdid_estat event, window(-3 12) estore(csdid)
estimates restore csdid


local plotopts xtitle(Mbar) ytitle(95% Robust CI)
honestdid, pre(1/11) post(12/12) mvec(0.5(0.5)2) coefplot `plotopts'

*Test de tendencias paralelas

pretrends power 0.5, pre(1/9) post(10/12)

matrix sigma = e(V)
matrix beta  = e(b)
matrix beta  = beta[., 1..12]
matrix sigma = sigma[1..12, 1..12]
pretrends, numpre(6) b(beta) v(sigma) slope(`r(slope)')

return list

matlist r(results)

mata st_matrix("deltaquad", 0.024 * ((-4::3) :- (-1)):^2)
pretrends, time(-4(1)3) ref(-1) deltatrue(deltaquad) coefplot







