#!/bin/bash

echo -e "Argument used '$1'\n"

if [ $(id -u) -ne 0 ]; then
        echo -e "\e[1;91mTHE INSTALLATION SCRIPT MUST BE RAN AS ROOT\e[0m"
        exit 1
fi


help () {

echo -e "\n\e[1;93mTo install cmash use :- \n\e[1;91m\tsudo bash $0 \e[92mor \e[1;91msudo bash $0 -i \e[92mor \e[1;91msudo bash $0 -install"

}

function opt_install()
{
    chmod +x cmash
    cp -f cmash /usr/bin/cmash
    if [ "$?" != "0" ]; then
        echo -e "\e[1;91mError\e[0m : Cant Copy"
    else
        echo -e "\e[1;92mInstallation finished.\e[0m"
    fi
}

if [[ ("$1" = "install" || "$1" = "-i" || "$1" = "-install") ]]

  then
      opt_install
  else
     help
fi
