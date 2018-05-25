#!/bin/bash

# Create configuration files
mkdir /opt/config
#echo "__dcae_collector_ip__" > /opt/config/dcae_collector_ip.txt
#echo "__dcae_collector_port__" > /opt/config/dcae_collector_port.txt
#echo "__ip_to_dns_net__" > /opt/config/ip_to_dns_net.txt
#echo "__ip_to_pktgen_net__" > /opt/config/ip_to_pktgen_net.txt
#echo "__vip__" > /opt/config/vip.txt
#echo "__gre_ipaddr__" > /opt/config/gre_ipaddr.txt
#echo "__pktgen_ipaddr__" > /opt/config/pktgen_ipaddr.txt
#echo "__oam_private_ipaddr__" > /opt/config/oam_private_ipaddr.txt
#echo "__repo_url_blob__" > /opt/config/repo_url_blob.txt
#echo "__repo_url_artifacts__" > /opt/config/repo_url_artifacts.txt
#echo "__demo_artifacts_version__" > /opt/config/demo_artifacts_version.txt
#echo "__install_script_version__" > /opt/config/install_script_version.txt
#echo "__vlb_private_net_cidr__" > /opt/config/vlb_private_net_cidr.txt
#echo "__pktgen_private_net_cidr__" > /opt/config/pktgen_private_net_cidr.txt
#echo "__onap_private_net_cidr__" > /opt/config/onap_private_net_cidr.txt
#echo "__pktgen_mac__" > /opt/config/pktgen_mac.txt
#echo "__cloud_env__" > /opt/config/cloud_env.txt

echo $dcae_collector_ip > /opt/config/dcae_collector_ip.txt
echo $dcae_collector_port > /opt/config/dcae_collector_port.txt
echo $vlb_private_ip_0 > /opt/config/ip_to_dns_net.txt
echo $vlb_private_ip_2 > /opt/config/ip_to_pktgen_net.txt
echo $vip > /opt/config/vip.txt
echo $gre_ipaddr > /opt/config/gre_ipaddr.txt
echo $vpg_private_ip_0 > /opt/config/pktgen_ipaddr.txt
echo $vlb_private_ip_1 > /opt/config/oam_private_ipaddr.txt
echo $repo_url_blob > /opt/config/repo_url_blob.txt
echo $repo_url_artifacts > /opt/config/repo_url_artifacts.txt
echo $demo_artifacts_version > /opt/config/demo_artifacts_version.txt
echo $install_script_version > /opt/config/install_script_version.txt
echo $cloud_env > /opt/config/cloud_env.txt
echo $azure_virtual_vlb_vdns_network_cidr > /opt/config/vlb_private_net_cidr.txt
echo $azure_virtual_vpg_vlb_network_cidr > /opt/config/pktgen_private_net_cidr.txt
echo $azure_virtual_private_network_cidr  > /opt/config/onap_private_net_cidr.txt
echo $pg_mac > /opt/config/pktgen_mac.txt 
apt-get install dtach
# Download and run install script
curl -k ${repo_url_blob}/org.onap.demo/vnfs/vlb/${install_script_version}/v_lb_install.sh -o /opt/v_lb_install.sh
cd /opt
chmod +x v_lb_install.sh
dtach -n `mktemp -u /tmp/dtach.XXXX` ./v_lb_install.sh
