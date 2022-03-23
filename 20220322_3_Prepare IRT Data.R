# ============================================================== #
##                   Prepare Data for IRT                       ##     
# ============================================================== #

## set path
drive <- "I"
path <- paste0(drive,":/AIR_20211222/PISA_Project/2022_Analysis4")
setwd(path)
getwd()

## Load Data
load("Weighted_Data.Rdata")
## Capture Score Data
## Load Functions 
source("MyFunctions/Hirtdata.R")             ## Prepare IRT data
## Prepare IRT data with Hirtdata function
## The three lists are:
## [[1]]: Without Filtering
## [[2]]: Applying Response-Level Filtering
## [[3]]: Applying Examinee-Level Filtering
irtdata2015 <- Hirtdata(WData_2015)
irtdata2018 <- Hirtdata(WData_2018)

## clean the global environment
# rm(list = ls()[!(ls() %in% c("Commonitems", "irtdata2015", "irtdata2018"))])
# save(list = ls(), file = "Score Data for IRT.Rdata", compress = T)
