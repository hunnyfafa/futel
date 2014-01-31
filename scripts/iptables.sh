# how to set up /etc/sysconfig/iptables on ceres

# clear all
iptables -F

# allow localhost
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT --src futel2.dyndns.org -j ACCEPT
# allow established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# let ssh in
iptables -A INPUT -p tcp --dport 42422 -j ACCEPT

# close everything
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# callcentric
iptables -A INPUT -p udp -m udp -s 204.11.192.0/24 --dport 5060:5080 -j ACCEPT
iptables -A INPUT -p udp -m udp -s 204.11.192.0/24 --dport 10000:20000 -j ACCEPT
iptables -A INPUT -p udp -m udp -s 66.193.176.35 --dport 5060:5080 -j ACCEPT
iptables -A INPUT -p udp -m udp -s 66.193.176.35 --dport 10000:20000 -j ACCEPT
iptables -A INPUT -p udp -m udp -s 66.193.176.54 --dport 5060:5080 -j ACCEPT
iptables -A INPUT -p udp -m udp -s 66.193.176.54 --dport 10000:20000 -j ACCEPT
iptables -A INPUT -p udp -m udp -s 66.193.176.58 --dport 5060:5080 -j ACCEPT
iptables -A INPUT -p udp -m udp -s 66.193.176.58 --dport 10000:20000 -j ACCEPT
# ipkall
iptables -A INPUT -p udp -m udp -s 66.54.140.46,66.54.140.47 --dport 5060:5080 -j ACCEPT
iptables -A INPUT -p udp -m udp -s 66.54.140.46,66.54.140.47 --dport 10000:20000 -j ACCEPT