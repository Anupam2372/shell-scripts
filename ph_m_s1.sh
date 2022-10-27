for stn in `cat station_list1.dat`; do
#for stn in `cat station_list_culled.dat`; do
# for stn in WBCY; do
   cd $dir/${stn}
   ls *.?H? > SAC_list.dat
#  wc SAC_list.dat
   for sacfile in `cat SAC_list.dat`; do
#      taup_setsac -mod ak135 -evdpkm -ph P-1,PKP-2,PP-3 $sacfile
       taup_setsac -mod ak135 -evdpkm -ph P-1 $sacfile
       done
   done
cd $dir
