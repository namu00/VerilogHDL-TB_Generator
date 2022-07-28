module sipo(clk, rst, data, out);
    input clk;
    input rst;
    input data;
    output [3:0] out;

    dff unit_3(
        .clk(clk),
        .rst(rst),
        .d(data),
        .q(out[3])
    );

    dff unit_2(
        .clk(clk),
        .rst(rst),
        .d(out[3]),
        .q(out[2])
    );

    dff unit_1(
        .clk(clk),
        .rst(rst),
        .d(out[2]),
        .q(out[1])
    );

    dff unit_0(
        .clk(clk),
        .rst(rst),
        .d(out[1]),
        .q(out[0])
    );

endmodule