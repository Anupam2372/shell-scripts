for evt in `cat event_list.dat`; do
# for evt in 20150921_1740; do
# evt=20180306_1413_PKP
   cd $dir/${evt}
   echo $dir/${evt}
   mkdir -p $dir/${evt}/Backup
   mv 20??.*.SAC Backup # move the rest into Backup
#  mv Backup/20??.*EH?.*SAC .
   done
cd $dir
