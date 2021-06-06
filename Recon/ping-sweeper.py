#!usr/bin/python

import subprocess

nrange = "10.11.1."

for i in range(1, 255):
  address = nrange + str(i)
  res = subprocess.call(['ping', '-c', '1', address])
  if res == 0:
    print address, "is up!"
  else:
    print "ping to", address, "failed!"
