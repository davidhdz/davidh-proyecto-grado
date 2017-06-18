#!/usr/bin/env bash

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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with cloc_recargado. If not, see <http://www.gnu.org/licenses/>.

# Programa para correr cloc individualmente en cada subdirectorio de un 
# directorio dado. Genera un reporte por cada subdirectorio.

# Para cada subdirectorio dentro del directorio dado se creará un reporte
# por el programa cloc y estos serán almacenados dentro del directorio 
# ./debiancloc. Si ya existe un reporte previo, entonces se ignora el análisis 
# para ese subdirectorio. 

for i in $(realpath "$1"/*); do
    if [ ! -f debiancloc/$(basename "$i").csv ]; then
        echo File: "$i"
        cloc --use-sloccount --exclude-ext=po --csv --report-file=debiancloc/$(basename "$i").csv "$i"
        echo
    else
        echo File $(basename "$i").csv already exist
        echo
        continue
    fi
done
