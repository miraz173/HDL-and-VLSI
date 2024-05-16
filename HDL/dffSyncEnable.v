module dffEnable(
    input clk,
    input enable,
    input reset,
    input [6:0] d,
    output reg [6:0] q
);

always @(posedge clk, posedge enable, posedge reset)
begin
  if(reset)
  begin
    q<=0;
  end
  else if(enable)
  begin
    q<=d;
  end
end

endmodule

`timestamp 1ns/1ps
module dffEnable_tb;
reg clk;
reg reset;
reg enable;
reg [6:0] d;
reg [6:0] q;
dffEnable uut(clk, reset, enable, d, q);

always begin@(posedge clk, posedge )
