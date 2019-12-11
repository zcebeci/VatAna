findk2 <- function(img, disp=TRUE){
  if(disp){
    image(img, col=grey(0:1), xlab = "", ylab = "", xaxt = "n", yaxt = "n")
    title(main="Binary image", font.main=15)
  }
  n <- nrow(img)
  j <- 1 
  k <- 1
  for(i in n:2){
     if(!img[i,j])
       if(!img[i-1,j+1] & img[i-1,j] & img[i,j+1]){
          k <- k + 1 
       }
     j <- j + 1
  }
  return(k)
}