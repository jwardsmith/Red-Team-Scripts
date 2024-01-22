#!/usr/bin/python

import socket
import sys

with open('users.txt', 'r') as f:
    users = f.readlines()

# Create socket
s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# Connect to the server 
connect=s.connect(('10.11.1.229',25))
# Receive the banner
banner=s.recv(1024)
print banner

for u in users:
    user = u.strip()

    # VRFY a user
    s.send('VRFY ' + user + '\r\n')
    result=s.recv(1024)
    print result

# Close the socket
s.close
