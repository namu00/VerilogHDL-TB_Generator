module rcs_8bit(a, b, sum, carry_start, carry);
    input [7:0] a, b;
    input carry_start;
    output [7:0] sum;
    output carry;

    wire borrow;

    rcs_4bit unit_0(
        .a(a[3:0]),
        .b(b[3:0]),
        .sum(sum[3:0]),
        .carry_start(1'b1),
        .carry(borrow)
    );

    rcs_4bit unit_1(
        .a(a[7:4]),
        .b(b[7:4]),
        .sum(sum[7:4]),
        .carry_start(borrow),
        .carry(carry)
    );
endmodule