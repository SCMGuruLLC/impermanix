#!/bin/sh

# packages.sh

# Creates the packages-source.sh program

# This program is part of the Impermanix project

# Copyright (C)  2018 Scott C. MacCallum
# scm@linux.com

# This program is free software: you can redistribute it and/or
# modify it under the terms of the GNU Affero License as published
# by the Free Software Foundation, either version 3 of the License,
# or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see http://www.gnu.org/licenses/.

pwd=$(pwd)

touch $pwd/packages-source.sh

cat /tmp/packages-source01 >> $pwd/packages-source.sh

ls -p /var/cache/apt/archives | sort > $pwd/packages.txt

sed -e "s/^/ /" $pwd/packages.txt > /tmp/packages01

sed -e "s/ /apt-get source /" /tmp/packages01 > /tmp/packages02

cut -d _ -f 1 /tmp/packages02 > /tmp/packages03

cat /tmp/packages03 >> $pwd/packages-source.sh

chmod +x $pwd/packages-source.sh

$pwd/packages-source.sh

exit 0