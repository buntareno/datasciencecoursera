complete <- function(strdir,id=1:332){
      #constuct result dataframe
      result<-data.frame(id=id,nobs=NA)
      
      for(i in id){
            #load csv file by id
            file_name <- paste(sprintf("%03d",i),".csv",sep="")
            data <- read.csv(paste(strdir,file_name,sep="/"))
            
            #set number of complete rows to the result dataframe
            #result$nobs[result$id==i] <- nrow(data[!is.na(data$sulfate)&!is.na(data$nitrate),])
            result$nobs[result$id==i] <- nrow(data[complete.cases(data),])
      }
      
      result
}