for phase in PcP; do
# for phase in P PP PKP; do
   cd $dir0/Data_$phase
#  mkdir -p Bad
#  for stn in BANI HATO IMPR PPDR PRSN; do
#     mv $dir0/Data_$phase/$stn Bad
#     done
#  ls */*.?HR | awk -F. '{print $3}' | sort | uniq > station_list.dat
   for stn in `cat station_list.dat`; do
      cd $dir0/Data_$phase/$stn
      echo Working on $dir0/Data_$phase/$stn
      ls *.?HR > rf_${stn}.files
      echo 'stop' >> rf_${stn}.files
      echo '2'   > rf_${stn}.in
      echo '35' >> rf_${stn}.in
      echo '1'  >> rf_${stn}.in
      echo '1'  >> rf_${stn}.in
      echo rf_${stn}.files  >> rf_${stn}.in
      echo '0'              >> rf_${stn}.in
      echo '0,360'          >> rf_${stn}.in
      echo '0'              >> rf_${stn}.in
      echo "recfunk_IndRF  < rf_${stn}.in" > run_recfunk.sh
      echo "plotepi outr_epi.grid outt_epi.grid 0.8 ${stn}_2.0Hz_${phase}" >> run_recfunk.sh
      echo "mv plot.ps plot_${stn}_epi_${phase}.ps" >> run_recfunk.sh
      echo "plotbaz outr_baz.grid outt_baz.grid 0.8 ${stn}_2.0Hz_${phase}" >> run_recfunk.sh
      echo "mv plot.ps plot_${stn}_baz_${phase}.ps" >> run_recfunk.sh
      done
   done
cd $dir0
