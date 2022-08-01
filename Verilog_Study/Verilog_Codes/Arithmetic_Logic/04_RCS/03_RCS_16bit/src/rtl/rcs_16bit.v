module rcs_16bit(a, b, sum, carry_start, carry);
    input [15:0] a, b;
    input carry_start;
    output [15:0] sum;
    output carry;

    wire borrow;

    rcs_4bit unit_0(
        .a(a[7:0]),
        .b(b[7:0]),
        .sum(sum[7:0]),
        .carry_start(1'b1),
        .carry(borrow)
    );

    rcs_4bit unit_1(
        .a(a[15:8]),
        .b(b[15:8]),
        .sum(sum[15:8]),
        .carry_start(borrow),
        .carry(carry)
    );
endmodule