 #!/bin/bash

echo -e "\e[34m======================\e[0m"
echo -e "\e[97;4;1mSSH Enumeration:\e[0m"
echo -e "\e[34m======================\e[0m\n"

echo -e "\e[97mPlease enter a target host?"

read -p 'Target Host: ' target
echo
echo -e "\e[34m================================\e[0m"
echo SSH banner:
echo -e "\e[34m================================\e[0m"
echo "" | nc -nv -n -w1 $target 22 | grep -v "Invalid"
echo
echo -e "\e[34m================================\e[0m"
echo Service/version info:
echo -e "\e[34m================================\e[0m"
echo "" | nmap -sV -Pn -p 22 $target | grep -v "host" | grep -v "Host" | grep -v "nmap"
echo
echo -e "\e[34m================================\e[0m"
echo Algorithms supported
echo -e "\e[34m================================\e[0m"
echo "" | nmap --script ssh2-enum-algos -Pn -p 22 $target | grep -v "host" | grep -v "Host" | grep -v "nmap"
echo
echo -e "\e[34m================================\e[0m"
echo Authentication methods
echo -e "\e[34m================================\e[0m"
echo "" | nmap --script ssh-auth-methods --script-args="ssh.user=root" -Pn -p 22 $target | grep -v "host" | grep -v "Host" | grep -v "nmap"
echo
echo -e "\e[34m================================\e[0m"
echo SSH hostkeys
echo -e "\e[34m================================\e[0m"
echo "" | nmap --script ssh-hostkey --script-args ssh_hostkey=all -Pn -p 22 $target | grep -v "host" | grep -v "Host" | grep -v "nmap"
echo
echo -e "\e[34m================================\e[0m"
echo SSHv1 supported
echo -e "\e[34m================================\e[0m"
echo "" | nmap --script sshv1.nse -Pn -p 22 $target | grep -v "host" | grep -v "Host" | grep -v "nmap"
