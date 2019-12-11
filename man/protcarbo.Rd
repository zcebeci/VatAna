\name{protcarbo}
\alias{protcarbo}
\title{Dataset of the energy & protein composition of some daily consumed foods}
\usage{
data(protcarbo)
}
\description{
The foods can be clustered using the components of nutritional matters. This dataset contains protein and carbohdyrate content of various daily consumed foods.
}
\details{
 \itemize{
   \item{energy: Energy content of food (kCal/100g)}
   \item{protein: Protein content of food (g/100g)}
 }
}

\value{
A dataframe consists of two columns (variables) and 15 rows (foods).
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
 \code{\link{genbinimg}},
 \code{\link{greyimage}},
 \code{\link{vatimage}},
 \code{\link{vatdisp}}
}

\examples{
# Load the dataset protcarbo 
str(protcarbo)
data(protcarbo) 
head(protcarbo)
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