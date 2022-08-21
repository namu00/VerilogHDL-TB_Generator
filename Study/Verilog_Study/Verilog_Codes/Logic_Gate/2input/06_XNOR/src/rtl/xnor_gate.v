module xnor_gate(a, b, out);
    input a;
    input b;
    output out;

    wire xor_result;

    xor_gate unit_0(
                    .a(a),
                    .b(b),
                    .out(xor_result)
    );
    assign out = ~xor_result;

endmodule