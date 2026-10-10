# Instruction Execution Cycle

## 1. Introduction

An instruction execution cycle is the sequence of operations performed by the processor to fetch, decode, and execute an instruction.

In this 8-bit SAP computer, the control unit uses a finite state machine (FSM) to generate the control signals required for each stage of execution.

The states are IDL, T1, T2, T3, T4, T5, T6, and HALT. Not every instruction requires every state.

## 2. Overview of the Execution States

| State | Main operation | Purpose |
|---|---|---|
| IDL | Wait for start | Keeps the processor idle until execution is requested |
| T1 | PC → MAR | Places the program counter address into the memory address register |
| T2 | RAM → IR | Fetches the instruction into the instruction register |
| T3 | PC ← PC + 1 | Advances the program counter |
| T4 | Decode opcode | Selects the operation to execute |
| T5 | Operand transfer | Performs additional memory or operand transfers when required |
| T6 | ALU operation | Performs arithmetic, logical, or comparison operations |
| HALT | Hold state | Keeps the processor halted |

## 3. Instruction Fetch

### T1 — Place the Instruction Address on the Bus

The program counter enables its value onto the shared data bus. The memory address register loads the address.

**Control signals:** CO = 1, MI = 1

### T2 — Fetch the Instruction

The RAM places the selected memory word on the shared bus. The instruction register loads the instruction.

**Control signals:** RO = 1, II = 1

### T3 — Increment the Program Counter

The program counter increments to point to the next sequential instruction.

**Control signal:** CE = 1

### T4 — Decode the Instruction

The control unit examines the opcode stored in the instruction register and selects the appropriate execution sequence.

Different instructions follow different paths after this state.

## 4. Execution Examples

### 4.1 LDA — Load Accumulator

1. T1–T3: Fetch the instruction and increment the PC.
2. T4: The opcode is decoded and the operand address is placed into the MAR.
3. T5: The selected memory value is transferred into the A register.

**Expected result:** A contains the value stored at the specified memory address.

### 4.2 STA — Store Accumulator

1. T1–T3: Fetch the instruction.
2. T4: Decode the opcode and load the operand address into the MAR.
3. T5: Enable the A register onto the bus and write the value into RAM.

**Expected result:** The specified memory location receives the accumulator value.

### 4.3 ADD — Addition

1. T1–T3: Fetch the instruction.
2. T4: Decode ADD and load the operand address into the MAR.
3. T5: Transfer the memory operand into the B register.
4. T6: The ALU adds A and B. The result is loaded into A and the flags are updated.

**Expected result:** A receives the 8-bit sum of the two operands.

### 4.4 SUB — Subtraction

1. T1–T3: Fetch the instruction.
2. T4: Decode SUB and load the operand address into the MAR.
3. T5: Transfer the memory operand into B.
4. T6: The ALU subtracts B from A, stores the result in A, and updates the flags.

**Expected result:** A receives the 8-bit subtraction result.

### 4.5 JMP — Unconditional Jump

1. T1–T3: Fetch the instruction.
2. T4: Decode JMP and load the operand field into the PC.

**Expected result:** The next instruction is fetched from the specified address.

### 4.6 JZ and JC — Conditional Jumps

- **JZ:** Loads the operand address into the PC when the zero flag is set.
- **JC:** Loads the operand address into the PC when the carry flag is set.

If the relevant flag is not set, execution continues at the next sequential address.

### 4.7 CMP — Compare

1. T1–T3: Fetch the instruction.
2. T4: Decode CMP and load the operand address into the MAR.
3. T5: Transfer the selected memory value into B.
4. T6: Perform subtraction for flag evaluation without intentionally writing the result to A.

The expected comparison behavior must be verified against the ALU flag definitions and integrated control signals.

### 4.8 IN, OUT, SFL, SFR, NOP, and HLT

- **IN:** Loads external input data into A during the opcode execution state.
- **OUT:** Captures A into the output register.
- **SFL:** Shifts A left by one bit and updates the flags.
- **SFR:** Shifts A right by one bit and updates the flags.
- **NOP:** Performs no additional operation after decoding.
- **HLT:** Transitions the control unit into the HALT state.

## 5. Clock and Control

The control unit advances between states on clock edges. Its combinational logic generates control signals based on the current state, opcode, and relevant flags.

The clock divider can provide a slower clock for demonstration, depending on how it is connected in the top-level design.

## 6. Verification Requirements

Instruction execution should be verified using testbenches and simulation waveforms.

Recommended tests include:

- Fetching an instruction and incrementing the PC.
- Loading from and storing to RAM.
- Performing ADD and SUB.
- Checking AND and XOR results.
- Testing shift operations and flags.
- Testing taken and not-taken conditional branches.
- Confirming that HLT remains in the halted state.
- Checking output-register and display behavior.

Only tests that have actually passed should be reported as verified.
