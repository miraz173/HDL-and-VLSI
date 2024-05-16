module comb2
(
 input [3:0] A,
 input [3:0] B,
 input [3:0] C,
 input [3:0] D,
 output [3:0] Arithmetic,
 output [3:0] Shift,
 output [3:0] Relational,
 output [3:0] Equality,
 output [3:0] Bitwise,
 output [3:0] Reduction,
 output [3:0] Logical,
 output [3:0] Concatenation,
 output [3:0] Conditional
);
 
 
 assign Arithmetic = B+C;
 assign Shift = B>>C;
 assign Relational = A > B;
 assign Equality = A == D;
 assign Bitwise = B & C;
 assign Reduction = |B;
 assign Logical = (A > B) || (A > D);
 assign Concatenation = {C[1:0], D[3:2]};
 assign Conditional = (A>B) ? A : B;
endmodule

`timescale 1ns/1ps
module comb2_tb;
 reg [3:0] A;
 reg [3:0] B;
 reg [3:0] C;
 reg [3:0] D;
 wire [3:0] Arithmetic;
 wire [3:0] Shift;
 wire [3:0] Relational;
 wire [3:0] Equality;
 wire [3:0] Bitwise;
 wire [3:0] Reduction;
 wire [3:0] Logical;
 wire [3:0] Concatenation;
 wire [3:0] Conditional;
comb2 uut
(
 .A(A),
 .B(B),
 .C(C),
 .D(D),
 .Arithmetic(Arithmetic),
 .Shift(Shift),
 .Relational(Relational),
 .Equality(Equality),
 .Bitwise(Bitwise),
 .Reduction(Reduction),
 .Logical(Logical),
 .Concatenation(Concatenation),
 .Conditional(Conditional)
);
initial begin
 A = 4'b1100;
 B = 4'b0110;
 C = 4'b0010;
 D = 4'b1100;
 #20;
end
initial begin
$monitor("A=%4b, B=%4b, C=%4b, D=%4b\n", A, B, C, D,
 "Arithmetic=%4b, Shift=%4b, Relational=%4b\n", Arithmetic, Shift, Relational,
 "Equality=%4b, Bitwise=%4b, Reduction=%4b\n", Equality, Bitwise, Reduction,
 "Logical=%4b, Concatenation=%4b, Conditional=%4b\n", Logical, Concatenation, Conditional); 
end
endmodule