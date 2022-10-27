# HH? 
#for yr in 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018; do
for yr in 2013 2014 2015 2016 2017 2018; do
# for yr in 2018; do
echo $yr
ls ${yr}*/*.HHZ*SAC | awk -F/ '{print $1}' |awk '$0 != prev { print; prev = $0 }' >  event_list_HH.dat
for evt in `cat event_list_HH.dat`; do
# for evt in `cat missing_events.dat`; do
# for evt in 20180304_1956_PKP; do
# evt=20180306_1413_PKP
   cd $dir/${evt}
   echo $dir/${evt}

   mkdir -p $dir/${evt}/Backup
#  mv *.IU.WVT.10.?H?.*SAC Backup # move files for borehole sensors to Backup
#  mv *.IU.WVT.60.?H?.*SAC Backup # move files for borehole sensors to Backup
#  mv *.IU.HKT.10.?H?.*SAC Backup # move files for borehole sensors to Backup
#  mv *.IU.DWPF.10.?H?.*SAC Backup # move files for borehole sensors to Backup
#  mv *.US.GOGA.10.?H?.*SAC Backup # move files for borehole sensors to Backup
#  mv *.NM.HDAR2.00.?H?.*SAC Backup # move files for borehole sensors to Backup
#  mv *.NM.HDAR2.10.?H?.*SAC Backup # move files for borehole sensors to Backup
#  mv *.US.WMOK.10.?H?.*SAC Backup # move files for borehole sensors to Backup
#  mv *.TA.TUL3.01.?H?.*SAC Backup # move files for borehole sensors to Backup

   ls ${yr}*.HH?.*.SAC | awk -F"." '{print $7,$8}' | sort | uniq -c | awk '{if ($1 == 3) print $2,$3}' | sort | uniq > stn_HH.id 
   ls `awk '{print "*"$1"."$2".*SAC"}' stn_HH.id`  > filenames_HH.t
   awk -F"." '{print "mv "$0,$7"."$8"."$10"."$12}'   filenames_HH.t > move_files_HH.sh
   if [ -f stn_HH.id ] && [ -s stn_HH.id ]
      then
         source move_files_HH.sh 
         saclst e f `awk '{print $1"."$2".HH[EN12].SAC"}' stn_HH.id` | paste - - | awk '{if ($2> $4) print $4;else print $2}' > end_time.dat
         saclst o f `awk '{print $1"."$2".HH[EN12].SAC"}' stn_HH.id` | paste - - | awk '{if ($2< $4) print $4;else print $2}' > origin_time.dat
         if [ -f  end_time.dat ] && [ -s  end_time.dat ] && [ -f  origin_time.dat ] && [ -s  origin_time.dat ] 
            then
               paste -d" " stn_HH.id origin_time.dat end_time.dat | awk '{print "cut "$3,$4"\nr "$1"."$2".HH[EN12].SAC\nrmean\nrtrend\nrotate to GCP\nw "$1"."$2".HHR.SAC "$1"."$2".HHT.SAC"} END {print "q"}' | sac
               awk '{print "r "$1"."$2".HH[ZNE12].SAC\nrmean\nrtrend\nw over"} END {print "q"}' stn_HH.id | sac
            else
               echo 'No end_time and/or origin_time files'
            fi
      else
         echo 'No stn_HH.id file'
      fi
   mkdir -p $dir/${evt}/Backup
   mv ${yr}*.HH?*SAC Backup # move the rest into Backup 

   done
cd $dir
   done
cd $dir
