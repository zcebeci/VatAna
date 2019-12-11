\name{greyimage}
\alias{greyimage}
\title{Generate grey version of the ordered dissimilarities matrix}
\usage{
greyimage(img, greylevel=256, disp=FALSE)
}

\arguments{
  \item{img}{A numeric matrix containing the ordered dissimilarities.}
  \item{greylevel}{An integer describing the levels of grey image to be generated. Usual levels are 8, 16, 128 and 256. The default value is 256.}
 \item{disp}{A logical value whether the grey-level dissimilarities image will be displayed or not. The default is TRUE.}
}

\description{
  This function generates the grey-level version of the ordered dissimilarity matrix (ODM) for VAT analysis. 
}

\details{
If lower grey-levels are selected the blocks in the image can be seen more easily.
}

\value{
 \item{img}{Grey-level ordered dissimilarities matrix}
}

\references{
Cebeci, Z. & Yildiz, F. (2015). Gorsel Kumelenme Egilimi Degerlendirmesi ve R'de Uygulamasi. \emph{Cukurova Universitesi Ziraat Fakultesi Dergisi}, 30 (2), 1-8. 
(URL: \href{https://dergipark.org.tr/en/download/article-file/219860}{https://dergipark.org.tr/en/download/article-file/219860})
}

\author{Zeynel Cebeci}
\seealso{
 \code{\link{binimage}},
 \code{\link{findk}},
 \code{\link{findk2}},
 \code{\link{genbinimg}},
 \code{\link{vatimage}},
 \code{\link{vatdisp}}
}

\examples{
# Load the dataset protcarbo
data(protcarbo)

# Run vatimage to build ordered dissimilarities matrix 
vatmat <- vatimage(protcarbo, disp=FALSE)$odm

# Generate the grey-level ordered dissimilarities matrix with 256 grey levels.
greymat <- greyimage(vatmat, disp=TRUE)
head(greymat)

# Generate the grey-level ordered dissimilarities matrix with 16 grey levels.
greymat2 <- greyimage(vatmat, greylevel=16, disp=TRUE)
head(greymat2)
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