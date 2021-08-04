echo "Installation of GHDL and GTKWave will begin..."

#echo "You will need root permissions to perform tools installation..."


if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Setting up directories..."

cd /
mkdir edatools 
cd edatools
#mkdir tools
#cd tools
mkdir opentools
cd opentools

echo "Solving dependencies..."
yum update -y
yum upgrade -y
yum install gcc gcc-c++ autoconf automake patch patchutils indent libtool python3 cmake git -y
yum install mesa-libGL mesa-libGLU mesa-libGLU-devel libXp libXp-devel libXmu-devel tcl tk tcl-devel tk-devel cairo cairo-devel -y
yum install graphviz libXaw-devel readline-devel flex bison -y
#yum install openmpi openmpi-devel openmpi3 openmpi-devel3 -y #use if you want multi-core support
yum install gcc-gnat -y
yum install epel-release -y

echo "Downloading tools..."
wget -O ghdl-0.37.tar.gz https://github.com/ghdl/ghdl/archive/v0.37.tar.gz
 
echo "Installing tools..."

echo "Installing GTKWave..."
yum install gtkwave -y

#echo"Installing Icarus Verilog..."
#yum install iverilog -y

echo "Installing GHDL..."
tar zxvpf ghdl-0.37.tar.gz
cd ghdl-0.37
./configure
make
make install
cd ..

echo "Minimal EDA open source tools installation done!"
echo "Back to user and run the 'minimal_microworkarea_skel.sh' script"
