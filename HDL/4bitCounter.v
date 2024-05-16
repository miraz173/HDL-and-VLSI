module fbit(
    input clk,
    input reset,
    input [3:0] d,
    output reg [3:0] q
);

always @(posedge clk, posedge reset)
begin
    if(reset)
        q <= 0;
    else
        q<=d;
end
endmodule

`timescale 1ns/1ps
module fbit_tb;
reg clk;
reg reset;
reg [3:0] d;
wire [3:0] q;
fbit f(clk, reset, d, q);

always begin
    clk=~clk;
    #10;
end

initial begin
    #60;
    $finish;
end

initial begin
    reset <=1;
    clk<=0;
    d<=0;
    #20;

    d<=4'b1010;
    #20;
    #20;
    #20;
end

initial begin
    $monitor("%d, %d", d, q);
end

endmodule