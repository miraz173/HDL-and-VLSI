module register 
(
input wire clk,
input wire reset,
input wire en,
input wire [6:0] d,
output reg [6:0] q
);
always @(posedge clk, posedge reset)
begin
if (reset)
 q <= 7'b0000_000;
else if(en)
 q <= d; 
end
 
endmodule

`timescale 1ns/1ns
module register_tb;
reg clk;
reg reset;
reg en;
reg [6:0] d;
wire [6:0] q;
register circuit1 (clk, reset, en, d, q);
always begin
clk = ~clk;
#10;
end
initial begin
 $dumpfile("test.vcd");
 $dumpvars(0, register_tb);
clk <= 0;
reset <= 1;
en<=0;
d <= 7'b0000_000;
#20;
reset <= 0;
en <= 1;
d <= 7'b0000_111;
#20;
$finish;
end
initial begin
$monitor("clk = %b, reset = %b, enable = %d, d = %b, q = %b", clk, reset, en, d, q);
end
endmodule
