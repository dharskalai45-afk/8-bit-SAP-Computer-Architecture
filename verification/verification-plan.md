# Verification Plan

## 1. Objective

The objective of verification is to check the functional correctness of the 8-bit SAP computer architecture before FPGA implementation.

## 2. Verification Method

Each module will be tested independently using a Verilog testbench and simulation. After individual module testing, the integrated SAP computer will be tested using complete instruction sequences.

## 3. Module-Level Verification

| Module | Planned checks | Status |
|---|---|---|
| Program Counter | Reset, increment, load | tested |
| MAR | Address loading |  tested |
| RAM | Read and write operations |  tested |
| Instruction Register | Instruction loading and opcode extraction | tested |
| A Register | Load and bus output |tested |
| B Register | Load and data output |  tested |
| ALU | Addition, subtraction, AND, XOR and shifts | tested |
| Flag Register | Carry and zero flag updates |  tested |
| Control Unit | Instruction sequencing and control signals |  tested |
| Input Register | External input loading |  tested |
| Output Register | Output data capture |  tested |
| Seven-Segment Display | Digit decoding |  tested |
| Display Control | Display refresh and digit selection |  tested |
| Clock Divider | Clock division and reset |  tested |
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

Verification is planned. Module-level and integration-level tests completed 
