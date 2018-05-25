#!/bin/bash

# Create configuration files
mkdir /opt/config
#echo "__oam_private_ipaddr__" > /opt/config/oam_private_ipaddr.txt
#echo "__onap_private_net_cidr__" > /opt/config/onap_private_net_cidr.txt
#echo "__local_private_ipaddr__" > /opt/config/local_private_ipaddr.txt
#echo "__pktgen_private_net_cidr__" > /opt/config/pktgen_private_net_cidr.txt
#echo "__vlb_ipaddr__" > /opt/config/vlb_ipaddr.txt
#echo "__repo_url_blob__" > /opt/config/repo_url_blob.txt
#echo "__repo_url_artifacts__" > /opt/config/repo_url_artifacts.txt
#echo "__demo_artifacts_version__" > /opt/config/demo_artifacts_version.txt
#echo "__install_script_version__" > /opt/config/install_script_version.txt
#echo "__pg_int__" > /opt/config/pg_int.txt
#echo "__vlb_mac__" > /opt/config/vlb_mac.txt
#echo "__cloud_env__" > /opt/config/cloud_env.txt

echo $vpg_private_ip_1 > /opt/config/oam_private_ipaddr.txt
echo $azure_virtual_vpg_vlb_network_cidr > /opt/config/pktgen_private_net_cidr.txt
echo $azure_virtual_private_network_cidr > /opt/config/onap_private_net_cidr.txt
echo $repo_url_blob > /opt/config/repo_url_blob.txt
echo $repo_url_artifacts > /opt/config/repo_url_artifacts.txt
echo $vpg_private_ip_0 > /opt/config/local_private_ipaddr.txt
echo $demo_artifacts_version > /opt/config/demo_artifacts_version.txt
echo $install_script_version > /opt/config/install_script_version.txt
echo $pg_int > /opt/config/pg_int.txt
echo $cloud_env > /opt/config/cloud_env.txt
echo $vlb_private_ip_2 > /opt/config/vlb_ipaddr.txt
echo $vlb_mac > /opt/config/vlb_mac.txt
apt-get install dtach
# Download and run install script
curl -k ${repo_url_blob}/org.onap.demo/vnfs/vlb/${install_script_version}/v_packetgen_install.sh -o /opt/v_packetgen_install.sh
cd /opt
chmod +x v_packetgen_install.sh
dtach -n `mktemp -u /tmp/dtach.XXXX` ./v_packetgen_install.sh
