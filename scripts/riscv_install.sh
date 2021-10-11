echo "Installation of RISC-V toolchain will begin..."

echo "You will need root permissions to perform tools installation..."

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Resolving dependencies..."
yum install autoconf automake python3 libmpc-devel mpfr-devel gmp-devel gawk  bison flex texinfo patchutils gcc gcc-c++ zlib-devel expat-devel -y
yum install centos-release-scl -y
yum install devtoolset-7-make -y
yum install dtc -y

echo "Seting up RISC-V install dir..."
cd /opt
mkdir riscv

echo "Create temporary directory to clone toolchain"
# if you are using a VM with less than 20 Gb, then, create in a pendrive or similar with at least 20 Gb space.
cd /media/run/micro
mkdir riscv
cd riscv

echo "Using devtoolset for CentOS compatible installation..."
scl enable devtoolset-7 bash

echo "Setting up RISC-V paths..."
export RISCV=/opt/riscv
export PATH=$PATH:$RISCV/bin

echo "Clonning and installing RISCV-GNU-TOOLCHAIN..."
git clone https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
./configure --prefix=/opt/riscv --enable-multilib
cd ..

echo "Clonning and installing RISCV-ISA-SIM, aka Spike..."
git clone https://github.com/riscv-software-src/riscv-isa-sim
cd riscv-isa-sim
mkdir build
cd build
../configure --prefix=$RISCV
make
make install
cd ..
cd ..

echo "Clonning and installing RISCV-PK, aka Proxy Kernel..."
git clone https://github.com/riscv-software-src/riscv-pk
cd riscv-pk
mkdir build
cd build
../configure --prefix=$RISCV --host=riscv64-unknown-elf --with-arch=rv32i
make
make install
cd ..
cd ..

cd ..
rm -rf riscv
exit

echo "RISC-V toolchain installation done!"
echo "Back to user and perform the below configuration in .bashrc file"

cho "#####################################################################################################################"
echo "To complete the setup you need to update the '.bashrc' file with the following paths:"
echo "export RISCV=/opt/riscv"
echo "export PATH=$PATH:$RISCV/bin"
echo "#####################################################################################################################"
