module clas_32bit(sel, a, b, result, c_out);
    input sel;
    input [31:0] a,b;
    output [31:0] result;
    output c_out;

    wire carry;

    clas_16bit unit_0(
        .a(a[15:0]),
        .b(b[15:0]),
        .sel(sel),
        .result(result[7:0]),
        .c_in(sel),
        .c_out(carry)
    );

    clas_16bit unit_1(
        .a(a[31:16]),
        .b(b[31:16]),
        .sel(sel),
        .result(result[31:16]),
        .c_in(carry),
        .c_out(c_out)
    );
endmodule