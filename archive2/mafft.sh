#!/bin/bash
        for i in $(ls ./msa_in/); do
            echo item: $i;
mafft --thread -7 --maxiterate 1000 --globalpair ./msa_in/"$i">./msa_out/$i
        done
        
