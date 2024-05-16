module d_ff(
    input wire clk,
    input wire d,
    output reg q
);
always @(posedge clk)
begin
    q <= d;
end
endmodule

`timescale 1ns/1ps
module dff_tb;
reg clk;
reg d;
wire q;
d_ff dftest(clk, d, q);

always
begin
    clk = ~clk;
    #10;
end

initial begin
    clk <= 0;
    d<=0;
    #20;
    d<=1;
    #20;
    d<=0;
end
initial begin
    $monitor("clk = %d, d = %d, q = %d\n",clk, d, q);
end
endmodule
