# install.packages("XML")
require(XML)
require(stringr)
url <- "http://www.loc.gov/rr/print/list/057_chron.html"
presidents <- readHTMLTable(url, which = 3, as.data.frame = TRUE, skip.rows = 1, header = TRUE , stringAsFactoris = TRUE,)
head(presidents)
tail(presidents)
# 
# presidents <- presidents[1:64, ]
# listYear <- str_split(string = presidents$YEAR, pattern = "-")
# head(listYear)
# y <- data.frame(Reduce(rbind,listYear))
# head(y)
# names(y) <- c("Start","Stop")
# presidents <- cbind(presidents, y)

presidents[str_sub(string = presidents$Start,start = 4,end = 4) == 1,c("YEAR","PRESIDENT","Start","Stop")]
View(presidents[str_detect(string = presidents$PRESIDENT, pattern = ignore.case("john")), ])

con <- url("http://www.jaredlander.com/data/warTimes.rdata")
load(con)
close(con)
head(warTimes,10)
theTimes <- str_split(string = warTimes,pattern = "(ACAEA)|-", n=2)
head(theTimes,10)

# WarStarted time

warStarted <- sapply(X = theTimes, FUN = function(x) x[1])
head(warStarted,10)
warStarted <- str_trim(string = warStarted)

head(str_extract(string = warStarted, pattern = "^\\d{4}"),20)
head(str_extract(string = warStarted, pattern = "\\D+"))




head(warTimes,40)

data <- str_split(string = warTimes, pattern = "(ACAEA)|-",n = 2)
data <- sapply(X = data,FUN = function(x) x[1] )
head(data)

data <- data[str_detect(string = data, pattern = "\\d{4}")]
data <- str_extract(string = data ,pattern = "\\d{4}")

require(ggplot2)

rnorm(20)
set.seed(1)
rnorm(20)
set.seed(1)
rnorm(20)
set.seed(15021991)
rnorm(20)
rbinom(20,size = 10, prob = 0.5)
