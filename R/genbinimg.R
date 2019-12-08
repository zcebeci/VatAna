genbinimg <- function(nb=10, disp=TRUE, seed=NULL){
  rotate  <- function(x, clockwise=TRUE){
    if(clockwise) t(apply(x, 2, rev))
    else apply(t(x), 2, rev)
  }
  if(!is.null(seed)) set.seed(seed)
  sampdata <- sample(1:10, nb, replace=T)    # Set block width on x-axis randomly 
  permutedata <- permute(sampdata)           # Permute block widths for making sums as fixed
  totnb <- sum(sampdata)
  dmat <- matrix(TRUE, totnb, totnb)  # Binary image matrix
  # Assign 1 to diagonal elements
  tot1 <- 1 ; tot2 <- 1
  for(i in 1:nb){
    dmat[tot1:(tot1 + sampdata[i]-1), tot2:(tot2 + permutedata[i]-1)] <- FALSE
    tot1 <- tot1 + sampdata[i]
    tot2 <- tot2 + permutedata[i]
  }
  if(disp){ # Display binary image if required
    image(dmat)  
    title("binary image")
  }
  # Count blocks on diagonal of the generated image
  cnt1 <- 1 ;  cnt2 <- 1
  nbc <- 0
  while(cnt1 <= totnb && cnt2 <= totnb){
    while(cnt1 < totnb && dmat[cnt1+1, cnt2] == FALSE){
       cnt1 <- cnt1 + 1
    }
    while(cnt2 < totnb && dmat[cnt1, cnt2+1] == FALSE){
       cnt2 <- cnt2 + 1
    }
    nbc <-nbc + 1
    cnt1 <- cnt1 + 1
    cnt2 <- cnt2 + 1
  }
  return(list(binimg=rotate(dmat), k=nbc))
}