Hirtestimate_mirt <- function(mdata, year){
  
  ## Install and load "mirt" 
  Packages <- c("mirt")
  for (BAO in Packages) {
    if (BAO %in% rownames(installed.packages()) == FALSE){
      install.packages(BAO)
    }
    if (BAO %in% (.packages()) == FALSE){
      library(BAO, character.only = TRUE)
    }
  }
  
  irt_parameter_list <- list()
  
  ## Main function of Hirtestimate with "mirt"
  for (irtlist in 1:3) {
    
    ## mirt need each examinee to response to at least one item
    all_cases <- data.frame(mdata[[irtlist]])
    valid_cases <- subset(all_cases[, c(2, 5:55)], rowSums(is.na(all_cases[, 5:55])) != ncol(all_cases[, 5:55])) 
    weights <- valid_cases[, 1]
    
    ## fit model with "mirt"
    item_type <-  c(rep("2PL", 43), rep("gpcm", 1), rep("2PL", 7))
    irt_model <- mirt(data = valid_cases[, 2:52], 
                      model = 1, ##  Default is 1, indicating unidimensional model 
                      itemtype = item_type,
                      survey.weights = weights,
                      SE = TRUE,
                      technical = list(NCYCLES = 10000, 
                                       BURNIN = 1000,
                                       SEMCYCLES = 1000,
                                       MHDRAWS = 100))
    
    irt_result <- coef(irt_model)
    
    ## re-organize and save the IRT results
    ## compute b and SE based on "mirt" result
    all_est <- data.frame(matrix(NA, nrow = 51, ncol = 6))
    names(all_est) <- c("Item", "Model", "a", "SEa", "b", "SEb")
    all_est[, 1] <- Commonitems[3:53,]
    all_est[, 2] <- c(rep("2PL", 43), rep("GPCM", 1), rep("2PL", 7))
    
    for (item in 1:51) {
      item_par <- as.data.frame(irt_result[[item]])
      if (item != 44) {
        item_par$SEa <- (item_par[3,1] - item_par[2,1])/3.92
        item_par$SEb <- (item_par[3,2] - item_par[2,2])/3.92
        item_par$b <- ((-item_par$d)/item_par$a1)
        all_est[item, 3] <- item_par[1, 1] 
        all_est[item, 4] <- item_par[1, 5] 
        all_est[item, 5] <- item_par[1, 7]
        all_est[item, 6] <- item_par[1, 6]
      } else {
        item_par$SEa <- (item_par[3,1] - item_par[2,1])/3.92
        item_par$SEb <- (item_par[3,6] - item_par[2,6])/3.92
        item_par$b <- ((-item_par$d1)/item_par$a1)
        all_est[item, 3] <- item_par[1, 1] 
        all_est[item, 4] <- item_par[1, 8] 
        all_est[item, 5] <- item_par[1, 10]
        all_est[item, 6] <- item_par[1, 9]
      }
    }
    
    if (irtlist == 1){
      mytype <- "All"
    } else if (irtlist == 2){
      mytype <- "Res_Filter"
    } else {
      mytype <- "Exa_Filter"
    }
    all_est[, 3:6] <- round(all_est[, 3:6], 3)
    names(all_est)[3:6] <- paste(names(all_est)[3:6], mytype, year, sep = "_")
    irt_parameter_list[[irtlist]] <- all_est
  }
  return(irt_parameter_list)
  print("Done!")
}
