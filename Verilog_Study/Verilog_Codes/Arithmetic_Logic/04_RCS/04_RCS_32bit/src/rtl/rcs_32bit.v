module rcs_16bit(a, b, sum, carry_start, carry);
    input [31:0] a, b;
    input carry_start;
    output [31:0] sum;
    output carry;

    wire borrow;

    rcs_8bit unit_0(
        .a(a[15:0]),
        .b(b[15:0]),
        .sum(sum[15:0]),
        .carry_start(1'b1),
        .carry(borrow)
    );

    rcs_8bit unit_1(
        .a(a[31:16]),
        .b(b[31:16]),
        .sum(sum[31:16]),
        .carry_start(borrow),
        .carry(carry)
    );
endmodule