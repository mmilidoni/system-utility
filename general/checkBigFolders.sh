#!/bin/bash

#Mostra la dimensione e il nome delle directory
#che occupano piu' di [arg1] MB di spazio su disco

if [ $# == 1 ]; then
        du -m / | perl -F"\s+" -ane 'if($F[0]>'$1') {print "$F[0] $F[1]\n"};'
else
        echo "ERRORE - la sintassi corretta e' ./comando [limite inferiore in MB]";
fi

