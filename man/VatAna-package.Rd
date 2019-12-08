\name{VatAna-package}
\alias{VatAna-package}
\docType{package}
\title{Visual Assessment of Clustering Tendency for Finding the Number of Clusters in a Dataset}

\description{
The package \pkg{VatAna} provides the functions related to the Visual Assessment of Cluster Tendency (VAT) algorithm proposed by Bezdek & Hathaway (2002).
}

\details{
The partitioning algorithms require a priori estimate of number of clusters (\code{k}) as an input parameter, and thus the success of partitioning depends mostly on this parameter. In order to find an optimal estimation of \code{k}, the obtained results are checked by the cluster validity indices at the end of each run of successive cluster analyses. Unfortunately, this kind of cluster validation is time consuming task, and also depends on the clustering indices which may not guarantee the quality of clustering since their performances vary with complexity in data structures (Cebeci, Kavlak & Yildiz, 2017). In order to find an optimal  number  of  clusters  in  datasets alternatively, one  also can  benefit from the visual techniques like visual assessment of clustering tendency (VAT) algorithm for finding the \code{k} in order to start a clustering session. The  VAT is a frontier algorithm which produces a gray-level image  of reordered distance matrix showing existing clustering with dark rectangular blocks along the diagonal of it. 

The function  \code{\link[VatAna:vatimage]{VatAna::vatimage}} of the package builds the ordered dissimilarities matrix (ODM) to be displayed as an image (ODI) for visual inspection as introduced in Bezdek & Hathaway (2002). 

The function \code{\link[VatAna:vatdisp]{VatAna::vatdisp}} displays all or any of dissimilarities images such as DM, ODM or BDM.

The function \code{\link[VatAna:findk]{VatAna::findk}} counts the dark blocks by moving the edges of them as described by Cebeci and Yildiz (2015). The counted number of blocks is proposed as the number of clusters in the examined dataset.  

The function \code{\link[VatAna:findk2]{VatAna::findk2}} counts the dark blocks by moving the diagonal of ODM of them as described by Cebeci and Yildiz (2015). This function can not discrimnate the overlapped blocks and finds less number of blocks than the function \code{findk}. The counted number of blocks is proposed as the number of clusters for the examined dataset.  

For test purposes, the function \code{\link[VatAna:genbinimg]{VatAna::genbinimg}} generates the artificial binary images containing a number of user-defined blocks.

The package also contains a dataset named \code{\link[VatAna:protcarbo]{VatAna::protcarbo}}, has 3 actual clusters with 2 variables and 15 rows. It can be used for testing the success to find the optimal numbcer of cluster using different threshold levels in generation of binary image matrices.

For finding the optimal number of clusters in a dataset:
a) First run \code{\link[VatAna:vatimage]{VatAna::vatimage}} with the dataset.
b) In order to get a proposal for the number of clusters in the dataset run \code{\link[VatAna:findk2]{VatAna::findk}} and/or \code{\link[VatAna:findk2]{VatAna::findk2}} using ODM from the result of previous step.
c) In order for visual inspection for VAT, draw the images of dissimilarities matrices using the function \code{\link[VatAna:vatdisp]{VatAna::vatdisp}}.
}

\references{

Bezdek, J. C., & Hathaway, R. J. (2002). VAT: A tool for visual assessment of (cluster) tendency. In \emph{Proceedings of the 2002 International Joint Conference on Neural Networks}. IJCNN'02 (Cat. No. 02CH37290), Vol. 3, pp. 2225-2230. IEEE.

Cebeci, Z. & Yildiz, F. (2015). Gorsel Kumelenme Egilimi Degerlendirmesi ve R'de Uygulamasi. \emph{Cukurova Universitesi Ziraat Fakultesi Dergisi}, 30 (2), 1-8. 
(URL: \href{https://dergipark.org.tr/en/download/article-file/219860}{https://dergipark.org.tr/en/download/article-file/219860})

Cebeci, Z., Kavlak, A. T. & Yildiz, F. (2017). Validation of fuzzy and possibilistic clustering results. In \emph{International Artificial Intelligence and Data Processing Symposium (IDAP 2017)}, pp. 1-7. \href{https://doi.org/10.1109/IDAP.2017.8090183}{<doi:10.1109/IDAP.2017.8090183>}. IEEE.
}

\author{Zeynel Cebeci}

\seealso{
 \code{\link{findk}},
 \code{\link{findk2}},
 \code{\link{genbinimg}},
 \code{\link{vatimage}},
 \code{\link{vatdisp}}
}

\concept{visual assessment of clustering tendency}
\concept{number of clusters}
\concept{clustering validity}
\concept{cluster analysis}
\concept{pattern discovery}
\concept{unsupervised learning}

\keyword{cluster}
\keyword{multivariate}