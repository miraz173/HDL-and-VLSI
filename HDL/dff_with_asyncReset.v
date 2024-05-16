module dffAsyncReset(
    input wire clk,
    input wire reset,
    input wire d,
    output reg q
);

always @(posedge clk, posedge reset)
begin
  if(reset)
    q<=0;
  else
    q<=d;
end
endmodule


`timescale 1ns/1ps
module dffAsyncReset_tff;
reg clk;
reg reset;
reg d;
wire q;
dffAsyncReset uut(clk, reset, d, q);

always begin
    clk = ~clk;
    #10;
end

always begin
    d<=~d;
    #29;
end

initial begin
    clk <= 0;
    reset<=1;
    d<=0;

    #20;
    reset<=0;
    // d<=1;
    #20;

end

initial begin
    $monitor("reset: %d, clk: %d, d: %d, q: %d, time:%d", reset, clk, d, q, $time);
end

initial begin
    #70;
    reset <= 1;
    #10;
    $finish;
end
endmodule