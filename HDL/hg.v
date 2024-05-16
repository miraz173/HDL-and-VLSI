// Here we will learn to write a verilog HDL to design a 4 bit qer
module qer(
  //define input and output ports
  input clk,reset, load,up_down,
//   input [3:0] d,
  output reg [3:0] q);
  //always block will be executed at each and every positive edge of the clock
  always@(posedge clk, posedge reset) 
  begin
    if(reset)    //Set qer to Zero
      q <= 15;
    else            //q down
      q <= q - 1;
  end
endmodule

// Code your testbench here
module qer_tb;
  reg clk,reset,load,ud;
//   reg [3:0] d;
  wire [3:0] q;
  // instance qer design
  qer ct_1(clk,reset,load,up_down,q);
  //clock generator
always begin
clk = ~clk;
#10;
end
initial begin
 $dumpfile("test.vcd");
 $dumpvars(0, qer_tb);
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
  //monitor all the input and output ports at times when any inputs changes its state
  initial begin 
    $monitor("time=%0d,reset=%b,load=%b,ud=%b,q=%d", $time,reset,load,ud,q);
end
endmodule