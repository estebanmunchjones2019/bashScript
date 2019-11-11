#!/bin/sh
echo 'Welcome'
firstline=$(head -n 1 ./source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "The version is: $version"
echo "Would you like to proceed with the current version? Type 1 for yes and 0 for no"
read versioncontinue
if [ $versioncontinue -eq 1 ]
  then
  echo 'Ok'
    for file in source/*
      do
        if [ $file == 'source/secretinfo.md' ]
        then
          echo "Sorry, the file secretinfo.md can not be copied to build folder"
        else
          echo "$file being copied to build folder"
          cp $file build/
        fi
      done
   else
  echo 'Come back when you are ready'
fi
cd build
echo "Build folder version: $version contains:"
ls

