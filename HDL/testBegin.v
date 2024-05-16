module comb1
(
 input D,
 input X,
 input A,
 output L
);
 assign L = (~D)&(~X)&A | (~D)&X&A | D&(~X)&(~A) | D&(~X)&A | D&X&A;
endmodule


`timescale 1ns/1ps
module comb1_tb;
 reg D;
 reg X; 
 reg A; 
 wire L;
 comb1 uut
 (
 .D(D),
 .X(X),
 .A(A),
 .L(L)
 );
 initial begin
 D = 0;
 X = 0;
 A = 0;
 #20;
 A = 1;
 #20;
 X = 1;
 #20;
 D = 1;
 #20;
 X = 0;
 #20;
 A = 0;
 #20;
 end
initial begin
 $monitor("D=%d X=%d A=%d L=%d\n", 
 D, X, A, L);
end
endmodule
