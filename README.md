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

At least 10 Gb space is required but 20-40 Gb space is recommended.

### Minimal Skel
Once you have a fresh CentOS 7 Linux installed, you can setup an skel for toolchain and workarea, following below steps:

Step 1. Download (or clone the repository) and change scripts file permissions.
        
        chmod 777 *.sh

Step 2. Run the 'minimal_micro_skel.sh' as root and them download and run the 'minimal_microworkarea_skel.sh' script as user.

        su
        ./minimal_micro_skel.sh
        exit
        ./minimal_microworkarea_skel.sh

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
    └── sources
```

where `opentools` has the EDA tools and `micro_skel` is the user workarea.

Of course, you can customize the scripts to do in a different way.

This minimal setup will provide you to compile and simulate RTL designs using VHDL.

### x86 Assembly DOS Experiences

Here we'll install an emulator to run DOS on linux as well as install the Classic Borland Turbo Assembler for x86 in order to have a first experience in low level programming. Also, we create a new directory on the `micro_skel` named `tasm`.

For this setup you may need first Minimal skel done (as performed in steps 1 and 2) and download (or clone) the `tasm_install.sh` script. Since downloaded (and changed permissions as in step 1), run it using:

                ./tasm_install.sh

Go to my repository `/tasm_hello` and see how to have this first x86 assembly experience using this skel. Have fun!

### x86-64 Assembly Linux Experiences

Here we'll install the NASM assembler on linux in order to continues the experience in low level programming, now with x86-64 assembly programming. 

For this setup you may need first Minimal skel done (as performed in steps 1 and 2) and download (or clone) the `nasm_install.sh` script. Since downloaded (and changed permissions as in step 1), run it using:

                ./nasm_install.sh

See the slides of the M&M course and have fun!

Tip1: test the flow using _hello.asm_ example and then _endianness.asm_ to understand how data storage is performed on x86 architecture.

Tip2: test using GNU toolchain (at&t vs intel syntax; and using gcc vs as+ld).

### RISC-V

Here we'll install the RISC-V toolchain in order to continues the experience programming for a RISC processor. 

For this setup you may need first Minimal skel done (as performed in steps 1 and 2) and download (or clone) the `riscv_install.sh` (and maybe riscv_install_p2.sh script). Since downloaded (and changed permissions as in step 1), run it using:

                ./riscv_install.sh
                
NOTE: if the script stop, proceed with the execution of "riscv_install_p2.sh" script (for more details, open and view the script comments).

NOTE2: if you have less than 20 Gb, you will need to perform some workaround to add more disk space (for more details, open and view the script comments).

Go to my repository `/riscv_hello` and see how to have this first RISC-V experience using this skel. Have fun!

--
Temporary/alternative setup (not recommended now):
- Download and unpack GNU Embedded Toolchain — v2020.12.8 for CentOS to compile; and Spike Disassembler — v2020.12.1 to simulate;
at https://www.sifive.com/software.
- Use the tools to compile and simulate the Hello World programs from my `riscv_hello` repo.
--

### Complete Skel

Work in progress...
