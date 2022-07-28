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
        rst = 1'b0; clk = 1'b0;
        #1 rst = 1'b1;
        j = 1'b1; k = 1'b0;
    end

    always begin
        #5 clk = ~clk;
    end

    initial begin
        j = 1'b0; k = 1'b0; #5;
        j = 1'b0; k = 1'b1; #5;
        j = 1'b1; k = 1'b0; #5;
        j = 1'b1; k = 1'b1; #5;
        j = 1'b1;
        
        #5 rst = 1'b0; #1 rst = 1'b1; #5
        $stop;
    end
endmodule