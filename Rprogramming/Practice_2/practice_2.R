##8月分布的所有文章，统计每个频道发布了多少篇文章
##然后通过频道名查询另外一个总发布文章量的表格里面，相同的频道名发布了多少文章，导出数据

setwd("~/Documents/GitHub/R programming/Practice_2")
library(readr)
#读取文件
all_data <- read_csv("./8月发布文章.csv")
#重命名所有列
names(all_data)<-c("editer","author","title","url","channel","property","pub_time")
#提取8月发布文章量表格里，每个频道发布的文章量
pro_fre<-as.data.frame(table(all_data$channel))
names(pro_fre)<-c("channel","atricle_count")

channel_data <- read_csv("./频道发布文章量.csv")
#根据8月发布的文章量里的频道名称，寻找总发布文章量里对应频道的文章数量
res<-merge(pro_fre,channel_data,by="channel")
write.csv(res,"./result.csv",fileEncoding = "GBK")