rankhospital<- function(state,outcome,num="best"){
        ## read outcome date
        setwd("~/Desktop/coursera-r/")
        file_address <- "~/Desktop/coursera-r/PA3/outcome-of-care-measures.csv"
        all_data <- read.csv(file_address,header = TRUE)
        
        ## check that state and outcome are valid
        if(!is.element(state,unique(all_data[,7]))){
                stop("invalid state")
        }
        if(!is.element(outcome,c("heart attack","heart failure","pneumonia"))){
                stop("invalid outcome")
        }
        if(num == "best"){
                num=1  
        }
        if(num=="worst"){
                num=-1
        }
        if(num > nrow(all_data)){
                stop("NA")
        }
       
        
        ##Return hospital name in that state with the given rank 
        
        data_part<-all_data[,c(2,7,11,17,23)]
        names(data_part)<-c("hospital","state","heart attack","heart failure","pneumonia")
        data_part[,c(3)]<-as.numeric(as.character(data_part[,c(3)]))
        data_part[,c(4)]<-as.numeric(as.character(data_part[,c(4)]))
        data_part[,c(5)]<-as.numeric(as.character(data_part[,c(5)]))
        dclean <- data_part[complete.cases(data_part),]
        
        ##30-day death rate
        state_dr<-dclean[dclean$state==state,]
        
        if(num==-1){
                state_dr_order<-state_dr[order(state_dr[,outcome],state_dr[,"hospital"],decreasing=T),]
                state_dr_order[1,1]  
        }else{
                state_dr_order<-state_dr[order(state_dr[,outcome],state_dr[,"hospital"]),]
                state_dr_order[num,1]  
        }
        #state_dr<-dclean[order('heart attack'),]
}

