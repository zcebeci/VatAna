greyimage <- function(img, greylevel=256, disp=FALSE){
  img <- floor(img/max(img)*(greylevel-1))
  if(disp){
    greypal <- grey(seq(0, 1, length=greylevel))
    image(img, col=greypal)
  }
  return(img)
}
