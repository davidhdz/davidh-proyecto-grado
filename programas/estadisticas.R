#! /usr/bin/env Rscript

png('../imagenes/rplot.png', width = 800)
cloc <- read.csv("../datos/cloc.csv", header=TRUE)
barplot(as.matrix(cloc[,3:5]),beside = TRUE,legend=(cloc$Lenguaje), args.legend = list(bty="n", horiz=FALSE), border="white",ylab = "Líneas de código", main = "Cantidad de líneas de código, comentarios y líneas vacías por Lenguaje", col=topo.colors(length(cloc$Lenguaje)))
dev.off()

cat("\n\n")
cat("==========================================================\n")
cat("Total archivos con lenguajes reconocidos:\t", sum(cloc$Archivos),"\n")
cat("Total de líneas en blanco:\t\t\t", sum(cloc$En_blanco),"\n")
cat("Total de líneas con comentarios:\t\t", sum(cloc$Comentarios),"\n")
cat("\nTotal de líneas de código fuente:\t\t", sum(cloc$Codigo),"\n")
cat("==========================================================\n\n\n")
