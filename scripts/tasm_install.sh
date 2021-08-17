echo "Installing tools and setting up x86 assembly DOS experience"

if [[ $EUID -ne 1000 ]]; then
   echo "This script must be run as user"
   exit 1
fi

echo "Installing dosemu"
sudo yum install dosemu -y

echo "Downloading and installing tasm"
cd ~/micro_skel
wget https://github.com/britovski/micro_skel/raw/main/tasm.tar.gz
tar zxvpf tasm.tar.gz
rm tasm.tar.gz

echo "Setting up workarea"
cd ../.dosemu
wget https://raw.githubusercontent.com/britovski/micro_skel/main/config/dosbox-0.74-3.conf

echo "x86 assembly DOS experience setup done!"
