# Fedar E1

Fedar E1 is a 5-Stage Pipelined (Fetch|Decode|Execute|Memory|Writeback) RV32I RISC-V Core written fully in Verilog.

- It has 32 GPIO pins.

---

**Artix-A7 Synthesize Report:**

|          Site Type         | Used | Fixed | Available | Util% |
| --- | --- | --- | --- | --- |
| **Slice LUTs\***                | 1070 |     0 |     20800 |  5.14 |
| -- LUT as Logic             |  558 |     0 |     20800 |  2.68 |
| -- LUT as Memory            |  512 |     0 |      9600 |  5.33 |
| ---- LUT as Distributed RAM |  512 |     0 |           |       |
| ---- LUT as Shift Register  |    0 |     0 |           |       |
| **Slice Registers**            |  806 |     0 |     41600 |  1.94 |
| -- Register as Flip Flop    |  286 |     0 |     41600 |  0.69 |
| -- Register as Latch        |  520 |     0 |     41600 |  1.25 |
| F7 Muxes                   |  320 |     0 |     16300 |  1.96 |
| F8 Muxes                   |  160 |     0 |      8150 |  1.96 |

Will be improved.
