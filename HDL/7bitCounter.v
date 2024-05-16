module register
(
input wire clk,
input wire reset,
input wire [6:0] d,
output wire [6:0] q
);
//signal declaration
reg [6:0] q_reg ;
wire [6:0] q_next ;
// body or memory or state register
always @(posedge clk, posedge reset)
begin
if (reset)
 q_reg <= 7'b0000_000;
else
 q_reg <= q_next; 
end
//next state logic
assign q_next = d;
//output logic
assign q = q_reg;
 
endmodule

module addOne
(
input wire [6:0] I,
output wire [6:0] O
);
assign O = I + 1;
 
endmodule
module counter
(
input wire CLK,
input wire Reset,
output wire [6:0] q
);
wire [6:0] d_temp, q_temp;
register register_circuit1 (CLK, Reset, d_temp, q_temp);
addOne adder_circuit1 (q_temp, d_temp);
assign q = q_temp;
endmodule

`timescale 1ns/1ns
module counter_tb;
reg clk;
reg reset;
wire [6:0] q;
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
$finish;
end
initial begin
$monitor("clk = %b, reset = %b, q = %b", clk, reset, q);
end
endmodule