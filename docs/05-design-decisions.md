# Design Decisions

## 1. Overview

This document records the main design decisions for the 8-bit SAP computer architecture implemented using Verilog HDL.

## 2. Data Width

The computer uses an 8-bit data path. Registers, RAM data and ALU results are designed around 8-bit values.

## 3. Memory Organization

The RAM module is designed with 16 addressable locations, each storing 8 bits.

- Address width: 4 bits
- Data width: 8 bits
- Total capacity: 128 bits

## 4. Instruction Format

Each instruction is 8 bits wide.

- Bits [7:4]: 4-bit opcode
- Bits [3:0]: 4-bit operand or memory address

This format supports up to 16 opcode values and 16 addressable locations.

## 5. Control Unit

A finite state machine (FSM) generates control signals for instruction fetch, decoding and execution. The design uses the states IDL, T1, T2, T3, T4, T5, T6 and HALT.

## 6. Datapath Organization

The datapath includes a program counter, memory address register, RAM, instruction register, A register, B register, ALU and flag register. These modules work together under the control unit.

## 7. Arithmetic and Logic Operations

The ALU code includes addition, subtraction, bitwise AND, bitwise XOR, left shift and right shift. Carry and zero outputs are provided for flag handling.

## 8. Input and Output

An input register receives external 8-bit data. An output register captures data for external output and seven-segment display control.

## 9. Clocking and Reset

A clock-divider module generates an internal clock for the CPU modules. The display controller uses the input clock. Reset behavior is implemented within the individual modules.

## 10. Design Status

These decisions describe the current RTL design. The complete design must be compiled, simulated and tested before functional correctness and FPGA compatibility can be confirmed.
