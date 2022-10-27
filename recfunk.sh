cd $dir
for stn in `cat station_list.dat`; do
# for stn in `cat station_list_culled.dat`; do
# stn=CCCC
   echo $dir/${stn}
   cd $dir/${stn}
   recfunk_pick < rf_${stn}.in
 plotepi outr_epi.grid outt_epi.grid 0.5 ${stn}_2.0Hz_P           # GMT script to plot RFs vs. epicentral distance
 mv plot.ps plot_${stn}_epi.ps
 plotbaz outr_baz.grid outt_baz.grid 1.0 ${stn}_2.0Hz_P           # GMT script to plot RFs vs. backazimuth
 mv plot.ps plot_${stn}_baz.ps
   done
cd $dir
