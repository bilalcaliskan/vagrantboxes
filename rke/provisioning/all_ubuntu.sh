#!/bin/bash

## OS upgrade
sudo apt update && sudo apt full-upgrade -y


## Firewall rules
# etcd nodes - Inbound rules
sudo ufw allow from any to any port 2376 proto tcp
sudo ufw allow from any to any port 2379 proto tcp
sudo ufw allow from any to any port 2380 proto tcp
sudo ufw allow from any to any port 8472 proto udp
sudo ufw allow from any to any port 9099 proto tcp
sudo ufw allow from any to any port 10250 proto tcp

# controlplane nodes - Inbound rules
sudo ufw allow from any to any port 80 proto tcp
sudo ufw allow from any to any port 443 proto tcp
sudo ufw allow from any to any port 6443 proto tcp
sudo ufw allow from any to any port 10254 proto tcp


## Docker installation
curl https://releases.rancher.com/install-docker/18.09.2.sh | sh
sudo usermod -aG docker vagrant


## Kernel modules
for module in br_netfilter ip6_udp_tunnel ip_set ip_set_hash_ip ip_set_hash_net iptable_filter iptable_nat iptable_mangle iptable_raw nf_conntrack_netlink nf_conntrack nf_conntrack_ipv4   nf_defrag_ipv4 nf_nat nf_nat_ipv4 nf_nat_masquerade_ipv4 nfnetlink udp_tunnel veth vxlan x_tables xt_addrtype xt_conntrack xt_comment xt_mark xt_multiport xt_nat xt_recent xt_set  xt_statistic xt_tcpudp; do
    if ! lsmod | grep -q $module; then
        echo "module $module is not present"
        modprobe $module
    fi;
done



## Required sysctl
echo -e "\nnet.bridge.bridge-nf-call-iptables=1" > /etc/sysctl.d/99-sysctl.conf
sudo sysctl -p /etc/sysctl.d/99-sysctl.conf
