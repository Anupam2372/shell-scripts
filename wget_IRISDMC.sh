# Get a SPECIFIC file
# wget -P /DirectoryYouWantToSaveTo -m -nd -np -r -A "FileName" ftp://ftp.iris.washington.edu/pub/userdata/Jay_Pulliam/
# Get ALL files
# wget -P . -m -nd -np -r ftp://ftp.iris.washington.edu/pub/userdata/Jay_Pulliam/ 

# Get a SPECIFIC file
# wget -P . -m -nd -np -r -A "20160518_0757*" ftp://ftp.iris.washington.edu/pub/userdata/Jay_Pulliam/
# wget -P . -m -nd -np -r -A "20150519_1525*" ftp://ftp.iris.washington.edu/pub/userdata/Jay_Pulliam/
# wget -P . -m -nd -np -r -A "20150916_2318*" ftp://ftp.iris.washington.edu/pub/userdata/Jay_Pulliam/
# wget -P . -m -nd -np -r -A "20130624_2204*" ftp://ftp.iris.washington.edu/pub/userdata/Jay_Pulliam/
wget -P . -m -nd -np -r -A "20*_PP.*" ftp://ftp.iris.washington.edu/pub/userdata/Jay_Pulliam/
