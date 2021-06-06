#!/bin/bash
for ip in $(seq 1 254); do
ping -c 1 10.11.1.$ip | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f 1 &
done
