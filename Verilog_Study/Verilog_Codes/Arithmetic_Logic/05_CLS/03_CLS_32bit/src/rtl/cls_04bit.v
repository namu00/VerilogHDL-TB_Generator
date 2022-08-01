module cls_4bit(carry_start, a, b, sum, carry_out);
    input carry_start;
    input [3:0] a;
    input [3:0] b;
    output [3:0] sum;
    output carry_out;

    wire [3:0]c;

    clb block_0( // Carry Look-Ahead Block
        .carry_start(carry_start), //Should be 1'b1 for Subtract (For Two's Compliment)
        .a(a),
        .b(~b), //For Two's Compliment
        .carry_out(c)
    );
    
    adder unit_0( //LSB
        .a(a[0]),
        .b(~b[0]),
        .c_in(carry_start),
        .sum(sum[0])
    );

    adder unit_1(
        .a(a[1]),
        .b(~b[1]),
        .c_in(c[0]),
        .sum(sum[1])
    );

    adder unit_2(
        .a(a[2]),
        .b(~b[2]),
        .c_in(c[1]),
        .sum(sum[2])
    );

    adder unit_3(
        .a(a[3]),
        .b(~b[3]),
        .c_in(c[2]),
        .sum(sum[3])
    );

    assign carry_out = c[3];
endmodule

module clb(carry_start, a, b, carry_out); //Carry Look-Ahead Block
    input carry_start;
    input [3:0] a;
    input [3:0] b;
    output [3:0] carry_out;

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
    and c0_and(c[0],carry_start,p[0]);
    or c0_or(carry_out[0],g[0],c[0]);

   and c1_and(c[1],carry_out[0],p[1]);
   or c1_or(carry_out[1],g[1],c[1]);

   and c2_and(c[2],carry_out[1],p[2]);
   or c2_or(carry_out[2],g[2],c[2]);

   and c3_and(c[3],carry_out[2],p[3]);
   or c3_or(carry_out[3],g[3],c[3]);
endmodule

module adder(a, b, c_in, sum); //1-Bit Full-Adder
    input a, b, c_in;
    output sum;
    wire s1;

    //SUM
    xor sum1 (s1, a, b);
    xor sum2 (sum, s1, c_in);
endmodule