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

import string
import subprocess
import glob

try:
    f = open('Sources', 'r')
except IOError:
    print "Error al abrir el archivo ", arg
else:
    cont=0
    for line in f:
        if 'Binary: ' in line:
            binarios = string.split(line)[1:]
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
