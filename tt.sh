for evt in `cat event_list.dat`; do
# for evt in 20180123_0931; do
cd $dir/${evt}
echo $evt
ls ??.*.?H?.SAC > SAC_list.t
# awk -F. '{print $1 "." $2 "." $3}' < SAC_list.t > SAC_list.dat
#for file in `cat SAC_list.dat`; do
#echo ${file}.SAC ${evt}.${file}
# mv ${file}.SAC ${evt}.${file}
#done
cd $dir
done
