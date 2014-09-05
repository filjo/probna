#link za fb token : https://developers.facebook.com/tools/explorer $

install.packages("Rfacebook")
install.packages("Rook")
require(ggthemes)
require(ggplot2)
require(Rfacebook)
require(Rook)
require(scales)
token <- "CAACEdEose0cBANpfFSGfN0ZApGa021bq4XlfHurincrnkT91Uq0jL9R5eNBPyXj9wzPAv3aNOE8RqSqUZAy6Q8JZCLRAjZABF1YsU22i2GpE0VGaJU0gAJwRmTSbtOOTinX9p5ocDOopMxZB5wFzmWv59e9ZCJaDaElqTE3KVJUCihjtZB4HIspM3G6LiQx9JnYdX113FAk7EK6hulIhXywcz22c64ra5EZD"
me <- getUsers("me",token=token)
me$name
myfriends <- getFriends(token,simplify = FALSE)
myfriends_info <- getUsers(myfriends$id,token = token,private_info = TRUE)
table(myfriends$relationship_status)

stat <- as.data.frame(table(myfriends$relationship_status))
names(stat) <- c("Status","Vrednost")
stat
class(stat$Vrednost)
stat$Vrednost <- as.integer(stat$Vrednost)

sum <- sum(stat$Vrednost)
element <- stat$Vrednost / sum
element
procent <- percent(element)
procent
stat$procent <- procent
stat

statistika <- data.frame(Name = myfriends$name,Status=myfriends$relationship_status)
head(statistika)
levels(factor(statistika$Status,exclude = NULL))
class(statistika)
statistika <- statistika[!is.na(statistika$Status), ]
g <- ggplot(data = statistika, aes(x = Status)) + geom_histogram(aes(color=Status,fill = Status , group = Status))
g <- g + theme(axis.text.x = element_text( angle = 90,hjust = 1,vjust = 0.4))
g
