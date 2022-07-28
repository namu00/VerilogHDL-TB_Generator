module testbench();
    reg clk;
    reg rst;
    reg [3:0] data;
    wire [3:0] q;

    pipo unit_0(
        .clk(clk),
        .rst(rst),
        .data(data),
        .q(q)
    );

    initial begin
        rst = 1'b0; clk = 1'b0;
        #1; rst = 1'b1;
    end

    always #5 clk = ~clk;

    initial begin
        data = 4'b0000; #10;
        data = 4'b0001; #10;
        data = 4'b0010; #10;
        data = 4'b0100; #10;
        data = 4'b1000; #10;
        data = 4'b1111; #10;
        $stop;
    end
endmodule