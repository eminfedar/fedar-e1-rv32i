module ALU(
    input [31:0] X,
    input [31:0] Y,
    input [3:0] OP,

    output reg [31:0] RESULT,
    output isEqual
);

    wire signed [31:0] X_signed = X;
    wire signed [31:0] Y_signed = Y;

    assign isEqual = X == Y;

    always @(*) begin
        case (OP)
            0: RESULT <= X + Y; // add
            1: RESULT <= X - Y; // sub
            2: RESULT <= X & Y; // and
            3: RESULT <= X | Y; // or
            4: RESULT <= X ^ Y; // xor
            5: RESULT <= X << Y; // shift left logical
            6: RESULT <= X >> Y; // shift right logical
            7: RESULT <= X_signed >>> Y; // shift right arithmetic
            8: RESULT <= (X_signed < Y_signed ? 1 : 0); // set less than (slt)
            9: RESULT <= (X < Y ? 1 : 0); // set less than (sltu)
        endcase
    end

endmodule