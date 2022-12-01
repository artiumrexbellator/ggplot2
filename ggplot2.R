library("ggplot2")
data<-read.csv("~/Desktop/master/big_data_2/ggplot2/region6.csv", header=TRUE, stringsAsFactors=FALSE)
ggplot(data=data,mapping = aes(x=ST119Q03NA,y=ST012Q05NA))+geom_point()
#part 1 
#question 1 
ggplot(data=data,mapping = aes(x=CNT,y=JOYSCIE))+geom_boxplot()+
  labs(x=NULL,y="Science enjoyment scores")+theme_bw()
#question2
ggplot(data=data,mapping = aes(x=CNT,y=JOYSCIE))+geom_boxplot()+
  labs(x=NULL,y="Science enjoyment scores")+theme_bw()+coord_flip()
#question 4
ggplot(data=data,mapping = aes(x=CNT,y=JOYSCIE))+geom_boxplot()+
  labs(x=NULL,y="Science enjoyment scores")+theme_bw()+coord_flip()+
  stat_summary(fun.y=mean, geom="point", shape=20, size=6, color="red", fill="red")
#question 5
ggplot(data=data,mapping = aes(x=CNT,y=JOYSCIE))+geom_boxplot()+
  labs(x=NULL,y="Science enjoyment scores")+theme_bw()+coord_flip()+
  stat_summary(fun.y=mean, geom="point", shape=20, size=6, color="red", fill="red")+
  geom_hline(yintercept = 0)
#question 6
ggplot(data=data,mapping = aes(x=reorder(CNT,JOYSCIE),y=JOYSCIE))+geom_boxplot()+
  labs(x=NULL,y="Science enjoyment scores")+theme_bw()+coord_flip()+
  stat_summary(fun.y=mean, geom="point", shape=20, size=6, color="red", fill="red")+
  geom_hline(yintercept = 0)
#question 7

region <- (sapply(data$CNT, function(x) {
  if(x %in% c("Canada", "United States", "Mexico")) "N. America"
  else if (x %in% c("Colombia", "Brazil", "Uruguay")) "S. America"
  else if (x %in% c("Japan", "B-S-J-G (China)", "Korea")) "Asia"
  else if (x %in% c("Germany", "Italy", "France")) "Europe"
  else if (x %in% c("Australia", "New Zealand")) "Australia"
  else if (x %in% c("Israel", "Jordan", "Lebanon")) "Middle-East"
}))

ggplot(data=data,mapping = aes(x=reorder(CNT,JOYSCIE),y=JOYSCIE,fill=region))+geom_boxplot()+
  labs(x=NULL,y="Science enjoyment scores")+theme_bw()+coord_flip()+
  stat_summary(fun.y=mean, geom="point", shape=20, size=6, color="red", fill="red")+
  geom_hline(yintercept = 0)


