*****************************************************
************** Who'll Stop the Rain? ****************
*** Repeated Disasters and Opinions of Government ***
*** Joshua P. Darr, Sarah D. Cate, Daniel S. Moak ***
************ Social Science Quarterly ***************
*****************************************************


***********************
**** Descriptives *****
***********************

** State weights **
use "LA_CRS_recoded.dta", clear
svyset respnum_ [pweight=weight_state], vce(linearized) singleunit(missing)

generate katrina_sub = (katrina_applied==1)
generate no_katrina_sub = (katrina_applied==0)
generate flood_sub = (flood_applied==1)
generate no_flood_sub = (flood_applied==0)

* No differences *
svy: mean fema_perf, over(katrina_applied)
svy: mean stategov_perf, over(katrina_applied)

* Big differences *
svy: mean fema_perf, over(flood_applied)
svy: mean stategov_perf, over(flood_applied)



** Baton Rouge metro weights **
use "LA_CRS_recoded.dta", clear
svyset respnum_ [pweight=weight_metro], vce(linearized) singleunit(missing)

generate katrina_sub = (katrina_applied==1)
generate no_katrina_sub = (katrina_applied==0)
generate flood_sub = (flood_applied==1)
generate no_flood_sub = (flood_applied==0)

* No differences *
svy: mean fema_perf, over(katrina_applied)
svy: mean stategov_perf, over(katrina_applied)

* Big differences *
svy: mean fema_perf, over(flood_applied)
svy: mean stategov_perf, over(flood_applied)



************************
*** Table 1: Results ***
**** flood_applied *****
************************

cd "/Users/jdarr/Dropbox/Research/LA_CRS/Data"

** State analyses **

use "LA_CRS_recoded.dta", clear
svyset respnum_ [pweight=weight_state], vce(linearized) singleunit(missing)

***** Add Labels to Data for Marginsplots *****
label define katrina_applied 0 "Did not apply" 1 "Applied"
label define flood_applied 0 "Did not apply" 1 "Applied"
label define flooded 0 "Not flooded" 1 "Flooded"

label variable katrina_applied "Applied for Katrina aid"
label variable flood_applied "Applied for 2016 flood aid"
label variable flooded "Flooded in 2016"

label values katrina_applied katrina_applied
label values flood_applied flood_applied
label values flooded flooded

* Column 1 *
svy: regress fema_perf flood_applied##katrina_applied black media_new_index media_old_index i.educ_cat i.inc_cat rent_home female democrat
*outreg2 using "Output/main_analysis.doc", append ctitle(FEMA approval, 0-100) se bdec(3) sdec(3)
margins, by(katrina_applied) at(flood_applied=1)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("FEMA assessment, 2016 floods", size(medsmall)) xtitle("2005 Katrina FEMA aid") ytitle("Approval of FEMA response, 2016 floods") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph save "2_FEMA_Katrina_applied_st.gph", replace
graph export "2_FEMA_Katrina_applied_st.png", replace
pwcompare i.flood_applied##i.katrina_applied, effects

margins, by(katrina_applied) at(flood_applied=0)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("Did not apply for Katrina aid") xtitle("2005 Katrina FEMA aid") ytitle("Approval of FEMA response, 2016 floods") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph export "1_FEMA_NoKatrina_applied_st.png", replace

