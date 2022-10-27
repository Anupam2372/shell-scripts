#for phase in P PP PKP P_PP_PKP; do
for phase in PcP; do
   cd $dir0/Data_$phase
#  ls */*.?HR | awk -F. '{print $3}' | sort | uniq > station_list.dat
   for stn in `cat station_list.dat`; do
      cd $dir0/Data_$phase/$stn
      echo $dir0/Data_$phase/$stn  > ${stn}.log
      source run_recfunk.sh       >> ${stn}.log
      done
   done
cd $dir0
