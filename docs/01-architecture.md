# 8-Bit SAP Computer Architecture

## 1. Introduction

The 8-bit SAP computer is a simplified processor designed to demonstrate the basic principles of computer organization and instruction execution.

The processor uses an 8-bit data path and a 4-bit address field, allowing it to represent 16 memory locations.

## 2. Main Functional Units

### 2.1 Program Counter (PC)

The Program Counter stores the address of the instruction to be fetched. It can be incremented or loaded with a new address during a jump operation.

### 2.2 Memory Address Register (MAR)

The MAR stores the address used to access the RAM.

### 2.3 Random Access Memory (RAM)

The RAM module contains 16 words, each 8 bits wide. It stores instructions and data according to the program's memory layout.

### 2.4 Instruction Register (IR)

The Instruction Register stores the current 8-bit instruction.

- Bits [7:4]: Opcode
- Bits [3:0]: Operand or address field

### 2.5 A Register

The A Register acts as the accumulator. It stores a primary operand and receives results from supported ALU operations.

### 2.6 B Register

The B Register stores a second operand for arithmetic and logical operations.

### 2.7 Arithmetic Logic Unit (ALU)

The ALU performs arithmetic, logical, and shift operations. The implemented operations include addition, subtraction, bitwise AND, bitwise XOR, left shift, and right shift.

### 2.8 Flag Register

The flag register stores the carry and zero flags when enabled.

### 2.9 Control Unit

The control unit is implemented as a finite state machine. It generates control signals that coordinate memory access, register transfers, ALU operations, and instruction sequencing.

### 2.10 Input and Output

The input interface places external data onto the shared bus. The output register stores data for display. The display controller and seven-segment decoder convert an 8-bit value into decimal digits for presentation.

## 3. Shared Data Bus

The processor uses an 8-bit shared data bus to transfer information between connected components.

Bus control signals determine which component drives the bus and which component receives the data. Only one source should drive the bus at a time.

## 4. Instruction Execution States

The control unit defines the following states:

| State | Purpose |
|---|---|
| IDL | Wait for the start signal |
| T1 | Transfer PC to MAR |
| T2 | Read the instruction from RAM into IR |
| T3 | Increment PC |
| T4 | Decode the opcode |
| T5 | Perform additional memory or operand transfer |
| T6 | Perform an ALU operation or comparison |
| HALT | Remain in the halted state |

The exact sequence depends on the instruction being executed.

## 5. Design Verification

The architecture should be verified through module-level and processor-level simulation. Verification evidence should be added after the corresponding tests have been executed successfully.

## 6. Implementation Status

The Verilog source code defines the processor components and control-unit behavior. Successful simulation and FPGA implementation must be recorded separately after verification.
