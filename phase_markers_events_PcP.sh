for evt in `cat event_list.dat`; do
# for evt in `cat missing_events.dat`; do
# for evt in 20150519_1525 20150916_2318 20160518_0757 20130624_2204; do
# for evt in 20180304_1956_PKP; do
   cd $dir/${evt}
   echo $dir/${evt}
   ls *.?H? > SAC_list.dat
#  ls *.SAC > SAC_list.dat
   for sacfile in `cat SAC_list.dat`; do
#      taup_setsac -mod ak135 -evdpkm -ph P-1,PKP-2,PP-3 $sacfile
#      taup_setsac -mod ak135 -evdpkm -ph P-1 $sacfile
#      taup_setsac -mod ak135 -evdpkm -ph PP-3 $sacfile
#      taup_setsac -mod ak135 -evdpkm -ph PKP-2 $sacfile
       taup_setsac -mod ak135 -evdpkm -ph PcP-4 $sacfile
       done
   done
cd $dir
