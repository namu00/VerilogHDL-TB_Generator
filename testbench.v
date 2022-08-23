module testbench();
    reg clk, rst;
    wire [3:0] q;

    jcnt test_unit (clk, rst, q);

    initial clk = 1'b0;
    always #1 clk = ~clk;

    initial begin
        rst = 1'b0; #2;
        rst = 1'b1; #2;
        rst = 1'b1; #2;
        rst = 1'b1; #2;
        rst = 1'b1; #2;
        rst = 1'b1; #2;
        rst = 1'b1; #2;
        rst = 1'b1; #2;
        rst = 1'b1; #2;
        rst = 1'b1; #2;
        rst = 1'b1; #2;
        rst = 1'b1; #2;
        rst = 1'b1; #2;
    end

endmodule