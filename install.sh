#!/bin/bash
printf "\n\nCreating Directories!\n\n"
mkdir tools
mkdir modules
mkdir files
printf "\n\nDownloading Files!\n\n"
wget http://tcpdiag.dl.sourceforge.net/project/crunch-wordlist/crunch-wordlist/crunch-3.6.tgz
wget http://www.openwall.com/john/j/john-1.8.0.tar.xz
wget https://raw.githubusercontent.com/jmathai/php-multi-curl/master/EpiCurl.php
printf "\n\nUnpacking!\n\n"
tar xf crunch-3.6.tgz
tar xf john-1.8.0.tar.xz
printf "\n\nCompiling External Programs!\n\n"
cd crunch-3.6
make
cd ..
cd john-1.8.0/src
make
printf "\n\nSystem Type?"
read input_variable
printf "\nYou entered: $input_variable"
make clean "$input_variable"
cd .. && cd ..
printf "\n\nMoving Files!\n\n"
mv john-1.8.0/run/john tools/john
mv john-1.8.0/run/unique tools/unique
mv john-1.8.0/run/john.conf tools/john.conf
mv crunch-3.6/crunch tools/crunch
mv crunch-3.6/charset.lst files/charset.lst
mv EpiCurl.php modules/EpiCurl.php
mv config.json files/config.json
mv wordlist.lst files/wordlist.lst
mv mangle.lst files/mangle.lst
mv configmake tools/configmake
mv add tools/add
mv clean tools/clean
printf "\n\nCleaning up!\n\n"
rm -rf john-1.8.0/
rm -rf crunch-3.6/
rm john-1.8.0.tar.xz
rm crunch-3.6.tgz
rm install.sh
printf "\n\nAll Done!\n\n"
exit
