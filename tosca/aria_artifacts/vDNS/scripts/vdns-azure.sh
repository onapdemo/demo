#!/bin/bash

# Create configuration files
mkdir /opt/config
#echo "__lb_oam_int__" > /opt/config/lb_oam_int.txt
#echo "__lb_private_ipaddr__" > /opt/config/lb_private_ipaddr.txt
#echo "__local_private_ipaddr__" > /opt/config/local_private_ipaddr.txt
#echo "__oam_private_ipaddr__" > /opt/config/oam_private_ipaddr.txt
#echo "__repo_url_blob__" > /opt/config/repo_url_blob.txt
#echo "__repo_url_artifacts__" > /opt/config/repo_url_artifacts.txt
#echo "__demo_artifacts_version__" > /opt/config/demo_artifacts_version.txt
#echo "__install_script_version__" > /opt/config/install_script_version.txt
#cho "__vlb_private_net_cidr__" > /opt/config/vlb_private_net_cidr.txt
#echo "__onap_private_net_cidr__" > /opt/config/onap_private_net_cidr.txt
#echo "__cloud_env__" > /opt/config/cloud_env.txt

echo $vlb_private_ip_1 > /opt/config/lb_oam_int.txt
echo $vlb_private_ip_0 > /opt/config/lb_private_ipaddr.txt
echo $vdns_private_ip_0 > /opt/config/local_private_ipaddr.txt
echo $vdns_private_ip_1 > /opt/config/oam_private_ipaddr.txt
echo $repo_url_blob  > /opt/config/repo_url_blob.txt
echo $repo_url_artifacts > /opt/config/repo_url_artifacts.txt
echo $demo_artifacts_version > /opt/config/demo_artifacts_version.txt
echo $install_script_version  > /opt/config/install_script_version.txt
echo $azure_virtual_vlb_vdns_network_cidr > /opt/config/vlb_private_net_cidr.txt
echo $azure_virtual_private_network_cidr > /opt/config/onap_private_net_cidr.txt
echo $cloud_env > /opt/config/cloud_env.txt
echo $vpg_private_ip_0 > /opt/config/pg_private_ipaddr.txt
apt-get install dtach
curl -k $repo_url_blob/org.onap.demo/vnfs/vlb/$install_script_version/v_dns_install.sh -o /opt/v_dns_install.sh
cd /opt
chmod +x v_dns_install.sh
dtach -n `mktemp -u /tmp/dtach.XXXX` ./v_dns_install.sh
