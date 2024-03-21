* -ssc install whereis-
* -ssc install markstat-
* install pandoc: https://pandoc.org/installing.html
* Pay attention to the installation path
* -whereis pandoc <yourpath here>-
* For example, for me it is:
* -whereis pandoc /opt/anaconda3/bin/pandoc-*
* there is more information on this in the "Tips for Users" section of the whereis help file
* -help whereis-

cd /Users/mollyofferwestort/Documents/Git/SOSC13300-W24/in-class

whereis pandoc /opt/anaconda3/bin/pandoc

markstat using class_11_stata, docx

//
cd ../assignments
markstat using Sparkman_et_al_assignment_stub_stata, docx

//

import delimited "./../data/41467_2022_32412_MOESM4_ESM.csv", clear
gen perceived_concern = grid_gts1_1_gts1
gen female = 1*(resp_gender == 2)
gen college_grad = 1*(usedu3 > 9)



gen party_id = qpid1
replace party_id = 3 if party_id == 4 | party_id == 5

label define party 1 "Democrat" 2 "Republican" 3 "Independent"
label values party_id party
tab party_id, m // 1 = Democrat, 2 = Republican, 3 = Independent

graph bar (mean) perceived_concern, over(party_id)
graph box perceived_concern, over(party_id)

graph bar (mean) perceived_concern, over(party_id) ///
    title("Mean Perceived Concern by Party ID") ///
    ytitle("Mean Perceived Concern") ///
    b2title("Party ID") ///
    name(mean_perceived_concern, replace)

graph export sparkman.png, width(500) replace
