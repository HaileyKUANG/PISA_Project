## Prepare Dataset for running

Hirtdata <- function(mdata){
  
  ## Table1: score table for all responses
  mycol <- grep("CNTSTUID|SENWT|BOOKID|Year|S_Record", colnames(mdata))
  irt_all <- mdata[, mycol] 
  
  
  ## Table2: score table after applying examinee-level filtering
  mycol_exa <- grep("CNTSTUID|SENWT|BOOKID|Year|S_Record|NormativeTT_Aplus2_exa_filter", colnames(mdata))
  myirt_exa <- mdata[, mycol_exa]
  
  for (i in 1:nrow(myirt_exa)) {                     ## the rows
    for (j in 56:106) {                              ## the columns of label info
      if(myirt_exa[i, j] == "Disengaged_Case") {
        myirt_exa[i, 5:55] <- NA                     ## set the score for disengaged response to "NA"
      } else {
        next
      }
    }
  }
  
  mycol_exa <- grep("CNTSTUID|SENWT|BOOKID|Year|S_Record", colnames(myirt_exa))
  irt_exa <- myirt_exa[, mycol_exa]
  
  
  ## Table3: score table after applying response-level filtering
  mycol1 <- grep("CNTSTUID|SENWT|BOOKID|Year|S_Record|NormativeTT_Aplus2", colnames(mdata))
  myirt1 <- mdata[, mycol1]
  mycol2 <- grep("NormativeTT_Aplus2_exa_filter", colnames(mdata))
  myirt_res <- myirt1[, -which(names(myirt1) %in% names(mdata[, mycol2]))]
  
  for (i in 1:nrow(myirt_res)) {                     ## the rows
    for (j in 1:51) {                                ## the columns of label info
      if(myirt_res[i, (2*j+4)] == "Disengaged_Case") {
        myirt_res[i, (2*j+(4-1))] <- NA                     ## set the score for disengaged response to "NA"
      } else {
        next
      }
    }
  }
  
  mycol_res <- grep("CNTSTUID|SENWT|BOOKID|Year|S_Record", colnames(myirt_res))
  irt_res <- myirt_res[, mycol_res]
  
  return(list(irt_all, irt_res, irt_exa))
}

