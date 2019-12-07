Fig5 <- function(filename=NULL, width=3.7, height=3.4, pointsize=8)
{
  if(!is.null(filename))
    eps(filename, width, height, pointsize)

  pan01$period <- as.integer(1)
  pan01$period[pan01$year>1966] <- as.integer(2)
  pan01$period[pan01$year>1979] <- as.integer(3)

  tab <- table(PPAN2=pan01$PPAN2, period=pan01$period, age=pan01$age)
  tab <- as.table(prop.table(tab[,,as.character(4:11)], 2:3))
  df <- as.data.frame(tab)
  df$age <- as.integer(as.character(df$age))
  df$period <- as.integer(as.character(df$period))
  df <- df[order(df$PPAN2, df$period),]
  row.names(df) <- 1:nrow(df)

  xlim <- c(3.5,11.5)
  ylim <- c(-0.1,1.1)
  mgp.x <- c(2.0,0.3,0)
  mgp.x2 <- c(1.2,0.3,0)
  mgp.y <- c(3.0,0.3,0)
  mgp.y2 <- c(1.3,0.5,0)
  cex.lab <- 1
  cex.axis <- 0.9
  cex.point <- 0.7
  tcl <- -0.3
  pch <- 16
  lwd.grid <- 0.3

  ## Upper row (AA)
  opar <- par(plt=c(x=0.2,0.4, y=0.65,0.87), no.readonly=TRUE)
  plot(NA, ann=FALSE, axes=FALSE, xlim=xlim, ylim=ylim)
  abline(h=seq(0,1,0.25),lty=1,lwd=lwd.grid,col="lightgray"); box()
  points(Freq~age, data=df, subset=PPAN2=="AA"&period==1, pch=pch, cex=cex.point)
  axis(2, at=seq(0,1,0.25), las=1, mgp=mgp.y, tick=FALSE, cex.axis=cex.axis)
  title(main="Period 1", font.main=1, cex.main=cex.lab, line=mgp.x2[1])
  par(plt=c(x=0.4,0.6, y=0.65,0.87), new=TRUE)
  plot(NA, ann=FALSE, axes=FALSE, xlim=xlim, ylim=ylim)
  abline(h=seq(0,1,0.25),lty=1,lwd=lwd.grid,col="lightgray"); box()
  points(Freq~age, data=df, subset=PPAN2=="AA"&period==2, pch=pch, cex=cex.point)
  title(main="Period 2", font.main=1, cex.main=cex.lab, line=mgp.x2[1])
  par(plt=c(x=0.6,0.8, y=0.65,0.87), new=TRUE)
  plot(NA, ann=FALSE, axes=FALSE, xlim=xlim, ylim=ylim)
  abline(h=seq(0,1,0.25),lty=1,lwd=lwd.grid,col="lightgray"); box()
  points(Freq~age, data=df, subset=PPAN2=="AA"&period==3, pch=pch, cex=cex.point)
  title(main="Period 3", font.main=1, cex.main=cex.lab, line=mgp.x2[1])

  ## Center row (AB)
  par(plt=c(x=0.2,0.4, y=0.40,0.62), new=TRUE)
  plot(NA, ann=FALSE, axes=FALSE, xlim=xlim, ylim=ylim)
  abline(h=seq(0,1,0.25),lty=1,lwd=lwd.grid,col="lightgray"); box()
  points(Freq~age, data=df, subset=PPAN2=="AB"&period==1, pch=pch, cex=cex.point)
  axis(2, at=seq(0,1,0.25), las=1, mgp=mgp.y, tick=FALSE, cex.axis=cex.axis)
  par(plt=c(x=0.4,0.6, y=0.40,0.62), new=TRUE)
  plot(NA, ann=FALSE, axes=FALSE, xlim=xlim, ylim=ylim)
  abline(h=seq(0,1,0.25),lty=1,lwd=lwd.grid,col="lightgray"); box()
  points(Freq~age, data=df, subset=PPAN2=="AB"&period==2, pch=pch, cex=cex.point)
  par(plt=c(x=0.6,0.8, y=0.40,0.62), new=TRUE)
  plot(NA, ann=FALSE, axes=FALSE, xlim=xlim, ylim=ylim)
  abline(h=seq(0,1,0.25),lty=1,lwd=lwd.grid,col="lightgray"); box()
  points(Freq~age, data=df, subset=PPAN2=="AB"&period==3, pch=pch, cex=cex.point)

  ## Lower row (BB)
  par(plt=c(x=0.2,0.4, y=0.15,0.37), new=TRUE)
  plot(NA, ann=FALSE, axes=FALSE, xlim=xlim, ylim=ylim)
  abline(h=seq(0,1,0.25),lty=1,lwd=lwd.grid,col="lightgray"); box()
  points(Freq~age, data=df, subset=PPAN2=="BB"&period==1, pch=pch, cex=cex.point)
  axis(1, at=seq(4,10,2), mgp=mgp.x, tcl=tcl, cex.axis=cex.axis)
  axis(2, at=seq(0,1,0.25), las=1, mgp=mgp.y, tick=FALSE, cex.axis=cex.axis)
  par(plt=c(x=0.4,0.6, y=0.15,0.37), new=TRUE)
  plot(NA, ann=FALSE, axes=FALSE, xlim=xlim, ylim=ylim)
  abline(h=seq(0,1,0.25),lty=1,lwd=lwd.grid,col="lightgray"); box()
  points(Freq~age, data=df, subset=PPAN2=="BB"&period==2, pch=pch, cex=cex.point)
  axis(1, at=seq(4,10,2), mgp=mgp.x, tcl=tcl, cex.axis=cex.axis)
  par(plt=c(x=0.6,0.8, y=0.15,0.37), new=TRUE)
  plot(NA, ann=FALSE, axes=FALSE, xlim=xlim, ylim=ylim)
  abline(h=seq(0,1,0.25),lty=1,lwd=lwd.grid,col="lightgray"); box()
  points(Freq~age, data=df, subset=PPAN2=="BB"&period==3, pch=pch, cex=cex.point)
  axis(1, at=seq(4,10,2), mgp=mgp.x, tcl=tcl, cex.axis=cex.axis)

  ## Outer annotation
  par(plt=c(x=0.2,0.8, y=0.15,0.87), new=TRUE); frame()
  title(xlab="Age", mgp=mgp.x, cex.lab=cex.lab)
  title(ylab="Relative frequency", mgp=mgp.y, cex.lab=cex.lab)
  mtext(side=4, "AA", at=0.86, las=1, line=mgp.y2[1], cex=cex.lab)
  mtext(side=4, "AB", at=0.50, las=1, line=mgp.y2[1], cex=cex.lab)
  mtext(side=4, "BB", at=0.14, las=1, line=mgp.y2[1], cex=cex.lab)

  if(!is.null(filename))
  {
    dev.off()
    eps2pdf(filename)
  }
  else
  {
    par(opar)
  }
}
