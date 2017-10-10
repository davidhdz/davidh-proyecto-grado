#!/usr/bin/env python
# -*- coding: UTF-8 -*-

# Copyright 2016 David Hernández
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

""" Programa que lee los paquetes de un archivo Source y descarga el archivo 
    fuente de cada uno de estos paquetes.
"""

# Carga de bibliotecas
import string
import subprocess
import glob

# Carga el archivo "Sources", este debe estar en el directorio de corrida
try:
    f = open('Sources', 'r')
except IOError:
    print "Error al abrir el archivo ", arg
else:
    #contador de paquetes procesados
    cont=0
    #Evalúa cada línea de Sources
    for line in f:
        # Si en la línea encuentra la palabra "Binary: " almacena los nombres de
        # cada paquete encontrado en la línea dentro de la lista "binarios"
        if 'Binary: ' in line:
            binarios = string.split(line)[1:]
            # Descarga las fuentes si no existen ya, y borra archivos no 
            # necesarios.
            for paquete in binarios:
                paquetes = string.strip(paquete,',')
                if (glob.glob(paquetes + '_*')):
                    break;		
                subprocess.call("apt-get --download-only source " + paquetes,
                                shell=True)
                subprocess.call("rm *.dsc " + "> /dev/null 2>&1", shell=True)
                subprocess.call("rm *.debian.tar.* " + "> /dev/null 2>&1", 
                                shell=True)
                subprocess.call("rm *.diff.gz " + "> /dev/null 2>&1", 
                                shell=True)
                cont = cont + 1
    f.close()

    print
    print "Cantidad de paquetes procesados: " + str(cont)
