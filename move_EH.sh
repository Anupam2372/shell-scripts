dir=/home/jay/Programs/JeffParkCodes/Data1
cd $dir

for stn in `cat EH2.t`; do
# for stn in REDR; do
echo Moving files for station $stn 
cd $dir/$stn
ls 20*.EHZ >  list.t
awk -F"." '{print "mv "$1"."$2"."$3".BHR",$1"."$2"."$3".EHR"}' list.t >  list2.t
awk -F"." '{print "mv "$1"."$2"."$3".BHT",$1"."$2"."$3".EHT"}' list.t >> list2.t
source list2.t
rm list.t
rm list2.t
ls 20*H?    > rf_${stn}.files
echo 'stop' >> rf_${stn}.files
echo '2'               > rf_${stn}.in
echo '35'             >> rf_${stn}.in
echo '1'              >> rf_${stn}.in
echo '1'              >> rf_${stn}.in
echo rf_${stn}.files  >> rf_${stn}.in
echo '0'              >> rf_${stn}.in
echo '0,360'          >> rf_${stn}.in
echo '0'              >> rf_${stn}.in
cd $dir
done
