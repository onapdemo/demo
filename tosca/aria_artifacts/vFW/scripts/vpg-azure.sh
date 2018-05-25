#!/bin/bash
#__fw_ipaddr__="192.168.40.5"
#__protected_net_cidr__="192.168.30.0/24"
#__sink_ipaddr__="192.168.30.5"
#__repo_url_blob__="https://nexus.onap.org/content/sites/raw"
#__repo_url_artifacts__="https://nexus.onap.org/content/groups/staging"
#__demo_artifacts_version__="1.1.1"
#__install_script_version__="1.1.1"
#__vpg_private_ip_0__="192.168.40.4"
#__vpg_private_ip_1__="192.168.20.4"
#__unprotected_private_net_cidr__="192.168.40.0/24"
#__onap_private_net_cidr__="192.168.10.0/24"
#__cloud_env__="azure"

# Create configuration files
mkdir /opt/config
echo $vfw_unprotected_private_ip > /opt/config/fw_ipaddr.txt
echo $azure_virtual_protected_network_cidr > /opt/config/protected_net_cidr.txt
echo $vsn_private_ip_0 > /opt/config/sink_ipaddr.txt
echo $repo_url_blob > /opt/config/repo_url_blob.txt
echo $repo_url_artifacts > /opt/config/repo_url_artifacts.txt
echo $demo_artifacts_version > /opt/config/demo_artifacts_version.txt
echo $install_script_version > /opt/config/install_script_version.txt
echo $vpkg_unprotected_private_ip > /opt/config/vpg_private_ip_0.txt
echo $vpg_private_ip_1 > /opt/config/vpg_private_ip_1.txt
echo $azure_virtual_unprotected_network_cidr > /opt/config/unprotected_private_net_cidr.txt
echo $azure_virtual_private_network_cidr > /opt/config/onap_private_net_cidr.txt
echo $cloud_env > /opt/config/cloud_env.txt
apt-get install dtach
# Download and run install script
curl -k ${repo_url_blob}/org.onap.demo/vnfs/vfw/${install_script_version}/v_packetgen_install.sh -o /opt/v_packetgen_install.sh
cd /opt
chmod +x v_packetgen_install.sh
dtach -n `mktemp -u /tmp/dtach.XXXX` ./v_packetgen_install.sh

#sed -i 's/length 128/length 9/g' /opt/pg_streams/stream_fw_udp1
#sed -i 's/length 128/length 9/g' /opt/pg_streams/stream_fw_udp2
#sed -i 's/length 128/length 9/g' /opt/pg_streams/stream_fw_udp3
#sed -i 's/length 128/length 9/g' /opt/pg_streams/stream_fw_udp4
#sed -i 's/length 128/length 9/g' /opt/pg_streams/stream_fw_udp5
#sed -i 's/length 128/length 9/g' /opt/pg_streams/stream_fw_udp6
#sed -i 's/length 128/length 9/g' /opt/pg_streams/stream_fw_udp7
#sed -i 's/length 128/length 9/g' /opt/pg_streams/stream_fw_udp8
#sed -i 's/length 128/length 9/g' /opt/pg_streams/stream_fw_udp9
#sed -i 's/length 128/length 9/g' /opt/pg_streams/stream_fw_udp10

#reboot
