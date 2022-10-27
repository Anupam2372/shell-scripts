dir0=/home/jay/Programs/JeffParkCodes
dir3=Data_P_PP_PKP_PcP
mkdir -p $dir0/$dir3
for phase in P PP PKP PcP; do
   cd $dir0/Data_$phase
   ls */*.?HR | awk -F. '{print $3}' | sort | uniq > station_list.dat
   for stn in `cat station_list.dat`; do
      cd $dir0/Data_${phase}/$stn
      mkdir -p $dir0/$dir3/${stn}
      echo Copying ${phase} files for station $stn 
      cp 20*.${stn}.?HR $dir0/$dir3/${stn}
      cp 20*.${stn}.?HT $dir0/$dir3/${stn}
      cp 20*.${stn}.?HZ $dir0/$dir3/${stn}
      done
   done
cd $dir0/$dir3
ls 2*.?HR | awk -F. '{print $3}' | sort | uniq > station_list.dat
for stn in `cat station_list.dat`; do
   cd $dir0/$dir3/$stn
   ls 20*.?H?   > rf_${stn}.files
   echo 'stop' >> rf_${stn}.files
   echo '2'     > rf_${stn}.in
   echo '35'   >> rf_${stn}.in
   echo '1'    >> rf_${stn}.in
   echo '1'    >> rf_${stn}.in
   echo rf_${stn}.files  >> rf_${stn}.in
   echo '0'              >> rf_${stn}.in
   echo '0,360'          >> rf_${stn}.in
   echo '0'              >> rf_${stn}.in
   echo "recfunk_pick < rf_${stn}.in" > run_recfunk.sh
   echo "plotepi outr_epi.grid outt_epi.grid 0.8 ${stn}_2.0Hz_P_PP_PKP" >> run_recfunk.sh
   echo "mv plot.ps plot_${stn}_epi.ps" >> run_recfunk.sh
   echo "plotbaz outr_baz.grid outt_baz.grid 0.8 ${stn}_2.0Hz_P_PP_PKP" >> run_recfunk.sh
   echo "mv plot.ps plot_${stn}_baz.ps" >> run_recfunk.sh
   done
cd $dir0/$dir3
