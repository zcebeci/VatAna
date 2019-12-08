\name{findk2}
\alias{findk2}
\title{Finding the well-seperated clusters in a dataset}
\usage{
findk2(img, t=NULL, disp=TRUE)
}
\arguments{
  \item{img}{A numeric matrix containing the ordered dissimilarities or a binary image matrix of dissimilarities.}
  \item{t}{A integer threshold value between 0 and 255. It is used for converting an image to binary image. The default value is the median of dissimilarities matrix.}
  \item{disp}{A logical value whether the binary image will be displayed or not. Default is TRUE.}
}
\description{
Counts the rectangular blocks by moving the diagonal of a binary image. The count is returned as the number of well-separated clusters in the given dataset.
}
\details{
This function evaluates the overlapped rectangle blocks as a single cluster.
}

\value{
 \item{k}{Number of clusters}
}

\references{
Cebeci, Z. & Yildiz, F. (2015). Gorsel Kumelenme Egilimi Degerlendirmesi ve R'de Uygulamasi. \emph{Cukurova Universitesi Ziraat Fakultesi Dergisi}, 30(2):1-8. 
(URL: \href{https://dergipark.org.tr/en/download/article-file/219860}{https://dergipark.org.tr/en/download/article-file/219860})
}

\author{Zeynel Cebeci}

\seealso{
 \code{\link{findk}},
 \code{\link{genbinimg}},
 \code{\link{vatimage}},
 \code{\link{vatdisp}}
}

\examples{
# Load the dataset protocarbo 
data(protcarbo) 
# Obtain the ODM matrix for VAT analysis
vatmat <- vatimage(protcarbo, disp=TRUE)$odm
# Find the number of clusters
k <- findk2(vatmat, t=50, disp=TRUE)
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