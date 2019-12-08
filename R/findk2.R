findk2 <- function(img, t=NULL, disp=TRUE){
  if(!is.null(t)){
      if(t<0 | t>255) stop("t, threshold value msut given in 0 and 255")
      else img <- img > t
  }
  if(disp){
    gray256 <- grey(seq(0, 1, length = 256))
    image(img, col=gray256, xlab = "", ylab = "", xaxt = "n", yaxt = "n")
    title(main="Binary image matrix", font.main=15)
  }
  n <- nrow(img)
  j <- 1 
  k <- 1
  for(i in n:2){
     if(img[i,j]==FALSE)
       if(img[i-1,j+1]==FALSE & img[i-1,j]==TRUE & img[i,j+1]==TRUE){
          k <- k + 1 
       }
     j <- j + 1
  }
  return(k)
}