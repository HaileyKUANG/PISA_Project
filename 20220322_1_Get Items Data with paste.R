## "Items_Data.Rdata" based on "2021_Analysis3/20210921 Data_for_Final Result.RData"
drive <- "I"

load(paste0(drive,":/AIR_20211222/PISA_Project/2021_Analysis3/20210921 Data_for_Final Result.RData"))

allvar_list <- c("BOOKID", "CNTSTUID", "Year")
for (i in 3:53) {
  item_var <- paste0(Commonitems[i,],c("T", "TT", "A",
                                       "V", "S", "S_Record",
                                       "_Normative_TT",
                                       "_NormativeTT_Aplus2",
                                       "_NormativeTT_Aplus2_exa_filter"))
  allvar_list <- c(allvar_list, item_var)
}

Data_2018 <- Common2018_item_exa[ , which(names(Common2018_item_exa) %in% allvar_list)]
Data_2015 <- Common2015_item_exa[ , which(names(Common2015_item_exa) %in% allvar_list)]

# path <- paste0(drive,":/AIR_20211222/PISA_Project/2022_Analysis4")
# setwd(path)
# save(list = c("Data_2018", "Data_2015", "Commonitems"),
#      file = "Items_Data.Rdata", compress=T)