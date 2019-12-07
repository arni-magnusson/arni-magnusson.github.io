tmp <- utbrteg[utbrteg$ar==2007,]
geoplotpalette()

lev <- c(2,10,50)

SMB.std.background(grid=F)

geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(0.01,0.04,0.07,0.11),fill.circles=T,colplot=T)

geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(0.01,0.04,0.07,0.11),fill.circles=T,colplot=T,border=T,bordercol=150)

geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(0.01,0.04,0.07,0.11),fill.circles=T,colplot=T,
label.location="locator",labels.only=T)


SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(2,30,100,90),fill.circles=F,,circles=0.05,colplot=T,border=F)
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(2,30,100,90),fill.circles=F,,circles=0.05,colplot=T,border=F
,label.location=lab,labels.only=T)

SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(0,30,100,90),fill.circles=F,,circles=0.05,colplot=T,border=F)
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(0,30,100,90),fill.circles=F,,circles=0.05,colplot=T,border=F
,label.location=lab,labels.only=T)

SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(0.01,0.04,0.07,0.11),open.circles=T,colplot=T,lwd=2)
geosymbols(tmp,z=tmp$trommungur,levels=lev,colors=c(0.01,0.04,0.07,0.11),open.circles=T,colplot=T,lwd=2,
label.location=lab,labels.only=T)

SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$trommungur,circles=0.2,sqrt=T,lwd=2,col=2)
geosymbols(tmp,z=tmp$trommungur,circles=0.2,sqrt=T,lwd=2,col=150,label.location=lab,labels.only=T,levels=c(1,5,50),
cex=1)

SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$trommungur,circles=0.2,sqrt=T,lwd=2,col=2)
tmp1 <- data.frame(lat=c(65.5,65,64.5),lon=rep(-17,3))
tmp1$z <- c(1,10,100)
geosymbols(tmp1,z=tmp1$z,circles=0.2,sqrt=T,maxn=max(tmp$trommungur),lwd=2)
geotext(tmp1$lat,rep(-18,3),tmp1$z,cex=1.2)


grd.smb <- list(lat=seq(62.8,67.5,length=50),lon=seq(-28,-10,length=80))
vg <- list(nugget=0.2,sill=1,range=40)

SMB.std.background(grid=F)
geosymbols(tmp,z=tmp$ysa.kg,circles=0.2,sqrt=T,lwd=2,col=2)
zgr  <- pointkriging(tmp$lat,tmp$lon,tmp$ysa.kg,grd.smb,vg,option=4,maxdist=50,set=-1)
hist(zgr)

lev <- c(20,100,200,1000)
col1 <- c(0,2,50,100,150)
SMB.std.background(grid=F)
geocontour.fill(zgr,levels=lev,white=T,col=col1)
geopolygon(island,col=0)
geopolygon(gepco500,exterior=T,col="white")
geopolygon(island,col="white")
geolines(island)
geopoints(tmp,pch=16,csi=0.06)
geocontour.fill(zgr,levels=lev,white=T,col=col1,label.location=lab,labels.only=T,labbox=F)

# Temperature

grd1 <- geoexpand(grd.smb)
tmp1 <- tmp[!is.na(tmp$botnhiti),]
z <- loess(botnhiti~lat*lon,df=2,span=0.3,data=tmp1)
grd1$predbh <- predict(z,grd1)

lev <- c(0,2,4,6)
SMB.std.background(grid=F)
geocontour.fill(grd1,z=grd1$predbh,levels=lev,white=T,col=col1)
geopolygon(island,col="white")
geopolygon(gepco500,exterior=T,col="white")

z1 <- interp(tmp1$lon,tmp1$lat,tmp1$botnhiti,grd.smb$lon,grd.smb$lat)
names(z1) <- c("lon","lat","z")
SMB.std.background(grid=F)
geocontour.fill(z1,z=c(z1$z),levels=lev,white=T,col=col1)
geopolygon(island,col="white")
geopolygon(gepco500,exterior=T,col="white")


# Loðna



geoplot(lodna.2,type="l")
geosymbols(lodna.2,z=lodna.2$z,perbars=0.15)

geoplot(lodna.2,type="l")
lev <- c(100,500,2000)
geosymbols(lodna.2,z=lodna.2$z,parbars=0.05,levels=lev,col=c(2,50,100,150),colplot=T)
