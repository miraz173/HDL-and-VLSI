module full_adder
(
    input x, 
    input y, 
    input z,
    output s, 
    output c
);
    assign s = (x ^ y) ^ z;
    assign c = ((x ^ y) & z) | (x & y);
endmodule

`timescale 1ns/1ps
module full_adder_tb;
reg x;
reg y;
reg z;
wire s;
wire c;
full_adder uut(
    .x(x),
    .y(y),
    .z(z),
    .s(s),
    .c(c)
);

initial begin
    x=0;
    y=0;
    z=0;

    #20
    x=1;

    #20
    y=1;

    #20
    z=1;

    #20
    x=0;

    #20
    y=0;

    #20
    x=1;

    #20
    x=0;
    y=1;
    z=0;
    end

    initial begin
        $monitor("x=%d, y=%d, z=%d,  c=%d, s=%d", x, y, z, c, s);
    end
endmodule
