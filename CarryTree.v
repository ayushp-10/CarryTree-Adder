`timescale 1ns / 1ps


module kogge_stone_adder(input [3:0] A, input [3:0] B, input Cin,
                         output [3:0] Sum_KSA, output Cout_KSA);
wire [3:0] P = A ^ B;
wire [3:0] G = A & B;
wire [3:0] C;

wire G1_0 = G[1] | (P[1] & G[0]);
wire G2_1 = G[2] | (P[2] & G[1]);
 wire G3_2 = G[3] | (P[3] & G[2]);

wire G2_0 = G2_1 | (P[2] & P[1] & G[0]);
  wire G3_0 = G3_2 | (P[3] & P[2] & P[1] & G[0]);

assign C[0] = Cin;
 assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G1_0 | (P[1] & P[0] & C[0]);
assign C[3] = G2_0 | (P[2] & P[1] & P[0] & C[0]);
assign Cout_KSA = G3_0 | (P[3] & P[2] & P[1] & P[0] & C[0]);

assign Sum_KSA = P ^ C;
endmodule


module brent_kung_adder(input [3:0] A, input [3:0] B, input Cin,
                        output [3:0] Sum_BKA, output Cout_BKA);
wire [3:0] P = A ^ B;
wire [3:0] G = A & B;
wire [3:0] C;

wire G1_0 = G[1] | (P[1] & G[0]);
wire P1_0 = P[1] & P[0];
wire G2_0 = G[2] | (P[2] & G1_0);
wire P2_0 = P[2] & P1_0;
  wire G3_1 = G[3] | (P[3] & G[2]);

assign C[0] = Cin;
assign C[1] = G[0] | (P[0] & C[0]);
  assign C[2] = G1_0 | (P1_0 & C[0]);
assign C[3] = G2_0 | (P2_0 & C[0]);
assign Cout_BKA = G3_1 | (P[3] & G2_0);

assign Sum_BKA = P ^ C;
endmodule


module sklansky_adder(input [3:0] A, input [3:0] B, input Cin,
                      output [3:0] Sum_SKA, output Cout_SKA);
wire [3:0] P = A ^ B;
wire [3:0] G = A & B;
wire [3:0] C;

wire G1_0 = G[1] | (P[1] & G[0]);
wire P1_0 = P[1] & P[0];
wire G3_2 = G[3] | (P[3] & G[2]);
wire P3_2 = P[3] & P[2];
wire G2_0 = G[2] | (P[2] & G1_0);
wire P2_0 = P[2] & P1_0;
wire G3_0 = G3_2 | (P3_2 & G1_0);

assign C[0] = Cin;
assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G1_0 | (P1_0 & C[0]);
assign C[3] = G2_0 | (P2_0 & C[0]);
assign Cout_SKA = G3_0 | (P[3] & G2_0);

assign Sum_SKA = P ^ C;
endmodule


module CarryTree(input [3:0] A, input [3:0] B, input Cin,
                  output [3:0] Sum_KSA, output Cout_KSA,
                  output [3:0] Sum_BKA, output Cout_BKA,
                  output [3:0] Sum_SKA, output Cout_SKA);
  kogge_stone_adder ksa (.A(A), .B(B), .Cin(Cin), .Sum_KSA(Sum_KSA), .Cout_KSA(Cout_KSA));
  brent_kung_adder  bka (.A(A), .B(B), .Cin(Cin), .Sum_BKA(Sum_BKA), .Cout_BKA(Cout_BKA));
  sklansky_adder    ska (.A(A), .B(B), .Cin(Cin), .Sum_SKA(Sum_SKA), .Cout_SKA(Cout_SKA));
endmodule
