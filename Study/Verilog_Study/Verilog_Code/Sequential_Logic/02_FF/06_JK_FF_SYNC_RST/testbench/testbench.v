module testbench();
    reg j;
    reg k;
    reg clk;
    reg rst;
    wire q;

    jkff_async_rst unit_0(
        .j(j),
        .k(k),
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    initial begin
        rst = 1'b0; clk = 1'b1;
        j = 1'b0; k = 1'b0;
        #3 rst = 1'b1;
    end

    always #3 clk = ~clk;

    initial begin 
        #3; j = 1'b0; k = 1'b0;
        #3; j = 1'b0; k = 1'b1;
        #3; j = 1'b1; k = 1'b0;
        #3; j = 1'b1; k = 1'b1;
        #1; rst = 1'b0;
        #2; rst = 1'b1;
        $stop;
    end
endmodule