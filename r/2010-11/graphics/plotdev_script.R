require(lattice)
trellis.device(color=F)
barplot(islands[islands>1000])
hist(precip)
densityplot(precip)
boxplot(precip)

dotplot(variety~yield|site, data=barley, groups=year, layout=c(1,6), pch=16,
        col=1:2)
boxplot(2.54*height~voice.part, data=singer)
bwplot(len~1|factor(dose)+supp, data=ToothGrowth, horiz=FALSE, as.table=TRUE)

plot(dist~speed, data=cars, pch=16)
lofit <- loess(dist~speed, data=cars)$fit
lines(cars$speed, lofit, lwd=4, col="red")
matplot(VADeaths, type="l", lty=1, lwd=4, xaxt="n")
axis(1, 1:5, rownames(VADeaths))
legend("topleft", colnames(VADeaths), lwd=4, col=1:4, bty="n")

coplot(len~log(dose)|supp, data=ToothGrowth, panel=panel.smooth)
panel.lmfit <- function(...)
{
  panel.xyplot(...)
  panel.lmline(...)
}
xyplot(len~log(dose)|supp, data=ToothGrowth, panel=panel.lmfit)

if(!require(gplots)) install.packages("gplots")
m <- aggregate(Ozone~Month, data=airquality, mean)[[2]]
se <- aggregate(Ozone~Month, data=airquality,
                function(x) sd(x)/sqrt(length(x)))[[2]]
plotCI(5:9, m, se, ylim=c(0,75), pch=16, gap=0, cex=2, xlab="",
       ylab="Ozone (ppb)", xaxt="n")
axis(1, at=5:9, labels=month.abb[5:9])

if(!require(scape)) install.packages("scape")
if(!require(rgl)) install.packages("rgl")
plot(Year~Age, data=x.cod$N, cex=sqrt(x.cod$N$N)/300, pch=16, ylim=c(2004,1971),
     las=1, ylab="")
with(mtcars, plot3d(disp,carb,mpg))

datadensity(mtcars)
plot.design(mpg~factor(cyl)+factor(vs)+factor(am)+factor(gear)+factor(carb),
            data=mtcars)

if(!require(car)) install.packages("car")
pairs(~mpg+disp+hp+drat+wt+qsec, data=mtcars)
scatterplotMatrix(~mpg+disp+hp+drat+wt+qsec, data=mtcars)
splom(~cbind(mpg,disp,hp,drat,wt,qsec)|factor(am), data=mtcars, pscales=0)

if(!require(ellipse)) install.packages("ellipse")
m <- cor(mtcars)
plotcorr(m)
col <- rgb(colorRamp(c("red","white","blue"))
           ((sign(m)*abs(zapsmall(m))^4+1)/2), max=255)
plotcorr(m, type="lower", col=col)

parcoord(mtcars[,c("mpg","disp","hp","drat","wt","qsec")])
parallel(~cbind(mpg,disp,hp,drat,wt,qsec)|factor(cyl), data=mtcars,
         layout=c(1,3))
plot(hp~disp, data=mtcars)
# identify(mtcars$disp, mtcars$hp, labels=rownames(mtcars))

if(!require(aplpack)) install.packages("aplpack")
stars(mtcars, full=F, draw.segments=T, key.loc=c(10,1))
stars(mtcars[,1:7], flip.labels=F, len=0.8, cex=0.7, key.loc=c(13,2))
faces(rev(mtcars))

x <- rnorm(1000)
y <- rnorm(1000)
z <- sin(x) + cos(y)
xcoords <- pretty(x, 10)
ycoords <- pretty(y, 10)
model <- loess(z~x+y)
grid <- expand.grid(x=xcoords, y=ycoords)
surface.vector <- predict(model, grid)
surface.matrix <- matrix(surface.vector, nrow=length(xcoords))

filled.contour(xcoords, ycoords, surface.matrix,
               color.palette=colorRampPalette(c("white","darkgray")))
persp(xcoords,ycoords,surface.matrix,theta=45, phi=30, expand=0.5, shade=0.5,
      ticktype="detailed")
persp3d(xcoords, ycoords, surface.vector, col="blue")
