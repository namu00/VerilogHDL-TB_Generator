module testbench();
    reg clk;
    reg rst;
    reg d;
    wire q;

    dff_async_rst unit_0(
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    initial begin
        rst = 1'b0; clk = 1'b1;
        #3; rst = 1'b1;
    end

    always #3 clk = ~clk;

    initial begin
        d = 1'b0; #5;
        d = 1'b1; #5;
        #1; rst = 1'b0;
        #5; rst = 1'b1; d = 1'b1;
        d = 1'b0;
        $stop;
    end
endmodule