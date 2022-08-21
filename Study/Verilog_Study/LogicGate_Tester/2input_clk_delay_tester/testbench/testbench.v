module and_2input(in1, in0, out);
    input in1;
    input in0;
    output out;

    assign out = in1 & in0;
endmodule

module testbench();
    reg clk;
    reg rst;
    wire in0,in1;
    wire out;

    initial begin
        clk = 1'b0; rst = 1'b0;
        #1; rst = 1'b1;
        #100; $stop;
    end

    always #1 clk = ~clk;

    tv_gen testvector(
        .clk(clk),
        .rst(rst),
        .in0(in0),
        .in1(in1)
    );

    and_2input test_unit(
        .in1(in1),
        .in0(in0),
        .out(out)
    );
endmodule