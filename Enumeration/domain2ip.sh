#!/bin/bash
for url in $(cat list.txt); do
host $url
done
