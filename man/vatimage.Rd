\name{vatimage}
\alias{vatimage}
\title{Generate ordered dissimilarities matrix for VAT analysis}
\usage{
vatimage(x, normalize=FALSE, disp=TRUE)
}

\arguments{
  \item{x}{A numeric matrix containing the data.}
  \item{normalize}{A logical value whether the the ordered dissimilarities matrix will be normalized or not. The default is FALSE.}
  \item{disp}{A logical value whether the the ordered dissimilarities image will be displayed or not. The default is TRUE.}
}

\description{
  This function generates the ordered dissimilarity matrix (ODM) for VAT analysis. ODM can be also displayed as an ordered dissimilarity image (ODI).
}

\details{
 The function works as below:
 \itemize{
  \item {1.}{Compute the dissimilarity (DM) matrix between the objects in the examined dataset using the Euclidean distance measure.}
  \item {2.}{Reorder the DM for arranging the similar objects are close to each other. The obtained matrix form ordering operation is called as the ordered dissimilarities matrix (ODM).}
  \item {3.}{If required the ODM can be visually inspected as the image (ODI).}
  \item {4.}{Computed ODM and DM are returned as a list for further analysis in order to count the rectangular block located on the diagonal of ODM.}
  }
}

\value{
 \item{odm}{Ordered dissimilarities matrix}
 \item{dm}{Original dissimilarities matrix}
}

\references{
Cebeci, Z. & Yildiz, F. (2015). Gorsel Kumelenme Egilimi Degerlendirmesi ve R'de Uygulamasi. \emph{Cukurova Universitesi Ziraat Fakultesi Dergisi}, 30 (2), 1-8. 
(URL: \href{https://dergipark.org.tr/en/download/article-file/219860}{https://dergipark.org.tr/en/download/article-file/219860})
}

\author{Zeynel Cebeci}
\seealso{
 \code{\link{findk}},
 \code{\link{findk2}},
 \code{\link{genbinimg}},
 \code{\link{vatdisp}}
}

\examples{
# Load the dataset iris and use the first four feature columns 
data(protcarbo)
vatdisp(protcarbo, renk="cm", t=60)
# Run vatimage to build ordered dissimilarities matrix 
vatmat <- vatimage(x, disp=FALSE)$odm
# Find the number of clusters
k <- findk(vatmat, t=0.7)$k
print(k)
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