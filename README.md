# Digital-Clock
This project is a simple digital clock designed using Verilog, a hardware description language used to model digital systems.

A 24-hour digital clock designed using Verilog HDL that counts hours, minutes, and seconds, and displays the output using a 7-segment decoder.
This project simulates a digital clock using modular Verilog components:

- Time counter logic (hours, minutes, seconds)
- Binary to BCD converter
- BCD to 7-segment decoder

### `digital_clock`
- Inputs:
  - `clk`: System clock input
  - `en`: Enable signal
  - `rst`: Reset signal (active high)
- Outputs:
  - `s1`, `s2` – Seconds (units and tens)
  - `m1`, `m2` – Minutes (units and tens)
  - `h1`, `h2` – Hours (units and tens)
- Clock speed simulated using: `localparam onesec = 100;`  

### `binarytoBCD`
- Converts a 6-bit binary input (0–59 or 0–23) to a 4-digit BCD output.

### `decoder_7seg`
- Converts BCD digit to a 7-bit output to drive 7-segment displays.

