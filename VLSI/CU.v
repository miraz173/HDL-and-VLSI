module CU (
    input wire [1:0] Opcode,
    output wire OP,
    output wire REG_EN,
    output wire IMM_SEL
);

    assign OP = Opcode[0];
    assign REG_EN = ~Opcode[1] ; //0 means reg mode
    assign IMM_SEL = Opcode[1] ; //1 means immediate mode

endmodule
