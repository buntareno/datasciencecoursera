corr <- function(strdir,threshold=0){
      
      result <- vector(mode="numeric", length=0)
      

      for(i in 1:332){

            #load csv file by id
            file_name <- paste(sprintf("%03d",i),".csv",sep="")
            data <- read.csv(paste(strdir,file_name,sep="/"))

            #filter only complete cases > threshold
            data <- data[complete.cases(data),]
            if(nrow(data)<=threshold)
                  next()
            
            #add correlations value into vector
            result <- append(result,cor(data$sulfate,data$nitrate),after=length(result))
      }

      result
}