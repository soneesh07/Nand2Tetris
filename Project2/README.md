# Nand2Tetris — Project 2: Boolean Arithmetic

## Overview

Project 2 focuses on building the arithmetic section of the Hack computer from smaller digital components.

The project starts with basic binary addition and progressively builds a 16-bit arithmetic unit and finally a complete ALU.

## Repository Structure

```text
Nand2Tetris/
├── run_test.bat
├── Project1/
└── Project2/
        ├── src/
        │   ├── halfadder.v
        │   ├── fulladder.v
        │   ├── add16.v
        │   ├── inc16.v
        │   └── alu.v
        │
        └── tb/
            ├── halfadder_tb.v
            ├── fulladder_tb.v
            ├── add16_tb.v
            ├── inc16_tb.v
            └── alu_tb.v
``` 

## Objectives

- Implement binary addition using HalfAdders and FullAdders.
- Build a 16-bit ripple-carry adder.
- Implement a 16-bit incrementer.
- Understand two's-complement arithmetic and signed numbers.
- Build the Hack ALU using combinational components.
- Verify all implemented circuits using Verilog testbenches.

## Architecture

The chips are built hierarchically:

```text
Project 1 Gates
      │
      ▼
  HalfAdder
      │
      ▼
  FullAdder
      │
      ▼
    Add16
      │
      ▼
    Inc16
      │
      ▼
     ALU
````

Each higher-level component reuses previously implemented components instead of rebuilding them from individual gates.

## Chips Implemented

| Chip      | Description                                                     |
| --------- | --------------------------------------------------------------- |
| HalfAdder | Adds two 1-bit values and produces sum and carry                |
| FullAdder | Adds two bits and an input carry                                |
| Add16     | Adds two 16-bit values                                          |
| Inc16     | Increments a 16-bit value by 1                                  |
| ALU       | Performs arithmetic and logical operations on two 16-bit inputs |

---

## HalfAdder

The HalfAdder performs:

$$
sum = a \oplus b
$$

$$
carry = a \land b
$$

It was implemented using the `Xor` and `And` gates from Project 1.

All four possible input combinations were tested.

---

## FullAdder

The FullAdder adds:

* `a`
* `b`
* `cin`

and produces:

* `sum`
* `carry`

It was constructed using two HalfAdders and an OR gate.

```text
        ┌─────────────┐
a ─────►│             │
b ─────►│ HalfAdder 1 ├──► sum1
        │             │
        └──────┬──────┘
               │
               ▼
        ┌─────────────┐
cin ───►│ HalfAdder 2 ├──► sum
        └──────┬──────┘
               │
               ▼
          OR ──► carry
```

All 8 possible input combinations were tested.

---

## Add16

`Add16` performs:

$$
out = a+b
$$

It is constructed using:

* 1 HalfAdder for the least significant bit
* 15 FullAdders for the remaining bits

The carry from each bit is propagated to the next bit.

```text
a[0], b[0]   → HalfAdder  → out[0]
                    │
                  carry
                    ↓
a[1], b[1]   → FullAdder  → out[1]
                    │
                    ↓
                   ...
                    ↓
a[15], b[15] → FullAdder  → out[15]
```

The final carry beyond the 16-bit output is discarded.

---

## Inc16

`Inc16` performs:

$$
out = in+1
$$

It was implemented using `Add16` with the constant:

```text
0000000000000001
```

Test cases included normal increments, boundary values, and 16-bit wraparound.

---

# ALU

The ALU is the main component of Project 2.

### Inputs

```text
x[16]
y[16]

zx
nx
zy
ny
f
no
```

### Outputs

```text
out[16]
zr
ng
```

### Control Bits

| Control Bit | Function                      |
| ----------- | ----------------------------- |
| `zx`        | Zero the `x` input            |
| `nx`        | Negate the `x` input          |
| `zy`        | Zero the `y` input            |
| `ny`        | Negate the `y` input          |
| `f`         | Select AND (`0`) or ADD (`1`) |
| `no`        | Negate the final output       |

The ALU processes the inputs in the following order:

```text
x → zero → negate ──┐
                    │
                    ├──► AND / ADD → negate → out
                    │
y → zero → negate ──┘
```

## ALU Function Table

The six control bits allow the ALU to generate 18 different functions.

| Function | `zx` | `nx` | `zy` | `ny` | `f` | `no` |
| -------- | ---: | ---: | ---: | ---: | --: | ---: |
| `0`      |    1 |    0 |    1 |    0 |   1 |    0 |
| `1`      |    1 |    1 |    1 |    1 |   1 |    1 |
| `-1`     |    1 |    1 |    1 |    0 |   1 |    0 |
| `x`      |    0 |    0 |    1 |    1 |   0 |    0 |
| `y`      |    1 |    1 |    0 |    0 |   0 |    0 |
| `!x`     |    0 |    0 |    1 |    1 |   0 |    1 |
| `!y`     |    1 |    1 |    0 |    0 |   0 |    1 |
| `-x`     |    0 |    0 |    1 |    1 |   1 |    1 |
| `-y`     |    1 |    1 |    0 |    0 |   1 |    1 |
| `x+1`    |    0 |    1 |    1 |    1 |   1 |    1 |
| `y+1`    |    1 |    1 |    0 |    1 |   1 |    1 |
| `x-1`    |    0 |    0 |    1 |    1 |   1 |    0 |
| `y-1`    |    1 |    1 |    0 |    0 |   1 |    0 |
| `x+y`    |    0 |    0 |    0 |    0 |   1 |    0 |
| `x-y`    |    0 |    1 |    0 |    0 |   1 |    1 |
| `y-x`    |    0 |    0 |    0 |    1 |   1 |    1 |
| `x&y`    |    0 |    0 |    0 |    0 |   0 |    0 |
| `x\|y`   |    0 |    1 |    0 |    1 |   0 |    1 |

### Status Outputs

#### Zero Flag

`zr` is set when the ALU output is zero:

$$
zr=1 \iff out=0
$$

#### Negative Flag

`ng` is determined by the most significant bit:

$$
ng=out[15]
$$

For 16-bit two's-complement numbers, a `1` in the MSB represents a negative value.

---

## Verification

Each chip was verified using custom Verilog testbenches and Icarus Verilog.

### Test Coverage

| Chip      |                                 Tests | Result |
| --------- | ------------------------------------: | ------ |
| HalfAdder |                  4 input combinations | PASS   |
| FullAdder |                  8 input combinations | PASS   |
| Add16     |   Multiple arithmetic and carry cases | PASS   |
| Inc16     | Normal, boundary and wraparound cases | PASS   |
| ALU       |                  All 18 ALU functions | PASS   |

The ALU verification tested all 18 supported functions and checked the `out`, `zr`, and `ng` outputs.

## Automated Testing

A batch script is provided to simplify compilation and simulation.

Example:

```powershell
.\run_test.bat Project2 alu
```

The test runner automatically includes the required source files from Project 1 and Project 2.

Example commands:

```powershell
.\run_test.bat Project2 halfadder
.\run_test.bat Project2 fulladder
.\run_test.bat Project2 add16
.\run_test.bat Project2 inc16
.\run_test.bat Project2 alu
```

## Tools Used

* Verilog HDL
* Icarus Verilog
* PowerShell
* Git / GitHub


