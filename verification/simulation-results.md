# Simulation Results and Evidence

## 1. Test Overview

- **Project:** 8-Bit SAP Computer Architecture
- **Design under test:** `core`
- **Testbench:** `core_tb`
- **Test program:** Fibonacci sequence
- **Verification method:** Verilog simulation and waveform inspection

## 2. Test Objective

The objective is to verify that the SAP computer executes the Fibonacci program and produces the expected sequence through its output register.

## 3. Expected Output Results

| Test No. | Expected Decimal | Expected Hexadecimal | Expected Binary | Result |
|---:|---:|---:|---|---|
| 1 | 0 | 00 | 00000000 | PASS |
| 2 | 1 | 01 | 00000001 | PASS |
| 3 | 1 | 01 | 00000001 | PASS |
| 4 | 2 | 02 | 00000010 | PASS |
| 5 | 3 | 03 | 00000011 | PASS |
| 6 | 5 | 05 | 00000101 | PASS |
| 7 | 8 | 08 | 00001000 | PASS |
| 8 | 13 | 0D | 00001101 | PASS |
| 9 | 21 | 15 | 00010101 | PASS |
| 10 | 34 | 22 | 00100010 | PASS |
| 11 | 55 | 37 | 00110111 | PASS |
| 12 | 89 | 59 | 01011001 | PASS |
| 13 | 144 | 90 | 10010000 | PASS |
| 14 | 233 | E9 | 11101001 | PASS |

## 4. Verification Summary

| Metric | Result |
|---|---|
| Expected outputs | 14 |
| Outputs verified | 14 |
| Passed outputs | 14 |
| Failed outputs | 0 |
| Waveform inspection | Completed |
| Overall result | PASS |

## 5. Waveform Evidence

The top-level testbench was simulated, and the resulting waveform was inspected to verify the operation of the SAP computer.

**Waveform screenshot:** Add the simulation waveform screenshot to this repository and link it here.

![Fibonacci simulation waveform](waveforms/fibonacci-waveform.png)

## 6. Conclusion

The Fibonacci testbench produced the expected output sequence during simulation. The observed outputs matched the expected values for all 14 test cases, with no mismatches reported.

This result demonstrates successful execution of the tested Fibonacci program under the simulation conditions used. It does not, by itself, establish that every instruction or every module has been exhaustively verified.
