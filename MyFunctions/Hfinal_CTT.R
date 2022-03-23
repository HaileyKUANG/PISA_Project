Hfinal_CTT <- function(mlist, mdata, filter_type){
  
  ## filter_type: binary
  ## 0 = response-level filtering
  ## 1 = examinee-level filtering
  
  if (filter_type == 0){
    mycol <- 12
  } else if (filter_type == 1){
    mycol <- 13
  }
  
  mystime <- data.frame(matrix(NA, ncol = 6, nrow = (nrow(mlist)-2)))
  
  ak <- 1
  
  for (i in 3:nrow(mlist)) {
    
    mvarname <- c("CNTSTUID", "SENWT", "BOOKID", "Year", mlist[i,]) ## variable names
    
    m <- data.frame(mdata[,grep(paste(mvarname, collapse = "|"), colnames(mdata))]) ## data
    
    n <- length(which(eval(parse(text = paste("m", "$", names(m)[mycol], sep = ""))) == "Disengaged_Case"))
    N <- length(which(eval(parse(text = paste("m", "$", names(m)[mycol], sep = ""))) != "Missing_Case"))
    myp <- n/N # sample size
    
    S_all <- mean(m[eval(parse(text = paste("m", "$", names(m)[mycol], sep = ""))) != "Missing_Case", 10],  
                  na.rm = T)
    
    
    S_disengage <- mean(m[eval(parse(text = paste("m", "$", names(m)[mycol], sep = ""))) == "Disengaged_Case", 10],  
                        na.rm = T)
    
    S_engage <- mean(m[eval(parse(text = paste("m", "$", names(m)[mycol], sep = ""))) == "Engaged_Case", 10], 
                              na.rm = T)
    
    mystime[ak, ] <- c(mlist[i,], n, round(myp, 3), round(S_all, 3), round(S_disengage, 3), round(S_engage, 3))
    
    ak <- ak + 1
  }
  
  names(mystime) <- c("Item", 
                      "number_of_disengagement", 
                      "percentage_of_disengagement", 
                      "Score_for_all", 
                      "Score_for_disengaged_responses", 
                      "Score_for_engaged_responses")
  return(mystime)
}
