---
title: 'Visual Assessment Of Clustering Tendency for Finding Number of Clusters in a Dataset'
author: 'Zeynel Cebeci'
date: 'December 13, 2019'
output:
  prettydoc::html_pretty:
    theme: tactile
    highlight: github
    df_print: paged
    number_sections: true
vignette: >
  %\VignetteIndexEntry{Visual Assessment Of Clustering Tendency}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---
<style>
body{
text-align: justify}
</style>

**
`VatAna` is an R package implements the *Visual Assessment of Cluster Tendency (VAT)* algorithm proposed by  Bezdek & Hathaway (2002).
**

To cite this vignette and package 'VatAna', please use one of the following items that fits to your references list:

Cebeci, Z. & Yildiz, F. (2015). Görsel Kümelenme Eğilimi Değerlendirmesi ve R'de Uygulaması. *Çukurova Üniversitesi Ziraat Fakültesi Dergisi*, Vol. 30,  no. 2, pp. 1-8. 
(URL: [https://dergipark.org.tr/en/download/article-file/219860](https://dergipark.org.tr/en/download/article-file/219860)) 

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

# Dataset and Packages

## Install and load the package VatAna
In order to install the package `VatAna` from the GitHub repository you should first install the `devtools` package from CRAN into your local system. Then you can install the package  `VatAna` using `install_github` of `devtools` package as shown with the R code chunks below:

```{r eval=FALSE}
if(!require(devtools)) {install.packages('devtools'); library(devtools)}
install_github("zcebeci/VatAna")
```
If you would like to have a compiled version of the vignettes of the package try to install the package `VatAna` using `install_github` with `build_vignettes` argument set to TRUE as shown below:

```{r eval=FALSE}
if(!require(devtools)) {install.packages('devtools'); library(devtools)}
 devtools::install_github("zcebeci/VatAna", build_vignettes=TRUE)
```
If you have not already installed `rmarkdown` and `prettydoc` in your local system, before running the above install commands firstly install these packages as following:

 ```{r eval=FALSE}
install.packages('prettydoc')
```
If you have already installed '`VatAna`', you can load it into R working environment by using the following command:

```{r, echo=TRUE, message=FALSE, warning=FALSE}
library(VatAna)
```

## Load the data set 
We demonstrate clusterig validation using the package '`VatAna`' on the dataset `protcarbo`  consisting of two features (`energy` and `protein`) of 15 human food. 

```{r comment=NA, echo=TRUE, message=FALSE, warning=FALSE, cols.print=5, rows.print=10}
data(protcarbo)
print(protcarbo)
```
The following R command displays the scatter plots between the feature pairs. 

```{r fig.width=7, fig.height=6}
plot(protcarbo, pch=19, col=4, main="Scatter plot of energy vs protein")
```

# Building the dissimilarities matrices
The function `vatimage` in the package generates the original dissimilarities matrix (DM) and the reordered dissimilarities matrix (ODM) as follows. If the argument `disp` is set to `TRUE`, the matrix ODM is displayed as an image (ODI).

```{r comment=NA, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
resimg <- vatimage(protcarbo, disp=TRUE)
```

Above the result of `vatimage` run was assigned to `resimg` object to use by forthcoming analyses. The original dissimilarities matrix (DM) is extracted from `resimg` and stored in `dm` and then its first 3 rows are displayed for giving an idea about its content.

```{r comment=NA, echo=TRUE, message=FALSE, warning=FALSE}
dm <- resimg$dm
head(dm, 3)
```

In the following code chunk, the reordered dissimilarities matrix (ODM) is built from the `vatimage` run above, and its first 3 rows are displayed for giving an idea about its content.

```{r comment=NA, echo=TRUE, message=FALSE, warning=FALSE}
odm <- resimg$odm
head(odm, 3)
```

# Displaying the dissimilarities matrices

The function `vatdisp` of the package displays the original dissimilarities matrix (DM) and the reordered dissimilarities matrix (ODM) and the binary reordered dissimilarities matrix (BDM).

```{r, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
vatdisp(protcarbo)
```

The default color palette is `"grey"` for the images displayed by `vatdisp`. But users can assign one of following items to the argument `renk` for changing the color palette.

renk  | Used color palette 
-------- | ------------------
`cm`| cm.colors
`grey`| gray256 colors
`heat`| heat.colors
`terrain`|terrain.colors
`topo`|topo.colors

In the following code chunk, `vatdisp` displays the images by using `terrain.colors()` palette.

```{r, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
vatdisp(protcarbo, renk="terrain")
```

One of the images in the figure above can also be displayed as an alone image as shown for the ODM matrix in the following code chunk.

```{r, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
vatdisp(protcarbo, renk="topo", which=3)
```

Binary images are produced with the Otsu Thresholding method. 


```{r, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
vatdisp(protcarbo, renk="grey", which=4)
```

# Greyscale and Binary images

## Greyscale images

In following code chunk, the greyscale image is generated with 256 grey-levels as usual.

```{r, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
godm <- greyimage(odm, greylevel=256, disp=TRUE)
```

In following code chunk, the greyscale image is generated with 16 grey-levels.

```{r, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
godm2 <- greyimage(odm, greylevel=16, disp=TRUE)
```

## Binary images
A binary image is generated by the function `binimage` using a greyscale image which is output of the function `greyscale`. There are several methods for avaliable to build binary images are listed in the package manual. In the following code chunk, the binary image displayed is produced with Otsu thresholding method.

```{r, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
bodm1 <- binimage(godm, method="otsu", disp=TRUE)
```

In the following code chunk, the binary image is produced with the `auto` option using an automatic thresholding value which is calculated from the processed ODM.

```{r, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
bodm2 <- binimage(godm, method="auto", disp=TRUE)
```

In the following code chunk, the binary image is produced with a fixed `t`, a user-defined threshold value.
 
```{r, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
bodm3 <- binimage(godm, method="fixed", t=40, disp=TRUE)
```

# Finding the number of clusters in a dataset

The package `VatAna` has two functions to propose a number of clusters for a given dataset. They work with the different techniques to count the blocks in binary dissimilarities matrices.

## Finding Number Clusters - Method I
The function `findk` finds the number of clusters by tracing the horizontal and vertical borders of the blocks in ODIs. In this way overlapped and well-separated blocks are counted, and the count is proposed as the number of clusters in the dataset. In the following code chunk, the ODM matrix called as `pcodm` is used as the input argument in the call of `findk`, and the computed `k` is returned and displayed.
 
```{r comment=NA, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
resimg <- vatimage(protcarbo, disp=FALSE)
pcodm <- resimg$odm
pcgdm <- greyimage(pcodm)
pcbdm <- binimage(pcgdm, method="otsu")$binimg
k <- findk(pcbdm, disp=TRUE)$k
cat("Proposed number of clusters:", k, "\n")
```

## Finding Number Clusters - Method II

The function `findk2` finds the number of clusters by tracing only along the diagonal of the blocks in ODIs. In this way only the well-separated blocks can be counted. The count is proposed as the number of clusters in the dataset. With the function `findk2` in following code chunk, `pcodm`, the ordered dissimilarities matrix is traced along its diagonal. The count of blocks is proposed as the number of clusters in the dataset`protcarbo`.

```{r comment=NA, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
resimg <- vatimage(protcarbo, disp=FALSE)
pcodm <- resimg$odm
pcgdm <- greyimage(pcodm)
pcbdm <- binimage(pcgdm)$binimg
k <- findk2(pcbdm, disp=TRUE)
print(k)
```

# Generate binary images 
Binary images generated with known number of blocks can be used for testing the performances of block counting algorithms. In the following code chunk a binary image is generated with 6 blocks and processed by the function `findk` and `findk2`, respectively. 

```{r comment=NA, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
bdm1 <- genbinimg(nb=6, seed=4, disp=TRUE)$binimg
k <- findk(bdm1, disp=FALSE)$k
print(k)
```
Since the `findk2` traces the binary image through its diagonal only it fails to find the blocks located outside diagonal. So it is recommended that to use the function `findk` for detecting the blocks more successfully.

```{r comment=NA, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
k <- findk2(bdm1, disp=FALSE)
print(k)
```

On the other hand, if the blocks are exactly positioned along the diagonal of binary image, both the functions will give the same result as shown below.

The output from the function `findk` for the binary image has 4 blocks along its diagonal:

```{r comment=NA, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
bdm2 <- genbinimg(nb=4, seed=65, disp=TRUE)$binimg
k <- findk(bdm2, disp=FALSE)$k
print(k)
```

The output from the function `findk2` for the binary image has 4 blocks along its diagonal:

```{r comment=NA, fig.width=7, fig.height=6, echo=TRUE, message=FALSE, warning=FALSE}
k <- findk2(bdm2, disp=FALSE)
print(k)
```

# References

Bezdek, J. C., & Hathaway, R. J. (2002). VAT: A tool for visual assessment of (cluster) tendency. In *Proceedings of the 2002 International Joint Conference on Neural Networks*. IJCNN'02 (Cat. No. 02CH37290), Vol. 3, pp. 2225-2230. IEEE.

Cebeci, Z. & Yildiz, F. (2015). Görsel Kümelenme Eğilimi Değerlendirmesi ve R'de Uygulaması. *Çukurova Üniversitesi Ziraat Fakültesi Dergisi*, 30 (2), 1-8. 
(URL: [https://dergipark.org.tr/en/download/article-file/219860](https://dergipark.org.tr/en/download/article-file/219860))


