module testbench();
    reg clk;
    reg rst;
    reg s;
    reg r;
    wire q;

    srff_sync_rst unit_0(
        .clk(clk),
        .rst(rst),
        .s(s),
        .r(r),
        .q(q)
    );

    initial begin
        rst = 1'b0; clk = 1'b1;
        #1; rst = 1'b1;
    end

    always #5 clk = ~clk;

    initial begin
        s = 1'b0; r = 1'b0; #10;
        s = 1'b0; r = 1'b1; #10;
        s = 1'b1; r = 1'b0; #10;
        s = 1'b1; r = 1'b1; #10;
        $stop;
    end
endmodule