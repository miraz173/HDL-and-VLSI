module register 
(
input wire clk,
input wire reset,
input wire [3:0] d,
output reg [3:0] q
);
always @(posedge clk, posedge reset)
begin
if (reset)
 q <= 4'b1111;
else
 q <= d; 
end
 
endmodule

module addOne
(
input wire [3:0] I,
output wire [3:0] O
);
assign O = I - 1;
 
endmodule

module counter
(
input wire CLK,
input wire Reset,
output wire [3:0] q
);
wire [3:0] d_temp, q_temp;
register register_circuit1 (CLK, Reset, d_temp, q_temp);
addOne adder_circuit1 (q_temp, d_temp);
assign q = q_temp;
endmodule

`timescale 1ns/1ns
module counter_tb;
reg clk;
reg reset;
wire [3:0] q;
counter counter_circuit1 
(clk, reset, q);
always begin
clk = ~clk;
#10;
end
initial begin
 $dumpfile("test.vcd");
 $dumpvars(0, counter_tb);
clk <= 0;
reset <= 1;
#20;
reset <= 0;
#20;
#20;
#20;
#20;
#20;
#20;
#20;
#20;
#20;
#20;
#20;
#20;
#20;
#20;
#20;
#20;
$finish;
end
initial begin
$monitor("clk = %b, reset = %b, q = %b", clk, reset, q);
end
endmodule