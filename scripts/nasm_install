echo "Installing tools and setting up x86-64 assembly linux experience"

if [[ $EUID -ne 1000 ]]; then
   echo "This script must be run as user"
   exit 1
fi

echo "Installing NASM"
sudo yum install nasm -y

echo "x86-64 assembly linux experience setup done!"
