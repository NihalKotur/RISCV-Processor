# Single-Cycle RV32I RISC-V Processor

A full single-cycle 32-bit RISC-V processor written in SystemVerilog, designed and verified using Icarus Verilog (in VSCode) and Surfer.

## Features
* **RV32I Base Instruction Set**: Supports R-type arithmetic/logic, I-type immediate math/loads, S-type stores, B-type conditional branches, and J-type jumps.
* **Harvard Architecture**: Separate instruction memory (`instrMem.sv`) and data memory (`dataMem.sv`).
* **Modular Datapath**: Separated logic for the Program Counter, Register File, ALU, Immediate Generator, Control Unit, and Data/Instruction memories integrated via `topLayer.sv`.
* **Individual Testbenches**: Testbenches used for every .sv file (except for `ControlUnit.sv`) to test individual components before combining them.

## Project Structure
```text
├── rtl/
│   ├── topLayer.sv      # Top-level datapath and control wiring
│   ├── alu.sv           # Arithmetic Logic Unit (4-bit control)
│   ├── controlUnit.sv   # Main decoding logic for instruction types
│   ├── regFile.sv       # 32x32 bit register file (x0000 permanently set to 0)
│   ├── immGen.sv        # Immediate extension unit (I, S, B, U, J types)
│   ├── pc.sv            # Program Counter with active-low reset
│   ├── instrMem.sv      # 256x32 bit instruction memory (loads instrMemFile.mem)
│   └── dataMem.sv       # 256x32 bit data RAM
├── tb/
│   └── topLayer_TB.sv
└── memFiles/
    └── instrMemFile.mem
```

## Run With: 
iverilog -g2012 -o sim/topLayer_TB.vvp rtl/topLayer.sv tb/topLayer_TB.sv && vvp sim/topLayer_TB.vvp && surfer sim/topLayer.vcd