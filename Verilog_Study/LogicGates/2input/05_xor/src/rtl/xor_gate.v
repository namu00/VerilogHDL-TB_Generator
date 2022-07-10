module xor_gate(a,b,out);
    input a;
    input b;
    output out;

    assign out = (~a && b) || (a && ~b);
endmodule