binimage <- function(img, method="otsu", t=NULL, q=0.10, greylevel=256, disp=FALSE){

  # Otsu thresholding method
  otsu <- function(img, greylevel=256){
    mx <- dim(img)[1]
    my <- dim(img)[2]
    histo <- numeric(greylevel)
    # Generate greyscale histogram
    for(x in 1:mx)
      for (y in 1:my){
        pix <- img[x, y]+1
        histo[pix] <- histo[pix]+1
      }
    # Calculate the relative frequencies of histogram
    npix <- mx*my
    histo <- histo/npix
    ut <- 0
    for(i in 1:greylevel)
      ut <- ut + i*histo[i]
    maxk <- 0
    maxsigmak <- 0
    for(k in 1:greylevel){
      wk <- 0
      for(i in 1:k)
        wk <- wk + histo[i]
      uk <- 0
      for (i in 1:k)
        uk <- uk + i * histo[i]     
      sigmak <- 0
      if(wk != 0 && wk != 1)
        sigmak <- ((ut * wk - uk)*(ut * wk - uk)) / (wk * (1 - wk))
      if (sigmak > maxsigmak){
        maxk <- k
        maxsigmak <- sigmak
      }
    }
    # Build the binary image
    for (x in  1:mx)
      for (y in 1:my){
        if(img[x,y] < maxk)
         img[x,y] <- 0
      else
        img[x,y] <- 1
    }
    return(list(binimg=img, threshold=maxk))
  }

  # User-defined threshold
  fixed <- function(img, t){
    if(is.null(t)) t <- floor(mean(img)) 
    img[img < t] <- 0
    img[img > t] <- 1
    return(list(binimg=img, threshold=t))
  }

  # Automatic detection method
  auto <- function(img){
    t <- floor(sqrt(2*sd(img)^2*log(nrow(img))/nrow(img)))
    img[img < t] <- 0
    img[img > t] <- 1
    return(list(binimg=img, threshold=t))
  }

  # Quantile method
  quant <- function(img, q=0.10){
    t <- floor(unname(quantile(img, prob=q)))
    img[img < t] <- 0
    img[img > t] <- 1
    return(list(binimg=img, threshold=t))
  }

  # Median method
  median <- function(img, greylevel){
    t <- floor(0.5*greylevel)
    img[img < t] <- 0
    img[img > t] <- 1
    return(list(binimg=img, threshold=t))
  }

  if(method=="fixed"){
     resbin <- fixed(img, t)
     binimg <- resbin$binimg
     threshold <- resbin$threshold
  }else if(method=="quant"){ 
     resbin <- quant(img, q)
     binimg <- resbin$binimg
     threshold <- resbin$threshold
  }else if(method=="auto"){ 
     resbin <- auto(img)
     binimg <- resbin$binimg
     threshold <- resbin$threshold
  }else if(method=="median"){ 
     resbin <- median(img, greylevel)
     binimg <- resbin$binimg
     threshold <- resbin$threshold
  }else{ 
     resbin <- otsu(img, greylevel)
     binimg <- resbin$binimg
     threshold <- resbin$threshold
  }

  if(disp) image(binimg, col=grey(c(0,1)))
  return(list(binimg=binimg, threshold=threshold))
}
