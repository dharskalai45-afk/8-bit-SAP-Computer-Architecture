# 8-Bit SAP Computer Architecture

## 1. Project Overview

This project focuses on designing an 8-bit SAP (Simple-As-Possible) computer architecture using Verilog HDL. The design is organized into separate modules that work together to execute instructions and process 8-bit data.

The project is intended for FPGA implementation and demonstrates the fundamental concepts of computer architecture and digital system design.

## 2. Project Objectives

- Understand the internal working of a simple computer.
- Design individual hardware modules using Verilog HDL.
- Connect the modules to form a complete computer architecture.
- Implement an instruction execution process using a control unit.
- Verify the design through simulation before FPGA implementation.

## 3. Architecture Components

| Component | Purpose |
|---|---|
| Program Counter (PC) | Holds the address of the next instruction. |
| Memory Address Register (MAR) | Holds the memory address being accessed. |
| RAM | Stores program instructions and data. |
| Instruction Register (IR) | Holds the current instruction. |
| A Register | Stores an operand and arithmetic or logic results. |
| B Register | Stores another operand for ALU operations. |
| ALU | Performs arithmetic and logical operations. |
| Data Bus | Transfers data between components. |
| Flag Register | Stores status flags used by the control logic. |
| Control Unit | Generates control signals to coordinate instruction execution. |
| Input Port | Provides external input data. |
| Output Register | Stores data for output display. |

## 4. Working Principle

The computer follows an instruction execution process:

1. **Fetch:** The instruction is read from memory.
2. **Decode:** The control unit identifies the operation to perform.
3. **Execute:** The required registers, ALU, memory, or input/output components perform the operation.
4. **Output:** Results can be transferred to the output register for display.

The control unit uses timing states to coordinate these operations.

## 5. Instruction Set

The current design includes the following planned instruction operations:

| Instruction | Intended purpose |
|---|---|
| NOP | No operation |
| LDA | Load data into the A register |
| STA | Store data in memory |
| ADD | Add operands |
| SUB | Subtract operands |
| AND | Perform bitwise AND |
| XOR | Perform bitwise XOR |
| SFL | Shift data left |
| SFR | Shift data right |
| OUT | Send data to the output register |
| JMP | Jump to an address |
| JZ | Jump when the zero condition is satisfied |
| JC | Jump when the carry condition is satisfied |
| IN | Read external input data |
| HLT | Halt instruction execution |
| CMP | Compare operands |

**Note:** The instruction behavior and opcode assignments must be checked against the implemented control-unit code and verified through simulation.

## 6. Control Unit

The control unit coordinates the computer's internal operations by generating control signals.

The current design uses timing states named `IDL`, `T1`, `T2`, `T3`, `T4`, `T5`, `T6`, and `HALT`. The required states and control signals depend on the instruction being executed.

## 7. Verilog Modules

The design is divided into separate modules:

- `main.v` — Top-level integration of the computer.
- `program_counter.v` — Program counter.
- `mar.v` — Memory address register.
- `ram_16x8.v` — Memory module.
- `instruction_register.v` — Instruction register.
- `a_register.v` — A register.
- `b_register.v` — B register.
- `alu.v` — Arithmetic and logic unit.
- `data_bus.v` — Shared data bus.
- `flag_register.v` — Status flag storage.
- `control_unit.v` — Instruction control and timing.
- `input_port.v` — External input interface.
- `output_register.v` — Output data storage.
- `clock_divider.v` — Clock division logic.
- `button_pulse.v` — Button pulse generation.
- `run_control.v` — Run-control logic.

## 8. Tools and Technologies

- Verilog HDL
- FPGA development tools
- Verilog simulation and testbenches
- GitHub for source-code management and documentation

## 9. Verification

Each hardware module should be compiled and tested independently before integration.

The verification process is:

**Module → Compile → Testbench → Simulation → Pass → Next Module**

After individual modules pass their tests, the integrated design should be tested with representative instructions, including arithmetic, memory access, branching, input/output, and halt operations.

## 10. Current Project Status

**Status: Under Development and Verification**

The modules and their connections are being reviewed and tested. The complete instruction execution flow and FPGA behavior will be confirmed through simulation and hardware testing.

## 11. Team Contributions

- **Documentation and integration:** Maintaining project documentation and organizing the repository.
- **RTL development:** Reviewing and developing the Verilog modules.
- **Verification:** Preparing testbenches and checking simulation results.

## 12. Conclusion

This project demonstrates the design of a simple 8-bit computer using modular Verilog coding. It provides practical experience with registers, memory, an ALU, a shared bus, instruction execution, control signals, and FPGA-oriented design.
