# ============================================================== #
##                  Get a & b with weights                      ##     
# ============================================================== #

## set path
drive <- "I"
path <- paste0(drive,":/AIR_20211222/PISA_Project/2022_Analysis4")
setwd(path)
getwd()

## Load Data
load("Score Data for IRT.Rdata")

## Compute un-weighted a & b with "mirt"
source("MyFunctions/Hirtestimate_mirt.R")
IRT2015_w <- Hirtestimate_mirt(irtdata2015, 2015)
IRT2018_w <- Hirtestimate_mirt(irtdata2018, 2018)
# save(list = ls()[ls() %in% c("WData_2018", "WData_2015", "Commonitems",
#                               "IRT2015_w", "IRT2018_w")], 
#                   file = "Weighted_ab.Rdata", compress = T)

## Compute un-weighted a & b with "irtplay"
source("MyFunctions/Hirtestimate_irtplay.R") ## Estimate IRT models
IRT2015 <- Hirtestimate_irtplay(irtdata2015, 2015)
IRT2018 <- Hirtestimate_irtplay(irtdata2018, 2018)

## Compare weighted and non-weighted parameters

## ====== Compare 1 ====== ##
## Year:    2015
## Filter:  NA
all(IRT2015[[1]] == IRT2015_w[[1]])

## a for All
## Result:  50 differences 
all(IRT2015[[1]]$a_All_2015 == IRT2015_w[[1]]$a_All_2015)
length(which(IRT2015[[1]]$a_All_2015 == IRT2015_w[[1]]$a_All_2015))
which(IRT2015[[1]]$a_All_2015 != IRT2015_w[[1]]$a_All_2015)
data.frame(IRT2015[[1]]$a_All_2015, IRT2015_w[[1]]$a_All_2015, stringsAsFactors=F)

## b for All
## Result:  49 differences 
all(IRT2015[[1]]$b_All_2015 == IRT2015_w[[1]]$b_All_2015)
length(which(IRT2015[[1]]$b_All_2015 == IRT2015_w[[1]]$b_All_2015))
which(IRT2015[[1]]$b_All_2015 != IRT2015_w[[1]]$b_All_2015)
data.frame(IRT2015[[1]]$b_All_2015, IRT2015_w[[1]]$b_All_2015, stringsAsFactors=F)

## ====== Compare 2 ====== ##
## Year:    2015
## Filter:  Response-Level
all(IRT2015[[2]] == IRT2015_w[[2]])

## a after applying response-level filtering
## Result:  50 differences 
all(IRT2015[[2]]$a_Res_Filter_2015 == IRT2015_w[[2]]$a_Res_Filter_2015)
length(which(IRT2015[[2]]$a_Res_Filter_2015 == IRT2015_w[[2]]$a_Res_Filter_2015))
which(IRT2015[[2]]$a_Res_Filter_2015 != IRT2015_w[[2]]$a_Res_Filter_2015)
data.frame(IRT2015[[2]]$a_Res_Filter_2015, IRT2015_w[[2]]$a_Res_Filter_2015, stringsAsFactors=F)

## b after applying response-level filtering
## Result:  50differences 
all(IRT2015[[2]]$b_Res_Filter_2015 == IRT2015_w[[2]]$b_Res_Filter_2015)
length(which(IRT2015[[2]]$b_Res_Filter_2015 == IRT2015_w[[2]]$b_Res_Filter_2015))
which(IRT2015[[2]]$b_Res_Filter_2015 != IRT2015_w[[2]]$b_Res_Filter_2015)
data.frame(IRT2015[[2]]$b_Res_Filter_2015, IRT2015_w[[2]]$b_Res_Filter_2015, stringsAsFactors=F)

## ====== Compare 3 ====== ##
## Year:    2015
## Filter:  Examinee-Level
all(IRT2015[[3]] == IRT2015_w[[3]])

## a after applying examinee-Level filtering
## Result:  50 differences 
all(IRT2015[[3]]$a_Exa_Filter_2015 == IRT2015_w[[3]]$a_Exa_Filter_2015)
length(which(IRT2015[[3]]$a_Exa_Filter_2015 == IRT2015_w[[3]]$a_Exa_Filter_2015))
which(IRT2015[[3]]$a_Exa_Filter_2015 != IRT2015_w[[3]]$a_Exa_Filter_2015)
data.frame(IRT2015[[3]]$a_Exa_Filter_2015, IRT2015_w[[3]]$a_Exa_Filter_2015, stringsAsFactors=F)

