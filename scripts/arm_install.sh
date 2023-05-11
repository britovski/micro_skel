echo "Installation of ARM toolchain will begin..."

echo "You will need root permissions to perform tools installation..."

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Seting up ARM install dir..."
cd /opt
mkdir arm
cd arm

echo "Downloading toolchain for ARM"
wget https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz

echo "Installing toolchain for ARM"
tar Jxvpf arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
rm arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz

echo "Downloading toolchain for Aarch64"
wget https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz

echo "Installing toolchain for Aarch64"
tar Jxvpf arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz 
rm arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz 

echo "Downloading QEMU"
wget https://download.qemu.org/qemu-4.2.1.tar.xz

echo "Installing QEMU for ARM bare-metal, ARM-linux, Aarch64 bare-metal and Aarch-linux"
tar xvJf qemu-4.2.1.tar.xz
rm qemu-4.2.1.tar.xz

cd qemu-4.2.1
./configure --target-list=arm-softmmu,arm-linux-user,aarch64-softmmu,aarch64-linux-user
make install
cd ..
rm -rf qemu-4.2.1


echo "ARM toolchain installation done!"
echo "Back to user and perform the below configuration in .bashrc file"

echo "#####################################################################################################################"
echo "To complete the setup you need to update the '.bashrc' file with the following paths:"
echo "export ARM=/opt/arm"
echo "export PATH=$PATH:$ARM/xxx/bin"
echo "export PATH=$PATH:$ARM/xxx/bin"
echo "#####################################################################################################################"


## TO DO
## https://github.com/ARM-software/CMSIS_5/archive/refs/tags/5.9.0.tar.gz
## colocar as libs stm em um repo para baixar
## testar bare-metals
## https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi.tar.xz
## https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-elf.tar.xz
## testar renode
## qemu-aarch64 -L /opt/arm/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/ hello64
## qemu-arm -L /opt/arm/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc hello
