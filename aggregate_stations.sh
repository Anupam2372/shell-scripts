cd $dir
# for yr in 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018; do
for yr in 2013 2014 2015 2016 2017 2018; do
   echo $yr
   ls ${yr}*/*.?HR | awk -F. '{print $3}' | sort | uniq > station_list_${yr}.dat
   for stn in `cat station_list_${yr}.dat`; do
      echo Moving files for station $stn 
      mkdir -p $stn
      mv ${yr}*/*.${stn}.?HR $stn
      mv ${yr}*/*.${stn}.?HT $stn
      mv ${yr}*/*.${stn}.?HZ $stn
      cd $dir
      done
   done
