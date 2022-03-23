# ============================================================== #
##                     Get P+ with weights                      ##     
# ============================================================== #

## set path
drive <- "I"
path <- paste0(drive,":/AIR_20211222/PISA_Project/2022_Analysis4")
setwd(path)
getwd()


## Load Data
load("Weighted_Data.Rdata")

## Load Function for compute P+
source("MyFunctions/Hfinal_CTT.R") 
source("MyFunctions/Hfinal_CTT_W.R") 

## Compute weighted P+
CTT2015_res_w <- Hfinal_CTT_W(Commonitems, WData_2015, 0)
CTT2018_res_w <- Hfinal_CTT_W(Commonitems, WData_2018, 0)
CTT2015_exa_w <- Hfinal_CTT_W(Commonitems, WData_2015, 1)
CTT2018_exa_w <- Hfinal_CTT_W(Commonitems, WData_2018, 1)

## Compute un-weighted P+
CTT2015_res <- Hfinal_CTT(Commonitems, WData_2015, 0)
CTT2018_res <- Hfinal_CTT(Commonitems, WData_2018, 0)
CTT2015_exa <- Hfinal_CTT(Commonitems, WData_2015, 1)
CTT2018_exa <- Hfinal_CTT(Commonitems, WData_2018, 1)

## Compare weighted and non-weighted P+

## ====== Compare 1 ====== ##
## Year:    2015
## Filter:  Response-Level
all(CTT2015_res_w == CTT2015_res)

## P+ for All
## Result:  45 differences 
all(CTT2015_res_w$Score_for_all == CTT2015_res$Score_for_all)
length(which(CTT2015_res_w$Score_for_all != CTT2015_res$Score_for_all))
which(CTT2015_res_w$Score_for_all != CTT2015_res$Score_for_all)
data.frame(CTT2015_res_w$Score_for_all, CTT2015_res$Score_for_all, stringsAsFactors=F)

## P+ for Disengaged Response
## Result:  8 differences 
all(CTT2015_res_w$Score_for_disengaged_responses== CTT2015_res$Score_for_disengaged_responses)
length(which(CTT2015_res_w$Score_for_disengaged_responses != CTT2015_res$Score_for_disengaged_responses))
which(CTT2015_res_w$Score_for_disengaged_responses != CTT2015_res$Score_for_disengaged_responses)
data.frame(CTT2015_res_w$Score_for_disengaged_responses, CTT2015_res$Score_for_disengaged_responses, stringsAsFactors=F)

## P+ for Engaged Response
## Result:  45 differences 
all(CTT2015_res_w$Score_for_engaged_responses== CTT2015_res$Score_for_engaged_responses)
length(which(CTT2015_res_w$Score_for_engaged_responses != CTT2015_res$Score_for_engaged_responses))
which(CTT2015_res_w$Score_for_engaged_responses != CTT2015_res$Score_for_engaged_responses)
data.frame(CTT2015_res_w$Score_for_engaged_responses, CTT2015_res$Score_for_engaged_responses, stringsAsFactors=F)

## ====== Compare 2 ====== ##
## Year:    2015
## Filter:  Response-Level
all(CTT2018_res_w == CTT2018_res)

## P+ for All
## Result:  49 differences 
all(CTT2018_res_w$Score_for_all == CTT2018_res$Score_for_all)
length(which(CTT2018_res_w$Score_for_all != CTT2018_res$Score_for_all))
which(CTT2018_res_w$Score_for_all != CTT2018_res$Score_for_all)
data.frame(CTT2018_res_w$Score_for_all, CTT2018_res$Score_for_all, stringsAsFactors=F)

## P+ for Disengaged Response
## Result:  12 differences 
all(CTT2018_res_w$Score_for_disengaged_responses== CTT2018_res$Score_for_disengaged_responses)
length(which(CTT2018_res_w$Score_for_disengaged_responses != CTT2018_res$Score_for_disengaged_responses))
which(CTT2018_res_w$Score_for_disengaged_responses != CTT2018_res$Score_for_disengaged_responses)
data.frame(CTT2018_res_w$Score_for_disengaged_responses, CTT2018_res$Score_for_disengaged_responses, stringsAsFactors=F)

