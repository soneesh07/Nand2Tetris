# Nand2Tetris Project 3 — Memory

Implementation of the memory components from **Nand2Tetris Project 3** using **Verilog HDL**.

## Overview

The project builds a hierarchical memory system starting from a single-bit storage element and progressively constructing larger memory modules.

### Components Implemented

| Component | Description |
|---|---|
| `DFF` | 1-bit data flip-flop |
| `Bit` | 1-bit storage element with load control |
| `Register` | 16-bit register |
| `RAM8` | 8 × 16-bit RAM |
| `RAM64` | 64 × 16-bit RAM |
| `RAM512` | 512 × 16-bit RAM |
| `RAM4K` | 4096 × 16-bit RAM |
| `RAM16K` | 16384 × 16-bit RAM |
| `PC` | 16-bit program counter |

## Memory Hierarchy

The larger memory modules are constructed using smaller modules:

```text
DFF
 │
 ▼
Bit
 │
 ▼
Register
 │
 ▼
RAM8
 │
 ▼
RAM64
 │
 ▼
RAM512
 │
 ▼
RAM4K
 │
 ▼
RAM16K

For example, RAM16K is built from four RAM4K modules. The upper address bits select the required RAM4K, while the remaining address bits select the location within that module.

RAM16K

RAM16K contains:

16,384 words
16 bits per word
14-bit address input

Its architecture uses:

              address[13:12]
                    │
                DMux4Way
             ┌──────┼──────┐
             ▼      ▼      ▼      ▼
           RAM4K  RAM4K  RAM4K  RAM4K
             │      │      │      │
             └──────┼──────┼──────┘
                    ▼
                Mux4Way16
                    │
                    ▼
                   out
Program Counter

The PC implements a 16-bit program counter with:

Load
Increment
Reset
Hold

Control priority:

Reset → Load → Increment → Hold
Verification

Each component has its own Verilog testbench located in the tb/ directory.

The RAM16K implementation was additionally verified using the official Nand2Tetris Hardware Simulator with the supplied test script and comparison file. The output matched the reference table.

Tools Used
Verilog HDL
Icarus Verilog
GTKWave
Nand2Tetris Hardware Simulator
Git / GitHub
Directory Structure
Project3/
│
├── src/
│   ├── bit.v
│   ├── dff.v
│   ├── pc.v
│   ├── ram8.v
│   ├── ram64.v
│   ├── ram512.v
│   ├── ram4k.v
│   ├── ram16k.v
│   └── reg.v
│
├── tb/
│   ├── bit_tb.v
│   ├── dff_tb.v
│   ├── pc_tb.v
│   ├── ram8_tb.v
│   ├── ram64_tb.v
│   ├── ram512_tb.v
│   ├── ram4k_tb.v
│   ├── ram16k_tb.v
│   └── reg_tb.v
│
└── README.md