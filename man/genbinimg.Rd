\name{genbinimg}
\alias{genbinimg}
\title{Generating a binary image}
\usage{
genbinimg(nb=10, disp=TRUE, seed=NULL)
}
\arguments{
  \item{nb}{An integer describes the number of rectangle blocks to be generated on the diagonal of binary image.}
  \item{disp}{A logical value whether generated binary image will be displayed or not. The default value is TRUE.}
  \item{seed}{An integer for reproducibility purpose. The default value is NULL.}
}
\description{
Generates a binary image matrix having the rectangular blocks through its diagonal.
}
\details{
This function is used to generate binary images in different structures in order to test the performance of an examined VAT algorithm.
}

\value{
 \item{binimg}{Matrix for generated binary image.}
 \item{k}{An integer for the number of clusters.}
}

\references{
Cebeci, Z. & Yildiz, F. (2015). Gorsel Kumelenme Egilimi Degerlendirmesi ve R'de Uygulamasi. \emph{Cukurova Universitesi Ziraat Fakultesi Dergisi}, 30 (2) : 1-8. 
(URL: \href{https://dergipark.org.tr/en/download/article-file/219860}{https://dergipark.org.tr/en/download/article-file/219860})
}

\author{Zeynel Cebeci}

\seealso{
 \code{\link{binimage}},
 \code{\link{findk}},
 \code{\link{findk2}},
 \code{\link{greyimage}},
 \code{\link{vatimage}},
 \code{\link{vatdisp}}
}

\examples{
# Generate a binary image with 5 rectangle blocks on its diagonal
genbinimg(nb=5, disp=TRUE, seed=1923)

# Generate a binary image with 10 rectangle blocks on its diagonal
imgres <- genbinimg(nb=10, disp=FALSE)
binmat <- imgres$binimg
image(binmat)
}

\concept{number of clusters}
\concept{validation of clustering}
\concept{clustering validity}
\concept{cluster analysis}
\concept{binary image}
\concept{count blocks}

\keyword{cluster}
\keyword{multivariate}