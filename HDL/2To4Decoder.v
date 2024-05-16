module tester(
    input a, b, c,
    output x,
    output [2:0] y,
    output [2:0] z
);

assign x=|a;
assign y= b&a |b +b;
assign z= ~a | b & c;
endmodule

`timescale 1ns/1ps
module tester_tb;
reg A, B, C;
wire X;
wire [2:0] Y;
wire [2:0] Z;

tester uut(
    .a(A),
    .b(B),
    .c(C),
    .x(X),
    .y(Y),
    .z(Z)
);
initial begin
    A=0; B=0; C=0;

    #20
    C=1;
    #20
    B=1;
    #20
    C=0;

end

initial begin
    $monitor("%b, %b, %b, %b, %b, %b", A, B, C, X, Y, Z);
end
endmodule
