\name{binimage}
\alias{binimage}
\title{Generate binary ordered dissimilarities matrix for VAT analysis}
\usage{
binimage(img, method="otsu", t=NULL, q=0.10, greylevel=256, disp=FALSE)
}

\arguments{
  \item{img}{A numeric matrix containing the greyscale ordered dissimilarities.}
  \item{method}{A character string describes the name of thresholding method to generate the binary image matrix from the greyscale ordered dissimilarities. The default value is \code{'otsu'} for the Otsu's thresholding method. The option \code{'fixed'} is for describing an user-defined value as the threshold. If it is assigned as the thresholding method, the user should define an integer threshold value with the argument \code{t}, otherwise the arithmetic mean of the matrix is used as the threshold value. The option \code{'auto'} automatically computes the threshold using the formula: \code{sqrt(2*sigma^2 * log(n)/n)}. The option \code{'median'} uses the middle value of greyscale range as the threshold. The \code{'quant'} option computes a user-defined quantile of the dissimilarites. If this method is used, the argument \code{q} should be assigned between 0 and 1. The default value of \code{q} is 0.10 (%10).
 }
  \item{t}{A numeric threshold value for converting the ordered dissimilarities to a binary image matrix. It is used if the method argument is set to \code{fixed}.  The default value is the arithmetic mean of the matrix \code{img}.}
  \item{q}{A numeric quantile value when the method argument is set to \code{quant}.  The default \code{q} value is 0.10.}
  \item{greylevel}{An integer describing the grey levels in the greyscale image. The default value is 256.}
  \item{disp}{A logical value whether the the ordered dissimilarities image will be displayed or not. The default value is \code{TRUE}.}
}

\description{
  This function generates the binary ordered dissimilarity matrix (BDM) for VAT analysis. 
}

\details{
Since this function uses the grey-level dissimilarities matrix as the input, the greyscale image should be generated using the function \code{greyimage} at first.
}

\value{
 \item{binimg}{Binary ordered dissimilarities matrix}
 \item{threshold}{Threshold value computed to generate the binary matrix}
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
 \code{\link{greyimage}},
 \code{\link{vatimage}},
 \code{\link{vatdisp}}

}

\examples{
# Load the dataset iris and use the first four feature columns 
data(protcarbo)
# Run vatimage to build ordered dissimilarities matrix 
vatmat <- vatimage(protcarbo, disp=FALSE)$odm
# Generate grey-level image matrix
greymat <- greyimage(vatmat, greylevel=256, disp=FALSE)
# Generate binary image matrix with automatic thresholding method
binmat <- binimage(vatmat, method="auto", greylevel=256, disp=TRUE)
# Generate binary image matrix with fixed thresholding method
binmat <- binimage(vatmat, method="fixed", t=50, greylevel=256, disp=TRUE)
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