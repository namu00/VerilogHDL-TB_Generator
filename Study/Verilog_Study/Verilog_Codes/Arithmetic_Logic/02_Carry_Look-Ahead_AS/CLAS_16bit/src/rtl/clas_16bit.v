module clas_16bit(sel, a, b, result, c_out);
    input sel;
    input [15:0] a,b;
    output [15:0] result;
    output c_out;

    wire carry;

    clas_8bit unit_0(
        .a(a[7:0]),
        .b(b[7:0]),
        .sel(sel),
        .result(result[7:0]),
        .c_in(sel),
        .c_out(carry)
    );

    clas_8bit unit_1(
        .a(a[15:8]),
        .b(b[15:8]),
        .sel(sel),
        .result(result[15:8]),
        .c_in(carry),
        .c_out(c_out)
    );
endmodule