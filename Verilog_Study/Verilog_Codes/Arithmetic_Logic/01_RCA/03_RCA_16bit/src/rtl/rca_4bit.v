module rca_4bit(a, b, sum, carry_start, carry);
    input [3:0] a;
    input [3:0] b;
    input carry_start;

    output [3:0] sum;
    output carry;

    wire [2:0] c;

    full_adder unit_0( //LSB
        .a(a[0]),
        .b(b[0]),
        .c_in(carry_start),
        .sum(sum[0]),
        .c_out(c[0])
    );

    full_adder unit_1(
        .a(a[1]),
        .b(b[1]),
        .c_in(c[0]),
        .sum(sum[1]),
        .c_out(c[1])
    );

    full_adder unit_2(
        .a(a[2]),
        .b(b[2]),
        .c_in(c[1]),
        .sum(sum[2]),
        .c_out(c[2])
    );

    full_adder unit_3( //MSB
        .a(a[3]),
        .b(b[3]),
        .c_in(c[2]),
        .sum(sum[3]),
        .c_out(carry)
    );
endmodule

module full_adder(a, b, c_in, sum, c_out);
    input a, b, c_in;
    output sum, c_out;
    wire s1;
    wire c1, c2, c3;

    //Carry_OUT
    and carry0 (c1, a, b); //A AND B
    xor carry1 (c2, a, b); 
    and carry2 (c3, c2, c_in); // (A XOR B) AND C_in
    or carry3 (c_out, c1, c3); // (A&B) + (A ^ B)&C_in

    //SUM
    xor sum1 (s1, a, b);
    xor sum2 (sum, s1, c_in);
endmodule