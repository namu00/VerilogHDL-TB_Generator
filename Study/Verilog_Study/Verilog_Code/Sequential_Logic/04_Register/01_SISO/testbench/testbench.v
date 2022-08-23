`timescale 1ns/1ps

module testbench();
    reg clk, rst, in, shift;
    wire out;

    siso test_unit(
        .clk(clk),
        .rst(rst),
        .in(in),
        .shift(shift),
        .out(out)
    );

    initial begin
        rst = 1'b0; clk = 1'b0;
        #1 rst = 1'b1;
    end

    always #1 clk = ~clk;

    initial begin
        shift = 1'b1;
        in = 1'b1; #8;
        in = 1'b0; #8;
        $stop;
    end
endmodule