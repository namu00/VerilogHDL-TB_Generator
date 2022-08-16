module testbench();
    reg clk, rst, in;
    wire result;

    pattern_00 testunit_0(
        .clk(clk),
        .rst(rst),
        .in(in),
        .result(result)
    );

    initial begin
        rst = 1'b0; clk = 1'b0;
        #1; rst = 1'b1;
    end

    always #2 clk = ~clk;

    initial begin
    end
endmodule