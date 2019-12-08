\name{vatdisp}
\alias{vatdisp}
\title{Plot the matrices of dissimilarities for VAT analysis}
\usage{
vatdisp(x, t=NULL, renk="grey", which=0)
}
\arguments{
  \item{x}{A numeric matrix containing the data.}
  \item{t}{A numeric threshold value for converting the ordered dissimilarities to a binary image matrix. The defauld is arithmetic mean of matrix.}
  \item{renk}{A character string to describe the name of color palette to be used in drawing the images. The options are \code{"cm", "gray", "heat", "terrain",} and \code{"topo"}. The default color pallette is \code{"grey"}.}
  \item{which}{An integer indicates which type of image matrix displayed. The options are 1 for original dissimilarities matrix, 2 for ordered dissimilarities matrix and 3 for binary image matrix to be used for finding the clusters in the dataset x. The default is 0 for drawing all kind of images.}
}
\description{
  This function displays the images of dissimilarity matrices. 
}
\details{
 The images and plots are drew by the functions:
 \enumerate{
  \item Scatter plot of the first two features in the dataset.
  \item DI: Original dissimilarities image.
  \item ODI: The ordered dissimilarities image.
  \item BDI: Binary version of the ordered dissimilarities image.
  }
}

\value{
 No value is returned.
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
data(iris)
x <- iris[,-5]
# Run vatimage to generate ODM
vatmat <- vatimage(x, disp=TRUE)$odm
# Find the number of clusters using ODM
k <- findk(vatmat, t=0.70)$k
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