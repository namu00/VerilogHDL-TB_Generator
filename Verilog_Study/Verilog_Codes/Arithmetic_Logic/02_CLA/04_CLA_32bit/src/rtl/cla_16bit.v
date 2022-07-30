module cla_16bit(carry_start, a, b, sum, carry_out);
    input carry_start;
    input [15:0] a;
    input [15:0] b;
    output [15:0] sum;
    output carry_out;

    wire c;

    cla_8bit unit_0(
        .carry_start(carry_start),
        .a(a[7:0]),
        .b(b[7:0]),
        .sum(sum[7:0]),
        .carry_out(c)
    );

    cla_8bit unit_1(
        .carry_start(c),
        .a(a[15:8]),
        .b(b[15:8]),
        .sum(sum[15:8]),
        .carry_out(carry_out)
    );
endmodule