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
$monitor("clk = %b, reset = %b, d = %b, q = %b", clk, reset, d, q);
end
endmodule

// module addOne
// (
// input wire [6:0] I,
// output wire [6:0] O
// );
// assign O = I + 1;
 
// endmodule
// module counter
// (
// input wire CLK,
// input wire Reset,
// input wire en,
// output wire [6:0] q
// );
// wire [6:0] d_temp, q_temp;
// register register_circuit1 (CLK, Reset, en, d_temp, q_temp);
// addOne adder_circuit1 (q_temp, d_temp);
// assign q = q_temp;
// endmodule

// `timescale 1ns/1ns
// module counter_tb;
// reg clk;
// reg reset;
// wire [6:0] q;
// counter counter_circuit1 
// (clk, reset, q);
// always begin
// clk = ~clk;
// #10;
// end
// initial begin
//  $dumpfile("test.vcd");
//  $dumpvars(0, counter_tb);
// clk <= 0;
// reset <= 1;
// #20;
// reset <= 0;
// #20;
// #20;
// #20;
// #20;
// $finish;
// end
// initial begin
// $monitor("clk = %b, reset = %b, q = %b", clk, reset, q);
// end
// endmodule
