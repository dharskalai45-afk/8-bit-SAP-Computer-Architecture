# Verification Plan

## 1. Objective

The objective of verification is to check the functional correctness of the 8-bit SAP computer architecture before FPGA implementation.

## 2. Verification Method

Each module will be tested independently using a Verilog testbench and simulation. After individual module testing, the integrated SAP computer will be tested using complete instruction sequences.

## 3. Module-Level Verification

| Module | Planned checks | Status |
|---|---|---|
| Program Counter | Reset, increment, load | Not tested |
| MAR | Address loading | Not tested |
| RAM | Read and write operations | Not tested |
| Instruction Register | Instruction loading and opcode extraction | Not tested |
| A Register | Load and bus output | Not tested |
| B Register | Load and data output | Not tested |
| ALU | Addition, subtraction, AND, XOR and shifts | Not tested |
| Flag Register | Carry and zero flag updates | Not tested |
| Control Unit | Instruction sequencing and control signals | Not tested |
| Input Register | External input loading | Not tested |
| Output Register | Output data capture | Not tested |
| Seven-Segment Display | Digit decoding | Not tested |
| Display Control | Display refresh and digit selection | Not tested |
| Clock Divider | Clock division and reset | Not tested |
| Top-Level Integration | Complete instruction execution | Not tested |

## 4. Integration Tests

The integrated design should be tested with representative programs that verify:

- Loading data from memory.
- Storing data into memory.
- Addition and subtraction.
- Logical operations.
- Conditional and unconditional jumps.
- Input and output operations.
- Halt instruction behavior.

## 5. Simulation Evidence

Simulation waveforms, test results and any identified corrections will be added after the tests are executed.

## 6. Current Status

Verification is planned. Module-level and integration-level tests must be completed before the design is declared verified.
