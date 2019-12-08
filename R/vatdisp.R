vatdisp <- function(x, t=NULL, renk="grey", which=0){
  resimg <- vatimage(x, disp=FALSE)   
  DM <- resimg$dm 
  ODM <- resimg$odm
  if(is.null(t)) t <- quantile(resimg$odm)[4]
  BDM <- resimg$odm > t
  if(renk=="cm") renk <- cm.colors(256)
  else if(renk=="heat") renk <- heat.colors(256)
  else if(renk=="terrain") renk <- terrain.colors(256)
  else if(renk=="topo") renk <- topo.colors(256)
  else if(renk=="grey") renk <- grey(seq(0, 1, length=256))
  else stop("Color should be one of these: 'cm', 'heat', 'terrain', 'topo'.The default is 'grey'.")
  opar <- par()
  if(which==0){
     opar <- par(mfrow=c(2,2)) 
     plot(x[,1], x[,2], xlab="", ylab="", pch=20, col=1, main="Scatter plot the first two features")
  }else{
     opar <- par(mfrow=c(1,1)) 
  }
  if(which==0 | which==1){
    image(DM, col=renk, xlab = "", ylab = "", xaxt = "n", yaxt = "n")
    title(main="Original dissimilarities image (DI)", font.main=15)
  }
  if(which==0 | which==2){
    image(ODM, col=renk, xlab = "", ylab = "", xaxt = "n", yaxt = "n")
    title(main="Ordered  dissimilarities image (ODI)", font.main=15)
  }
  if(which==0 | which==3){
    image(BDM, col=renk, xlab = "", ylab = "", xaxt = "n", yaxt = "n")
    title(main="Binary ordered dissimilarities image (BODI)", font.main=15)
  }
  par(opar)
}