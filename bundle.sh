#!/bin/bash

#Nécessite d'installer des paquets pip
# pip install pipreqs
# pip install pip-bundle


BUNDLES=()
BUNDLES_TO_EXTRACT=()
DIR=tempWheels
BUN_DIR=bundle_files
REQ=requirements.txt
PIP_BUN=bundle.pip-bundle

echo -ne '#####\r'
pipreqs . > /dev/null 2>&1
pip-bundle create > /dev/null 2>&1
file-roller -e $BUN_DIR $PIP_BUN > /dev/null 2>&1

echo -ne '##########\r'

mkdir $DIR

while read p;
do
	BUNDLE="$(cut -d'=' -f1 <<<$p)"
	BUNDLES=("${BUNDLES[@]}" "$BUNDLE")

done < $REQ

cd $BUN_DIR
for WHEEL in *;
do 
	WHEELNAME="$(cut -d'-' -f1 <<<$WHEEL)"
	for TEMP_BUNDLE in "${BUNDLES[@]}"
	do
		if [ "$WHEELNAME" == "$TEMP_BUNDLE" ]	
		then
			file-roller -e ../$DIR $WHEEL > /dev/null 2>&1
		fi
	done 	
done

echo -ne '###############\r'
cd ../$DIR

for FOLDER in *;
do
	for TEMP_BUNDLE in "${BUNDLES[@]}"
	do
		if [ "$FOLDER" == "$TEMP_BUNDLE" ]
		then
		mv $FOLDER ..
		fi
	done
done

echo -ne '#########################\r'
cd ..
rm -rf $DIR
rm -rf $BUN_DIR
rm -f $PIP_BUN
rm -f $REQ

echo -ne 'BUNDLE DONE !\r'




