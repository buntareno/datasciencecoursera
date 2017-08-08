pollutantmean <- function(strdir,pollutant,id=1:332){
     
      total_pol_amt <- 0
      total_rec <- 0
      
      for(i in id){
      
            #load csv file by id
            file_name <- paste(sprintf("%03d",i),".csv",sep="")
            data <- read.csv(paste(strdir,file_name,sep="/"))
            
            #collect pollutant amt and num of records
            total_pol_amt <- total_pol_amt+sum(data[,pollutant],na.rm = TRUE)
            total_rec <- total_rec+sum(!is.na(data[,pollutant]))
      }
      
      total_pol_amt/total_rec
}
