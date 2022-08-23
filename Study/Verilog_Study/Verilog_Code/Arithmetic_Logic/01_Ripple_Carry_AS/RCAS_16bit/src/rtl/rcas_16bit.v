module rcas_16bit(a, b, sel, result, c_out);
    input [15:0] a,b;
    input sel;
    output [15:0] result;
    output c_out;

    wire carry;
    rcas_8bit unit_0(
        .a(a[7:0]),
        .b(b[7:0]),
        .sel(sel),
        .result(result[7:0]),
        .c_in(sel),
        .c_out(carry)
    );

    rcas_8bit unit_1(
        .a(a[15:8]),
        .b(b[15:8]),
        .sel(sel),
        .result(result[15:8]),
        .c_in(carry),
        .c_out(c_out)
    );
endmodule