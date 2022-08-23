`timescale 1ns/1ps

module testbench();
    reg clk, rst, ld;
    reg [3:0] in;
    wire q;

    piso test_unit(
        .clk(clk),
        .rst(rst),
        .ld(ld),
        .in(in),
        .q(q)
    );

    initial begin
        rst = 1'b0; clk = 1'b0;
        #1; rst = 1'b1;
    end

    always #1 clk = ~clk;

    initial begin
        ld = 1'b1;
        in = 4'b1010; #8;
        ld = 1'b0; #8;
        $stop;
    end
endmodule