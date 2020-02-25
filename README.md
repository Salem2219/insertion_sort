# Insertion Sort
Basic Finite State Machine with Datapath (FSMD) example to sort the array a[].

## Notes

- Array a is a ram 16 x 8 bits.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem2219/insertion_sort.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd insertion_sort
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. Note: Array a is specifed in a_ram.vhd:

    ```sh
    $ vsim work.tb
    ```
6. Add the following commands in Transcript :
    ```sh
    $add wave -position end  sim:/tb/dut/RAM/program
    $run 30ns

```
