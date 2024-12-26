# Subtle Shift Register Bug in VHDL

This repository demonstrates a common, yet easily missed, error in VHDL code: an incorrect implementation of a shift register. The provided VHDL code attempts to create an 8-bit shift register, but due to a logic error, it functions as a simple latch, overwriting the register's value instead of shifting bits.

## Bug Description

The issue lies within the `behavioral` architecture's process. The line `shift_reg <= data_in;` directly overwrites the `shift_reg` signal with the `data_in` value on each rising clock edge, instead of performing a proper shift operation. This makes the shift register ineffective.

## Bug Solution

The solution involves correctly implementing a shift operation within the process.  Instead of a direct assignment, the code should use a concatenation to shift the bits effectively.

## How to Reproduce

1.  Simulate the `bug.vhdl` code.  Notice that the output does not shift the input bits.
2. Compare that output to the simulation output of the corrected code in `bugSolution.vhdl`

This example highlights the importance of carefully reviewing the logic of sequential circuits in VHDL to ensure the intended functionality is achieved.