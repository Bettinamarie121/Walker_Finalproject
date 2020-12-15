#!/bin/bash

#This script creates and executes a comparable_virusnew.txt that extracts and 
#sorts a subset of virus data from comparable_viruses.txt

#cut field 2 from comparable_viruses.txt and make a new file “pvy.txt with pvy types
cut -f2 comparable_viruses.txt | grep -v PVY >pvy.txt
#grep -v shows only the lines that do not match

#make a header file for comparable
echo “Comparable?” > header.txt

#annotate virus pvy.txt with “yes or no” based -on virus comparable to pvy
while read line
	do if [ $line PVY ]
then echo “yes”
else echo “no”
fi		#closes this loop
done < pvy.txt>>header.txt	#to append yes/no to header.txt and “done” to close the loop

#paste comparable_viruses.txt then header.txt
#want header.txt data to be added to the end and not the beginning of 
#comparable_virusesnew.txt 

paste comparable_viruses.txt header.txt > comparable_virusesnew.txt

#Count the number of comparable viruses
#set variable to string of commands/statement

NUM=$(grep "yes" comparable_virusesnew.txt | wc -l)
echo 'There is '$NUM' virus comparable to the PVY original strain.' 



