# read.table("c:/shop/cars.txt", header=T)
# cars <- read.table("c:/shop/cars.txt", header=T)

cars
head(cars)

plot(cars$speed, cars$dist)

summary(cars)

cars.lm <- lm(dist~speed, data=cars)
abline(cars.lm)

summary(cars.lm)

# png("c:/shop/cars.png")
plot(dist~speed, data=cars)
abline(cars.lm)
# dev.off()

# history()
