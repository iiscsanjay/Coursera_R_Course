pollutantmean <- function(directory, polutant, id = 1:332) {
  f <- function(i,polutant) {
    data = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                          ".csv", sep = ""))
    polutantSum <- sum(data[!is.na(data[,col]),col])
    countSum <- sum(!is.na(data[,col]))
    corrtemp <- c(polutantSum,countSum)
  }
  col <- if(polutant == "sulfate")
  {2}
  else
  {3}
  df = sapply(id, f)
  totalSum <- sum(df[1,])
  countSum <- sum(df[2,])
  round(totalSum/countSum, 3)
}


complete <- function(directory, id = 1:332) {
  f <- function(i) {
    data = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                          ".csv", sep = ""))
    sum(complete.cases(data))
  }
  nobs = sapply(id, f)
  return(data.frame(id, nobs))
}

corr <- function(directory, threshold = 0) {
  g <- function(i) {
    data <- read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                           ".csv", sep = ""))
    dff <- data[complete.cases(data), ]
    cor(dff$sulfate, dff$nitrate)
  }
  df = complete(directory)
  ids = df[df["nobs"] > threshold,]$id
  corrr <- sapply(ids, g)
  return(corrr)
}