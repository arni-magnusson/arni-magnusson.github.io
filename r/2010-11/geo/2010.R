# Commands from the course 12 Now 2010.
library(Logbooks) # connect logbook library
# Lbl is a function to attach the dataframes lina, botnv, dragnot,
# botnv is stored in 3 parts botnv1, botnv2 and botnv3 but botnv attaches all.
# Not needed in linux where all objects are attached with library(Logbooks)
Lbl("botnv")

# The function looks like pos is the position in the search path , default
# is at the end of the search path.

Lbl <- function(Objects=c("botnv"),pos){
  txt <- c("botnv1","botnv2","botnv3")
  i <- match("botnv",Objects) # botnv attaches botnv1, botnv2 and botnv3
  if(!is.na(i)) {
    Objects <- c(Objects,txt)
    Objects <- Objects[-i]
  }
  Objects <- unique(Objects) # not repeat the same object twice.
  Objects <- paste(Objects,".rda",sep="") # stored in files with .rda ending
  if(missing(pos)) pos <- length(search())
  for(i in 1:length(Objects)){
    if(!exists(Objects[i])) # Not reattach objects that exist.
      attach(paste(Logbooklib,"/ExtraStuff/",Objects[i],sep=""),pos=pos+i)
  }
}

#Quit
q()
# libraries Logbooks and geo will be attached but R at MRI will be set up so it
# Happens automatically.
library(Logbooks)
# Check the search path
search()
# List what is in pos 2 second place in the search path after the place where data
# is written (GlobalEnv)
ls(pos=2)
#Attach part of the logbook library and check the objects.
Lbl(c("net","lina"))
search()
names(lina)
Lbl("botnv")
names(botnv1)
table(botnv1$ar)
table(botnv3$ar)
nrow(botnv3)
# Check the geo library.  First attach it.

