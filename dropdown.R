library(ggplot2)
ggplot(finalDogData, aes(Year, Breed, col=Breed)) + geom_point()
