\name{findk}
\alias{findk}
\title{Finding the number of overlapped and well-separated clusters in a dataset}
\usage{
findk(img, t=NULL, disp=FALSE)
}
\arguments{
  \item{img}{A numeric image matrix of the ordered dissimilarities, or a binary image matrix of ordered dissimilarities.} 
  \item{t}{A number to be used as the threshold value between 0 and 255. It is used for converting the image of dissimilarties to a binary image. The default value is median of the image matrix.}
  \item{disp}{A logical value whether binary image will be displayed or not. Default is TRUE.}
}
\description{
Counts the well-separated and overlapping rectangular blocks tracing their edges. The count is proposed as the number of clusters for the given dataset.
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
 \code{\link{findk2}},
 \code{\link{genbinimg}},
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
vatmat <- vatimage(protcarbo, disp=TRUE)$odm
# Find the number of clusters
k <- findk(vatmat, t=50, disp=TRUE)$k
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