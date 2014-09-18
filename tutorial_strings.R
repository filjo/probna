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
