# Nand2Tetris — Project 1: Boolean Logic

## Overview

This project implements the Boolean logic layer of the Nand2Tetris computer architecture using **Verilog HDL**.

The circuits are built **hierarchically from scratch**, starting with a NAND gate and progressively constructing more complex logic, switching, 16-bit, and multi-way components from previously verified modules.

Unlike the standard Nand2Tetris HDL implementation, this project uses **Verilog**, with **Icarus Verilog** for simulation and **GTKWave** for waveform analysis.

---

## Implemented Chips

### Basic Logic

| Chip | Configuration |
|---|---|
| NAND | 2 inputs → 1 output |
| NOT | 1 input → 1 output |
| AND | 2 inputs → 1 output |
| OR | 2 inputs → 1 output |
| XOR | 2 inputs → 1 output |

### Switching Logic

| Chip | Configuration |
|---|---|
| MUX | 2:1 |
| DMUX | 1:2 |

### 16-bit Logic

| Chip | Configuration |
|---|---|
| Not16 | 16-bit → 16-bit |
| And16 | 2 × 16-bit → 16-bit |
| Or16 | 2 × 16-bit → 16-bit |
| Mux16 | 2 × 16-bit → 16-bit |

### Multi-way Logic

| Chip | Configuration |
|---|---|
| Or8Way | 8-bit → 1-bit |
| Mux4Way16 | 4 × 16-bit → 16-bit |
| Mux8Way16 | 8 × 16-bit → 16-bit |
| DMux4Way | 1-bit → 4 × 1-bit |
| DMux8Way | 1-bit → 8 × 1-bit |

NAND is explicitly implemented in this repository. In the standard Nand2Tetris Project 1, NAND is treated as the primitive gate, resulting in 15 chips to implement. This repository therefore contains **16 Verilog modules**, including the NAND primitive.

---

## Design Approach

The project follows a bottom-up hierarchical design methodology.

```text

Primitive
   │
  NAND
   │
   ├── NOT
   ├── AND
   ├── OR
   └── XOR
        │
        ├── MUX
        └── DMUX

16-bit components
 │
 ├── Not16
 ├── And16
 ├── Or16
 └── Mux16

Multi-way components
 │
 ├── Or8Way
 ├── Mux4Way16
 ├── Mux8Way16
 ├── DMux4Way
 └── DMux8Way

 ``` 
---

## Example: Hierarchical Construction

Higher-level chips are constructed using previously verified modules rather than directly replacing the hierarchy with equivalent Verilog operators.

For example, the AND gate is constructed from NAND and NOT:

```text
a ─────┐
       NAND ── NOT ── out
b ─────┘

``` 
---

## Verification

Each implemented chip has a dedicated Verilog testbench.

The testbenches:

1. Apply input combinations or test vectors.
2. Allow the combinational logic to propagate.
3. Compare the actual output with the expected output.
4. Report `PASS` or `FAIL`.

For small combinational circuits, all possible input combinations were tested where practical.

For larger 16-bit and multi-way circuits, representative test vectors covering different input and selection conditions were used.

```markdown
### Example: NAND Verification

| a | b | out |
|---|---|-----|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

All four input combinations were verified through the testbench.