#!/bin/bash

mkdir -p ../cds301-students/
cd ../cds301-students/

U=( jc_moran sgallera gbshin vcaetto skwon11 lpachec3 swindle2 mgreer6 hsadural sbhatti7 sbhatti8 szaidi10 kwelborn zvannoy syu13 jjones26 )

b="https://rweigel@bitbucket.org"

for u in "${U[@]}"
do
    mkdir $u;cd $u;git clone $b/$u/cds301; cd ..
done
