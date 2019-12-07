# scan("c:/shop/rivers.txt")
# read.table("c:/shop/cars.txt", header=T)
# read.csv("c:/shop/cars.csv")

# dir.create("c:/shop/out")
# write(rivers, "c:/shop/out/rivers2.dat")
# write.table(cars, "c:/shop/out/cars2.dat", quote=F, row.names=F)
# write.csv(cars, "c:/shop/out/cars2.csv", quote=F, row.names=F)

# is.integer(x)
# as.integer(x)

0        # x == 0
""       # x == ""
NA       # is.na(x)
NULL     # is.null(x)
Inf      # is.infinite(x)
-Inf     # is.infinite(x)
FALSE    # !x

numbers <- c(10, 20, 30)
strings <- c("ten", "twenty", "thirty")
vec <- c("West", "Center", "East", "West", "Center")
fac <- factor(vec)
ord <- ordered(vec, levels=c("West","Center","East"))
table(fac)
table(ord)
plot(fac)
plot(ord)

matrix(c(10,20,30,40), ncol=2)
# numbers <- c(10, 20, 30)
# strings <- c("ten", "twenty", "thirty")
data.frame(one=numbers, two=strings)
mtcars
class(mtcars)
as.matrix(mtcars)
table(mtcars$cyl)
table(mtcars$am, mtcars$cyl)

list(one=rivers, two=TRUE, three=sleep, four=pi)

ISOdate(2010, 11, 08)               # 12:00 by default
ISOdate(2010, 11, 08, 23, 59, 59)
as.POSIXct("2010-11-08", tz="GMT")  #  0:00 by default
as.POSIXct("2010-11-08 23:59:59", tz="GMT")

plot(mpg~cyl, data=mtcars)
lm(mpg~cyl, data=mtcars)
aggregate(mpg~cyl, data=mtcars, mean)

length(rivers)
dim(mtcars)
nrow(mtcars)
ncol(mtcars)

names(islands)
dimnames(mtcars)
rownames(mtcars)
colnames(mtcars)

mode(WorldPhones)
class(WorldPhones)
unclass(mtcars)
attributes(mtcars)

head(mtcars)
tail(mtcars)
unique(mtcars$cyl)
object.size(mtcars)

v <- c(10, 20, 30)
names(v) <- c("one", "two", "three")
head(cars)
colnames(cars) <- c("s", "d")
dimnames

pi == 3
pi != 3
pi <  3
pi <= 3
pi >  3
pi >= 3

pi > 3
is.character(pi)
!is.character(pi)
pi>3 && is.character(pi)
pi>3 || is.character(pi)
!(pi>3 || is.character(pi))

# numbers <- c(10, 20, 30)
# strings <- c("ten", "twenty", "thirty")
numbers >= 20
strings == "thirty"
numbers >= 20  |  strings == "thirty"
numbers >= 20  &  strings == "thirty"
any(numbers >= 20)
all(numbers >= 20)

chickwts$feed=="soybean" | chickwts$feed=="casein"
chickwts$feed %in% c("soybean","casein")

islands[islands<20]
islands[1:3]
islands[c("Greenland","Iceland","Britain")]
cars$dist
cars[1,2]
cars[1:10,1]
cars[,1]
z <- list(one=rivers, two=TRUE, three=sleep, four=pi)
z$two

v <- c(1, 3, 5, 7, 9)
v[1:3]
x <- data.frame(num=v, char=letters[v])
x[1:3, "char"]
z <- list(one=rivers, two=TRUE, three=sleep, four=pi)
z$two

v <- c(1, 3, 5, 7, 9)
v[1:3] <- 0
v <- v[-(1:3)]
x <- data.frame(num=v, char=letters[v])
x[1:3, "char"] <- ""
x <- x[-(1:3),]
z <- list(one=rivers, two=TRUE, three=sleep, four=pi)
z$two <- FALSE
z$two <- NULL

USArrests[USArrests$UrbanPop>80 & USArrests$Rape<20,]

rep(10, 3)
rep(1:10, 3)
rep(1:10, each=3)
rep(1:10, length=22)

sample(month.abb, 10, replace=T)
sort(islands)
sort(islands, decreasing=T)
rev(rivers)
order(rivers)  # rivers[order(rivers)]
rank(rivers)

1:10
seq(1, 10, 0.5)
seq(1, 10, length=5)

rnorm(10, m=0, s=1)
runif(10, min=0, max=1)
rpois(10, lambda=1)
round(pi)
trunc(pi)
pi %% 1

nchar(month.name)
paste(month.abb[1], month.abb[3], sep="-")
paste(month.abb, collapse=".")
substring(month.abb, first=2, last=3)
grep("r", month.name)
month.abb[grep("r", month.name)]
month.abb[grep("r", month.name, invert=T)]
gsub("J", "Y", month.abb)

v <- 1:10
cbind(v)
cbind(v^2, log(v))
rbind(v)
rbind(v^2, log(v))
apply(WorldPhones, 1, sum)  # within row
apply(mtcars, 2, max)       # within column
t(WorldPhones)

aggregate(hp~cyl, data=mtcars, mean)
tapply(mtcars$hp, mtcars$cyl, mean)
z <- aggregate(qsec~cyl+am, data=mtcars, mean)
xtabs(qsec~cyl+am, data=z)
tapply(mtcars$qsec, list(mtcars$cyl,mtcars$am), mean)
