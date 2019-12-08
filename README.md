# VatAna
## *Visual Assessment of Clustering Tendency for Finding the Number of Clusters in a Dataset*

`VatAna` is an R package which is an implementation of the *Visual Assessment of Cluster Tendency (VAT)* algorithm proposed by Bezdek & Hathaway (2002).

## Introduction
The partitioning algorithms require a priori estimate of number of clusters (k) as an input parameter, and thus the success of partitioning depends mostly on this parameter. In order to find an optimal estimation of k, the obtained results are checked by the cluster validity indices at the end of each run of successive cluster analyses. Unfortunately, this kind of cluster validation is time consuming task, and also depends on the clustering indices which may not guarantee the quality of clustering since their performances vary with complexity in data structures. In order to find an optimal  number  of  clusters  in  datasets, one  can  benefit  from the  preprocessing approaches like visual assessment of clustering tendency algorithm before  going to clustering session. The  visual assessment of clustering tendency (VAT) is a frontier algorithm which produces a gray-level image  of reordered distance  matrix showing existing clusters with dark blocks along the diagonal of it. This R package provides various functions related with VAT analysis and demonstrates its usage with the examples. 

## Install the package 'VatAna'
In order to install the package `VatAna` from the GitHub repository you should first install the `devtools` package from CRAN into your local system. Then you can install the package  `VatAna` using `install_github` of `devtools` package as in the R code chunks below:

```{r}
if(!require(devtools)) {install.packages('devtools'); library(devtools)}
install_github("zcebeci/VatAna")
```
If you would like to have a compiled version of the vignettes of the package try to install the package `fcvalid` using `install_github` with `build_vignettes` argument set to TRUE as shown below:

```{r}
if(!require(devtools)) {install.packages('devtools'); library(devtools)}
 devtools::install_github("zcebeci/VatAna", build_vignettes=TRUE)
```
If you have not already installed `rmarkdown` and `prettydoc` in your local system, before running the above install commands firstly install these packages as following:

 ```{r}
install.packages('prettydoc')
```

## Load the package into R working space
After you installed the package `VatAna`, run the following command in order to load it to R working space.

```{r}
library(VatAna)
```

## Help for the package
To get help about the use of functions included in the package `VatAna`, run `help` in R as seen in the following code chunk.

```{r}
help(package="VatAna")
```
For reaching the detailed vignette about the usage of package with examples, run the following command and then click *HTML* link on the accessed page in your web browser. Read the vignette and apply the examples.

```{r}
browseVignettes("VatAna")
```

## Cite the package
To cite the package please use one of the following items fits to your references list:

Cebeci, Z. & Yildiz, F. (2015). Görsel Kümelenme Eğilimi Değerlendirmesi ve R'de Uygulaması. \emph{Cukurova Universitesi Ziraat Fakultesi Dergisi}, 30 (2), 1-8. 
(URL: \href{https://dergipark.org.tr/en/download/article-file/219860}{https://dergipark.org.tr/en/download/article-file/219860})

or in BibTeX format:
```
@article{cebeci30gorsel,
  title={G{\"o}rsel K{\"u}melenme E{\u{g}}ilimi De{\u{g}}erlendirmesi ve R’de Uygulamas{\i}},
  author={Cebeci, Zeynel and Yildiz, Figen},
  journal={{\c{C}}ukurova {\"U}niversitesi Ziraat Fak{\"u}ltesi Dergisi},
  volume={30},
  number={2},
  pages={1--8}
}
 ```
