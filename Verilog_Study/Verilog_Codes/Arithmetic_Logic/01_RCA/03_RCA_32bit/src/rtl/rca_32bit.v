module rca_32bit(a, b, sum, carry_start, carry);
    input [31:0] a;
    input [31:0] b;
    input carry_start;
    output [31:0] sum;
    output carry;

    wire crr;

    rca_16bit unit_0(
        .a(a[15:0]),
        .b(b[15:0]),
        .sum(sum[15:0]),
        .carry_start(1'b0),
        .carry(crr)
    );

    rca_16bit unit_1(
        .a(a[31:16]),
        .b(b[31:16]),
        .sum(sum[31:16]),
        .carry_start(crr),
        .carry(carry)
    );
endmodule