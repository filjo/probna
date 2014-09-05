install.packages("ggthemes")
require(ggplot2)
require(ggthemes)
data(diamonds)
head(diamonds)
tail(diamonds)
g <- ggplot(data = diamonds , aes(x = carat, y =price ,color = color ))
g <- g + geom_point() + scale_color_grey()
g
g <- g + theme_economist() + scale_colour_economist() + scale_x_continuous(labels=comma)

