#!/bin/bash

cd seismograms

`echo ls -l` | awk '{print $9}'| sort -u > ../event.txt

for i in `cat ../event.txt`
do 
   cd $i

`echo ls *H?.*.sac` | sort -u > ../rem.txt
test -d ./Broken || mkdir ./Broken

for i in `cat ../rem.txt`
do 
   mv  $i ./Broken
done

rm -f ../rem.txt


`echo ls *B??.sac` | sort -u > ../sac.txt
test -d ./sac_broadband || mkdir ./sac_broadband

for i in `cat ../sac.txt`
do 
   mv  $i ./sac_broadband
done

rm -f ../sac.txt


`echo ls *.sac` | sort -u > ../S_band.txt
test -d ./sac_shortband || mkdir ./sac_shortband

for i in `cat ../S_band.txt`
do 
  mv  $i ./sac_shortband
done

rm -f ../S_band.txt

  cd ..
done

rm -f ../event.txt