* Column 2 *
svy: regress stategov_perf flood_applied##katrina_applied black media_new_index media_old_index i.educ_cat i.inc_cat rent_home female democrat
*outreg2 using "Output/main_analysis.doc", append ctitle(State gov't approval, 0-100) se bdec(3) sdec(3)
margins, by(katrina_applied) at(flood_applied=1)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("State gov't assessment, 2016 floods", size(medsmall)) xtitle("2005 Katrina FEMA aid") ytitle("Approval of state gov't response, 2016 floods") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph save "4_Stategov_Katrina_applied_st.gph", replace
graph export "4_Stategov_Katrina_applied_st.png", replace
pwcompare i.flood_applied##i.katrina_applied, effects

margins, by(katrina_applied) at(flood_applied=0)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("Did not apply for Katrina aid") xtitle("2005 Katrina FEMA aid") ytitle("Approval of state gov't response, 2016 floods") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph export "3_Stategov_NoKatrina_applied_st.png", replace
pwcompare i.flood_applied##i.katrina_applied, effects

graph combine "2_FEMA_Katrina_applied_st.gph" "4_Stategov_Katrina_applied_st.gph", xsize(6) title("Louisiana sample", size(medium)) graphregion(color(white))
graph save "Louisiana sample.gph", replace




** Baton Rouge metro oversample **

use "LA_CRS_recoded.dta", clear
svyset respnum_ [pweight=weight_metro], vce(linearized) singleunit(missing)

***** Add Labels to Data for Marginsplots *****
label define katrina_applied 0 "Did not apply" 1 "Applied"
label define flood_applied 0 "Did not apply" 1 "Applied"
label define flooded 0 "Not flooded" 1 "Flooded"

label variable katrina_applied "Applied for Katrina aid"
label variable flood_applied "Applied for 2016 flood aid"
label variable flooded "Flooded in 2016"

label values katrina_applied katrina_applied
label values flood_applied flood_applied
label values flooded flooded

* Column 3 *
svy: regress fema_perf flood_applied##katrina_applied black media_new_index media_old_index i.educ_cat i.inc_cat rent_home female democrat
*outreg2 using "Output/main_analysis.doc", append ctitle(FEMA approval, 0-100) se bdec(3) sdec(3)
margins, by(katrina_applied) at(flood_applied=1)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("FEMA assessment, 2016 floods", size(medsmall)) xtitle("2005 Katrina FEMA aid") ytitle("Approval of FEMA response") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph save "6_FEMA_Katrina_applied_br.gph", replace
graph export "6_FEMA_Katrina_applied_br.png", replace
pwcompare i.flood_applied##i.katrina_applied, effects

margins, by(katrina_applied) at(flood_applied=0)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("Did not apply for Katrina aid") xtitle("2005 Katrina FEMA aid") ytitle("Approval of FEMA response") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph export "5_FEMA_NoKatrina_applied_br.png", replace
pwcompare i.flood_applied##i.katrina_applied, effects

* Column 4 *
svy: regress stategov_perf flood_applied##katrina_applied black media_new_index media_old_index i.educ_cat i.inc_cat rent_home female democrat
*outreg2 using "Output/main_analysis.doc", append ctitle(State gov't approval, 0-100) se bdec(3) sdec(3)
margins, by(katrina_applied) at(flood_applied=1)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("State gov't assessment, 2016 floods", size(medsmall)) xtitle("2005 Katrina FEMA aid") ytitle("Approval of state gov't response") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph save "8_Stategov_Katrina_applied_br.gph", replace
graph export "8_Stategov_Katrina_applied_br.png", replace
pwcompare i.flood_applied##i.katrina_applied, effects

margins, by(katrina_applied) at(flood_applied=0)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("Did not apply for Katrina aid") xtitle("2005 Katrina FEMA aid") ytitle("Approval of state gov't response") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph export "7_Stategov_NoKatrina_applied_br.png", replace
pwcompare i.flood_applied##i.katrina_applied, effects

graph combine "6_FEMA_Katrina_applied_br.gph" "8_Stategov_Katrina_applied_br.gph", xsize(6) title("Baton Rouge sample", size(medium)) graphregion(color(white))
graph save "BR_sample.gph", replace



****************
*** Figure 1 ***
****************

graph combine "Louisiana sample.gph" "BR_sample.gph", col(1) row(2) ysize(7) xsize(6.5) title("2016 Flood Opinions by Katrina Experience", size(medium)) graphregion(color(white))
graph save "Margins results figure.gph", replace
graph export "Margins results figure.png", replace







*** APPENDIX Table A2: Additive Analyses ***

************************
**** MAIN ANALYSIS: ****
**** flood_applied *****
************************
set more off

cd "/Users/jdarr/Dropbox/Research/LA_CRS/Data"

** State analyses **

use "LA_CRS_recoded.dta", clear
svyset respnum_ [pweight=weight_state], vce(linearized) singleunit(missing)

***** Add Labels to Data for Marginsplots *****
label define katrina_applied 0 "Did not apply" 1 "Applied"
label define flood_applied 0 "Did not apply" 1 "Applied"
label define flooded 0 "Not flooded" 1 "Flooded"

label variable katrina_applied "Applied for Katrina aid"
label variable flood_applied "Applied for 2016 flood aid"
label variable flooded "Flooded in 2016"

label values katrina_applied katrina_applied
label values flood_applied flood_applied
label values flooded flooded

* Column 1 *
svy: regress fema_perf flood_applied katrina_applied black media_new_index media_old_index i.educ_cat i.inc_cat rent_home female democrat
outreg2 using "Output/additive.doc", append ctitle(FEMA approval, 0-100) se bdec(3) sdec(3)


* Column 2 *
svy: regress stategov_perf flood_applied katrina_applied black media_new_index media_old_index i.educ_cat i.inc_cat rent_home female democrat
outreg2 using "Output/additive.doc", append ctitle(State gov't approval, 0-100) se bdec(3) sdec(3)




** Baton Rouge metro oversample **

use "LA_CRS_recoded.dta", clear
svyset respnum_ [pweight=weight_metro], vce(linearized) singleunit(missing)

***** Add Labels to Data for Marginsplots *****
label define katrina_applied 0 "Did not apply" 1 "Applied"
label define flood_applied 0 "Did not apply" 1 "Applied"
label define flooded 0 "Not flooded" 1 "Flooded"

label variable katrina_applied "Applied for Katrina aid"
label variable flood_applied "Applied for 2016 flood aid"
label variable flooded "Flooded in 2016"

label values katrina_applied katrina_applied
label values flood_applied flood_applied
label values flooded flooded

* Column 3 *
svy: regress fema_perf flood_applied katrina_applied black media_new_index media_old_index i.educ_cat i.inc_cat rent_home female democrat
outreg2 using "Output/additive.doc", append ctitle(FEMA approval, 0-100) se bdec(3) sdec(3)


* Column 4 *
svy: regress stategov_perf flood_applied katrina_applied black media_new_index media_old_index i.educ_cat i.inc_cat rent_home female democrat
outreg2 using "Output/additive.doc", append ctitle(State gov't approval, 0-100) se bdec(3) sdec(3)





**************************
** Table A3: Add'l test **
******* flooded **********
**************************


cd "/Users/jdarr/Dropbox/Research/LA_CRS/Data"

** State analyses **

use "LA_CRS_recoded.dta", clear
svyset respnum_ [pweight=weight_state], vce(linearized) singleunit(missing)

***** Add Labels to Data for Marginsplots *****
label define katrina_applied 0 "Did not apply" 1 "Applied"
label define flooded 0 "Not flooded" 1 "Flooded"

label variable katrina_applied "Applied for Katrina aid"
label variable flooded "Flooded in 2016"

label values katrina_applied katrina_applied
label values flooded flooded

** Table A3 **

* Column 1 *
svy: regress fema_perf flooded##katrina_applied black media_new_index media_old_index i.educ_cat i.inc_cat rent_home female democrat
outreg2 using "Output/secondary_analysis.doc", append ctitle(FEMA approval, 0-100) se bdec(3) sdec(3)
margins, by(katrina_applied) at(flooded=1)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("Applied for Katrina aid") xtitle("2016 Floods FEMA aid") ytitle("Approval of FEMA response") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph export "10_FEMA_Katrina_applied_st_flooded.png", replace
margins, by(flooded) at(katrina_applied=0)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("Did not apply for Katrina aid") xtitle("2016 Floods FEMA aid") ytitle("Approval of FEMA response") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph export "9_FEMA_NoKatrina_applied_st_flooded.png", replace

* Column 2 *
svy: regress stategov_perf flooded##katrina_applied black media_new_index media_old_index i.educ_cat i.inc_cat rent_home female democrat
outreg2 using "Output/secondary_analysis.doc", append ctitle(State gov't approval, 0-100) se bdec(3) sdec(3)
margins, by(katrina_applied) at(flooded=1)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("Applied for Katrina aid") xtitle("2016 Floods FEMA aid") ytitle("Approval of state gov't response") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph export "12_Stategov_Katrina_applied_st_flooded.png", replace
margins, by(flooded) at(katrina_applied=0)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("Did not apply for Katrina aid") xtitle("2016 Floods FEMA aid") ytitle("Approval of state gov't response") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph export "11_Stategov_NoKatrina_applied_st_flooded.png", replace





** Baton Rouge metro oversample **

use "LA_CRS_recoded.dta", clear
svyset respnum_ [pweight=weight_metro], vce(linearized) singleunit(missing)

***** Add Labels to Data for Marginsplots *****
label define katrina_applied 0 "Did not apply" 1 "Applied"
label define flooded 0 "Not flooded" 1 "Flooded"

label variable katrina_applied "Applied for Katrina aid"
label variable flooded "Flooded in 2016"

label values katrina_applied katrina_applied
label values flooded flooded

* Column 3 *
svy: regress fema_perf flooded##katrina_applied black media_new_index media_old_index i.educ_cat i.inc_cat rent_home female democrat
outreg2 using "Output/secondary_analysis.doc", append ctitle(FEMA approval, 0-100) se bdec(3) sdec(3)
margins, by(katrina_applied) at(flooded=1)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("Applied for Katrina aid") xtitle("2016 Floods FEMA aid") ytitle("Approval of FEMA response") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph export "14_FEMA_Katrina_applied_br_flooded.png", replace
margins, by(flooded) at(katrina_applied=0)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) xtitle("2016 Floods FEMA aid") ytitle("Approval of FEMA response") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph export "13_FEMA_NoKatrina_applied_br_flooded.png", replace

* Column 4 *
svy: regress stategov_perf flooded##katrina_applied black media_new_index media_old_index i.educ_cat i.inc_cat rent_home female democrat
outreg2 using "Output/secondary_analysis.doc", append ctitle(State gov't approval, 0-100) se bdec(3) sdec(3)
margins, by(katrina_applied) at(flooded=1)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("Applied for Katrina aid") xtitle("2016 Floods FEMA aid") ytitle("Approval of state gov't response") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph export "16_Stategov_Katrina_applied_br_flooded.png", replace
margins, by(flooded) at(katrina_applied=0)
marginsplot, recast(scatter) yscale(range(0 100)) ylabel(0(10)100) xscale(range(-0.5 1.5)) title("Did not apply for Katrina aid", span) xtitle("2016 Floods FEMA aid") ytitle("Approval of state gov't response") graphregion(color(white)) plotregion(color(white)) bgcolor(white) graphregion(margin(medium))
graph export "15_Stategov_NoKatrina_applied_br_flooded.png", replace





