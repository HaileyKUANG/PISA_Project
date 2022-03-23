Hirtestimate_irtplay <- function(mdata, year){
  
  ## Install and load "irtplay" 
  Packages <- c("irtplay")
  for (BAO in Packages) {
    if (BAO %in% rownames(installed.packages()) == FALSE){
      install.packages(BAO)
    }
    if (BAO %in% (.packages()) == FALSE){
      library(BAO, character.only = TRUE)
    }
  }
  
  ## Main function of Hirtestimate
  irt_parameter_list <- list()
  for (irtlist in 1:3) {
    irt_data <- data.frame(mdata[[irtlist]][, 5:55])
    ## fit model with "irtplay"
    irt_model <- est_irt(data = irt_data, 
                         D = 1,
                         model = c(rep("2PLM", 43), rep("GPCM", 1), rep("2PLM", 7)),
                         cats = c(rep(2, 43), rep(3, 1), rep(2, 7)))
    irt_result <- summary(irt_model)
    all_est <- as.data.frame(irt_result$estimates)
    names(all_est)[4:9] <- c("a", "SEa", "b", "SEb", "c", "SEc")
    
    ## re-organize and save the IRT results
    if (irtlist == 1){
      mytype <- "All"
    } else if (irtlist == 2) {
      mytype <- "Res_Filter"
    } else if (irtlist == 3) {
      mytype <- "Exa_Filter"
    }
    

    
    all_est$Item <- Commonitems[3:53,]
    all_est <- all_est[, c(10, 2:9)]
    names(all_est)[4:9] <- paste(names(all_est)[4:9], mytype, year, sep = "_")
    all_est <- all_est[, -c(2, 8:9)]
    all_est[, 3:6] <- round(all_est[, 3:6], 3)
      
    irt_parameter_list[[irtlist]] <- all_est
  }

return(irt_parameter_list)
}