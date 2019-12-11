vatdisp <- function(x, renk="grey", which=0, greylevel=256){
  resimg <- vatimage(x, disp=FALSE)   
  DM <- resimg$dm 
  ODM <- resimg$odm
  GDM <- greyimage(ODM, greylevel=greylevel) 
  BDM <- binimage(GDM, disp=FALSE)
  BDM <- BDM$binimg
  if(renk=="cm") renk <- cm.colors(256)
  else if(renk=="heat") renk <- heat.colors(256)
  else if(renk=="terrain") renk <- terrain.colors(256)
  else if(renk=="topo") renk <- topo.colors(256)
  else if(renk=="grey") renk <- grey(seq(0, 1, length=256))
  else stop("Color options are: 'cm', 'heat', 'terrain', 'topo'. The default is 'grey'.")
  opar <- par()
  if(which==0){
     opar <- par(mfrow=c(2,2)) 
  }else{
     opar <- par(mfrow=c(1,1)) 
  }
  if(which==0 | which==1){
    histo <- hist(GDM, breaks=c(0:greylevel-1), plot=TRUE, col=4, xlab="", font.main=12)$counts
  }
  if(which==0 | which==2){
    image(DM, col=renk, xlab = "", ylab = "", xaxt = "n", yaxt = "n")
    title(main="Original dissimilarities", font.main=12)
  }
  if(which==0 | which==3){
    image(ODM, col=renk, xlab = "", ylab = "", xaxt = "n", yaxt = "n")
    title(main="Ordered  dissimilarities", font.main=12)
  }
  if(which==0 | which==4){
    image(BDM, col=renk, xlab = "", ylab = "", xaxt = "n", yaxt = "n")
    title(main="Binary ordered dissimilarities", font.main=12)
  }
  par(opar)
}