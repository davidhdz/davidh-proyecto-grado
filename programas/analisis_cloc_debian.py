#!/usr/bin/env python
# -*- coding: UTF-8 -*-

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
# along with analisis_cloc_debian If not, see <http://www.gnu.org/licenses/>.

""" Programa que se encarga de analizar los archivos csv generados por
    analisis_cloc_debian. Agrupa y suma los lenguajes detectados en los 
    diferentes paquetes y genera un archivo csv con los resultados.
"""

# Carga de bibliotecas
import glob
import pandas as pd

# Lista de archivos a analizar
archivos = glob.glob('debiancloc/*.csv')

# Se inicializa el dataframe
df = pd.DataFrame()

# Se agrega al dataframe los datos de los archivos importados
for archivo in archivos:
    df = df.append(pd.read_csv(archivo, usecols=[0,1,2,3,4]))

# Se agrupan los lenguajes y se suman
final = df.groupby(df.language).sum()

# Se reinicia el índice
final = final.reset_index()

# Se reordenan las columnas el dataframe
final = final[['files','language','blank','comment','code']]

# Se ordenan los datos segun la cantidad de codigo
final = final.sort_values("code",ascending=False)

# Se genera el csv final
final.to_csv('debiancloc.csv',index=False)



