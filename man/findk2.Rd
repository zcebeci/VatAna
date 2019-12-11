\name{findk2}
\alias{findk2}
\title{Finding the well-seperated clusters in a dataset}
\usage{
findk2(img, disp=TRUE)
}
\arguments{
  \item{img}{A binary image matrix of dissimilarities. It is produced by using the function binimage.}
  \item{disp}{A logical value whether the binary image will be displayed or not. The default value is TRUE.}
}
\description{
Counts the rectangular blocks by moving the diagonal of a binary image. The count is returned as the estimation of the number of well-separated clusters for the given dataset.
}
\details{
This function counts the overlapped rectangle blocks as one block.
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
 \code{\link{binimage}},
 \code{\link{findk}},
 \code{\link{genbinimg}},
 \code{\link{greyimage}},
 \code{\link{vatimage}},
 \code{\link{vatdisp}}
}

\examples{
# Load the dataset protcarbo 
data(protcarbo) 
# Obtain the ODM matrix for VAT analysis
vatmat <- vatimage(protcarbo, disp=TRUE)$odm
greymat <- greyimage(vatmat, greylevel=256)
binmat <- binimage(greymat, method="otsu")$binimg
# Find the number of clusters
k <- findk2(binmat, disp=TRUE)
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