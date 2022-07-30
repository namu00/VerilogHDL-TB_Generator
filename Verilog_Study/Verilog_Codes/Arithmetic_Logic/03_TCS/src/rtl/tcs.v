module tcs(a, b, sum, carry); //TOP MODULE
    input [1:0] a;
    input [1:0] b;
    output [1:0] sum;
    output carry;

    wire [1:0] tsb;
    wire c;

    tc twos_b(.data(b), .out(tsb));

    full_adder add_0(
        .a(a[0]),
        .b(tsb[0]),
        .c_in(1'b0),
        .sum(sum[0]),
        .c_out(c)
    );

    full_adder add_1(
        .a(a[1]),
        .b(tsb[1]),
        .c_in(c),
        .sum(sum[1]),
        .c_out(carry)
    );
    
endmodule



module tc(data, out); //Twos Compliment Module
    input [1:0] data;
    output [1:0] out;

    wire [1:0] bit_inv;
    wire carry;

    //Bit inverting
    not inv0(bit_inv[0],data[0]);
    not inv1(bit_inv[1],data[1]);

    //add one to do TWOS COMPLIEMNT
    full_adder twos_0(
        .a(bit_inv[0]),
        .b(1'b1),
        .c_in(1'b0),
        .sum(out[0]),
        .c_out(carry)
    );

    full_adder twos_1(
        .a(bit_inv[1]),
        .b(1'b0),
        .c_in(carry),
        .sum(out[1]),
        .c_out()
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