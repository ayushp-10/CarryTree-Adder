This project implements and compares three high-performance 4-bit carry-lookahead adders using Verilog:

Kogge-Stone Adder (KSA)

Brent-Kung Adder (BKA)

Sklansky Adder

These adders use prefix tree logic to accelerate carry computation, making them suitable for high-speed arithmetic operations in modern digital systems.

Each adder has a distinct trade-off in depth (delay), wiring complexity, and fan-out:

Kogge-Stone Adder:
Depth = O(log₂n), high wiring cost, fastest in delay

Brent-Kung Adder:
Depth = O(log₂n), lower wiring cost, moderate speed

Sklansky Adder:
Depth = O(log₂n), higher fan-out, good balance between speed and complexity

These comparisons help in selecting the right adder for specific performance or area-constrained applications.
