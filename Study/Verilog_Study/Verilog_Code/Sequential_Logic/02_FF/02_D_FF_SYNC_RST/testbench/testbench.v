module testbench();
    reg d;
    reg clk;
    reg rst;
    wire q;

    dff_sync_rst unit_0(
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    initial begin
        rst = 1'b0; clk = 1'b1;
        #3 rst = 1'b1;
    end

    always #5 clk = ~clk;

    initial begin
        d = 1'b0; #10;
        d = 1'b1; #10;
        #7; rst = 1'b0; d = 1'b1;
        d = 1'b1; #10;
        $stop;
    end
    
endmodule