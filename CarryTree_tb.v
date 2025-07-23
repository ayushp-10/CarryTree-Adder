`timescale 1ns / 1ps

module CarryTree_tb;
  reg  [3:0] A, B;
  reg        Cin;
  wire [3:0] Sum_KSA, Sum_BKA, Sum_SKA;
  wire       Cout_KSA, Cout_BKA, Cout_SKA;

  CarryTree uut (
    .A(A), .B(B), .Cin(Cin),
    .Sum_KSA(Sum_KSA), .Cout_KSA(Cout_KSA),
    .Sum_BKA(Sum_BKA), .Cout_BKA(Cout_BKA),
    .Sum_SKA(Sum_SKA), .Cout_SKA(Cout_SKA)
  );

  initial begin
    

    A = 4'b0000; B = 4'b0000; Cin = 0; #5;
    $display("%b %b   %b   | %b %b | %b %b | %b %b",
             A, B, Cin, Sum_KSA, Cout_KSA, Sum_BKA, Cout_BKA, Sum_SKA, Cout_SKA);

    A = 4'b0000; B = 4'b0000; Cin = 1; #5;
    $display("%b %b   %b   | %b %b | %b %b | %b %b",
             A, B, Cin, Sum_KSA, Cout_KSA, Sum_BKA, Cout_BKA, Sum_SKA, Cout_SKA);

    A = 4'b1111; B = 4'b1111; Cin = 0; #5;
    $display("%b %b   %b   | %b %b | %b %b | %b %b",
             A, B, Cin, Sum_KSA, Cout_KSA, Sum_BKA, Cout_BKA, Sum_SKA, Cout_SKA);

    A = 4'b1111; B = 4'b1111; Cin = 1; #5;
    $display("%b %b   %b   | %b %b | %b %b | %b %b",
             A, B, Cin, Sum_KSA, Cout_KSA, Sum_BKA, Cout_BKA, Sum_SKA, Cout_SKA);

    A = 4'b0101; B = 4'b0011; Cin = 0; #5;
    $display("%b %b   %b   | %b %b | %b %b | %b %b",
             A, B, Cin, Sum_KSA, Cout_KSA, Sum_BKA, Cout_BKA, Sum_SKA, Cout_SKA);

    A = 4'b0101; B = 4'b0011; Cin = 1; #5;
    $display("%b %b   %b   | %b %b | %b %b | %b %b",
             A, B, Cin, Sum_KSA, Cout_KSA, Sum_BKA, Cout_BKA, Sum_SKA, Cout_SKA);

    A = 4'b1000; B = 4'b1000; Cin = 0; #5;
    $display("%b %b   %b   | %b %b | %b %b | %b %b",
             A, B, Cin, Sum_KSA, Cout_KSA, Sum_BKA, Cout_BKA, Sum_SKA, Cout_SKA);

    A = 4'b1000; B = 4'b1000; Cin = 1; #5;
    $display("%b %b   %b   | %b %b | %b %b | %b %b",
             A, B, Cin, Sum_KSA, Cout_KSA, Sum_BKA, Cout_BKA, Sum_SKA, Cout_SKA);

    A = 4'b0111; B = 4'b0001; Cin = 1; #5;
    $display("%b %b   %b   | %b %b | %b %b | %b %b",
             A, B, Cin, Sum_KSA, Cout_KSA, Sum_BKA, Cout_BKA, Sum_SKA, Cout_SKA);

    A = 4'b1010; B = 4'b0101; Cin = 0; #5;
    $display("%b %b   %b   | %b %b | %b %b | %b %b",
             A, B, Cin, Sum_KSA, Cout_KSA, Sum_BKA, Cout_BKA, Sum_SKA, Cout_SKA);

    $finish;
  end
endmodule