## P+ for Engaged Response
## Result:  49 differences 
all(CTT2018_res_w$Score_for_engaged_responses== CTT2018_res$Score_for_engaged_responses)
length(which(CTT2018_res_w$Score_for_engaged_responses != CTT2018_res$Score_for_engaged_responses))
which(CTT2018_res_w$Score_for_engaged_responses != CTT2018_res$Score_for_engaged_responses)
data.frame(CTT2018_res_w$Score_for_engaged_responses, CTT2018_res$Score_for_engaged_responses, stringsAsFactors=F)

## ====== Compare 3 ====== ##
## Year:    2015
## Filter:  Examinee-Level
all(CTT2015_exa_w == CTT2015_exa)

## P+ for All
## Result:  45 differences (same as Response-Level)
all(CTT2015_exa_w$Score_for_all == CTT2015_exa$Score_for_all)
length(which(CTT2015_exa_w$Score_for_all != CTT2015_exa$Score_for_all))
which(CTT2015_exa_w$Score_for_all != CTT2015_exa$Score_for_all)
data.frame(CTT2015_exa_w$Score_for_all, CTT2015_exa$Score_for_all, stringsAsFactors=F)

## P+ for Disengaged Response
## Result:  0 differences 
all(CTT2015_exa_w$Score_for_disengaged_responses== CTT2015_exa$Score_for_disengaged_responses)
length(which(CTT2015_exa_w$Score_for_disengaged_responses != CTT2015_exa$Score_for_disengaged_responses))
which(CTT2015_exa_w$Score_for_disengaged_responses != CTT2015_exa$Score_for_disengaged_responses)
data.frame(CTT2015_exa_w$Score_for_disengaged_responses, CTT2015_exa$Score_for_disengaged_responses, stringsAsFactors=F)

## P+ for Engaged Response
## Result:  0 differences 
all(CTT2015_exa_w$Score_for_engaged_responses== CTT2015_exa$Score_for_engaged_responses)
length(which(CTT2015_exa_w$Score_for_engaged_responses != CTT2015_exa$Score_for_engaged_responses))
which(CTT2015_exa_w$Score_for_engaged_responses != CTT2015_exa$Score_for_engaged_responses)
data.frame(CTT2015_exa_w$Score_for_engaged_responses, CTT2015_exa$Score_for_engaged_responses, stringsAsFactors=F)

## ====== Compare 4 ====== ##
## Year:    2018
## Filter:  Examinee-Level
all(CTT2018_exa_w == CTT2018_exa)

## P+ for All
## Result:  49 differences 
all(CTT2018_exa_w$Score_for_all == CTT2018_exa$Score_for_all)
length(which(CTT2018_exa_w$Score_for_all != CTT2018_exa$Score_for_all))
which(CTT2018_exa_w$Score_for_all != CTT2018_exa$Score_for_all)
data.frame(CTT2018_exa_w$Score_for_all, CTT2018_exa$Score_for_all, stringsAsFactors=F)

## P+ for Disengaged Response
## Result:  0 differences 
all(CTT2018_exa_w$Score_for_disengaged_responses== CTT2018_exa$Score_for_disengaged_responses)
length(which(CTT2018_exa_w$Score_for_disengaged_responses != CTT2018_exa$Score_for_disengaged_responses))
which(CTT2018_exa_w$Score_for_disengaged_responses != CTT2018_exa$Score_for_disengaged_responses)
data.frame(CTT2018_exa_w$Score_for_disengaged_responses, CTT2018_exa$Score_for_disengaged_responses, stringsAsFactors=F)

## P+ for Engaged Response
## Result:  0 differences 
all(CTT2018_exa_w$Score_for_engaged_responses== CTT2018_exa$Score_for_engaged_responses)
length(which(CTT2018_exa_w$Score_for_engaged_responses != CTT2018_exa$Score_for_engaged_responses))
which(CTT2018_exa_w$Score_for_engaged_responses != CTT2018_exa$Score_for_engaged_responses)
data.frame(CTT2018_exa_w$Score_for_engaged_responses, CTT2018_exa$Score_for_engaged_responses, stringsAsFactors=F)

## clean the global environment
# rm(list = ls()[!(ls() %in% c("WData_2018", "WData_2015", "Commonitems",
#                              "CTT2015_res_w", "CTT2018_res_w",
#                              "CTT2015_exa_w", "CTT2015_exa_w"))])
# save(list = ls(), file = "Weighted_P+.Rdata", compress = T)

