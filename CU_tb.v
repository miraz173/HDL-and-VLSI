module CU_tb;
    reg [1:0] Opcode;       
    wire OP;                
    wire REG_EN;
    wire IMM_SEL;

    CU uut (
        .Opcode(Opcode),
        .OP(OP),
        .REG_EN(REG_EN),
        .IMM_SEL(IMM_SEL)
    );

    initial begin
        $dumpfile("cu_test.vcd");
        $dumpvars(0, CU_tb);

        Opcode = 2'b00;//reg_not
        #10;

        Opcode = 2'b01;//reg_shl
        #10;

        Opcode = 2'b10;//imm_not
        #10;

        Opcode = 2'b11;//imm_shl
        #10
        
        $finish;
    end

    initial begin
        $monitor("Time=%0t Opcode=%b -> OP=%b REG_EN=%b IMM_SEL=%b", $time, Opcode, OP, REG_EN, IMM_SEL);
    end

endmodule