library(geo)
ls()
# Show how to convert data from the format used in the oracle data base degree, minutes and
# 100th part of minutes to decimal number.
geoconvert(632085)
geoconvert(637085)
# The logbook database afli.stofn does only store degree and minutes therefore
# the data supplied to geoconvert need to be
geoconvert(6459*100)
# Select bottom trawl records from 2010.
tmp <- botnv3[botnv3$ar==2010,]
names(tmp)
range(tmp$lat,na.rm=T)
#type="n" means not plot only use data to set plot up (same as with plot) type = "n"
#, "b","p" or "l" are all valid values
geoplot(tmp,type="n")
# Data in logbooks are only given by minute, lat and lon.  jitter=0.02 puts random disturbance
# 0.02 on it (should really use 0.01).
geopoints(tmp,pch=".",jitter=0.02,col="blue")
# Plot a larger area to show the Mercator transform works i.e the discance between
# Meridians increases.  b0 = high value is required when extending plot far north.
geoplot(xlim=c(-40,60),ylim=c(60,82),b0=82)
# Add world maps to the plot, they area stored in maps and mapdata
libray(maps)
library(maps)
library(mapdata)
geoworld()
geoplot(xlim=c(-40,60),ylim=c(60,82),b0=82)
geoplot(xlim=c(-40,60),ylim=c(60,82),b0=82,dlon=10)
#High resolution map (worldHires)
geoworld(database="worldHires")
# Paint all countries yellow
geoworld(database="worldHires",fill=T,col="yellow")
# 500 m depth contour.
gbplot(500)
#See how exaggerated the size of far north is in Mercator.
# Lambert transform is not as bad.
geoplot(xlim=c(-40,60),ylim=c(60,82),projection="Lambert")
geoworld(database="worldHires",fill=T,col="yellow")
geoworld(database="worldHires")
gbplot(500,col="blue")
# Look at the hot topic of today Arnarfjörður
# Plot the March survey area.
SMB.std.background()
# Give to points to limit Arnarfjörður (with the mouse.
lim <- geolocator(type="l",n=2)
geoplot(xlim=lim)
# Want to refine the area.
lim <- geolocator(type="l",n=2)
geoplot(xlim=lim)
# See how coarse the default map island is
nrow(island)
# bisland is much more precies map.
geoplot(xlim=lim,country=bisland)
# Move text with the yaxis further away from the plot.  Default valu of yaxdist is 0.3
geoplot(xlim=lim,country=bisland,yaxdist=0.5)
# Put random jitter on the points that are only given up to minute.  0.01 means 100 th of degree that # is close to minute.  On this scale resolution in the data is easy to see (not use jitter)
geopoints(lina,jitter=0.01,pch=16,csi=0.04,col="blue")
# Paint grey over all the points on land.
geopolygon(bisland,col="grey")
# Make a region limiting Arnarfjörður, do not have to follow the coast lines well.  Click
# the center button of the mouse when finished.
reg <- geodefine()
# Find the longline records within  within the region.
linaarn <- geoinside(lina,reg)
nrow(linaarn)
# To know what col = 150 means we have to define a color palette
geopoints(linaarn,pch=16,col=150)
geopoints(linaarn,pch=16,col="red")
geopoints(linaarn,pch=16,col="yellow",jitter=0.01)
# Want to get rid of the longline points within Iceland, option = 2 in the call to geoinside
# means keeping what is outside ther region.  Use the same name again that is not
# recommended procedure.
lina <- geoinside(lina,island,option=2)
# See that the  name lina appear in 2 places.
find("lina")
geopoints(lina,pch=16,jitter=0.01,col="black")
geolines(island,lwd=2)
rm(lina)
# Finding the points that are within the more precise coast line takes much longer time.
lina <- geoinside(lina,bisland,option=2)
# Plot what color numbers mean.
litir(14)
# Defined a color palette.
geoplotpalette()
litir(14)
# Black and white palette
geoplotbwpalette()
litir(14)
# Example how to show a palette
pie(1:100,col=palette(rainbow(100)))
geoplotpalette()
# Árni  discussed palettes in more detail.
# Plot Arnarfjörður again.
geoplot(xlim=lim,country=bisland)
# hatch the region (density = something)
geopolygon(reg,density=10,col=1)
# Records within Arnarfjörður
linaarn <- geoinside(lina,reg)
x <- geopoints(linaarn,pch=16,col=1,jitter=0.01)
# number of records by year
table(linaarn$ar)
# Cod catch in tonnes per year.  Tapply is some kind of pivot table
x <- tapply(lina$torskur,lina$ar,sum)
# apply.shrink does the same as tapply but returns the data in different format.  As dataframe
# aggregate is a similar program that is part of R and probably many other.
x <- apply.shrink(linaarn$torskur,linaarn$ar,sum)
# Want to set appropriate names on the dataframe
x <- apply.shrink(linaarn$torskur,linaarn$ar,sum,names=c("year","codcatch"))
# apply.shrink.dataframe is a more powerful program that takes a data frame
# and can do the same opertation a in tapply on many columns at time.
x <- apply.shrink.dataframe(linaarn,c("torskur","ysa","keila"),c("ar"),sum)
# the names of the output are "ar","torskur.sum","ysa.sum","keila.sum"
names(x)
# Look at what happens if we want to sum the data by year and season.
# first define summer as months 5-9 summer = 1 then but else 0.
linaarn$summer <- ifelse(linaarn$veman%in%5:9,1,0)
# show example of how the ifelse command works
x <- 1:10
# Print the output of ifelse on the screen
ifelse(x < 5.5,3,7)
# run apply.shrink.dataframe with "ar" and "summer" names of the output are now
# ar","summer","torskur.sum","ysa.sum","keila.sum"
x <- apply.shrink.dataframe(linaarn,c("torskur","ysa","keila"),c("ar","summer"),sum)
# tapply returns a matrix when classified by to variables (year and summer)
# NA in the matrix means no record for this year and season.
x <- tapply(linaarn$torskur,list(linaarn$ar,linaarn$summer),sum)
# The output for year and season with no record do not show up in the output of apply.shrink
# and apply.shrink.dataframe.  In apply.shrink.dataframe they can be included by full.data.frame=T
# in the call.
>x <- apply.shrink.dataframe(linaarn,c("torskur","ysa","keila"),c("ar","summer"),
sum,full.data.frame=T)
# With this kind of data no record does really mean 0 so we can specify.
x <- apply.shrink.dataframe(linaarn,c("torskur","ysa","keila"),c("ar","summer")
,sum,full.data.frame=T,Set=0)
# Closer look at ifelse
x <- 1:10
x < 5.5
ifelse(x < 5.5,1,0)
# Look no at an example on how we use ifelse to set maturity stage to 0 or 1.
# Survey data from March 2010
Oracle<- F
tmp <- lesa.stodvar(ar=2010,man=2:3)
tmp <- lesa.stodvar(ar=2010,man=2:3,oracle=F)
# synaflokkur=30 is the March survey see table fiskar.synaflokkar
tmp <- tmp[tmp$synaflokkur %in% 30,]
nrow(tmp)
# Get the otolith sampes, add the column kynthroski to the std output
tmp1 <- lesa.kvarnir(tmp$synis.id,1,c("kynthroski"))
# List maturity stages , how much in each stage, remember that table ignores NA values.
table(tmp1$kynthroski)
# fish where maturity stage is > 1 has mature=1 else mature=0 (stage 5 is though questionable)
tmp1$mature <- ifelse(tmp1$kynthroski > 1,1,0)
table(tmp1$mature)

