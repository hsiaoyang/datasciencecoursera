rankall<-function(outcome,num="best"){
        ##read outcome date
        setwd("~/Desktop/coursera-r/")
        file_address <- "~/Desktop/coursera-r/PA3/outcome-of-care-measures.csv"
        all_data <- read.csv(file_address,header = TRUE)
        state_name<-unique(all_data[,7])
        ##check that state and outcome  are vailid
        if(!is.element(outcome,c("heart attack","heart failure","pneumonia"))){
                stop("invalid outcome")
        }
        if(num == "best"){
                num=1  
        }
        if(num=="worst"){
                num=-1
        }
                
        ##for each state, find the hospital of the given rank
        data_part<-all_data[,c(2,7,11,17,23)]
        names(data_part)<-c("hospital","state","heart attack","heart failure","pneumonia")
        data_part[,c(3)]<-as.numeric(as.character(data_part[,c(3)]))
        data_part[,c(4)]<-as.numeric(as.character(data_part[,c(4)]))
        data_part[,c(5)]<-as.numeric(as.character(data_part[,c(5)]))
        dclean <- data_part[complete.cases(data_part),]
    
        
        ## renturn a data frame with the hospital names and the state name
        #all_state_order<- dclean[order(dclean[,"state"],dclean[,outcome]),]
         lapply(split(all_state_order,all_state_order$state),function(each_state_order){
                each_state_order<-each_state_order[order(each_state_order[,outcome]),]
                res_order <- each_state_order[num,]
                res_order[1,c("hospital","state")]
                
        })
        
}