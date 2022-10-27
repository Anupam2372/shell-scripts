# evt=20170718_0205
# openssl enc -d -des-cbc -salt -in $file.openssl -out $file.seed -pass pass:kmklp
# openssl enc -d -des-cbc -salt -in ${evt}.*.openssl -out ${evt}.seed -pass pass:bZHylnxu
ls *.openssl > openssl_list.t
awk -F. '{print $1"."$2}'        < openssl_list.t > openssl_list.dat
for evt in `cat openssl_list.dat`; do
openssl enc -d -des-cbc -salt -in ${evt}*.openssl -out ${evt}.seed -pass pass:bZHylnxu
done
