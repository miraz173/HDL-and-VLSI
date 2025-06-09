module ALU_tb;
    reg [4:0] A, B;       
    reg OP;          
    wire [4:0] R;          
    wire CF;
    wire SF;
    wire ZF;

    ALU uut (
        .A(A),
        .B(B),
        .OP(OP),
        .R(R),
        .CF(CF),
        .SF(SF),
        .ZF(ZF)
    );

    initial begin
        $dumpfile("alu_test.vcd");
        $dumpvars(0, ALU_tb);

        A = 5'b00000; B = 5'b00000; OP = 1'b0;//not
        #10;

        A = 5'b10101; OP = 1'b0;
        #10;

        A = 5'b11111; OP = 1'b0;
        #10;

        A = 5'b11101; B = 5'b00000; OP = 1'b1;//shl 0
        #10;

        A = 5'b11101; B = 5'b00001; OP = 1'b1;
        #10;

        A = 5'b10101; B = 5'b00010; OP = 1'b1;
        #10;

        A = 5'b11101; B = 5'b00011; OP = 1'b1;
        #10;

        A = 5'b01010; B = 5'b00000; OP = 1'b1;
        #10;

        A = 5'b01010; B = 5'b00100; OP = 1'b1;//<<4
        #10;

        A = 5'b01010; B = 5'b00101; OP = 1'b1; //shl << 5
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b OP=%b -> R=%b CF=%b ZF=%b SF=%b", $time, A, B, OP, R, CF, ZF, SF);
    end

endmodule