## b after applying examinee-Level filtering
## Result:  51 differences 
all(IRT2015[[3]]$b_Exa_Filter_2015 == IRT2015_w[[3]]$b_Exa_Filter_2015)
length(which(IRT2015[[3]]$b_Exa_Filter_2015 == IRT2015_w[[3]]$b_Exa_Filter_2015))
which(IRT2015[[3]]$b_Exa_Filter_2015 != IRT2015_w[[3]]$b_Exa_Filter_2015)
data.frame(IRT2015[[3]]$b_Exa_Filter_2015, IRT2015_w[[3]]$b_Exa_Filter_2015, stringsAsFactors=F)

## ====== Compare 4 ====== ##
## Year:    2018
## Filter:  NA
all(IRT2018[[1]] == IRT2018_w[[1]])

## a for All
## Result:  51 differences 
all(IRT2018[[1]]$a_All_2018 == IRT2018_w[[1]]$a_All_2018)
length(which(IRT2018[[1]]$a_All_2018 == IRT2018_w[[1]]$a_All_2018))
which(IRT2018[[1]]$a_All_2018 != IRT2018_w[[1]]$a_All_2018)
data.frame(IRT2018[[1]]$a_All_2018, IRT2018_w[[1]]$a_All_2018, stringsAsFactors=F)

## b for All
## Result:  51 differences 
all(IRT2018[[1]]$b_All_2018 == IRT2018_w[[1]]$b_All_2018)
length(which(IRT2018[[1]]$b_All_2018 == IRT2018_w[[1]]$b_All_2018))
which(IRT2018[[1]]$b_All_2018 != IRT2018_w[[1]]$b_All_2018)
data.frame(IRT2018[[1]]$b_All_2018, IRT2018_w[[1]]$b_All_2018, stringsAsFactors=F)

## ====== Compare 5 ====== ##
## Year:    2018
## Filter:  Response-Level
all(IRT2018[[2]] == IRT2018_w[[2]])

## a after applying response-level filtering
## Result:  51 differences 
all(IRT2018[[2]]$a_Res_Filter_2018 == IRT2018_w[[2]]$a_Res_Filter_2018)
length(which(IRT2018[[2]]$a_Res_Filter_2018 == IRT2018_w[[2]]$a_Res_Filter_2018))
which(IRT2018[[2]]$a_Res_Filter_2018 != IRT2018_w[[2]]$a_Res_Filter_2018)
data.frame(IRT2018[[2]]$a_Res_Filter_2018, IRT2018_w[[2]]$a_Res_Filter_2018, stringsAsFactors=F)

## b after applying response-level filtering
## Result:  51 differences 
all(IRT2018[[2]]$b_Res_Filter_2018 == IRT2018_w[[2]]$b_Res_Filter_2018)
length(which(IRT2018[[2]]$b_Res_Filter_2018 == IRT2018_w[[2]]$b_Res_Filter_2018))
which(IRT2018[[2]]$b_Res_Filter_2018 != IRT2018_w[[2]]$b_Res_Filter_2018)
data.frame(IRT2018[[2]]$b_Res_Filter_2018, IRT2018_w[[2]]$b_Res_Filter_2018, stringsAsFactors=F)

## ====== Compare 6 ====== ##
## Year:    2018
## Filter:  Examinee-Level
all(IRT2018[[3]] == IRT2018_w[[3]])

## a after applying examinee-Level filtering
## Result:  51 differences 
all(IRT2018[[3]]$a_Exa_Filter_2018 == IRT2018_w[[3]]$a_Exa_Filter_2018)
length(which(IRT2018[[3]]$a_Exa_Filter_2018 == IRT2018_w[[3]]$a_Exa_Filter_2018))
which(IRT2018[[3]]$a_Exa_Filter_2018 != IRT2018_w[[3]]$a_Exa_Filter_2018)
data.frame(IRT2018[[3]]$a_Exa_Filter_2018, IRT2018_w[[3]]$a_Exa_Filter_2018, stringsAsFactors=F)

## b after applying examinee-Level filtering
## Result:  51 differences 
all(IRT2018[[3]]$b_Exa_Filter_2018 == IRT2018_w[[3]]$b_Exa_Filter_2018)
length(which(IRT2018[[3]]$b_Exa_Filter_2018 == IRT2018_w[[3]]$b_Exa_Filter_2018))
which(IRT2018[[3]]$b_Exa_Filter_2018 != IRT2018_w[[3]]$b_Exa_Filter_2018)
data.frame(IRT2018[[3]]$b_Exa_Filter_2018, IRT2018_w[[3]]$b_Exa_Filter_2018, stringsAsFactors=F)

