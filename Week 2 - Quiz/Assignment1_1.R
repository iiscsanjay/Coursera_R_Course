pollutantmean <- function(directory, polutant, id = 1:332) {
  totalSum <- 0
  countSum <- 0
  for (num in id ){
    file =  sprintf("%03d.csv",num)
    filename = file.path(directory,file)
    tmpData <- read.csv(filename)
    col <- if(polutant == "sulfate")
    {2}
    else
    {3}
    noNAData <- is.na(tmpData[,col])
    
    polutantSum <- sum(tmpData[!noNAData,col])
    countSum <- countSum + sum(!noNAData)
    totalSum <- totalSum + polutantSum
    cat(sprintf("Filename : %s, polutant = %s, polutantSum = %f, totalSum = %f,CountSum=%d\n",file,polutant,polutantSum,totalSum,countSum))
  }
  sprintf("%0.3f", totalSum/countSum)
}

complete <- function(directory, id = 1:332) {
    ncols <- 2
    nrows <- length(id)
    df <- data.frame(matrix(ncol = ncols, nrow = nrows))
    
    names(df) <- c("id", "nobs")
    ## directory is a character of length indicating filename location
    ## id is an integer vector  indicating monitor id number
    count <- 1
    for (num in id ){
        file =  sprintf("%03d.csv",num)
        filename = file.path(directory,file)
        tmpData <- data.frame(read.csv(filename))
        noNAdata <- tmpData[complete.cases(tmpData),]
        rowcountnoNAdata <- dim(noNAdata)[1] 
        df[count,] <- c(num, rowcountnoNAdata)
        #cat(sprintf("filename = %s, count = %d\n", file, num))
        count <- count + 1
         }
     df
    
}
corr <- function(directory, threshold = 0) {
    filenames <- list.files(directory, pattern = ".csv", full.names = TRUE)
    corr <- numeric()
    for (file in filenames) {
        tmpData <- data.frame(read.csv(file))
        noNAdata <- tmpData[complete.cases(tmpData),]
        if(dim(noNAdata)[1] > threshold) {
          sulfate <- noNAdata[,2]
          nitrate <- noNAdata[,3]
          cr <- cor(sulfate,nitrate)
        }
        else{
          cr <- numeric()
        }
        corr <- c(corr,cr)
    }
     corr
}

