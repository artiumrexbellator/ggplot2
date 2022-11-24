library("ggplot2")

#part 2
#exercice 1
data<-read.csv("~/Desktop/master/big_data_2/ggplot2/region6.csv", header=TRUE, stringsAsFactors=FALSE)
ggplot(data = data,
       mapping = aes(x = reorder(CNT, PV1MATH), y = PV1MATH, fill = Region)) +
  geom_point(aes(color = Region)) +
  labs(x=NULL, y="Math Scores") +
  coord_flip() +
  geom_hline(yintercept = 490, linetype="dashed", color = "red", size = 1) +
  theme_bw()

ggplot(data = data,
       mapping = aes(x = reorder(CNT, PV1MATH), y = PV1MATH, fill = Region)) +
  geom_violin(aes(color = Region)) +
  labs(x=NULL, y="Math Scores") +
  coord_flip() +
  geom_hline(yintercept = 490, linetype="dashed", color = "red", size = 1) +
  theme_bw()
#a =geom_violin takes less time to create
#b the second time is better since it represents the intensity of math scores in some points

#2

region <- (sapply(data$CNT, function(x) {
  if(x %in% c("Canada", "United States", "Mexico")) "N. America"
  else if (x %in% c("Colombia", "Brazil", "Uruguay")) "S. America"
  else if (x %in% c("Japan", "B-S-J-G (China)", "Korea")) "Asia"
  else if (x %in% c("Germany", "Italy", "France")) "Europe"
  else if (x %in% c("Australia", "New Zealand")) "Australia"
  else if (x %in% c("Israel", "Jordan", "Lebanon")) "Middle-East"
}))

Austrialia<-subset(data,Region %in% c("Australia", "New Zealand"))

ggplot(data = data,
       mapping = aes(x = ESCS, y = PV1MATH)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "SES", y = "Math Scores") +
  theme_bw() +
  theme(legend.title = element_blank()) +
  facet_grid(. ~ region)

#exercice 2 
plot(data$ESCS,data$PV1MATH,data=Austrialia)+
  geom_smooth(method = "lm")+
  labs(x = "ESCS", y = "Math Scores") +
  theme_bw() +
  theme(legend.title = element_blank())

