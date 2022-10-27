dir=/home/jay/Programs/JeffParkCodes/Data_PKP

for stn in `cat station_list.dat`; do
   echo $dir/${stn}
   rm -r $dir/${stn}
   done
cd $dir
