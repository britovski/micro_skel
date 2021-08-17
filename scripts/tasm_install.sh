echo "Installing tools and setting up x86 assembly DOS experience"

if [[ $EUID -ne 1000 ]]; then
   echo "This script must be run as user"
   exit 1
fi

echo "Installing dosbox"
sudo yum install dosbox -y

echo "Creating micro_skel workarea (if not exist)"
cd ~
mkdir micro_skel
cd micro_skel

echo "Downloading and installing tasm"
wget https://github.com/britovski/micro_skel/raw/main/tasm.tar.gz
tar zxvpf tasm.tar.gz
rm tasm.tar.gz

echo "Setting up workarea step #2"
cd ..
mkdir .dosbox
cd .dosbox
wget https://raw.githubusercontent.com/britovski/micro_skel/main/config/dosbox-0.74-3.conf

echo "x86 assembly DOS experience setup done!"
