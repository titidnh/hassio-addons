#!/bin/bash

#####################################
# From yoyo.org
adServersListRegex="https://pgl.yoyo.org/adservers/serverlist.php?hostformat=squid-dstdom-regex&showintro=0&startdate%5Bday%5D=01&startdate%5Bmonth%5D=01&startdate%5Byear%5D=2017&mimetype=plaintext"
adserverslistRegexfile="adServersListyoyo.txt"

printf "Downloading Ad Servers list: yoyo.org... "
curl -sSL "$adServersListRegex" > $adserverslistRegexfile && printf "Done.\n\n"


#####################################
# From StevenBlack
adServersList="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
adserverslistfile="adServersListStevenBlack.txt"

printf "Downloading Ad Servers list: StevenBlack... "
curl -sSL "$adServersList" > $adserverslistfile && printf "Done.\n\n"

# remove squid invalid entries
sed -i '/#/d' $adserverslistfile
sed -i '/127.0.0.1\ /d' $adserverslistfile
sed -i '/f/d' $adserverslistfile
sed -i '/255/d' $adserverslistfile
sed -i '/::1/d' $adserverslistfile

# remove 0.0.0.0
sed -e s/0.0.0.0\ //g -i $adserverslistfile
sed -i '/0.0.0.0/d' $adserverslistfile

# white lines
sed -i '/^[[:space:]]*$/d' $adserverslistfile

#####################################
# From StevenBlack (Porn)
pornServersList="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-only/hosts"
pornserverslistfile="pornServersListStevenBlack.txt"

printf "Downloading Porn Servers list: StevenBlack... "
curl -sSL "$pornServersList" > $pornserverslistfile && printf "Done.\n\n"

# remove squid invalid entries
sed -i '/#/d' $pornserverslistfile
sed -i '/127.0.0.1\ /d' $pornserverslistfile
sed -i '/f/d' $pornserverslistfile
sed -i '/255/d' $pornserverslistfile
sed -i '/::1/d' $pornserverslistfile

# remove 0.0.0.0
sed -e s/0.0.0.0\ //g -i $pornserverslistfile
sed -i '/0.0.0.0/d' $pornserverslistfile

# white lines
sed -i '/^[[:space:]]*$/d' $pornserverslistfile

#####################################
# From  OISD
adOisdServersList="https://raw.githubusercontent.com/cbuijs/oisd/master/big/domains"
adOisdserverslistfile="adServersListOISD.txt"

printf "Downloading Ad Servers list: OISD... "
curl -sSL "$adOisdServersList" > $adOisdserverslistfile && printf "Done.\n\n"

# remove squid invalid entries
sed -i '/!/d' $adOisdserverslistfile
sed -i 's/||//' $adOisdserverslistfile
sed -i 's/\^//' $adOisdserverslistfile
# white lines
sed -i '/^[[:space:]]*$/d' $adOisdserverslistfile

#####################################
# From AdAway
adServersListAdAway="https://adaway.org/hosts.txt"
adserverslistAdAwayfile="adServersListAdAway.txt"

printf "Downloading Ad Servers list: AdAway... "
curl -sSL "$adServersListAdAway" > $adserverslistAdAwayfile && printf "Done.\n\n"

# remove squid invalid entries
sed -i '/#/d' $adserverslistAdAwayfile
sed -i '/::1/d' $adserverslistAdAwayfile
sed -i '/127.0.0.1\ \ localhost/d' $adserverslistAdAwayfile
sed -e s/127.0.0.1\ //g -i $adserverslistAdAwayfile

# white lines
sed -i '/^[[:space:]]*$/d' $adserverslistAdAwayfile

#####################################
# From NoPorn
#adServersListNoPorn="https://raw.githubusercontent.com/zangadoprojets/pi-hole-blocklist/main/Pornpages.txt"
#adserverslistNoPornfile="adServersListNoPorn.txt"

#printf "Downloading Ad Servers list: No Porn... "
#curl -sSL "$adServersListNoPorn" > $adserverslistNoPornfile && printf "Done.\n\n"

# remove squid invalid entries
#sed -i '/#/d' $adserverslistNoPornfile
#sed -i '/::1/d' $adserverslistNoPornfile
#sed -i '/127.0.0.1\ \ localhost/d' $adserverslistNoPornfile
#sed -e s/127.0.0.1\ //g -i $adserverslistNoPornfile

# white lines
#sed -i '/^[[:space:]]*$/d' $adserverslistNoPornfile

#####################################
# From NoTrack
adServersListNoTrack="https://adguardteam.github.io/HostlistsRegistry/assets/filter_32.txt"
adserverslistNoTrackfile="adServersListNoTrack.txt"

printf "Downloading Ad Servers list: No Track... "
curl -sSL "$adServersListNoTrack" > $adserverslistNoTrackfile && printf "Done.\n\n"

# remove squid invalid entries
sed -i '/!/d' $adserverslistNoTrackfile
sed -i '/#/d' $adserverslistNoTrackfile
sed -i '/::1/d' $adserverslistNoTrackfile
sed -i '/127.0.0.1\ \ localhost/d' $adserverslistNoTrackfile
sed -e s/127.0.0.1\ //g -i $adserverslistNoTrackfile
sed -i 's/||//' $adserverslistNoTrackfile
sed -i 's/\^//' $adserverslistNoTrackfile

# white lines
sed -i '/^[[:space:]]*$/d' $adserverslistNoTrackfile
