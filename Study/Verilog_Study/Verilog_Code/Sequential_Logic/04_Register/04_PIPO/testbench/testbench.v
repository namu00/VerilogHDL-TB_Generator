module testbench();
    reg clk, rst;
    reg [3:0] in;
    wire [3:0] q;

    pipo test_unit(
        .clk(clk),
        .rst(rst),
        .in(in),
        .q(q)
    );

    initial begin
        rst = 1'b0; clk = 1'b0;
        #1; rst = 1'b1;
    end

    always #1 clk = ~clk; 
    
    initial begin
        in = 4'hf; #2;
        in = 4'b1000; #2;
        in = 4'b0100; #2;
        in = 4'b0010; #2;
        in = 4'b0001; #2;
        $stop;
    end
endmodule