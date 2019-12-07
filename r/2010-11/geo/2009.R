library(foreign) # library to read data from Splus
data.restore("tmp.dmp")  # data generated with datadump in Splus
geoplot(utbrteg) # utbrteg Dataframe with all survey stations
names(utbrteg)  # utbrteg means distributionofspecies
hist(tmp$trommungur) # one species, relatively uncommon.
tmp <- utbrteg[utbrteg$ar==2007,]  # select the year 2007  (ar means year)
hist(tmp$trommungur)
geoplotbwpalette()  # grey palette
source("Rcourse.r") # a file that is attached.

# Plot circles of 4 different sizes for < 2 2-10 1-50 and > 50.  size
# 0.01, 0.04, 0.07 and 0.11 inches.  fill.circles=T and colplot=T for
# this plot and colors gets the meaning size (confusing)
lev <- c(2,10,50)
SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$trommungur,levels=lev,
colors=c(0.01,0.04,0.07.0.11),fill.circles=T,colplot=T)
geosymbols(tmp,z=tmp$trommungur,levels=lev,
colors=c(0.01,0.04,0.07,0.11),fill.circles=T,colplot=T,
label.location="locator",labels.only=T) # Add legend (label)
args(geosymbols) # Show arguments
SMB.std.background() # set up std plot for Iceland (call to geoplot)
# Plot circles of same size but different colors size 0.1
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(2,30,100,90),
fill.circles=F,,circles=0.1,colplot=T,border=T,bordercol=150)

SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(2,30,100,90),
fill.circles=F,,circles=0.05,colplot=T,border=F)
# Add label with the  (locator)
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(2,30,100,90),
fill.circles=F,,circles=0.05,colplot=T,border=F
,label.location="locator",labels.only=T)
lab <- geolocator(type="l")  # specify a good location for label to use.

# Repeat but do not have to point with the mouse.
SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(0,30,100,90),
fill.circles=F,,circles=0.05,colplot=T,border=F)
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(0,30,100,90),fill.circles=F,
circles=0.05,colplot=T,border=F,label.location=lab,labels.only=T)

# Open circles of 4 different sizes
SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(0.01,0.04,0.07,0.11),
open.circles=T,colplot=T,lwd=2)
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(0.01,0.04,0.07,0.11),
open.circles=T,colplot=T,lwd=2,label.location=lab,labels.only=T)

# Open circles of where area is proportional to the value (
# diameter proportional to the sqrt of value)

SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$trommungur,circles=0.2,sqrt=T,lwd=2,col=2)
geosymbols(tmp,z=tmp$trommungur,circles=0.2,sqrt=T,lwd=2,col=150,
label.location=lab,labels.only=T,levels=c(1,5,50))


#Label was rather ugly and size of letters can not be controlled
# a bug that will be fixed.  But there are ways around the problem.

SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$trommungur,circles=0.2,sqrt=T,lwd=2,col=2)
tmp1 <- data.frame(lat=c(65.5,65,64.5),lon=rep(-17,3))
tmp1$z <- c(1,5,50)
geosymbols(tmp1,z=tmp1$z,circles=0.2,sqrt=T,maxn=max(tmp$trommungur),lwd=2)
geotext(tmp1$lat,-18,tmp1$z,cex=1.2)
args(geotext)
geotext(tmp1$lat,tmp1$lon-1,tmp1$z,cex=1.2)

# Repeat little differently

SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$trommungur,circles=0.2,sqrt=T,lwd=2,col=2)
tmp1 <- data.frame(lat=c(65.5,65,64.5),lon=rep(-17,3))
tmp1$z <- c(1,10,100)
geosymbols(tmp1,z=tmp1$z,circles=0.2,sqrt=T,maxn=max(tmp$trommungur),lwd=2)
geotext(tmp1$lat,rep(-18,3),tmp1$z,cex=1.2)


# Look at haddock that is very abundant

SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$ysa.kg,circles=0.2,sqrt=T,lwd=2,col=2)


# Prepare for smoothing vg is a variogram, grd.smb the grid.
# the lower the ratio nugget/sill the closer the smoothing is to interpolation
# Points further than range are not correlated.


grd.smb <- list(lat=seq(62.8,67.5,length=50),lon=seq(-28,-10,length=80))
vg <- list(nugget=0.2,sill=1,range=40)

# option is the search algorithm.  4 means that for each gridpoint take all
# dat points less than specified distance from the gridpoint (50 km here.
zgr  <- pointkriging(tmp$lat,tmp$lon,tmp$ysa.kg,grd.smb,vg,option=4,maxdist=50,
set-1,mindist=20) # set=-1 means points further away than 20km from next
# gridpoint are NA
hist(zgr)

