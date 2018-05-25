#!/bin/bash
#__dcae_collector_ip__="127.0.0.1"
#__dcae_collector_port__="8080"
#__repo_url_blob__="https://nexus.onap.org/content/sites/raw"
#__repo_url_artifacts__="https://nexus.onap.org/content/groups/staging"
#__demo_artifacts_version__="1.1.1"
#__install_script_version__="1.1.1"
#__vfw_private_ip_0__="192.168.30.5"
#__vfw_private_ip_1__="192.168.40.4"
#__vfw_private_ip_2__="192.168.10.5"
#__unprotected_private_net_cidr__="192.168.40.0/24"
#__protected_private_net_cidr__="192.168.30.0/24"
#__onap_private_net_cidr__="192.168.10.0/24"
#__cloud_env__="azure"

# Create configuration files
mkdir /opt/config
echo $dcae_collector_ip > /opt/config/dcae_collector_ip.txt
echo $dcae_collector_port > /opt/config/dcae_collector_port.txt
echo $repo_url_blob > /opt/config/repo_url_blob.txt
echo $repo_url_artifacts > /opt/config/repo_url_artifacts.txt
echo $demo_artifacts_version > /opt/config/demo_artifacts_version.txt
echo $install_script_version > /opt/config/install_script_version.txt
echo $vfw_unprotected_private_ip > /opt/config/vfw_private_ip_0.txt
echo $vfw_protected_private_ip > /opt/config/vfw_private_ip_1.txt
echo $vfw_private_ip_2 > /opt/config/vfw_private_ip_2.txt
echo $azure_virtual_unprotected_network_cidr > /opt/config/unprotected_private_net_cidr.txt
echo $azure_virtual_protected_network_cidr > /opt/config/protected_private_net_cidr.txt
echo $azure_virtual_private_network_cidr > /opt/config/onap_private_net_cidr.txt
echo $cloud_env > /opt/config/cloud_env.txt
apt-get install dtach
# Download and run install script
curl -k ${repo_url_blob}/org.onap.demo/vnfs/vfw/${install_script_version}/v_firewall_install.sh -o /opt/v_firewall_install.sh
cd /opt
chmod +x v_firewall_install.sh
dtach -n `mktemp -u /tmp/dtach.XXXX` ./v_firewall_install.sh
