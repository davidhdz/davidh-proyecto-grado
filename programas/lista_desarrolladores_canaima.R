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

# Script para generar gráfico de la actividad de la lista Canaima Desarrolladores


library(readr)
library(ggplot2)

desarrolladorescount <- read_csv("../datos/desarrolladorescount.csv", 
                                 col_types = cols(Fecha = col_date(format = "%Y-%B")))

desarrolladores <- desarrolladorescount[order(as.Date(desarrolladorescount$Fecha, format="%Y-%B")),] 
attach(desarrolladores)

ahora <- Sys.time()
tiempo <- strftime(ahora,"%Y%m%d%H%M%S")
pdf(sprintf('./plot_%s.pdf', tiempo),height=4)

parada.vec<-c(seq(from=as.Date("2008-11-01"), to=as.Date("2017-05-01"), by="1 month"))
ggplot( data = desarrolladores, aes( Fecha, Cantidad ))  + geom_bar(stat = "identity", fill="deepskyblue4", alpha=1) + ggtitle("Mensajes mensuales enviados a la lista de desarrolladores de Canaima") + scale_y_continuous(breaks=seq(0,1100,100)) + theme(axis.ticks = element_line(size = .2), axis.text.x  = element_text(size=6,angle=90,colour="black",vjust=1,hjust=1), plot.title = element_text(face="bold",hjust = 0.5)) + scale_x_date(breaks=parada.vec, date_labels = format(parada.vec,"%b %Y")) + labs(x="Mes - Año", y="Número de mensajes")

dev.off()
