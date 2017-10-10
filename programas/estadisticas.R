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

# Estadísticas básicas de los datos obtenidos por CLOC

library(tcltk)

#Filtro de extensiones con las que se trabajará en este script
Filters   <- matrix(c("csv",".csv"),1, 2, byrow = TRUE)

#Cargar el archivo de entrada
entrada <- tk_choose.files(default = "", caption = "Seleccione el archivo de entrada",multi = FALSE, filters = Filters, index = 1)

cloc <- as.data.frame(read.csv(entrada, header=TRUE))

cat("\n\n")
cat("==========================================================\n")
cat("Total archivos con lenguajes reconocidos:\t", format(sum(cloc$files), digits=2, nsmall=2, decimal.mark=",", big.mark=".", scientific=FALSE),"\n")
cat("Total de líneas en blanco:\t\t\t", format(sum(cloc$blank), digits=2, nsmall=2, decimal.mark=",", big.mark=".", scientific=FALSE),"\n")
cat("Total de líneas con comentarios:\t\t", format(sum(cloc$comment), digits=2, nsmall=2, decimal.mark=",", big.mark=".", scientific=FALSE),"\n")
cat("\nTotal de líneas de código fuente:\t\t", format(sum(cloc$code), digits=2, nsmall=2, decimal.mark=",", big.mark=".", scientific=FALSE),"\n")
cat("==========================================================\n\n\n")

