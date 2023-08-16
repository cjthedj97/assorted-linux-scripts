#!/bin/bash

pandoc=$(whereis pandoc)
if [[ $pandoc = *"pandoc"* ]]
then
  echo "Pandoc Installed"
else
  sudo apt install Pandoc
fi

lynx=$(whereis lynx)
if [[ $lynx = *"lynx"* ]]
then
  echo "Lynx Installed"
else
  sudo apt install lynx
fi

echo "Please enter file path"
read filepath
pandoc $filepath | lynx -stdin
