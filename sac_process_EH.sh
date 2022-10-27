# EH? 
for yr in 2013 2014 2015 2016 2017 2018; do
echo ${yr}

ls ${yr}*/*.EHZ*SAC | awk -F/ '{print $1}' |awk '$0 != prev { print; prev = $0 }' >  event_list_EH.dat
for evt in `cat event_list_EH.dat`; do
# for evt in `cat missing_events.dat`; do
# for evt in 20180304_1956_PKP; do
# evt=20180306_1413_PKP
   cd $dir/${evt}
   echo $dir/${evt}
   ls *.EH?.*.SAC | awk -F"." '{print $7,$8}' | sort | uniq -c | awk '{if ($1 == 3) print $2,$3}' | sort | uniq > stn_EH.id 
   ls `awk '{print "*"$1"."$2".*SAC"}' stn_EH.id`  > filenames_EH.t
   awk -F"." '{print "mv "$0,$7"."$8"."$10"."$12}'   filenames_EH.t > move_files_EH.sh
   if [ -f stn_EH.id ] && [ -s stn_EH.id ]
      then
         source move_files_EH.sh 
         saclst e f `awk '{print $1"."$2".EH[EN12].SAC"}' stn_EH.id` | paste - - | awk '{if ($2> $4) print $4;else print $2}' > end_time.dat
         saclst o f `awk '{print $1"."$2".EH[EN12].SAC"}' stn_EH.id` | paste - - | awk '{if ($2< $4) print $4;else print $2}' > origin_time.dat
         if [ -f  end_time.dat ] && [ -s  end_time.dat ] && [ -f  origin_time.dat ] && [ -s  origin_time.dat ] 
            then
               paste -d" " stn_EH.id origin_time.dat end_time.dat | awk '{print "cut "$3,$4"\nr "$1"."$2".EH[EN12].SAC\nrmean\nrtrend\nrotate to GCP\nw "$1"."$2".EHR.SAC "$1"."$2".EHT.SAC"} END {print "q"}' | sac
               awk '{print "r "$1"."$2".EH[ZNE12].SAC\nrmean\nrtrend\nw over"} END {print "q"}' stn_EH.id | sac
            else
               echo 'No end_time and/or origin_time files'
            fi
      else
         echo 'No stn_EH.id file'
      fi
## mkdir -p $dir/${evt}/Backup
## mv 20*.EH*SAC Backup # move the rest into Backup for now
   done
cd $dir
   done
cd $dir
