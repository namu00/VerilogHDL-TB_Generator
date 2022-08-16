module clas_8bit(sel, a, b, result, c_in, c_out);
    input sel;
    input c_in;
    input [7:0] a,b;
    output [7:0] result;
    output c_out;

    wire carry;

    clas_4bit unit_0(
        .a(a[3:0]),
        .b(b[3:0]),
        .sel(sel),
        .result(result[3:0]),
        .c_in(c_in),
        .c_out(carry)
    );

    clas_4bit unit_1(
        .a(a[7:4]),
        .b(b[7:4]),
        .sel(sel),
        .result(result[7:4]),
        .c_in(carry),
        .c_out(c_out)
    );
endmodule