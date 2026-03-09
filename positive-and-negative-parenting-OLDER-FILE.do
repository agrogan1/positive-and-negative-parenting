* analysis with older R15 data file

clear all

cd "/Users/agrogan/Desktop/GitHub/positive-and-negative-parenting"

use "/Users/agrogan/Library/CloudStorage/Dropbox-UniversityofMichigan/Andrew Grogan-Kaylor/MICS/merging MICS and World Bank WDI/MICS_R15_Oct2023.dta"

recode no_aggress (0=1)(1=0), generate(aggress)

label variable aggress "child aggression"

describe d_*

* analysis

* mixed

mixed aggress sex_selected age_selected d_* || country: d_*

est store M1

* meqrlogit

meqrlogit aggress sex_selected age_selected d_* || country: d_*

est store M2

* tables of estimates

* mixed

etable, estimates(M1) /// use these estimate(s)
/* novarlabel */ /// variable names only; could use variable labels 
cstat(_r_b) /// beta's only
showeq /// show equation names
showstars showstarsnote /// show stars and note
column(depvar) /// column is depvar
title("Maximal Model of Parenting and Child Aggression Outcome") ///
export("mytable.md", replace)

* meqrlogit

etable, estimates(M2) /// use these estimate(s)
/* novarlabel */ /// variable names only; could use variable labels 
cstat(_r_b) /// beta's only
showeq /// show equation names
showstars showstarsnote /// show stars and note
column(depvar) /// column is depvar
title("Maximal Model of Parenting and Child Aggression Outcome") ///
export("mytable_meqrlogit.md", replace)

* spaghetti plot

spagplot aggress d_phys_spank, ///
id(country) ///
title("Spaghetti Plot of Aggression by Spanking") ///
ytitle("Aggression") ///
caption("Each line represents a country") // spaghetti plot

graph export "spagplot.png", replace width(2000)

* random effects

predict u*, reffects // predict random effects

preserve // preserve older data

describe u? u1? // describe random effects

collapse u? u1?, by(country)

save reffects.dta, replace

restore // restore older data





