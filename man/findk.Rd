\name{findk}
\alias{findk}
\title{Finding the number of overlapped and well-separated clusters in a dataset}
\usage{
findk(img, disp=FALSE)
}
\arguments{
  \item{img}{A numeric binary image matrix of the ordered dissimilarities. It can be produced by using the function binimage of the package.} 
  \item{disp}{A logical value whether the binary image will be displayed or not. Default is TRUE.}
}
\description{
Counts the well-separated and overlapped rectangular blocks tracing their edges. The count is proposed as the number of clusters for the given dataset.
}
\details{
Tracing the edges starts with the first cell on the last row of binary image matrix. The functions detects the corners of blocks and then changes the moving direction. 
}

\value{
 \item{k}{Number of clusters}
 \item{edges}{Vector of the detected directions for the edges of rectangle blocks.}
}

\references{
Cebeci, Z. & Yildiz, F. (2015). Gorsel Kumelenme Egilimi Degerlendirmesi ve R'de Uygulamasi. \emph{Cukurova Universitesi Ziraat Fakultesi Dergisi}, 30(2):1-8.
(URL: \href{https://dergipark.org.tr/en/download/article-file/219860}{https://dergipark.org.tr/en/download/article-file/219860})
}

\author{Zeynel Cebeci}

\seealso{
 \code{\link{binimage}},
 \code{\link{findk2}},
 \code{\link{genbinimg}},
 \code{\link{greyimage}},
 \code{\link{vatimage}},
 \code{\link{vatdisp}}
}

\examples{
# Generate a binary image having 6 rectangle blocks over its diagonal.
binmat <- genbinimg(nb=6, disp=FALSE)$binimg
k <- findk(binmat, disp=TRUE)$k
cat("Number of clusters detected:", k, "\n")

# Load the dataset protocarbo 
data(protcarbo) 
# Obtain the VAT matrix 
vatmat <- vatimage(protcarbo, disp=FALSE)$odm
greymat <- greyimage(vatmat, greylevel=256)
binmat <- binimage(greymat, method="auto")$binimg
# Find the number of clusters
k <- findk(binmat, disp=TRUE)$k
cat("Number of clusters detected:", k, "\n")
}

\concept{visual assessment of clustering tendency}
\concept{number of clusters}
\concept{validation of clustering}
\concept{clustering validity}
\concept{cluster analysis}
\concept{binary image}
\concept{count blocks}

\keyword{cluster}
\keyword{multivariate}