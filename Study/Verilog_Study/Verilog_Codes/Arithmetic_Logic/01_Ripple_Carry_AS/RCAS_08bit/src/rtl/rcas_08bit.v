module rcas_8bit(a, b, sel, result, c_out);
    input [7:0] a,b;
    input sel;
    output [7:0] result;
    output c_out;

    wire carry;
    rcas_4bit unit_0(
        .a(a[3:0]),
        .b(b[3:0]),
        .sel(sel),
        .result(result[3:0]),
        .c_in(sel),
        .c_out(carry)
    );

    rcas_4bit unit_1(
        .a(a[7:4]),
        .b(b[7:4]),
        .sel(sel),
        .result(result[7:4]),
        .c_in(carry),
        .c_out(c_out)
    );
endmodule