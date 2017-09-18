###Getting and Cleaning Data
###week 4 Quiz

file_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(file_url,destfile = "./quiz1.csv",method="curl")

all_data<-read.csv("quiz1.csv")
all_wgtp<-names(all_data)
res<-strsplit(all_wgtp,"wgtp")

###quiz2

quiz2_file<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(quiz2_file,destfile = "./gdp.csv",method = "curl")
gdp_data<-read.csv("gdp.csv",skip=3)

gdp<-as.vector(gdp_data$US.dollars.)
gdp<-as.numeric(gsub(",","",gdp))
gdp<-gdp[complete.cases(gdp)]
res<-mean(gdp[1:190])
res

###quiz3
country<-gdp_data$Economy
res<-grep("^United",country)
length(res)

###quiz4

gdp_file<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
edu_file<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(gdp_file,destfile = "./gdp2.csv",method = "curl")
download.file(edu_file,destfile = "./edu.csv",method = "curl")

#clean GDP_data
GDP_data<-read.csv("gdp2.csv",skip=3)
edu_data<-read.csv("edu.csv")
GDP_data<-GDP_data[GDP_data$Ranking!="",]
GDP_data$Ranking <- as.numeric(as.vector(GDP_data$Ranking))
GDP_data<-GDP_data[complete.cases(GDP_data$Ranking),]
#merge data
#intersect_data<-intersect(GDP_data$X,edu_data$CountryCode)

m_data<-merge(GDP_data,edu_data,by.x ="X",by.y = "CountryCode",all = F)
write.csv(m_data,"data.csv")

special_note<-m_data$Special.Notes
res<-grepl("[Jj]une",special_note)
table(res)


###quzi5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)


