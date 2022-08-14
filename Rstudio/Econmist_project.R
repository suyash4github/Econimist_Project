library(ggplot2)
library(data.table)
library(ggthemes)
pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")
df <- fread('Economist_Assignment_Data.csv')
print(head(df))
p <- ggplot(df,aes(x=CPI,y=HDI))+geom_point(size=5,shape=1,aes(color=factor(Region)))
p1<-p+geom_smooth(aes(group=1),method='lm',formula = y~log(x),color='red',se=F)
p2 <- p1 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)
p3<- p2 + scale_x_continuous(limits = c(.9,10.5),breaks = 1:10)
p4 <- p3 + theme_economist_white()
print(p4)
