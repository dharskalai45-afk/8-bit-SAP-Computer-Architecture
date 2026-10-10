# 8-Bit SAP Computer Architecture

## 1. Introduction

This project implements an 8-bit Simple-As-Possible (SAP) computer architecture using Verilog HDL. The design is organized into separate modules that work together to fetch instructions, process data, and execute operations.

## 2. Architecture Specifications

 Component                       Specification 

| Data bus                      | 8 bits |
| Program counter               | 4 bits |
| Instruction register          | 8 bits |
| Opcode                        | 4 bits |
| Operand                       | 4 bits |
| RAM                           | 16 × 8 bits |
| Control unit                  | Finite State Machine (FSM) |
| Hardware description language | Verilog HDL |

## 3. Major Components

- **Program Counter (PC):** Maintains the instruction address.
- **Memory Address Register (MAR):** Holds the selected memory address.
- **RAM:** Stores instructions and data.
- **Instruction Register (IR):** Stores the current instruction.
- **A Register:** Serves as the accumulator.
- **B Register:** Stores the second operand.
- **ALU:** Performs arithmetic, logical, and shift operations.
- **Flag Register:** Stores carry and zero flags.
- **Control Unit:** Generates signals to coordinate instruction execution.
- **Shared Data Bus:** Transfers data between components.
- **Input and Output:** Provide external data input and result output.
- **Run Control and Clock Divider:** Manage processor startup and timing.

## 4. Instruction Execution

The general instruction flow consists of fetching an instruction, decoding its opcode, selecting operands, executing the operation, and storing the result. The exact timing sequence depends on the instruction and the implemented control-unit logic.

## 5. Top-Level Integration

The `main` module connects the processor components, shared bus, memory, control unit, clock logic, and input/output interfaces.

## 6. Verification Status

The modules and complete processor must be compiled and simulated before their functionality can be marked as verified.

 Test                           Status 

| Module compilation          | Pending verification |
| Register tests              | Pending verification |
| RAM tests                   | Pending verification |
| ALU tests                   | Pending verification |
| Control-unit tests          | Pending verification |
| Full CPU simulation         | Pending verification |
| FPGA hardware test          | Pending verification |

## 7. Architecture Diagram

The following diagram will illustrate the major components and their connections.

![8-bit SAP Computer Architecture](../images/architecture.png)

