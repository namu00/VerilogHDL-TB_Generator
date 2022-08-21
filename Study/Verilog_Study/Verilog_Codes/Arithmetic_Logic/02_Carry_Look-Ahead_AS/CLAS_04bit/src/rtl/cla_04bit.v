module clas_4bit(sel, a, b, result, c_out);
    input sel;
    input [3:0]a, b;
    output c_out;
    output [3:0] result;

    wire [3:0] b_bits;
    wire [3:0] carry;

    inverting_bit leaf_0(
        .data(b),
        .sel(sel),
        .out(b_bits)
    );

    clb block_0(
        .a(a),
        .b(b_bits),
        .c_in(sel),
        .c_out(carry)
    );

    adder unit_0( //LSB
        .a(a[0]),
        .b(b_bits[0]),
        .c_in(carry[0]),
        .sum(result[0])
    );

    adder unit_1(
        .a(a[1]),
        .b(b_bits[1]),
        .c_in(carry[0]),
        .sum(result[1])
    );

    adder unit_2(
        .a(a[2]),
        .b(b_bits[2]),
        .c_in(carry[1]),
        .sum(result[2])
    );

    adder unit_3(
        .a(a[3]),
        .b(b_bits[3]),
        .c_in(carry[2]),
        .sum(result[3])
    );
    
    assign c_out = carry[3];
endmodule

module inverting_bit(data, sel, out);
    input sel;
    input [3:0] data;
    output [3:0] out;

    //sel == 1 inverting b bits
    //sel == 0 passthrough b bits
    xor bit_0(out[0],data[0],sel);
    xor bit_1(out[1],data[1],sel);
    xor bit_2(out[2],data[2],sel);
    xor bit_3(out[3],data[3],sel);
endmodule

module clb(c_in, a, b, c_out); //Carry Look-Ahead Block
    input c_in;
    input [3:0] a;
    input [3:0] b;
    output [3:0] c_out;

    wire [3:0]g; //Generation Signal
    wire [3:0]p; //Propagation Signal
    wire [3:0]c; //for calc carry

    //Generation
    and g1(g[0], a[0], b[0]);
    and g2(g[1], a[1], b[1]);
    and g3(g[2], a[2], b[2]);
    and g4(g[3], a[3], b[3]);

    //Propagation
    or p1(p[0],a[0],b[0]);
    or p2(p[1],a[1],b[1]);
    or p3(p[2],a[2],b[2]);
    or p4(p[3],a[3],b[3]);

    //Carry Out
    and c0_and(c[0],c_in,p[0]);
    or c0_or(c_out[0],g[0],c[0]);

   and c1_and(c[1],c_out[0],p[1]);
   or c1_or(c_out[1],g[1],c[1]);

   and c2_and(c[2],c_out[1],p[2]);
   or c2_or(c_out[2],g[2],c[2]);

   and c3_and(c[3],c_out[2],p[3]);
   or c3_or(c_out[3],g[3],c[3]);
endmodule

module adder(a, b, c_in, sum); //1-Bit Adder Without Carry_Out
    input a, b, c_in;
    output sum;
    wire s1;

    //SUM
    xor sum1 (s1, a, b);
    xor sum2 (sum, s1, c_in);
endmodule