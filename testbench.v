module testbench();
    reg in;
    wire out;

    not test_unit(in,out);

    initial clk = 1'b0;
    always #1 clk = ~clk;
endmodule