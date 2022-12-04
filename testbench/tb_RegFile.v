`include "RegFile.v"
`timescale 1ns / 100ps 

module tb_RegFile;
    reg [4:0]R1;
    reg [4:0]R2;
    reg [4:0]RD;
    reg [31:0]RD_DATA;
    reg reg_write_enable;

    wire [31:0]R1_data;
    wire [31:0]R2_data;

    RegFile regfile(R1, R2, RD, RD_DATA, reg_write_enable, R1_data, R2_data );

    initial begin
        #20;

        R1 = 0;
        R2 = 0;
        RD = 0;
        RD_DATA = 0;
        reg_write_enable = 0;
        #20;

        R1 = 0;
        R2 = 0;
        RD = 1;
        RD_DATA = 5;
        reg_write_enable = 1;
        #20;

        R1 = 1;
        R2 = 0;
        RD = 2;
        RD_DATA = 10;
        reg_write_enable = 1;
        #20;

        // Test write_enable is working
        R1 = 1;
        R2 = 2;
        RD = 3;
        RD_DATA = 99;
        reg_write_enable = 0;
        #20;

        R1 = 3;
        R2 = 2;
        RD = 1;
        RD_DATA = 99;
        reg_write_enable = 0;
        #20;

        // Test R0 is write protected
        R1 = 3;
        R2 = 1;
        RD = 0;
        RD_DATA = 99;
        reg_write_enable = 1;
        #20;

        R1 = 0;
        R2 = 1;
        RD = 0;
        RD_DATA = 0;
        reg_write_enable = 0;
        #20;
    end

    initial begin
        $dumpfile("vcd/regfile.vcd");
        $dumpvars(0, tb_RegFile);
    end
endmodule