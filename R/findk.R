# Counts the overlapped and separated blocks in a binary image
findk <- function(img, t=NULL, disp=FALSE){
  if(!is.null(t)){
      if(t<0 | t>255) stop("t, threshold value msut given in 0 and 255")
      else img <- img > t
  }
  if(disp){     # Display binary image if required
    gray256 <- grey(seq(0, 1, length = 256))
    image(img, col=gray256, xlab = "", ylab = "", xaxt = "n", yaxt = "n")
    title(main="Binary image", font.main=10)
  }
  n <- nrow(img)
  i <- n
  j <- 1 
  k <- 1
  yon <- c()
  while(i >= 2){
    if(!img[i,j]){
      yon <- c(yon, "H")
      j <- j+1
      if(j > n) break
    }else{
      yon <- c(yon, "V")
      i <- i-1
     }
  }
  for(i in 2:length(yon)){
     if(yon[i]!=yon[i-1] & yon[i-1]=="H") k <- k+1
  }
  return(list(k=k, edges=yon))
}