module RAM(
    input [9:0] ADDRESS,
    input [31:0] DATA_IN,
    input WRITE_ENABLE,
    input CLK,
    
    output [31:0] DATA_OUT
);
    reg [31:0] memory [1023:0];

    assign DATA_OUT = memory[ADDRESS];

    always @(posedge CLK) begin
        if (WRITE_ENABLE)
            memory[ADDRESS] <= DATA_IN;
    end

endmodule