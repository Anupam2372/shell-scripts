for stn in `cat station_list.dat`; do
echo $stn
ls ${stn}/*HR |wc
done
