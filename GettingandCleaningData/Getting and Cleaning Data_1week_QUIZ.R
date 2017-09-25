library(data.table)
library(openxlsx)
library(XML)

#QUIZ 第1,2题
if(!file.exists("community.csv")){
        file_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        download.file(file_url,destfile = "./community.csv",method = "curl")
      
}else{
        file_data <-data.table(read.csv("community.csv",header =TRUE))
        head(file_data)
        VAL_data<-file_data[,VAL]
        print(VAL_data)
}

#QUIZ 第3题
library(openxlsx)
if(!file.exists("NGA.xlsx")){
file2_url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(file2_url,destfile = "NGA.xlsx",method="curl")
}else{
        file2_data<- read.xlsx(xlsxFile="NGA.xlsx",sheet=1,skipEmptyRows = TRUE)
        file2_data<-data.table(file2_data)
        dat<-file2_data[c(18:23),c(7:15)]
        
}

#QUIZ 第4题
library(XML)
library(RCurl)
library(bitops)
#xml文件是https，需要用RCurl包
xml_file_url<-getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")
xml_tree<-xmlTreeParse(xml_file_url,useInternal = TRUE)
rootNode <- xmlRoot(xml_tree)
#rootNode[[1]][[2]][["zipcode"]]
zcode<- xpathSApply(rootNode,"//zipcode",xmlValue)
#通过which找到下标，然后用length统计个数
length(which(zcode==21231))

##QUIZ 第5题
library(data.table)
file5_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(file5_url,destfile = "quiz5.csv",method = "curl")
DT <- fread("quiz5.csv")





