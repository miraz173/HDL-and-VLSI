module ALU_NOT_5bit 
(
    input wire [4:0] A,  
    output wire [4:0] R    
);

    assign R= ~A;

endmodule
