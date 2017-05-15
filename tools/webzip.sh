#!/bin/bash
#
# zip all files in web folder and sub-folders.
# requires use of 7zip command line application
#
# sverre.stikbakke@ntnu.no 12.05.2017
#


rm ../web.zip
./7za.exe a -r ../web.zip ../web/*
