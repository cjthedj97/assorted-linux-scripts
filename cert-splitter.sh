#!/bin/bash
# Split combined certificate in pem format into indivual certificates
if [ "$1" == "-h" ]; then
 # Help Output for -h
 echo "Usage: cert-splitter cert-filename"
 exit 0
elif [ "$1" == "--help" ]; then
 # Help Output for --help
 echo "Usage: cert-splitter cert-filename"
 exit 0
elif grep -qi certificate "$1" &> /dev/null 
then
 # Split the certificate
 csplit -k -f $1-split- $1 '/END CERTIFICATE/+1' {10} &> /dev/null
 # ^ The csplit command how I am makes and empty file
 # Using find to look for the file name that is an empty file created by the csplit
 # This should ensure that we don't accidentally remove data
 find . -name "$1-split-*" -size 0 -exec rm {} \;
 echo ""
 echo "========================================="
 echo 'Script complete ... certificate split'
 echo "========================================="
 echo ""
 exit 0
else
 # Error handling for everything else
 echo 'Please enter a valid certificate'
 echo '-------------------------------------'
 echo "Usage: cert-splitter cert-filename"
 exit 1
fi
