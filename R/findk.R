# Counts the overlapped and separated blocks in a binary image
findk <- function(img, disp=FALSE){
  if(disp){   # Display binary image if required
    image(img, col=grey(0:1), xlab = "", ylab = "", xaxt = "n", yaxt = "n")
    title(main="Binary image", font.main=15)
  }
  n <- nrow(img)
  i <- n
  j <- 1 
  k <- 1
  yon <- c()
  while(i >= 2){
    if(!img[i,j]){
      yon <- c(yon, "h")
      j <- j+1
      if(j > n) break
    }else{
      yon <- c(yon, "v")
      i <- i-1
     }
  }
  for(i in 2:length(yon)){
     if(yon[i]!=yon[i-1] & yon[i-1]=="h") k <- k+1
  }
  return(list(k=k, edges=yon))
}