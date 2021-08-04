echo "Setting up minimal workarea"

if [[ $EUID -ne 1000 ]]; then
   echo "This script must be run as user"
   exit 1
fi

cd ~
mkdir micro_skel
mkdir temp
cd temp
git clone https://www.github.com/britovski/micro_skel
cp micro_skel/sources.zip ../micro_skel
cd ../micro_skel
unzip sources.zip
rm sources.zip
rm -rf ../temp

echo "Minimal workarea done!"
