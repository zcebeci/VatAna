genbinimg <- function(nb=10, disp=TRUE, seed=NULL){
  rotimage  <- function(img, clockwise=TRUE){
    if(clockwise) t(apply(img, 2, rev))
    else apply(t(img), 2, rev)
  }
  if(!is.null(seed)) set.seed(seed)
  sampdata <- sample(1:nb, nb, replace=T)    # Set block width on x-axis randomly 
  permutedata <- permute(sampdata)           # Permute block widths for making sums as fixed
  totnb <- sum(sampdata)
  img <- matrix(TRUE, totnb, totnb)  # Binary image matrix
  # Assign 1 to diagonal elements
  tot1 <- 1 ; tot2 <- 1
  for(i in 1:nb){
    img[tot1:(tot1 + sampdata[i]-1), tot2:(tot2 + permutedata[i]-1)] <- 0
    tot1 <- tot1 + sampdata[i]
    tot2 <- tot2 + permutedata[i]
  }
  # Count blocks on diagonal of the generated image
  cnt1 <- 1 ;  cnt2 <- 1
  nbc <- 0
  while(cnt1 <= totnb && cnt2 <= totnb){
    while(cnt1 < totnb && img[cnt1+1, cnt2] == 0){
       cnt1 <- cnt1 + 1
    }
    while(cnt2 < totnb && img[cnt1, cnt2+1] == 0){
       cnt2 <- cnt2 + 1
    }
    nbc <-nbc + 1
    cnt1 <- cnt1 + 1
    cnt2 <- cnt2 + 1
  }
  img <- rotimage(img)
  if(disp){ # Display the binary image if required
    image(img, col=grey(0:1), xaxt="n", yaxt="n")  
    title("Binary image")
  }
  return(list(binimg=img, k=nbc))
}