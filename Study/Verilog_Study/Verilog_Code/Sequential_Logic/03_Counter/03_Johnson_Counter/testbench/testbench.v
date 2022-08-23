module testbench();
    reg clk;
    reg rst;
    wire [3:0] q;

    jcnt test_unit0(
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    initial begin
        rst = 1'b0; clk = 1'b0;
        #1; rst = 1'b1;
    end

    always #5 clk = ~clk;

    initial begin
        #160; $stop;
    end
endmodule