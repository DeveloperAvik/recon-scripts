#!/bin/bash

gau {urlname} | grep "=" | qsreplace hack\" -a | 

while read url 
do
    target= `curl -s -l $url | egrep -o '(hack"|hack\\")'`
    echo -e "Target: \e[1,31m $url \e[0m" "$target" "\n";
done | sed 's/hack%22/[XSS Possible] Reflection found.../g'
