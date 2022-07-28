module pipo(clk, rst, data, q);
    input clk;
    input rst;
    input [3:0] data;
    output [3:0] q;

    dff unit_3(
        .clk(clk),
        .rst(rst),
        .d(data[3]),
        .q(q[3])
    );

    dff unit_2(
        .clk(clk),
        .rst(rst),
        .d(data[2]),
        .q(q[2])
    );

    dff unit_1(
        .clk(clk),
        .rst(rst),
        .d(data[1]),
        .q(q[1])
    );

    dff unit_0(
        .clk(clk),
        .rst(rst),
        .d(data[0]),
        .q(q[0])
    );
endmodule