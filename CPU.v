module CPU (
    input wire [9:0] PI,     // Program Instruction, 10 bit
    output wire [4:0] R,     // ALU result, signed value
    output wire CF,              
    output wire SF,             
    output wire ZF,
    output wire GF          //Greater Flag: R>0?1:0
);

    // Designed CPU has 8 registers, each 5-bit wide
    reg [4:0] registers [0:7];

    initial begin  // Register values(Random values) of CPUs internal registers
        registers[0] = 5'd1;
        registers[1] = 5'd3;
        registers[2] = 5'd5;
        registers[3] = 5'd10;
        registers[4] = 5'd20;
        registers[5] = 5'd21;
        registers[6] = 5'd27;
        registers[7] = 5'd31;
    end

    wire OP;
    wire REG_EN;
    wire IMM_SEL;

    CU cu1 (
        //input
        .Opcode(PI[9:8]), //opcode at PI[9:8]
        //output
        .OP(OP),
        .REG_EN(REG_EN),
        .IMM_SEL(IMM_SEL)
    );
    
    wire [4:0] A = registers[PI[7:5]]; //Get A from registers
    wire [4:0] B = (IMM_SEL) ? PI[4:0] : registers[PI[4:2]]; 

    ALU alu1 (
        //input
        .A(A),
        .B(B),
        .OP(OP),
        //output
        .R(R),
        .CF(CF),
        .SF(SF),
        .ZF(ZF)
    );
    assign GF = ~(ZF || SF); //SF=1 meaning negative number
endmodule
