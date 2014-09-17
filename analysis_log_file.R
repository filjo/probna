require(stringr)
require(ggplot2)

data = read.table(file = "access_log")                    # Read the file
keeps <- c("V1","V4","V5","V6","V7","V8")                 # Which columns we want to keep...
data <- data[ ,keeps]

transform <- list(Date = substr(data$V4, 2 , 12))         # Extract the Date from the column V4...
UTC <- substr(data$V4, 14 , 21)                           # Extract the TIME(UTC) from the column V4...
Offset <- as.numeric(substr(data$V5, 1 , 5))              # Extract the Offset from the column V4...

data <- cbind(data,transform, Time , Offset)  

keeps <- c("V1","V6","V7", "V8", "Date", "Time", "Offset" )
data <- data[ ,keeps]

method <- substr(data$V6,start = 1,stop = 3)              # Get the method
protocol <- str_extract(data$V6, pattern = "HTTP/.*")     # Get the HTTP protocol with pattern
protocol <- unlist(protocol)                              # Returns list, must unlist to get in the dataframe ...
data <- cbind(data, method, protocol)                     # Get the columns together to form the dataframe...

posebna <- data$V6  # Ja cuvame 6- ta kolona za podocna da ja tranformirame, pa so cbind() da ja dodadime...

keeps <- c("V1","V7", "V8", "Date", "Time", "Offset","method", "protocol" )
data <- data[ ,keeps]

# Renaming columns
# Giving names that have meaning

colnames(data) <- c("IP", "Status","Size in bytes","Date", "UTC", "Offset","Command", "Protocol")

# Transform V6 column and add it to the data frame ...

# head(posebna)
p <- str_extract(string = posebna , pattern = "/.*")                    # Remove the method at the beggining
p1 <- str_replace(string = p,pattern = "HTTP/.*",replacement = "")      # Remove the HTTP protocol 
p1 <- str_trim(p1,side = "both")                                        # Remove whitespace characters

# Adding the column to dataframe

data <- cbind(data,p1)
colnames(data)[9] <- "Link"
data$Date <- as.Date(data$Date,"%d/%b/%Y")
head(data)
# making Graphics for the data :)

g <- ggplot(data, aes( x = format(Status))) + geom_histogram(aes(fill = Status,color= Status)) 
g <- g + labs(x="Status", y = "Count",title = "Count by different status") 
g

# Tabela so broj na requesti po datum :)

reqs=as.data.frame(table(data$Date))        # Kreira tabeli i freqfentnost
head(reqs)
ggplot(reqs , aes(x = as.Date(Var1), y = Freq)) + geom_line()

table