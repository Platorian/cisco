#!/bin/bash

# move into correct directory
cd ~/Documents/github/cis-notes/cisco

# add all new file
git add .
sleep 5

# commit new files to repo
git commit -m "updated notes"
sleep 10

# push files to main
git push origin main
sleep 10

# print status
git status
