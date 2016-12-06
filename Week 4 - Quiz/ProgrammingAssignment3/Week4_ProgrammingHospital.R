best <- function(state, outcome) {
    fileData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outComes <- c("heart attack","heart failure","pneumonia")
    
    # Filer out duplicates from state names
    
    stateNames <- c(unique(fileData$State))

    # checking the input to the function
    if(!(state %in% stateNames)){
        stop(print("Invalid state !"))
    }
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
    
    # This is how you select data based on a given condition:
    #Assigning the data which belongs to only passed state
    stateData <-subset(fileData,fileData$State == state)
  

    #selecting the only three column for file data according to input value of outcome
    data <- stateData[,c(2,col)]
    

    # to remove Not Available to numeric as NA
    data[,2] <- as.numeric(data[,2])

    # remove all NA value rows
    purifiedData <- data[!is.na(data[,2]),]
    tail(rankall("heart failure"), 10)
    minValue <- min(purifiedData[,2])
    
    hospitalName <- purifiedData[(minValue == purifiedData[,2]),1]
   # print(hospitalName)
   
     if (length(hospitalName) > 1) {
        hospitalName <- sort(hospitalName)
        return(hospitalName[1])
    }
    else{
        return(hospitalName)
    }
}

rankhospital <- function(state, outcome, num) {
    fileData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outComes <- c("heart attack","heart failure","pneumonia")
    stateNames <- c(unique(fileData$State))
    
    # checking the input to the function
    if(!(state %in% stateNames)){
        stop(print("Invalid state !"))
    }
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
    #Assigning the data which belongs to only passed state
    stateData <-subset(fileData,fileData$State == state)
  
    
    #selecting the only three column for file data according to input value of outcome
    data <- stateData[,c(2,col)]
    
    
    
    # to remove Not Available to numeric as NA
    data[,2] <- as.numeric(data[,2])
    
    # remove all NA value rows
    purifiedData <- data[!is.na(data[,2]),]
    
    assign <- purifiedData[order(purifiedData[,2],purifiedData[,1]),]
    hospitalNames <- c(assign[,1])
    
    totalRank <- length(hospitalNames)
    
    if (num == "best"){
      return(hospitalNames[1])
    }
    else if (num == "worst"){
      return(hospitalNames[totalRank])
    }
    else if (num > totalRank ){
      return(NA)
    }
    else{
      return(hospitalNames[num])
    }
}
  
rankall <- function(outcome, num = "best") {
    ## Read outcome data
    fileData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outComes <- c("heart attack","heart failure","pneumonia")
    stateNames <- c(unique(fileData$State))
    
    numOfStates <- length(stateNames)
    
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
    # To check the validity of the rank for a state first get the number of hospitals in that state. 
    df <- data.frame(matrix(ncol = 2, nrow = numOfStates))
   
    names(df) <- c("state","hospital")
    ## For each state, find the hospital of the given rank

    for(index in 1:numOfStates) {
        state <- stateNames[index]
        stateData <-subset(fileData,fileData$State == state)
        # remove all NA value rows
        data <- stateData[, c(2,col)]
        # to remove Not Available to numeric as NA
        data[,2] <- as.numeric(data[,2])
        
        purifiedData <- data[!is.na(data[,2]),]
        
        assign <- purifiedData[order(purifiedData[,2],purifiedData[,1]),]
        hospitalNames <- c(assign[,1])
        # We would need number of hospitals in a given state to check whether or not rank is out of bounds
        totalHospsinState <- length(hospitalNames)
      
        if (num == "best"){
            df[index,] <- c(state,hospitalNames[1])
        }
        else if (num == "worst"){
            df[index,] <- c(state,hospitalNames[totalHospsinState])
        }
        else if (num > totalHospsinState ){
            df[index,] <- c(state,NA)
        }
        else{
            df[index,] <- c(state,hospitalNames[num])
        }
    }
    newdf <- df[order(df[,1],df[,2]),]
    newdf
}
sapplyrankallSubset <- function(outcome, num = "best") {
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
  
  f <- function(state) {
    df <- subset(fileData,fileData$State == state)
    data <- df[, c(2,col)]
   
    data[,2] <- as.numeric(data[,2])
    
    purifiedData <- data[!is.na(data[,2]),]
    
    assign <- purifiedData[order(purifiedData[,2],purifiedData[,1]),]
    
    hospitalNames <- c(assign[,1])
    
    numHospSate <- dim(assign)[1]
    
    ## For each state, find the hospital of the given rank
    
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
  #nameV <- sapply(stateNames, f,simplify = FALSE)
  nameV <- lapply(stateNames, f)
  print(nameV$NY)
  newdf <- data.frame(cbind(hospital=nameV,state=stateNames))
  newdf
}

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
