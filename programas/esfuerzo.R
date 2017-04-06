#! /usr/bin/env Rscript
library(tcltk)

#Filtro de extensiones con las que se trabajará en este script
Filters   <- matrix(c("csv",".csv"),1, 2, byrow = TRUE)

#Cargar el archivo de entrada
entrada <- tk_choose.files(default = "", caption = "Seleccione el archivo de entrada",multi = FALSE, filters = Filters, index = 1)

cloc <- read.csv(entrada, header=TRUE)

a <- 2.40
b <- 1.05
c <- 2.5
d <- 0.38
KSLOC <- sum(cloc$code)/1000
Spa <- 73837
Epm <- a*(KSLOC)^b
Prod <- KSLOC/Epm
Tdev <- c*(Epm)^d
Per <- Epm/Tdev
Ctd <- Per*Spa

cat("\n\n")
cat("Líneas de código fuente: \t", format(sum(cloc$code), digits=2, nsmall=2, decimal.mark=",", big.mark=".", scientific=FALSE),"\n")
cat("Líneas de código fuente (K): \t", format(KSLOC, digits=2, nsmall=2, decimal.mark=",", big.mark=".", scientific=FALSE),"\n\n\n")
cat("Estimaciones aplicando el Modelo COCOMO Básico\n")
cat("==============================================================\n")
cat("Esfuerzo estimado de desarrollo:\t", format(Epm, digits=2, nsmall=2, decimal.mark=",", big.mark=".", scientific=FALSE),"\n")
cat("Productividad estimada:\t\t\t", format(Prod, digits=2, nsmall=2, decimal.mark=",", big.mark=".", scientific=FALSE),"\n")
cat("Tiempo de desarrollo estimado:\t\t", format(Tdev, digits=2, nsmall=2, decimal.mark=",", big.mark=".", scientific=FALSE),"\n")
cat("Personas requeridas estimadas:\t\t", format(Per, digits=2, nsmall=2, decimal.mark=",", big.mark=".", scientific=FALSE),"\n")
cat("\nCosto total estimado del proyecto(*):\t", format(Ctd, digits=2, nsmall=2, decimal.mark=",", big.mark=".", scientific=FALSE), "\n\n")
cat("(*) con US$", format(Spa, digits=2, nsmall=2, decimal.mark=",", big.mark=".", scientific=FALSE), "anual como referencia para enero de 2017\n")
cat("==============================================================\n\n\n")
