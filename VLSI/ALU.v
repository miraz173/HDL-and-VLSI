module ALU
(
    input wire [4:0] A, B,                   
    input wire OP,    
    output reg [4:0] R,     
    output wire CF,
    output wire SF,
    output wire ZF           
);

    wire [4:0] R_NOT, R_SHL;
    wire R_CF;

    // Instantiate modules
    ALU_NOT_5bit NOT1 ( .A(A), .R(R_NOT));
    ALU_SHL_5bit SHL1 ( .A(A), .B(B), .R(R_SHL), .CF(R_CF));

    always @(*) 
    begin
        case (OP)
            1'b0: // NOT operation
                begin 
                    R = R_NOT; 
                end
            1'b1: // left Shift 
                begin 
                    R = R_SHL;
                end
            default: 
                begin
                    R = 5'b00000;  
                end
        endcase
    end

    assign CF = OP? R_CF :1'b0;
    assign SF = R[4];
    assign ZF = ~(R[4] | R[3] | R[2] | R[1] | R[0]);

endmodule
