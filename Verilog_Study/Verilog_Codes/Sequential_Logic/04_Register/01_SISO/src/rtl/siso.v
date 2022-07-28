module siso(clk, rst, data, out);
    input clk;
    input rst;
    input data;
    output out;

    wire [3:0] q;

    dff unit_3(
        .clk(clk),
        .rst(rst),
        .d(data),
        .out(q[3])
    );

    dff unit_2(
        .clk(clk),
        .rst(rst),
        .d(q[3]),
        .out(q[2])
    );

    dff unit_1(
        .clk(clk),
        .rst(rst),
        .d(q[2]),
        .out(q[1])
    );

    dff unit_0(
        .clk(clk),
        .rst(rst),
        .d(q[1]),
        .out(q[0])
    );
    assign out = q[0];
endmodule