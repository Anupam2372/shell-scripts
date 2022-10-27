dir=/home/jay/Programs/JeffParkCodes/Data_PKP
dir2=/data/bruin/GrASP/RF_JeffPark/RF_PKP
# for evt in `cat event_list.dat`; do
for evt in `cat missing_events.dat`; do
#cd $dir/${evt}
echo $evt
#ls *.SAC |wc
cp -rp $dir2/${evt} $dir 
done
cd $dir
