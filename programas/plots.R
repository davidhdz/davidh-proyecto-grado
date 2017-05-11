#! /usr/bin/env Rscript

# Copyright 2017 David Hernández
#
#
# This software is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with paquetes.py. If not, see <http://www.gnu.org/licenses/>.

# Generador de gráficos con los datos obtenidos por CLOC

library(tcltk)
library(plotrix)
library(ggplot2)

#Filtro de extensiones con las que se trabajará en este script
Filters   <- matrix(c("csv",".csv"),1, 2, byrow = TRUE)

#Cargar el archivo de entrada
entrada <- tk_choose.files(default = "", caption = "Seleccione el archivo de entrada",multi = FALSE, filters = Filters, index = 1)

cloc <- as.data.frame(read.csv(entrada, header=TRUE))

#ss1<-subset(cloc[,1:5],cloc$code>1230000)
#ss2<-subset(cloc[,1:5],cloc$code<1230000)
#ss3 <- data.frame("files"=sum(ss2$files),"language"="otros", "blank"=sum(ss2$blank), "comment"=sum(ss2$comment),"code"=sum(ss2$code))
#ss4 <- rbind(ss1,ss3)

ahora <- Sys.time()
tiempo <- strftime(ahora,"%Y%m%d%H%M%S")
pdf(sprintf('./plot_%s.pdf', tiempo))

# Gráfico de barras
barplot(as.matrix(cloc[,3:5])/1000, beside = TRUE, horiz=FALSE, legend=(cloc$language), args.legend = list(bty="n", horiz=FALSE), border="white", yaxt="n", #ylim=c(0, max(ss4$code)),
        ylab = "Líneas de código", main = "Cantidad de líneas vacía, comentarios y líneas de código fuente por Lenguaje", col=rainbow(length(cloc$language)))
my.axis <-paste(axTicks(2),"K",sep="")
axis(2,at=axTicks(2), labels=my.axis)

# Pie
pct <- round(cloc$files/sum(cloc$files)*100)
lbls <- paste(pct,"%",sep="") # ad % to labels 
#lbls <- paste(ss4$language, lbls) # add percents to labels 

pie(cloc$files, col=rainbow(length(lbls)), lbls,
    main="Cantidad de archivos por lenguaje")

bisectors<-pie3D(cloc$files, col=rainbow(length(lbls)), start=0, labels = lbls, labelcex = 1,
                 main="Cantidad de archivos por lenguaje", explode=.0,shade=.6, theta=pi/pi)
legend(-.8,1, cloc$language, cex=0.8, fill=rainbow(length(cloc$language)))


dev.off()
