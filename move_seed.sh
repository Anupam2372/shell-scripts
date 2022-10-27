# mkdir -p SEED_openssl
# mv *.openssl SEED_openssl
ls *.seed > event_list.dat
awk -F. '{print $1}'        < event_list.dat > event_list.t
awk '$0 != prev { print; prev = $0 }'  event_list.t > event_list.dat
for evt in `cat event_list.dat`; do
mkdir -p ${evt}
mv ${evt}.*seed ${evt}
done
