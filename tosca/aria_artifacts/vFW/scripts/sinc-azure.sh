#!/bin/bash
#__protected_net_gw__="192.168.30.4"
#__unprotected_net__="192.168.40.0/24"
#__repo_url_blob__="https://nexus.onap.org/content/sites/raw"
#__install_script_version__="1.1.1"
#__vsn_private_ip_0__="192.168.30.5"
#__vsn_private_ip_1__="192.168.20.6"
#__protected_private_net_cidr__="192.168.30.0/24"
#__onap_private_net_cidr__="192.168.20.0/24"
#__cloud_env__="azure"

# Create configuration files
mkdir /opt/config
echo $vfw_protected_private_ip > /opt/config/protected_net_gw.txt
echo $azure_virtual_unprotected_network_cidr > /opt/config/unprotected_net.txt
echo $repo_url_blob > /opt/config/repo_url_blob.txt
echo $install_script_version > /opt/config/install_script_version.txt
echo $vsn_private_ip_0 > /opt/config/vsn_private_ip_0.txt
echo $vsn_private_ip_1 > /opt/config/vsn_private_ip_1.txt
echo $azure_virtual_protected_network_cidr > /opt/config/protected_private_net_cidr.txt
echo $azure_virtual_private_network_cidr > /opt/config/onap_private_net_cidr.txt
echo $cloud_env > /opt/config/cloud_env.txt
apt-get install dtach
# Download and run install script
curl -k ${repo_url_blob}/org.onap.demo/vnfs/vfw/${install_script_version}/v_sink_install.sh -o /opt/v_sink_install.sh
cd /opt
chmod +x v_sink_install.sh
dtach -n `mktemp -u /tmp/dtach.XXXX` ./v_sink_install.sh
