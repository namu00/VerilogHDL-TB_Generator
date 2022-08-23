module testbench();
    reg clk;
    reg rst;
    wire [3:0] q;

    jcnt test_unit(clk, rst, q);

    initial clk = 1'b0;
    always #1 clk = ~clk;
endmodule