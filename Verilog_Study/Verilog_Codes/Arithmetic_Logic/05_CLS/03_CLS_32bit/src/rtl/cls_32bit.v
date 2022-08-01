module cls_32bit(carry_start, a, b, sum, carry_out);
    input carry_start;
    input [31:0] a;
    input [31:0] b;
    output [31:0] sum;
    output carry_out;

    wire borrow;

    cls_16bit unit_0(
        .carry_start(carry_start),
        .a(a[15:0]),
        .b(b[15:0]),
        .sum(sum[15:0]),
        .carry_out(borrow)
    );

    cls_16bit unit_1(
        .carry_start(borrow),
        .a(a[31:16]),
        .b(b[31:16]),
        .sum(sum[31:16]),
        .carry_out(carry_out)
    );

endmodule