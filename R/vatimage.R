# Generate ordered dissimilarities matrix (ODM)
vatimage <- function(x, normalize=FALSE, disp=TRUE){
  if (missing(x)) stop("Data matrix is missing!")
  if (is.null(x)) stop("Data matrix is null!")
  x <- as.matrix(x)
  n <- nrow(x)
  if (any(is.na(x))) stop("Missing values are not allowed in the data matrix!")
  if (!is.numeric(x)) 
     stop("Data matrix should be a numeric matrix!")
  if(typeof(x)!= "dist")
     D <- as.matrix(dist(x))
  else
     D <- x
  if(normalize)
     D <- (D-min(D))/(max(D)-min(D))
  I <- rep(0, n)
  P <- c()
  mx <- which(D == max(D), arr.ind=TRUE)[2]
  I[mx] <- 1
  P[1] <- mx
  for (i in 2:n){
     Dr <- matrix(D[I > 0, ], nrow=sum(I))
     Dr[, I == 1] <- max(Dr)
     mn <- (which(Dr == min(Dr), arr.ind=TRUE))[2]
     I[mn] <- 1
     P[i] <- mn
  }
  odm <- D[P, rev(P)]
  if(disp)
     image(odm, col = grey(seq(0, 1, length = 256)), 
        xlab = "", ylab = "", xaxt = "n", yaxt = "n", main = "Ordered Dissimilarities Image")
  return (list(odm=odm, dm=D))
}
