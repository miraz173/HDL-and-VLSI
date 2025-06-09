module ALU_SHL_5bit (
    input wire [4:0] A, B,
    output reg [4:0] R,
    output reg CF
);

    wire [2:0] shift_amt;
    assign shift_amt = B[2:0]; // Use only 3 LSBs of B

    always @(*) begin
        case (shift_amt)
            3'd0: 
                begin
                    R = A;            // No shift
                    CF = 1'b0;
                end
            3'd1: 
                begin
                    R = A << 1;       // Shift left by 1
                    CF = A[4];
                end
            3'd2: 
                begin
                    R = A << 2;       // Shift left by 2
                    CF = A[3];
                end
            3'd3: 
                begin
                    R = A << 3;       // Shift left by 3
                    CF = A[2];
                end
            3'd4: 
                begin
                    R = A << 4;       // Shift left by 4
                    CF = A[1];
                end
            3'd5: 
                begin
                    R = A << 5;
                    CF = A[0];
                end                

            default: 
                begin
                    R = 5'b00000;  // For shift_amt > 4, output will become zero
                    CF = 1'b0;
                end

        endcase
    end

endmodule