table(is.na(tmp1$kynthroski))
table(tmp1$lengd[is.na(tmp1$kynthroski)])
table(tmp1$mature)
# But what happened to missing values in kynthroski they are also missing in mature.
table(is.na(tmp1$mature))
# Fish with missing value of mature is all small so we can set mature to 0 (immature)
# this is the fish that is only weighted ungutted.
table(tmp$lengd[is.na(tmp$mature)])
tmp1$mature[is.na(tmp1$mature)] <- 0
# Binomial glm model where maturity is modelled as a function of length
x <- glm(mature~lengd,data=tmp1,family=binomial)

# Now we come color command from Árni Magg  no further explanation.
# some of them might not work (typing errors)
gray(0.3)
gray(0)
gray(1)
gray(seq(0.3, 0.9, 0.1))
rgb(0.3, 0.8, 0, maxColorValue=1)
mycol <- rgb(0.3, 0.8, 0, maxColorValue=1)
barplot(1, col=mycol)
mycol <- rgb(0.6, 0.8, 0, maxColorValue=1)
barplot(1, col=mycol)
hsv(0, 1, 1)
hsv(0.7, 0.2, 1)
barplot(1, col=hsv(0.7, 0.2, 1))
barplot(1, col=hsv(0.7, 0.5, 1))
gray(seq(0.3, 0.9, 0.1))
install.packages("gplots")
library(gplots)
rich.colors
?rich.colors
options(help_type="html")
?rich.colors
m <- matrix(1:120+rnorm(120), nrow=15, ncol=8)
opar <- par(bg="gray", mfrow=c(1,2))
matplot(m, type="l", lty=1, lwd=3, col=rich.colors(8))
matplot(m, type="l", lty=1, lwd=3, col=rich.colors(8,"blues"))
par(opar)
barplot(rep(1,100), col=rich.colors(100), space=0, border=0, axes=FALSE)
barplot(rep(1,20), col=rich.colors(40)[11:30]) # choose subset
par(mfrow=c(2,2))
barplot(m, col=heat.colors(15), main="\nheat.colors")
barplot(m, col=1:15, main="\ndefault palette")
barplot(m, col=rich.colors(15), main="\nrich.colors")
barplot(m, col=rainbow(15), main="\nrainbow")
par(opar)
install.packages("colorRamps")
library(colorRamps)
colorRamp(c("red","white","blue"))
myramp <- colorRamp(c("red","white","blue"))
myramp(10)
myramp(seq(0,1,0.1))
mycol <- myramp(seq(0,1,0.1))
barplot(rep(1,11), col=mycol)
rgb(myramp(seq(0,1,0.1)))
myramp(seq(0,1,0.1))
rgb(myramp(seq(0,1,0.1)))
rgb(myramp(seq(0,1,0.1)), maxColorValue=1)
colorRampPalette(c("red","white","blue"))
myramp <- colorRampPalette(c("red","white","blue"))
myramp(19)
barplot(rep(1,11), col=myramp(11))
rainbow(19)
topo.colors(19)
# gray
# rich.colors(palette="blues")
# rich.colors(10)
colorRampPalette(c("red","white","blue"))
"purple"
barplot(rep(1,11), col="brown")
barplot(rep(1,11), col=c("brown",rep("blue",10))
barplot(rep(1,11), col=c("brown",rep("blue",10)))
barplot(rep(1,11), col=c("brown",rep("blue",2)))
# Árni's color input finished.  .

#Use data from survey and capelin surveys stored in a Rdata file.  Attach
# the file on linux system h: is /net/hafkaldi/u2/haf
attach("h:/hoski/RnamskeidNov2010/RdataNov122010")
ls()
search()
ls(pos=2)
# utbrteg is a data frame with all stations in the March survey 1985 - 2009
names(utbrteg)
table(utbrteg$ar)
# Select 2009 values
tmp <- utbrteg[utbrteg$ar==2009,]
SMB.std.background()
# Plot the tows
geotows(tmp)
# Plot points
geopoints(tmp)
SMB.std.background()
# symbols specified by characters are not well centered those specified by number 1-20 are
# better pch = 16 is a filled square, 17 filled triangle
geopoints(tmp,pch="*")
geopoints(tmp,pch=16)
# This is a way to see what different numbers for pch mean.
plot(1:20,1:20,type="n")
for(i in 1:20) points(i,i,pch=i)
# Different ways of plotting temperature first as text
SMB.std.background()
geotext(tmp,z=tmp$botnhiti)
# Then smaller text
SMB.std.background()
geotext(tmp,z=tmp$botnhiti,csi=0.07)

# More digits
SMB.std.background()
geotext(tmp,z=tmp$botnhiti,csi=0.07,digit=1)
# Different colour for low more and less than 3 degrees.
SMB.std.background()
i <- tmp$botnhiti < 3
# less than 3 degrees i True is blue
geotext(tmp[i,],z=tmp$botnhiti[i],col="blue")
# more than 3 degrees i is not True (!i is True ) is red
geotext(tmp[!i,],z=tmp$botnhiti[!i],col="red")
# Paint iceland (white) col=0 is transparent so the first command does nothing.
geopolygon(island,col=0)
geopolygon(island,col="white")
geolines(island)
geolines(island,lwd=2)
# Look at haddock data
SMB.std.background()
#Plot circles where the diameter is proportional to the square root of hddock abundance
# i.e area proportional to haddock abundance.  Max size 0.2 inches.
geosymbols(tmp,z=tmp$ysa.kg,circles=0.2,sqrt=T)
# Here the size 0.2 inches means 1000 kg but comparing different years maxn must
# be the same in all plots.  Default for maxn is max in data.
geosymbols(tmp,z=tmp$ysa.kg,circles=0.2,sqrt=T,maxn=1000)
# Here the size 0.2 inches means 10000kg , much smaller circles than in the plot before
# looks like much less haddock.
geosymbols(tmp,z=tmp$ysa.kg,circles=0.2,sqrt=T,maxn=10000)
# Can also plot other types of circle where we specifiy levels, like levels=c(0.1, 0.5 ,1 )
# In this case the data are divided in one more group than levels here
# < 0.1 0.1-0.5, 0.5 - 1 and > 1.  Then different size or color of circels is drawn for each
# group.  In those cases colplot=T has to be specified, the argument colors means either
# size in inches if fillcircles=T or color number if fillcircles=F.  If fill circles=T the
# argument col means colors of the cirecles and if fill.circles=F the argument circles means
# size of circles (very bad organiztion of argument).  The argument label.location (data frame
# with twopositions  or "locator" is legend) and labels.only is used is only the
# legend is to be plotted.
SMB.std.background()
# Number of stations with þrömmungur and number per year.
table(tmp$trommungur > 0)
table(utbrteg$ar,utbrteg$trommungur > 0)
# Plot stations with þrömmungur in red and stations not with þrömmungur in blue.
# first plot the 200 m depth contour in light grey, (col 160 in geoplotpalette)
i <- tmp$trommungur > 0
geoplotpalette()
gbplot(200,lwd=5,col=160)
geopoints(tmp[!i,],pch=16,col="blue")
geopoints(tmp[i,],pch=16,col="red")
# Look at histogram of trommungur abundance to set appropriate levels.
hist(tmp$trommungur)
hist(tmp$trommungur,nclass=25)
SMB.std.background()
geosymbols(tmp,z=tmp$trommungur,levels=c(2,10,50),colors=c(0.01,0.04,0.07,0.11),
fill.circles=T,colplot=T)
# Add legend
geosymbols(tmp,z=tmp$trommungur,levels=c(2,10,50),colors=c(0.01,0.04,0.07,0.11),
fill.circles=T,colplot=T,label.location="locator",labels.only=T)
# Add yellow border, sometime not appropriate but not here.
geosymbols(tmp,z=tmp$trommungur,levels=c(2,10,50),colors=c(0.01,0.04,0.07,0.11),
fill.circles=T,colplot=T,border=T,bordercol=100)
# Should maybe identify the 0 values better, add one value for 0 (< 0.01)
SMB.std.background()
labloc <- geolocator(n=2,type="p")
geosymbols(tmp,z=tmp$trommungur,levels=c(0.01,2,10,50),colors=c(0.01,0.02,0.04,0.07,0.11),
  fill.circles=T,colplot=T,label.location=labloc)
# Plot different coloured circles of size 0.05 inches for each level.  < 0.01 is col 0 transparent.
SMB.std.background(grid=F)
# fill.circles=F when coloured circles, 0.05 is the size of the circles
geosymbols(tmp,z=tmp$trommungur,levels=c(0.01,2,10,50),colors=c(0,2,30,100,150),
fill.circles=F,circles=0.05,colplot=T)
geosymbols(tmp,z=tmp$trommungur,levels=c(0.01,2,10,50),colors=c(0,2,30,100,150)
,fill.circles=F,circles=0.05,colplot=T,label.loction="locator",labels.only=T)

# Look at reitur (statistical square 1degree longitude x ½ degree latitude)
# Old data is often only available by square sometime subsquare.
# Plot the squares on a plot.  In the surveys reitur and tognumer identify a station
geoplot(reitur=T,reittext=T)
# Degree to reitur and reitur to degree.
d2r
r2d
# Number of haddock by square
x <- apply.shrink(utbrteg$ysa.kg,utbrteg$reitur,mean,names=c("reitur","ysa"))
# First 10 records
x[1:10,]
# Plot Survey area
SMB.std.background(reitur=T)
# Center of the squares in x
pos<- r2d(x$reitur)
# as pos is not a dataframe pos$lat and pos$lon has to be given in this form.
# pos is a list and can be changed to dataframe by as.data.frame
geosymbols(pos$lat,pos$lon,z=x$ysa,circles=0.2,sqrt=T)
hist(x$ysa)
# Survey area with squares
SMB.std.background(reitur=T)
# Red wide circles
geosymbols(pos$lat,pos$lon,z=x$ysa,circles=0.2,sqrt=T,col="red",lwd=3)
# Small text in the center of the square
geotext(pos$lat,pos$lon,x$ysa,csi=0.07)
# Look at the depth data, gbplot denies to plot some lines but names(gbdypi shows what is
# available.  Discusstions about better depth contours.
names(gbdypi)
SMB.std.background(grid=F)
gbplot(500)
gbplot(400,lwd=3)
# Here gbplot complains but the commenan below works.
gbplot(300,lwd=3)
geolines(gbdypi$"300",col="blue")
geolines(gbdypi$"1500",col="blue")
# Plot larger area and the 1500 m contour.
geoplot(xlim=c(-50,10),ylim=c(60,70))
geolines(gbdypi$"1500",col="blue")

# save the history in .RHistory
savehistory()
