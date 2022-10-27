source set_dir.sh
for phase in PP; do
   cd $dir0/Data_$phase
#  ls */*.?HR | awk -F. '{print $3}' | sort | uniq > station_list.dat
   for stn in `cat station_list.dat`; do
      cd $dir0/Data_$phase/$stn
      echo $dir0/Data_$phase/$stn
      ls *.?H? | awk -F"." '{print $2,$3}' | sort | uniq > stn.id
      ls `awk '{print "*"$1"."$2".?H?"}' stn.id`  > filenames_SAC.t
      awk '{print "r *"$1"."$2".?H?\nchnhdr T1 0\nchnhdr T2 0\nw over"} END {print "q"}' stn.id | sac
      done
   done
cd $dir0
