`timescale 1ns/1ps

module CPU_tb;
    // Inputs
    reg [9:0] PI;

    // Outputs
    wire [4:0] R;
    wire CF, SF, ZF;
    wire GF;
    // Instantiate the CPU
    CPU cpu1 (
        .PI(PI),
        .R(R),
        .CF(CF),
        .SF(SF),
        .ZF(ZF),
        .GF(GF)
    );

    initial begin
        $dumpfile("cpu_test.vcd");
        $dumpvars(0, CPU_tb);

        $display(" Time |      PI      |   R   | CF | SF | ZF | GF ");
        $display("-------------------------------------------------");

        // Test 1: NOT operation (PI = 00), register mode (B unused)
        PI = 10'b0010100000;
        #10;
        
        // Test 10: SHL operation, register mode (PI = 01), shift by 1
        PI = 10'b0100100100; // shift by 1
        #10;
        
        // Test 3: SHL operation, register mode (PI = 01), shift by 1
        PI = 10'b0100100011;
        #10;
        
        // Test 4: SHL operation, immediate mode (PI = 11)
        PI = 10'b1101000011; // 3
        #10;
        
        // Test 5: SHL operation, immediate mode
        PI = 10'b1110000010; // shift << 10
        #10;
        
        // Test 4: SHL operation, immediate mode
        PI = 10'b1110100101; // shift << 5
        #10;
        
        $finish;

    end

    initial begin
        $monitor("%5t |  %b  | %b |  %b |  %b |  %b |  %b ",
                 $time, PI, R, CF, SF, ZF, GF);
    end

endmodule
