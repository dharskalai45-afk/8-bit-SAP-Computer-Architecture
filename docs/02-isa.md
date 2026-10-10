# Instruction Set Architecture (ISA)

## 1. Overview

The Instruction Set Architecture (ISA) defines the instructions supported by the 8-bit SAP computer, their binary encodings, and the operations they request.

The processor uses an 8-bit instruction format consisting of a 4-bit opcode and a 4-bit operand or address field.

## 2. Instruction Format

| Bits | Field | Description |
|---|---|---|
| [7:4] | Opcode | Identifies the instruction |
| [3:0] | Operand | Specifies a 4-bit address or jump target for applicable instructions |

**Instruction width:** 8 bits  
**Opcode width:** 4 bits  
**Address width:** 4 bits  
**Addressable memory locations:** 16

## 3. Opcode Table

| Opcode | Mnemonic | Intended operation |
|---|---|---|
| 0000 | NOP | No operation |
| 0001 | LDA | Load the accumulator from memory |
| 0010 | STA | Store the accumulator in memory |
| 0011 | ADD | Add a memory operand to the accumulator |
| 0100 | SUB | Subtract a memory operand from the accumulator |
| 0101 | AND | Perform bitwise AND |
| 0110 | XOR | Perform bitwise XOR |
| 0111 | SFL | Shift the accumulator left by one bit |
| 1000 | SFR | Shift the accumulator right by one bit |
| 1001 | OUT | Transfer the accumulator value to the output register |
| 1010 | JMP | Jump to the specified address |
| 1011 | JZ | Jump if the zero flag is set |
| 1100 | JC | Jump if the carry flag is set |
| 1101 | IN | Load external input into the accumulator |
| 1110 | HLT | Halt processor execution |
| 1111 | CMP | Compare the accumulator with a memory operand |

## 4. Instruction Descriptions

### 4.1 Data Transfer Instructions

- **LDA address:** Loads the value stored at the specified memory address into the A register.
- **STA address:** Stores the value of the A register at the specified memory address.
- **IN:** Loads external input data into the A register.
- **OUT:** Transfers the A register value to the output register.

### 4.2 Arithmetic Instructions

- **ADD address:** Adds the selected memory operand to the accumulator.
- **SUB address:** Subtracts the selected memory operand from the accumulator.

The ALU produces an 8-bit result. Carry and zero status are generated according to the selected operation and stored when flag enable is asserted.

### 4.3 Logical Instructions

- **AND address:** Performs a bitwise AND between the accumulator and the selected memory operand.
- **XOR address:** Performs a bitwise exclusive OR between the accumulator and the selected memory operand.

### 4.4 Shift Instructions

- **SFL:** Shifts the accumulator left by one bit.
- **SFR:** Shifts the accumulator right by one bit.

The ALU provides a carry output corresponding to the bit shifted out.

### 4.5 Control-Flow Instructions

- **JMP address:** Loads the specified address into the program counter.
- **JZ address:** Loads the specified address into the program counter when the zero flag is set.
- **JC address:** Loads the specified address into the program counter when the carry flag is set.
- **HLT:** Places the control unit in its halted state.
- **NOP:** Performs no additional operation during the opcode execution state.

### 4.6 Comparison Instruction

- **CMP address:** Subtracts the selected memory operand from the accumulator for comparison purposes and updates the flags without intentionally storing the ALU result in the accumulator.

## 5. Instruction Execution

The control unit sequences instruction execution through the states IDL, T1, T2, T3, T4, T5, T6, and HALT.

The instruction is fetched from memory, decoded using its opcode, and executed through the required register transfers, memory operations, and ALU operations.

The number of states used depends on the instruction.

## 6. Implementation Notes

The opcode table describes the instructions defined by the control unit. Successful operation of each instruction must be confirmed by reviewing the integrated design and its simulation results.

In particular, conditional branches, comparison flags, shared-bus transfers, and memory writes require verification before the ISA is considered fully validated.
