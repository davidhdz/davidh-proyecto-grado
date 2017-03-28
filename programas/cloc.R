#! /usr/bin/env Rscript

png('../imagenes/rplot.png', width = 800)
cloc <- read.csv("../datos/cloc.csv", header=TRUE)
barplot(as.matrix(cloc[,3:5]),beside = TRUE,legend=(cloc$language), args.legend = list(bty="n", horiz=FALSE), border="white",ylab = "Líneas de código", main = "Cantidad de líneas de código, comentarios y líneas vacías por Lenguaje", col=topo.colors(length(cloc$language)))
box(bty="l")
dev.off()
