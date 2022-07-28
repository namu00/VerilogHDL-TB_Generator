module testbench();
    reg clk;
    reg rst;
    reg data;
    wire out;

    siso unit_0(
        .clk(clk),
        .rst(rst),
        .data(data),
        .out(out)
    );

    initial begin
        rst = 1'b0; clk = 1'b0;
        #1; rst = 1'b1;
    end

    always #5 clk = ~clk;

    initial begin
        data = 1'b1; #10;
        data = 1'b0;
        #40; $stop;
    end
endmodule