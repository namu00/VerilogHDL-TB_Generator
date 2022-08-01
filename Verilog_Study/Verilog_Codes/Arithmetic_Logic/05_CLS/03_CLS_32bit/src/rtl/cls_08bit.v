module cls_8bit(carry_start, a, b, sum, carry_out);
    input carry_start;
    input [7:0] a;
    input [7:0] b;
    output [7:0] sum;
    output carry_out;

    wire borrow;

    cls_4bit unit_0(
        .carry_start(carry_start),
        .a(a[3:0]),
        .b(b[3:0]),
        .sum(sum[3:0]),
        .carry_out(borrow)
    );

    cls_4bit unit_1(
        .carry_start(borrow),
        .a(a[7:4]),
        .b(b[7:4]),
        .sum(sum[7:4]),
        .carry_out(carry_out)
    );

endmodule