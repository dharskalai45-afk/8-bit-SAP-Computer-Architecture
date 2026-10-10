# 8-Bit SAP Computer Architecture Using Verilog HDL

## 1. Project Overview

This project implements an 8-bit SAP (Simple-As-Possible) computer architecture using Verilog HDL, with FPGA implementation as the target platform.

The design demonstrates the fundamental working principles of a processor, including instruction fetching, instruction decoding, arithmetic and logical operations, memory access, register transfers, and control-unit sequencing.

The architecture uses a shared 8-bit data bus to transfer information between the processor's registers, memory, and input/output components. A finite state machine (FSM)-based control unit generates control signals to coordinate instruction execution over multiple clock cycles.

## 2. Project Objectives

- To understand the fundamental organization and operation of a processor.
- To implement an 8-bit datapath using Verilog HDL.
- To design registers, memory, an arithmetic logic unit (ALU), and a control unit.
- To implement instruction execution using clocked control states.
- To demonstrate arithmetic, logical, memory, branching, and input/output operations.
- To verify the design through simulation and, where completed, FPGA implementation.
- To display numerical output using a seven-segment display interface.

## 3. Architecture Components

The design includes the following modules:

| Component | Function |
|---|---|
| Program Counter (PC) | Holds the address of the next instruction to fetch. |
| Memory Address Register (MAR) | Holds the address used to access memory. |
| RAM (16 × 8) | Stores 16 words, each 8 bits wide. |
| Instruction Register (IR) | Stores the current instruction and provides its opcode and operand fields. |
| A Register | Stores the accumulator value and ALU result. |
| B Register | Stores the second operand for ALU operations. |
| Arithmetic Logic Unit (ALU) | Performs arithmetic, logical, and shift operations. |
| Flag Register | Stores carry and zero flags. |
| Control Unit | Generates control signals and sequences instruction execution. |
| Input Register Interface | Places external input data onto the shared bus. |
| Output Register | Stores data for output display. |
| Clock Divider | Generates a slower clock from the input clock. |
| Display Controller | Selects display digits and converts an 8-bit value into decimal digits. |
| Seven-Segment Decoder | Converts a decimal digit into seven-segment display signals. |

## 4. Instruction Set

The control unit defines 16 four-bit opcode values.

The instruction set includes data transfer, arithmetic, logical, shift, branching, input/output, comparison, and halt operations.

The exact instruction encodings and supported execution behavior are documented in the ISA section of this repository.

## 5. Instruction Execution

Instruction execution is controlled by a finite state machine with the following states:

- **IDL:** Waits for the start signal.
- **T1:** Places the program counter value on the bus and loads the memory address register.
- **T2:** Reads the selected memory word into the instruction register.
- **T3:** Increments the program counter.
- **T4:** Decodes the opcode and initiates the required operation.
- **T5:** Performs additional operand-addressing, memory, or register-transfer operations.
- **T6:** Performs the selected ALU operation or comparison.
- **HALT:** Holds the processor in its halted state.

Not every instruction uses all these states. The control unit determines the required sequence according to the opcode.

## 6. Design Methodology

The design follows a modular RTL development approach:

1. Develop the individual processor components using Verilog HDL.
2. Integrate the components through a shared data bus and control signals.
3. Coordinate instruction execution using an FSM-based control unit.
4. Verify individual modules and processor-level instruction sequences through simulation.
5. Integrate the design with the target FPGA and its input/output peripherals, where supported.

## 7. Tools and Technologies

- Verilog HDL
- RTL design
- Finite State Machine (FSM)
- Digital logic design
- HDL simulation and waveform analysis
- FPGA implementation tools, depending on the target board

## 8. Project Status

The project contains modular Verilog descriptions of the processor datapath, control unit, memory interface, and display logic.

Simulation results, verified instruction behavior, and FPGA implementation evidence will be recorded as the corresponding tests and hardware demonstrations are completed.

## 9. Team Contributions

This is a collaborative three-member project. The team shares responsibility for architecture design, RTL development, verification, integration, and documentation.

Individual contributions will be recorded in the project repository.

## 10. Future Improvements

- Expand instruction-level and processor-level verification.
- Improve flag handling and conditional instruction testing.
- Add debugging support for internal registers and control states.
- Improve the demonstration interface and document measured FPGA results.

---

**Project:** 8-Bit SAP Computer Architecture  
**Hardware Description Language:** Verilog HDL  
**Design Approach:** Modular RTL design with FSM-based control  
**Target:** FPGA implementation
