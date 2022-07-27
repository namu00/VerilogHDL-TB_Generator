module testbench();
    reg in,clk,rst;
    wire out;

    dff unit_0(.in(in), .clk(clk), .rst(rst), .out(out));

    initial begin
        rst = 1'b0; clk = 1'b0;
        #3 rst = 1'b1;
    end
    
    always #5 clk = ~clk;

    initial begin
        in = 1'b0;
        #2 #10
        in = 1'b1;
        #10 in = 1'b0;
        #10 $stop;
    end
endmodule