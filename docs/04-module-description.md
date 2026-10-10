# Verilog Module Descriptions

## 1. Overview

The 8-bit SAP computer is organized into individual Verilog modules. Each module implements a specific function, allowing the processor to be developed, tested, and maintained in a modular manner.

## 2. Module Descriptions

### 2.1 Clock Divider — `clk_div`

**Purpose:** Generates a slower clock signal from the input clock.

**Inputs:** `clk_in`, `rst`

**Output:** `clk_out`

**Operation:** A counter increments on each rising edge of the input clock. When the configured division count is reached, the output clock toggles. Reset clears the counter and output clock.

### 2.2 Program Counter — `PC`

**Purpose:** Maintains the instruction address.

**Inputs:** `clk`, `rst`, `co`, `cl`, `ce`

**Bus:** Shared 8-bit data bus

**Operation:** The PC can be reset, loaded from the bus, or incremented. When `co` is enabled, it places its 4-bit address on the lower four bits of the bus.

### 2.3 Memory Address Register — `mar`

**Purpose:** Holds the address used to access RAM.

**Inputs:** `clk`, `rst`, `mi`, shared bus

**Output:** `addr`

**Operation:** When `mi` is enabled, the MAR loads the lower four bits of the shared bus. Its output selects one of the 16 RAM locations.

### 2.4 RAM — `ram16x8`

**Purpose:** Stores instructions and data.

**Inputs:** `clk`, `ri`, `ro`, `addr`

**Bus:** Shared 8-bit data bus

**Operation:** The module contains 16 words of 8 bits each. The `ri` signal enables a synchronous memory write, while `ro` enables the selected memory word onto the bus. Initial contents are loaded from `rram.mem`.

### 2.5 Instruction Register — `instruction_reg`

**Purpose:** Stores the current instruction.

**Inputs:** `clk`, `rst`, `ii`, `io`

**Output:** `opcode`

**Operation:** The register stores an 8-bit instruction when `ii` is asserted. The upper four bits provide the opcode. When `io` is asserted, the lower four bits are placed onto the shared bus.

### 2.6 A Register — `reg_a`

**Purpose:** Implements the accumulator.

**Inputs:** `clk`, `rst`, `ai`, `ao`, shared bus

**Output:** `a_out`

**Operation:** Loads data from the bus when `ai` is enabled. When `ao` is enabled, the stored accumulator value is driven onto the bus. The output is also available separately through `a_out`.

### 2.7 B Register — `reg_b`

**Purpose:** Stores the second operand for ALU operations.

**Inputs:** `clk`, `rst`, `bi`, data bus

**Output:** `b_out`

**Operation:** Loads the supplied 8-bit data when `bi` is enabled. The stored value is available through `b_out`.

### 2.8 Arithmetic Logic Unit — `alu`

**Purpose:** Performs arithmetic, logical, and shift operations.

**Inputs:** `a`, `b`, `sub`, `rox`, `dna`, `sfli`, `sfri`

**Outputs:** `res`, `carry`, `zero`

**Supported operations:**

- Addition
- Subtraction
- Bitwise XOR
- Bitwise AND
- Left shift
- Right shift

**Operation:** The operation-select inputs determine the result. Carry status is generated according to the selected operation, and the zero output indicates whether the result is zero.

### 2.9 Flag Register — `reg_flag`

**Purpose:** Stores processor status flags.

**Inputs:** `clk`, `rst`, `carry`, `zero`, `fe`

**Outputs:** `flag_C`, `flag_Z`

**Operation:** When `fe` is enabled, the register captures the carry and zero signals. These flags are used by conditional jump instructions.

### 2.10 Input Interface — `reg_in`

**Purpose:** Places external input data on the shared bus.

**Inputs:** `inpi`, `ext_inp`

**Bus:** Shared 8-bit data bus

**Operation:** When `inpi` is asserted, the external input value is driven onto the bus.

### 2.11 Output Register — `reg_out`

**Purpose:** Stores data intended for external display.

**Inputs:** `clk`, `rst`, `oi`, data bus

**Output:** `out`

**Operation:** Captures the bus value when `oi` is asserted and retains it until another load or reset.

### 2.12 Control Unit — `control_unit`

**Purpose:** Coordinates processor operation.

**Inputs:** `op_in`, `clk`, `rst`, `flag_C`, `flag_Z`, `start`

**Outputs:** Register, memory, bus, ALU, input/output, and halt control signals

**Operation:** Uses an FSM to sequence instruction fetching, decoding, operand transfer, execution, branching, and halting.

### 2.13 Display Controller — `display_control`

**Purpose:** Converts an 8-bit unsigned value into decimal digits and multiplexes a four-digit seven-segment display.

**Inputs:** `clk`, `rst`, `data`

**Outputs:** `AN`, `SEG`

**Operation:** Derives hundreds, tens, and ones digits from the input value. The refresh counter selects which digit is active at a given time.

### 2.14 Seven-Segment Decoder — `seven_segment`

**Purpose:** Converts a decimal digit into segment-control signals.

**Inputs:** `bcd`, `dp`

**Output:** `seg`

**Operation:** Generates active-low segment patterns for digits 0–9 and blanks the digit for other input values.

## 3. Module Integration

The modules are intended to be connected through a top-level module.

The PC, RAM, IR, A register, and input interface use the shared data bus. The MAR supplies the RAM address. The B register supplies the second ALU operand, while the A register supplies the first operand and receives results.

The control unit coordinates these operations through control signals.

The top-level module must connect the datapath, flags, clock/reset signals, and display interface consistently.

## 4. Verification Approach

Each module should first be tested independently where practical. After module-level testing, the integrated processor should be tested using complete instruction sequences.

Verification status should be based on actual compilation, simulation, and hardware results rather than source-code inspection alone.
