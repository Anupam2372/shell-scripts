dir=/home/jay/Programs/JeffParkCodes/Data1
# awk '{print $3}' ZC.stns > ZC.t
# for stn in `cat ZC.t`; do
for stn in `cat station_list_culled.dat`; do
# stn=CCCC
#  cd $dir/${stn}
#  echo $dir/${stn}
   ls -l $dir/${stn}/outt_baz.grid
   done
