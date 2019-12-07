plot(cars$speed, cars$dist)
barplot(cars$dist)
hist(cars$dist)
boxplot(cars$dist)

plot(cars$speed, cars$dist)
plot(dist~speed, data=cars)
plot(cars)  # data frame
cars.lm <- lm(dist~speed, data=cars)
par(mfrow=c(2,2))
plot(cars.lm)  # lm

# points(x, y)
# lines(x, y)
# abline(a, b)
# abline(obj)
# abline(h)
# abline(v)
# text(x, y, label)

barplot(1, col=6)
barplot(1, col="darkgreen")
colors()

par(mfrow=c(2, 3))
plot(0, main=1)
plot(0, main=2)
plot(0, main=3)
plot(0, main=4)
plot(0, main=5)
plot(0, main=6)
par(mfrow=c(1, 1))

# ?par

plot(c(1,10), c(1,100), main="title", xlab="x", ylab="y", xlim=c(0,20),
     ylim=c(0,120), pch=3, lwd=5, col="orange", cex=2)
lines(c(5,15), c(50,60), lty=2, lwd=5, col="purple")
text(10, 20, "here", col="brown")
