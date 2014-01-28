library(ggplot2)
library(plyr)


gdURL <- "http://tiny.cc/gapminder"
gOut <- read.delim(gURL)
gOut <- read.delim(gdURL)
gOut
str(gOut)
gOut <- read.delim("gapminderDataFiveYear.txt")


## built-in apply() function operates on a MATRIX, not a data.frame
tDat <- with(gOut,
             cbind(cambodia = lifeExp[country == "Cambodia"],
                   canada = lifeExp[country == "Canada"],
                   rwanda = lifeExp[country == "Rwanda"]))
rownames(tDat) <- with(gOut, year[country == "Canada"])
str(tDat)
tDat


apply(tDat, 1, mean)
str(apply(tDat, 1, mean))
apply(tDat, 2, median)
rowmeans(tDat)
rowMeans(tDat)


which.min(tDat[1,])
tDat[1,]

apply(tDat,1,which.min)


apply(tDat,2,summary)

apply(tDat, 2, quantile, probs=c(0.25,0.75))


##compute te interquartile range of life Exp by counry
##hint IQR()

IQR(tDat)

apply(tDat, 2, quantile,probs=c(.25,.75)
)
Q <- apply(tDat, 2, quantile, probs=c(.25,.75))
range(Q)


IQR(tDat, na.rm=FALSE, type = (1) )


apply(tDat, 2, IQR)
apply(tDat, 2, range)
apply(tDat, 2, function(x) diff(quantile(x, probs = c(0.25, 0.75))))
