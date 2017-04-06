#! /usr/bin/env Rscript
library(tcltk)

#Filtro de extensiones con las que se trabajará en este script
Filters   <- matrix(c("csv",".csv"),1, 2, byrow = TRUE)

#Cargar el archivo de entrada
entrada <- tk_choose.files(default = "", caption = "Seleccione el archivo de entrada",multi = FALSE, filters = Filters, index = 1)

ahora <- Sys.time()
tiempo <- strftime(ahora,"%Y%m%d%H%M%S")
png(sprintf('./plot_%s.png', tiempo), width = 800)

cloc <- as.data.frame(read.csv(entrada, header=TRUE))
#barplot(as.matrix(cloc[,3:5]),beside = TRUE, horiz=FALSE,legend=(cloc$language), args.legend = list(bty="n", horiz=FALSE), border="white",ylab = "Líneas de código", main = "Cantidad de líneas de código, comentarios y líneas vacías por Lenguaje", col=topo.colors(length(cloc$language)))
#grid(nx=NA)
porcentaje <- round(100*cloc$code/sum(cloc$code), 1)
porcentaje
#etiquetas <- paste(porcentaje, "%", sep="")
#pie(cloc$code, main="Lenguajes", col=topo.colors(length(cloc$language)), labels=etiquetas)
#legend("topleft", c(cloc$language), fill=topo.colors(length(cloc$language)))
#plot(porcentaje,cloc$code)
#hist(cloc$code)
#dotchart(cloc[,5], labels=cloc$language, cex = 0.3, pch = 16, main = "Líneas de código por lenguaje", cex.lab=0.5)
ss<-subset(cloc,cloc$code>1230000)
ss[,1:5]
cloc[,1:5]
#qplot(cloc$code, cloc$files, data = cloc, xlab="Número de líneas de código", ylab = "Cantidad de archivos", size=(cloc$code/cloc$files), color=I("blue"), alpha=I(0.7))
#plot(cloc$files,cloc$code,main = "Relación entre Líneas de código por lenguaje y cantidad de archivos por lenguaje",pch=19, col="blue", xlab="Número de archivos", ylab="Número de líneas de código")
#barplot(cloc$code, names.arg = cloc$language, col=topo.colors(length(cloc$language)), horiz = FALSE, border = "white")


dev.off()

cat("\n\n")
cat("==========================================================\n")
cat("Total archivos con lenguajes reconocidos:\t", sum(cloc$files),"\n")
cat("Total de líneas en blanco:\t\t\t", sum(cloc$blank),"\n")
cat("Total de líneas con comentarios:\t\t", sum(cloc$comment),"\n")
cat("\nTotal de líneas de código fuente:\t\t", sum(cloc$code),"\n")
cat("==========================================================\n\n\n")

