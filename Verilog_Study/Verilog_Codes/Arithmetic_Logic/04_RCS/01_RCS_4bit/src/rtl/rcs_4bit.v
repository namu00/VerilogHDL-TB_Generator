module rcs_4bit(a, b, borrow_in, borrow,diff);
    input [3:0] a,b;
    input borrow_in;
    output [3:0] diff;
    output borrow;

    wire [3:0] brr;

    full_subtract unit_0(
        .a(a[0]),
        .b(b[0]),
        .c(borrow_in),
        .diff(diff[0]),
        .borrow(brr[0])
    );

    full_subtract unit_1(
        .a(a[1]),
        .b(b[1]),
        .c(brr[0]),
        .diff(diff[1]),
        .borrow(brr[1])
    );

    full_subtract unit_2(
        .a(a[2]),
        .b(b[2]),
        .c(brr[1]),
        .diff(diff[2]),
        .borrow(brr[2])
    );

    full_subtract unit_3(
        .a(a[3]),
        .b(b[3]),
        .c(brr[2]),
        .diff(diff[3]),
        .borrow(brr[3])
    );

    assign borrow = brr[3];
endmodule

module full_subtract(a,b,c,borrow,diff);
    input a,b,c;
    output borrow,diff;

    wire [3:0]w;
    xor (diff,a,b,c);

    not n1(w[0],a);
    and a1(w[1],w[0],b);
    and a2(w[2],w[1],c);
    and a3(w[3],b,c);
    or o1(borrow,w[1],w[2],w[3]);
endmodule