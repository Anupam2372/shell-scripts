for evt in `cat event_list.dat`; do
cd $dir/${evt}
ls *.seed > seed_list.t
awk -F. '{print $1}' < seed_list.t > seed_list.dat
for file in `cat seed_list.t`; do
rdseed -df ${file}
done
cd $dir
done
