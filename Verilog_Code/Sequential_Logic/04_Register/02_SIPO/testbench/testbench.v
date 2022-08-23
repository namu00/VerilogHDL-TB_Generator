`timescale 1ns/1ps

module testbench();
    reg clk, rst, in;
    wire [3:0]q;

    sipo test_unit(
        .clk(clk),
        .rst(rst),
        .in(in),
        .q(q)
    );

    initial begin
        rst = 1'b0; clk = 1'b0;
        #1rst = 1'b1;
    end

    always #1 clk = ~clk;

    initial begin
        in = 1'b1; #8;
        in = 1'b0; #8;
        $stop;
    end
endmodule