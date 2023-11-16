#! /bin/bash

FILE="/etc/default/grub"

grep GRUB_CMDLINE_LINUX_DEFAULT ${FILE} | grep -v nomodeset >/dev/null
if [ $? == 0 ]; then

 ORG_LINE=$(grep GRUB_CMDLINE_LINUX_DEFAULT ${FILE} | grep -v nomodeset)
 NEW_LINE=$(echo ${ORG_LINE} | sed 's/"$/ nomodeset"/' )

 echo ${ORG_LINE}
 echo ${NEW_LINE}

 sed -i.bak "s/${ORG_LINE}/${NEW_LINE}/" ${FILE} >/dev/null 2>&1

 update-grub
fi
