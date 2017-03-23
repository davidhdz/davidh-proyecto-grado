#! /usr/bin/env Rscript

cloc <- read.csv("../datos/cloc.csv", header=TRUE)

a <- 2.40
b <- 1.05
c <- 2.5
d <- 0.38
KSLOC <- sum(cloc$code)/1000
Spa <- 60445
Epm <- a*(KSLOC)^b
Prod <- KSLOC/Epm
Tdev <- c*(Epm)^d
Per <- Epm/Tdev
Ctd <- Per*Spa

cat("\n\n")
cat("Líneas de código fuente:", sum(cloc$code),"\n\n\n")
cat("Estimaciones aplicando el Modelo COCOMO Básico\n")
cat("==========================================================\n")
cat("Esfuerzo estimado de desarrollo:\t\t", Epm,"\n")
cat("Productividad estimada:\t\t\t\t", Prod,"\n")
cat("Tiempo de desarrollo estimado:\t\t\t", Tdev,"\n")
cat("Personas requeridas estimadas:\t\t\t", Per,"\n")
cat("Costo total estimado del proyecto(*):\t\t", Ctd, "\n\n")
cat("(*) con US$", Spa, "anual como referencia para enero de 2017\n")
cat("==========================================================\n\n\n")
