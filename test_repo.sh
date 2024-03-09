#! /bin/bash

param1 = "$1"
param2 = "$2"

#1
mkdir -p "$param2"
cd "$param2"
git init

#2&3
touch logtest.log
echo "$(date '+%Y-%m-%d %H:%M:%S.%N') - Repo Folder Created" >> logtest.log

#4
curl -L -o file.tar.gz "$1"

#5
echo "$(date '+%Y-%m-%d %H:%M:%S.%N') - ${param1} downloaded" >> logtest.log

#6
tar -xzf file.tar.gz

#7
find . -type f >> logtest.log

#8
git add .
git commit -m "Initial commit"

#9
git checkout -b BR_IMAGES

#10
cp -r extracted_folder/*.{jpeg,png} .

#11
git add .
git commit -m "Add images"

#12
git checkout -b BR_TEXT

#13
cp -r extracted_folder/*.{txt,log} .

#14
git add .
git commit -m "Add text files"

#15
git checkout master
rm -rf extracted_folder file.tar.gz

#16
git commit -m "Remove extracted files"
 
#17
git merge BR_IMAGES
git merge BR_TEXT

#18
git log --oneline BR_IMAGES >> logtest.log
git log --oneline BR_TEXT >> logtest.log
git log --oneline master >> logtest.log


git remote add origin https://github.com/Omer-Levi/linux-task4.git

#19
git push --all -u origin 

