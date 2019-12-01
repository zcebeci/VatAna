## gokedatest.R
###############################################################################################
## To cite this code in publications use:

##  Cebeci, Z. & F. Yildiz (2015). Görsel Kümelenme Eğilimi Değerlendirmesi ve R'de Uygulaması.
##  	Çukurova Üniversitesi Ziraat Fakültesi Dergisi, 
##	URL http://traglor.cu.edu.tr/

## As BibTeX entry for LaTeX users is

##  @article{article,
##    title = {Görsel Kümelenme Eğilimi Değerlendirmesi ve R'de Uygulaması},
##    author = {Zeynel Cebeci, Figen Yıldız},
##    journal = {Çukurova Üniversitesi Ziraat Fakültesi Dergisi},
##    year = 2015,
##    volume = 30,
##    number = 2,
##    pages = 1-8
##    url = {http://traglor.cu.edu.tr/common/object_show.aspx?id=1951}
##  }

################################################################################################
# KEG algoritması fonksiyonu 
gokeda <- function(X, img=F, dist=F) 
{
	if (missing(X)) 
		stop("Veri seti girilmedi.")
	if (is.null(X)) 
		stop("Veri seti boş, elemanı yok.")
	X = as.matrix(X)
	n = nrow(X)
	if (any(is.na(X))) 
		stop("Veri setinde NA değerler olamaz.")
	if (!is.numeric(X)) 
		stop("Veri seti sayısal bir matris veya veri tablosu olmalıdır.")
	if (is.null(rownames(X))) 
		rn = paste("Nesne", 1:n, sep = " ")
	else 
		rn = rownames(X)
	if(!dist)
		D = as.matrix(dist(X))
	else {
		D = X
		if(!is(D, "dist"))
 			stop("Girilen veri seti uzaklıklar matrisi olmalıdır.")
	}

	I = rep(0, n)
	P = c()
	mx = which(D == max(D), arr.ind = TRUE)[2]
	I[mx] = 1
	P[1] = mx
	for (i in 2:n){
		Dr = matrix(D[I > 0, ], nrow = sum(I))
		Dr[, I == 1] = max(Dr)
		mn = (which(Dr == min(Dr), arr.ind = TRUE))[2]
		I[mn] = 1
		P[i] = mn
	}
	Ds = D[P, rev(P)]
	if(img)
	image(Ds, col = grey(seq(0, 1, length = 256)), 
		xlab = rn, ylab = "", xaxt = "n", yaxt = "n", 
		main = "KEG")
    	return (list(odm=Ds, P=P))
}

# gokedatest.txt dosyasındakiveri seti ile uygulama

par(mfrow=c(2,2),  oma = c(0.5, 0.5, 0.5, 0.5), mar = c(2, 2, 2, 2), ask=T)

# Çalışma klasörünü seç
setwd("c:/rdata")

# Veri dosyasını oku ve ds veri setine ata
ds <- read.table("gokedatest.txt", head=T)

# Tablo olarak okunan veriyi X matrisine ata
X <- as.matrix(ds)

#grafik sonuçlarını kaydetmek isterseniz aşağıdaki satır başında # kaldırınız
#pdf("gokedaout.pdf")

plot(X, xlab="", ylab="", main="X Serpilimi") 

# Uzaklıkları hesapla ve D matrisine ata
dst <- dist(X, diag=T, upper=T) 
D <- as.matrix(dst)
# plot(D, xlab="", ylab="", main="D Serpilimi") 

# Uzaklıklar için G Matrisini oluştur ve serpilme diyagramını çiz
G <- round(D/max(D)*255, 0)

gri256 <- grey(seq(0, 1, length = 256))

# Orijinal uzaklıklar (D) matrisini görüntüle
image(G, col = gri256, xlab = "", ylab = "", xaxt = "n", yaxt = "n")
title(main="Orijinal D Görüntüsü", font.main=15)

# Kümelenme eğilimi (KEG) görüntüsü
rdm <- gokeda(X, img=F)
DR <- rdm$odm
image(DR, col = gri256, xlab = "", ylab = "", xaxt = "n", yaxt = "n")
title(main="KEG", font.main=15)

# Kümelenme eğilimi (KEG) ikili görüntüsü
BDR <- round(DR/max(DR),0)
#if (DR > 127) {b = 1; } else { b = 0; }
image(BDR, col = gri256, xlab = "", ylab = "", xaxt = "n", yaxt = "n")
title(main="Binary KEG", font.main=15)

## program sonu
