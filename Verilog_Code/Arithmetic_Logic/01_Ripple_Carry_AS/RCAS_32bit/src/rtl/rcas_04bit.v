module rcas_4bit(a, b, sel, result, c_in, c_out);
    input [3:0] a,b;
    input sel;
        //sel == 0 adder
        //sel == 1 subtractor
    input c_in;
    output [3:0] result;
    output c_out;

    wire [3:0] b_bit;
    wire [2:0] carry;
    
    //sel 1 == inverting b bits
    //sel 0 == passtrough b bits
    bit_inv leaf_0(
        .sel(sel),
        .data(b),
        .bit(b_bit)
    );

    full_adder unit_0(
        .a(a[0]),
        .b(b_bit[0]),
        .c_in(c_in),
        .sum(result[0]),
        .c_out(carry[0])
    );

    full_adder unit_1(
        .a(a[1]),
        .b(b_bit[1]),
        .c_in(carry[0]),
        .sum(result[1]),
        .c_out(carry[1])
    );

    full_adder unit_2(
        .a(a[2]),
        .b(b_bit[2]),
        .c_in(carry[1]),
        .sum(result[2]),
        .c_out(carry[2])
    );

    full_adder unit_3(
        .a(a[3]),
        .b(b_bit[3]),
        .c_in(carry[2]),
        .sum(result[3]),
        .c_out(c_out)
    );
    
endmodule

module bit_inv(sel, data, bit);
    //sel 1 == inverting b bits
    //sel 0 == passtrough b bits
    input sel;
    input [3:0] data;
    output [3:0] bit;

    wire [3:0] out;

    xor b0(out[0],data[0],sel);
    xor b1(out[1],data[1],sel);
    xor b2(out[2],data[2],sel);
    xor b3(out[3],data[3],sel);

    assign bit = out;
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