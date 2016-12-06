sapplyrankallSplit <- function(outcome, num = "best") {
  ## Read outcome data
  fileData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outComes <- c("heart attack","heart failure","pneumonia")
  stateNames <- sort(c(unique(fileData$State)))
  
  numOfStates <- length(stateNames)
  # split the data frame by column name:
  
  ## Check that outcome and rank are valid:
  # checking the input to the function
  
  if(!(outcome %in% outComes)){
    stop(print("Invalid condition!"))
  }
  
  # deciding the column number to access certain data on given outcome condition
  if (outcome == "heart attack"){
    col <- 11
  }
  else if ( outcome == "heart failure"){
    col <- 17
  }
  else if ( outcome == "pneumonia"){
    col <- 23
  }
  stateData <- split(fileData,fileData$State)
  
  f <- function(id) {
    df <- stateData[[id]]
    data <- df[, c(2,col)]
    
    data[,2] <- as.numeric(data[,2])
    
    purifiedData <- data[!is.na(data[,2]),]
    
    assign <- purifiedData[order(purifiedData[,2],purifiedData[,1]),]
    
    hospitalNames <- c(assign[,1])
        
    numHospSate <- dim(assign)[1]
    
 
    
    if (num == "best"){
      return(hospitalNames[1])
    }
    else if (num == "worst"){
      return(hospitalNames[numHospSate])
    }
    
    else if (num > numHospSate ){
      return(NA)
    }
    else{
      return(hospitalNames[num])
    }
  }
  id=seq_len(numOfStates)
  #nameV <- sapply(id, f,simplify = FALSE)
  nameV <- lapply(id,f)
  newdf <- data.frame(cbind(hospital=nameV,state=stateNames))
  newdf
}
