`include "CPU.v"
`include "RAM.v"
`include "ROM.v"
`timescale 1ns / 100ps 

module Main(
    input CLK,
    output [31:0] GPIO
);
    wire [9:0] RAM_ADDR;
    wire [31:0] RAM_READ_DATA;
    wire [31:0] RAM_WRITE_DATA;
    wire RAM_WRITE_ENABLE;

    wire [9:0] INSTRUCTION_ADDR;
    wire [31:0] INSTRUCTION;
    
    CPU cpu(
        .RAM_READ_DATA(RAM_READ_DATA),
        .INSTRUCTION(INSTRUCTION),
        .CLK(CLK),

        .RAM_ADDR(RAM_ADDR),
        .RAM_WRITE_DATA(RAM_WRITE_DATA),
        .RAM_WRITE_ENABLE(RAM_WRITE_ENABLE),
        .INSTRUCTION_ADDR(INSTRUCTION_ADDR),
        .GPIO(GPIO)
    );
    
    ROM rom(
        .ADDRESS(INSTRUCTION_ADDR),

        .DATA(INSTRUCTION)
    );

    RAM ram(
        .ADDRESS(RAM_ADDR),
        .DATA_IN(RAM_WRITE_DATA),
        .WRITE_ENABLE(RAM_WRITE_ENABLE),
        .CLK(CLK),

        .DATA_OUT(RAM_READ_DATA)    
    );
    
//    integer i = 0;
//    initial begin
//        for(i=0; i<20; i = i + 1) begin
//            #20 CLK = ~CLK;
//        end
//    end
    
endmodule