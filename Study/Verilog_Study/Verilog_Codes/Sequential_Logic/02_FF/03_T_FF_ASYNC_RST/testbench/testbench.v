module testbench();
    reg clk;
    reg rst;
    reg t;
    wire q;

    tff_async_rst unit_0(
        .clk(clk),
        .rst(rst),
        .t(t),
        .q(q)
    );

    initial begin
        rst = 1'b0; clk = 1'b1;
        #3 rst = 1'b1;
    end

    always #5 clk = ~clk;

    initial begin
        t = 1'b0; #10;
        t = 1'b1; #10;
        #7; rst = 1'b0; t = 1'b1;
        t = 1'b1; #10;
        $stop;
    end
    
endmodule