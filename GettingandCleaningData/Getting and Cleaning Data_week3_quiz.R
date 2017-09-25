#Getting and Cleaning Data
#Week 3 Quiz

### QUIZ 1
f_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(f_url,destfile = "./data_quiz_1.csv",method = "curl")

all_data<-read.csv("data_quiz_1.csv")
which(all_data$ACR>=3&all_data$AGS>=6)

### QUIZ 2

library(jpeg)
img_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(img_url,destfile = "quiz2.jpg",method = "curl")
img_data<-readJPEG("./quiz2.jpg",native = TRUE)
quantile(img_data,c(0.3,0.8))

### QUIZ 3

quiz3_file<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
edu_file<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(quiz3_file,destfile = "./quiz3.csv",method = "curl")
download.file(edu_file,destfile = "./edu.csv",method = "curl")

#clean GDP_data
GDP_data<-read.csv("quiz3.csv",skip=3)
edu_data<-read.csv("edu.csv")
GDP_data<-GDP_data[GDP_data$Ranking!="",]
GDP_data$Ranking <- as.numeric(as.vector(GDP_data$Ranking))
GDP_data<-GDP_data[complete.cases(GDP_data$Ranking),]
#merge data
#intersect_data<-intersect(GDP_data$X,edu_data$CountryCode)

m_data<-merge(GDP_data,edu_data,by.x ="X",by.y = "CountryCode",all = F)
m_data_order<-m_data[order(m_data$Ranking,decreasing = T),]
m_data_order[13,c(1,40)]
#RESULT:
#    X          Short.Name
# 93 KNA St. Kitts and Nevis

### QUIZ 4
tapply(m_data_order$Ranking,m_data_order$Income.Group,mean)
# RESULT:
#                   High income: nonOECD    High income: OECD 
#                   NA             91.91304             32.96667 
#           Low income  Lower middle income  Upper middle income 
#            133.72973            107.70370             92.13333 
### QUIZ 4

sp_data<-split(m_data_order,m_data_order$Income.Group)
subset_data<-sp_data$`Lower middle income`
rank_data<-m_data_order[-(1:151),]
sum(subset_data$X %in% rank_data$X)
#[1] 5

