library(ggplot2)
ggplot(finalDogData, aes(Year, Breed, col=Breed)) + geom_point() + scale_x_continuous(breaks = round(seq(min(finalDogData$Year), max(finalDogData$Year), by = 5)))

