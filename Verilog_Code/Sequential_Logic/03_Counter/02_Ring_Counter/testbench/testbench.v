module testbench();
    reg clk;
    reg rst;
    reg trig;
    wire [3:0] out;

    ring_counter unit_0(
        .clk(clk),
        .rst(rst),
        .trig(trig),
        .out(out)
    );

    initial begin
        rst = 1'b0; clk = 1'b0;
        trig = 1'b0;
        #1; rst = 1'b1;
    end

    always #5 clk = ~clk;

    initial begin
        #40; trig = 1'b1; #40; $stop;
    end
endmodule