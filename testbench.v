module testbench();

    reg clk,
          rst;
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

    initial begin
        q = 4'b0000; #2;
        q = 4'b0001; #2;
        q = 4'b0011; #2;
        q = 4'b0111; #2;
        q = 4'b1111; #2;
        q = 4'b1110; #2;
        q = 4'b1100; #2;
        q = 4'b1000; #2;
        q = 4'b0000; #2;
        q = 4'b0001; #2;
        q = 4'b0011; #2;
        q = 4'b0111; #2;
        q = 4'b1111; #2;
    end

endmodule