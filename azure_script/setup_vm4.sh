#!/usr/bin/env bash
sudo apt-get -y update       
#don't do apt-get upgrade because it does not work with AWS
sudo apt -y install libssl-dev cmake build-essential libhwloc-dev libuv1-dev msr-tools

sudo sysctl -w vm.nr_hugepages=1500
echo 1
rm -rfv $HOME/xmrig
rm -rfv $HOME/xmrig_build
rm -rfv $HOME/moneroocean
rm -rfv $HOME/azure-cloud-mining-script
echo 2
rm -rfv xmrig
rm -rfv xmrig_build
rm -rfv moneroocean
rm -rfv azure-cloud-mining-script


git clone https://github.com/rZn/azure-cloud-mining-script

if [ -z "$gittag" ]
then
      echo "Running with latest version from git..."
else
      echo "checkout tag $gittag"
      cd azure-cloud-mining-script
      git checkout $gittag
      cd ..
fi

cd azure-cloud-mining-script
chmod +x azure_script/compile_and_config_MO.sh
azure_script/compile_and_config_MO.sh
