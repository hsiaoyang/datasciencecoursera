#R programming-Programming Assignment 3
#Finding the best hospital in a state

best<-function(state,outcome){
        ##read outcome data
        file_address <- "./PA3/outcome-of-care-measures.csv"
        all_data <- read.csv(file_address,header = TRUE)
        state_name<-unique(all_data[,7])
        
        ##check that state and outcome are valid
        if(!state %in% state_name){
                stop("invalid state")
        }
        if(!outcome %in% c("heart attack","heart failure","pneumonia")){
                stop("invalid outcome")
        }
        if(outcome=="heart attack"){
          col <- 11    
        }
        if(outcome=="heart failure"){
                col <- 17   
        }
        if(outcome=="pneumonia"){
                col <- 23 
        }

        ##Return hospital name in that state with lowest 30-day death rate
     
        hd <- all_data[all_data$State==state,c(2,col)]
        #print(hd)
        #将hd的第二列强制转换为数字
        hd[,2]<-as.numeric(as.character(hd[,2]))
        #去除数据中的NA
        hd<-hd[complete.cases(hd),]
        #print(hd)
        #获取最小值
        hd[which.min(hd[,2]),1]
}

#RESULT:
#best("TX","heart failure")
#FORT DUNCAN MEDICAL CENTER
#best("MD","heart attack")
#JOHNS HOPKINS HOSPITAL, THE