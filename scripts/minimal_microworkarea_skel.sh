echo "Setting up minimal workarea"

if [[ $EUID -ne 1000 ]]; then
   echo "This script must be run as user"
   exit 1
fi

cd ~
mkdir micro_skel
mkdir temp
cd temp
git clone https://www.github.com/britovski/adder_ghdl
cp adder_ghdl/sources.tgz ../micro_skel
cd ../micro_skel
tar zxvpf sources.tgz
rm sources.tgz
rm -rf ../temp

echo "Minimal workarea done!"
