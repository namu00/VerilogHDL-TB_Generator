module rca_8bit(a, b, sum, carry_start, carry);
    input [7:0] a;
    input [7:0] b;
    input carry_start;
    output [7:0] sum;
    output carry;

    wire crr;

    rca_4bit unit_0(
        .a(a[3:0]),
        .b(b[3:0]),
        .sum(sum[3:0]),
        .carry_start(1'b0),
        .carry(crr)
    );

    rca_4bit unit_1(
        .a(a[7:4]),
        .b(b[7:4]),
        .sum(sum[7:4]),
        .carry_start(crr),
        .carry(carry)
    );
endmodule