# set levels and colors. 14x14 Colorpalette can be plotted with litir(14)
# litir in Icelandic means colours.
lev <- c(20,100,200,1000)
col <- c(0,2,50,100,150)
geocontour.fill(zgr,levels=lev,white=T,colors=col)
lev <- c(20,100,200,1000)
col1 <- c(0,2,50,100,150)
SMB.std.background(grid=F)

# geocontour has similar calls as geocontour.fill but
# makes contour lines.
geocontour.fill(zgr,levels=lev,white=T,col=col1)
# gebco500 is a version of the 500m depth contorur around Iceland that
# can be shaded by the polygon command eterior = T shade outside the polygon
# The name gebco is the French company where we obtained this depth contour.
geopolygon(gepco500,exterior=T,col=0) # col=0 is transparent that does nothing
geolines(gepco500)
geopolygon(gepco500,exterior=T,col="white")
geopolygon(island,col="white") # shade iceland but some
#of the contouus went ashore.
geolines(island)
geopoints(tmp,pch=16,csi=0.06)
geocontour.fill(zgr,levels=lev,white=T,col=col1,label.location=lab,labels.only=T,labbox=F)

# expand the grid get a matrix of all combinations. geopoints(grd1) and
# geogrid(grd) gives the same result.  The zgr from pointkriging
# using grd.smb is in  the same order as grd1 generated from grd.smb
# by geoexpand. This can be used to avoid interpolation to areas where it
# should not be done like i <- geoinside(grd,island,option=0) ;
# zgr[i] <- 0 .  (nothing ashore) .
grd1 <- geoexpand(grd.smb)
tmp1 <- tmp[!is.na(tmp$botnhiti),]
# use a second order polynomial with 2 degrees of freedom.  See for example
# the book statistical models in S for decription of loess.  Smaller span and
# higher df means follows the data better.  df can though not be much higher
# than 2 .
z <- loess(botnhiti~lat*lon,df=2,span=0.3,data=tmp1)
grd1$predbh <- predict(z,grd1)
table(is.na(grd1$predbh))
lev <- c(0,2,4,6)
SMB.std.background(grid=F)
geocontour.fill(grd1,z=grd1$predbh,levels=lev,white=T,col=col1)
geopolygon(island,col=0)
geopolygon(island,col="white")
geopolygon(gepco500,exterior=T,col="white")

# Look at some example from acoustics.  Lodna means capelin.

names(lodna.2)
geoplot(lodna.2,type="l")
geosymbols(lodna.2,z=lodna.2$z,perbars=0.15) # Bars perpendicular to cruise
# lines size proportional to z.
hist(lodna.2$z)
geoplot(lodna.2,type="l")
lev <- c(100,500,2000)
geosymbols(lodna.2,z=lodna.2$z,parbars=0.05,levels=lev,col=c(2,50,100,150))
help(geosymbols)
geoplot(lodna.2,type="l")
lev <- c(100,500,2000)
# plot the data as 4 different colours < 100, 100-500, 500-200 and > 2000.
# width of sybols 0.05 inches.
geosymbols(lodna.2,z=lodna.2$z,parbars=0.05,levels=lev,
col=c(2,50,100,150),colplot=T)


# interpolate the temperature z1$z from interp is a matrix and
# geocontour.fill requires vector, therefore c(z1$z)
tmp <- utbrteg[utbrteg$ar==2007,]
tmp1 <- tmp[!is.na(tmp$botnhiti),]
z1 <- interp(tmp1$lon,tmp1$lat,tmp1$botnhiti,grd.smb$lon,grd.smb$lat)
names(z1) <- c("lon","lat","z")
z1 <- interp(tmp1$lon,tmp1$lat,tmp1$botnhiti,grd.smb$lon,grd.smb$lat)
names(z1) <- c("lon","lat","z")
SMB.std.background(grid=F)
geocontour.fill(z1,z=c(z1$z),levels=lev,white=T,col=col1)
geopolygon(island,col="white")
geopolygon(gepco500,exterior=T,col="white")

# Some examples of plotting data around Srilanka
# RdataVietnam contains depth contours for the neighbourhood of Vietnam.
# The data is stored in a list called res.

attach("RDatavietnam")
geoplot(xlim=c(60,90),ylim=c(0,20))
geoworld(database="worldHires")
 geoworld(database="worldHires",col=3)
 geoworld(database="worldHires",col=3,fill=T)
