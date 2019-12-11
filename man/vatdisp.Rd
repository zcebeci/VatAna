\name{vatdisp}
\alias{vatdisp}
\title{Plot the dissimilarities matrices for VAT analysis}
\usage{
vatdisp(x, renk="grey", which=0, greylevel=256)
}
\arguments{
  \item{x}{A numeric matrix containing the data.}
  \item{renk}{A character string to describe the name of color palette to be used in drawing the images. The options are \code{"cm", "gray", "heat", "terrain",} and \code{"topo"}. The default color pallette is \code{"grey"}.}
  \item{which}{An integer indicates the type of plot to be displayed. The options: 1 for histogram, 2 for original dissimilarities matrix, 3 for ordered dissimilarities matrix and 4 for binary image matrix to be used for finding the clusters in the dataset x. The default is 0 for displaying all of the images.}
  \item{greylevel}{An integer between 2 and 256 for grey-level image of the ODM. Usual values are 16, 128, and 256. The default value is 256.}
}
\description{
  This function displays the images of dissimilarity matrices. 
}
\details{
 The images and plots are drew by the functions:
 \enumerate{
  \item Histogram of the original dissimilarities.
  \item Image of original dissimilarities.
  \item Image of the ordered dissimilarities.
  \item Image of the binary version of the ordered dissimilarities.
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
 \code{\link{binimage}},
 \code{\link{findk}},
 \code{\link{findk2}},
 \code{\link{genbinimg}},
 \code{\link{greyimage}},
 \code{\link{vatimage}}
}

\examples{
# Load the dataset protcarbo
data(protcarbo)

# Display the images with default values
vatdisp(protcarbo)

# Display the ODM images with topo colors
vatdisp(protcarbo, which=3, renk="topo")
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