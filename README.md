# micro_skel
This repository constains configuration scripts for a microprocessors and microcontrollers course. The scripts are used to toolchain installation and workarea setup.

## Guiding instructions

### Pre-requisites
First of all you need to have linux! The scripts were implemented and tested for CentOS 7 distribution (7.9) since is the most commonly used due to support for EDA (commercial) tools, but Ubuntu is also much used from open source community and the scripts can be adapted to use with it.

So you need to have an installation of CentOS 7 on your computer. If you don´t have yet, you need to choose between 3 options:
- single linux installation;
- dual-boot installation (if you really want to maintain windowns, or maybe macOSX);
- linux on a virtual machine (VM) running on windows.

Of course, the worst option is to run on a virtual machine because virtualization can slower the processing, but works, and I tested the scripts in both "dedicated" linux and also using Oracle VirtualBox VM's.

If you want to know how to install CentOS 7 see the following instuctions: https://linoxide.com/how-tos/centos-7-step-by-step-screenshots/

At least 20 Gb space is required but 40-60 Gb space is recommended.

### Minimal Skel
Once you have a fresh CentOS 7 Linux installed, you can setup an skel for toolchain and workarea, following below steps:

Step 1. Download (or clone the repository) and change scripts file permissions.
        
        chmod 777 *.sh

Step 2. Run the 'minimal_micro_skel.sh' as root and them download and run the 'minimal_microworkarea_skel.sh' script as user.

        su
        ./minimal_opentools.sh
        exit
        ./minimal_sky130_skel.sh

I call this first option as minimal since it support basic design flow with basic following open source EDA tools:
- GHDL (version 33);
- GTKWave (version 8.3).

The directory structure is organized as follow:
```bash 
/edatools/
  └── opentools
```

and

```bash 
~/micro_skel/
    └── adder
```

where `opentools` has the EDA tools and `micro_skel` is the user workarea.

Of course, you can customize the scripts to do in a different way.

This minimal setup will provide you to compile and simulate RTL designs using VHDL.

### Complete Skel

Work in progress...