names(res)
geolines(res$" names(res)
names(res)
names(res$"100")
geolines(res$"200")
geolines(res$"1000",col="grey")
geolines(res$"1000",col="grey",lwd=5)
geolines(res$"2000",col="blue",lwd=5)
geolines(res$"4000",col="red",lwd=5)
geolines(res$"3000",col="yellow",lwd=5)
limits <- geolocator(type="p",n=2)
geoplot(xlim=limits)
geoplot(xlim=limits,yaxdist=1)
geoplot(xlim=limits,yaxdist=0.7)
geoplot(xlim=limits,yaxdist=0.5)
geoplot(xlim=limits,yaxdist=0.5,dlat=1,dlon=1)
geoplot(xlim=limits,yaxdist=0.3,dlat=1,dlon=1)
 geoworld(database="worldHires",col=3,fill=T)
geolines(res$"200",col="blue")
locdist()
args(locdist)
locdist()
reg <- geodefine()
geopolygon(reg,col="blue")
geoarea(reg)
args(geoarea)
geoarea(reg,robust=F)
geoarea(island)

# Try to get only Shri Lanka out of the woldHires database.
# Would be easier if we would know what to set in for region in
# geoworld but region is the first argument.
srilanka <- geoworld(fill=T,database="worldHires",return.data=T)
geolines(srilanka)
geoidentify(srilanka)
i <- 1:nrow(srilanka)
i <- i[is.na(srilanka$lat)]
tmp <- srilanka[(2011923+1):(2014977-1),]
geopolygon(tmp,col="yellow")
geoarea(tmp)
srilanka <- tmp
nrow(srilanka)
# Some color manipulations.  HSV is hue saturation brightness(value)


geoplotpalette # colorscheme based on a matrix called postcol
x <- matrix(0,15,3)
x[,3] <- 1 # full brightness
x[,2] <- 1 # full saturation
x[,1] <- seq(0,1,length=15) # color circles in 15 steps
palette(hsv(x[,1],x[,2],x[,3]))
litir(5) # plot the palette

x[,2] <- 0  #no saturation all colors white when brightness is 1
palette(hsv(x[,1],x[,2],x[,3]))
litir(5)

# saturation is 0 , therefore we get a black and white color scheme
# if brightness changes from 0 to 1.

x[,2] <- 0
x[,3] <- seq(0,1,length=15)
palette(hsv(x[,1],x[,2],x[,3]))
litir(5)

# Make colors from white  to blue in 15 steps by fixing hue and
# brightness but let saturation change
x[,1] <- 0.75
x[,2] <- seq(0,1,length=15)
palette(hsv(x[,1],x[,2],x[,3]))
litir(5)

# look at the geoplot palette.
geoplotpalette()
litir(14)

# Revisit circles plot.

tmp <- utbrteg[utbrteg$ar==2007,]
lev <- c(2,10,50)
SMB.std.background(grid=F)
SMB.std.background
hist(tmp$trommungur)
table(tmp$trommungur==0)
hist(log(1+tmp$trommungur))
geosymbols(tmp,z=tmp$trommungur,levels=lev,
colors=c(0.01,0.04,0.07,0.11),fill.circles=T,colplot=T)
SMB.std.background(grid=F)
 geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(0.01,0.04,0.07,0.11),
fill.circles=T,colplot=T,border=T,bordercol="white")

# example of geoconvert that is used to plot
geoconvert(655084)
geoconvert(6550*100)
geoplot(tmp)
geoplot(xlim=c(-24,-20),ylim=c(64,65))
geoplot(xlim=c(-85,-90),ylim=c(14,19))
geoplot(xlim=c(-85,-90),ylim=c(14,19),yaxdist=0.7) #yaxdist is distance of
# latitude symbols from plot.
geoworld(database="worldHires",fill=T,col=158)
geoworld(database="worldHires",fill=T,col=150)
geoplot(xlim=c(-70,-95),ylim=c(14,25),yaxdist=0.7)
geoworld(database="worldHires",fill=T,col=158)
geoworld(database="worldHires",fill=T,col=150)
limits <- geolocator(type="p",n=2)
limitsbelise <- limits
geoplot(xlim=limitsbelise)
geoworld(database="worldHires",fill=T,col=150)




# Some example of curves smooth curves (with geocurve)

x <- geodefine()
geopolygon(x,col=0,exterior=T)
geopolygon(x,col="white",exterior=T)
args(geocurve)
x1 <- geocurve(x,open=F,plot=F) # does not work in R as the default degree
# of fredom is nrow(x)/2 that is not an integer.
x1 <- geocurve(x,open=F,plot=F,df=5)
x1 <- geocurve(x,open=F,plot=F,df=12)
