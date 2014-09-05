# Statistika

#               Binomna raspredelba  #
require(ggplot2)
rbinom(n = 5,size = 3,prob=0.01)

binom10 <- rbinom(n=10000, size = 10, prob = 0.4)
binom100 <- rbinom(n=10000, size = 100, prob = 0.4)
binom1000 <- rbinom(n=10000, size = 1000, prob = 0.4)

binom5 <- data.frame(Success = rbinom(n=10000, size = 5, prob = 0.3), Size = "pet")
binom10 <- data.frame(Success = rbinom(n=10000, size = 10, prob = 0.3), Size = "deset")
binom100 <- data.frame(Success = rbinom(n=10000, size = 100, prob = 0.3), Size = "sto")
binom1000 <-data.frame(Success = rbinom(n=10000, size = 1000, prob = 0.3), Size = "iljada")

binomAll <- rbind(binom5,binom10,binom100,binom1000)
head(binomAll)
tail(binomAll)

ggplot(binomAll,aes(x=Success)) + geom_histogram() + facet_wrap(~Size,scales = "free")
facet_wrap()
dbinom(x = 3,size = 10, prob = 0.3) # 3 od 10 uspesi
pbinom(q = 3, size = 10, prob = 0.3) # 3 ili polmaku
qbinom(p = 0.99, size = 5 ,prob = 0.3) # kolku obidi od 5 ni trebaat za da dobieme verojatnost p
qbinom(c(.3,.35,.40,.50,.90,.95,.96,.97,.98,.99), size = 5 ,prob = 0.3) # vektor od verojatnosti





