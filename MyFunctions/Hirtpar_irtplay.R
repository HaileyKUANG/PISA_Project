Hirtpar <- function(irtplayoutput, Year, Type){
  
  if (Type == 1){
    mytype <- "All"
  } else if (Type == 2) {
    mytype <- "Res_Filter"
  } else if (Type == 3) {
    mytype <- "Exa_Filter"
  }
  
  all_est <- data.frame(irtplayoutput$estimates)
  names(all_est)[4:9] <- c("a", "SEa", "b", "SEb", "c", "SEc")
    
  ## load Commonitems table 
  # load("I:/AIR_20211222/PISA_Project/2022_Analysis4/Commonitems.Rdata")
  
  all_est$Item <- Commonitems[3:53,]
  all_est <- all_est[, c(10, 2:9)]
  names(all_est)[4:9] <- paste(names(all_est)[4:9], mytype, Year, sep = "_")
  # all_est <- all_est[, -c(5, 7, 9)]
  return(all_est)
}
