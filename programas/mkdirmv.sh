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
# along with mkdirmv. If not, see <http://www.gnu.org/licenses/>.

for file in *.*; do
  directorio="$(basename "${file}")"
  mkdir "_${directorio}"
  mv "$file" "_${directorio}"
  cd "_${directorio}"
    if [ ${file: -3} == ".gz" ]; then
        gzip -t *
        gunzip *
        tar xfi *
        rm *.tar
    fi
    if [ ${file: -3} == ".xz" ]; then
        tar xfi *
        rm "$file"
    fi
    if [ ${file: -4} == ".bz2" ]; then
        bzip2 -dv *
        tar xfi *
        rm *.tar
    fi
    cd ..
done

