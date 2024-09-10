#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
EXIT="\e[0m"

#-------------------------------

echo
echo -n -e "${RED}[+] Enter the name of directory to be created :${EXIT} "

read $dir
cd $dir

echo
echo -e "${RED} [+] Js file gathering... ${EXIT}"

cat $1 | grep -E -v "(*[.]json|*[.]jsp)" | grep -E *[.]js > js-extension-urls.txt

echo 
echo -e "${GREEN}[+] Js files gathering completed...${EXIT}"

echo 
echo -e "${RED} Sending HTTP requests...${EXIT}"

cat js-extension-urls.txt | 

while read line 
do
    echo curl -l $line | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" >> all_fetc_urls.txt
done 
echo 

echo -e "${GREEN}[+] HTTP requests send ... ${EXIT}"
