dir0=/data/ursa/Jay/RF/SEUS
dir1=$dir0/Scripts

cd $dir0
mkdir -p $dir0/Data_P_PP_PKP
cd $dir0/Data_P_PP_PKP
rm station_list.t
for phase in P PP PKP; do
   cat $dir0/Data_$phase/station_list_${phase}.dat >> station_list.t
   done
sort station_list.t | uniq > station_list.dat

for stn in `cat station_list.dat`; do
   echo Working on $stn
   mkdir -p $stn
   cd $stn
   rm rf_${stn}.in
   rm rf_${stn}.files
   for phase in P PP PKP; do
      ls $dir0/Data_${phase}/${stn}/*.?H? >> rf_${stn}.files
      done
   echo 'stop' >> rf_${stn}.files
# Need to insert phase number here (1) P, (2) PKP, (3) PP, (4) PcP
   echo '2'   > rf_${stn}.in
   echo '35' >> rf_${stn}.in
   echo '1'  >> rf_${stn}.in
   echo '1'  >> rf_${stn}.in
   echo rf_${stn}.files  >> rf_${stn}.in
   echo '0'              >> rf_${stn}.in
   echo '0,360'          >> rf_${stn}.in
   echo '0'              >> rf_${stn}.in
   echo "recfunk_pick < rf_${stn}.in" > run_recfunk.sh
   echo "plotepi outr_epi.grid outt_epi.grid 0.8 ${stn}_2.0Hz_P_PP_PKP" >> run_recfunk.sh
   echo "mv plot.ps plot_${stn}_epi_P_PP_PKP.ps" >> run_recfunk.sh
   echo "plotbaz outr_baz.grid outt_baz.grid 0.8 ${stn}_2.0Hz_P_PP_PKP" >> run_recfunk.sh
   echo "mv plot.ps plot_${stn}_baz_P_PP_PKP.ps" >> run_recfunk.sh
   cd $dir0/Data_P_PP_PKP
   done
