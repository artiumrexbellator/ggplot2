library("ggplot2")
library("dplyr")

#part3
data<-read.csv("~/Desktop/master/big_data_2/ggplot2/atlcrime.csv", header=TRUE, stringsAsFactors=FALSE)
t <- ggplot(data) + geom_bar(mapping = aes(x=beat, y=neighborhood, color=crime))
# Basic barplot
#only take the year part
dates<-format(as.Date(data$date, format="%m/%d/%Y"),"%Y")
data$date=dates
#get total beats for earch year
data2<-data %>%
  group_by(crime,date) %>%
  summarise(beat=sum(beat))
#replace na values with 0
data2 <- data2 %>% replace(is.na(.), 0)
#acummulate sum by year for earch year
data2<-data2 %>%
  group_by(crime) %>%
  mutate(label_y=cumsum(beat))


#plotting data 2 from max beats to min by using reorder 
ggplot(data2,aes(x = reorder(crime,beat), y = beat,fill=date)) + 
  geom_bar(stat='identity')+
  geom_text(
    aes(label = after_stat(y), group = crime), 
    stat = 'summary', fun = sum, vjust = 0.5,hjust=0.8,size=3
  )+ 
  coord_flip()+
  theme(axis.title.y = element_blank())
