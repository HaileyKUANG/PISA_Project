# ============================================================== #
##                   Get and Merge Weights                      ##     
# ============================================================== #

## set path
drive <- "I"
path <- paste0(drive,":/AIR_20211222/PISA_Project/2022_Analysis4")
setwd(path)
getwd()

## Read sav file with "haven" package
library(haven)
Weights_2018 <- read_sav("Weights Data_SPSS/18/USA_2018_Student_Weight.sav")
Weights_2015 <- read_sav("Weights Data_SPSS/15/USA_2015_Student_Weight.sav")
Weights_2018 <- Weights_2018[, c(3, 5)]
Weights_2015 <- Weights_2015[, c(3, 5)]

## Read data for estimating item parameters
load("Items_Data.Rdata")

## Check the CNTSTUID Only in weight data set
!(Weights_2018$CNTSTUID %in% Data_2018$CNTSTUID)
sum(ifelse(!(Weights_2018$CNTSTUID %in% Data_2018$CNTSTUID), 1, 0))
Weights_2018$CNTSTUID[!(Weights_2018$CNTSTUID %in% Data_2018$CNTSTUID)]

## Merge weights to final data
WData_2018 <- merge(Weights_2018, Data_2018, by = "CNTSTUID")
WData_2015 <- merge(Weights_2015, Data_2015, by = "CNTSTUID")

## clean the global environment
# rm(list = ls()[!(ls() %in% c("WData_2018", "WData_2015", "Commonitems"))])
# save(list = ls(), file = "Weighted_Data.Rdata", compress = T)
