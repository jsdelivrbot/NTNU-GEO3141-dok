#!/bin/bash
#
# Zip all files in web folder and sub-folders
# which are changed since last commit.
# Requires use of 7zip command line application.
#
# sverre.stikbakke@ntnu.no 15.05.2017
#

mkdir -p ../webdiff

rm ../webdiff.zip
rm -r ../webdiff/*

for file in $(git ls-files --modified *[^.md]*[^.sh]); do
  cp file ../webdiff
done

# ./7za.exe a -r ../webdiff.zip ../webdiff/*
