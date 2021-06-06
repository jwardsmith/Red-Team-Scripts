#!/bin/bash

# reset all counters and iptables rules
iptables -Z && iptables -F
# measure incoming traffic from <incoming>
iptables -I INPUT 1 -s <incoming> -j ACCEPT
# measure outgoing traffic to <outgoing>
iptables -I OUTPUT 1 -d <outgoing> -j ACCEPT
