#!/usr/bin/env bash

# list all .xml files in current dir
xml_files=$(find . -type f -name "*.xml")

for file in $xml_files; do
  cp $file /boot/config/plugins/dockerMan/templates-user/my_$file
done
