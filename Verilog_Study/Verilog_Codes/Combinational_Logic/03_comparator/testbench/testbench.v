module testbench();
    reg a;
    reg b;

    wire eq,neq;
    wire big_a,big_b;

    cmp unit_0(
        .a(a),
        .b(b),
        .eq(eq),
        .neq(neq),
        .big_a(big_a),
        .big_b(big_b)
    );

    initial begin
        a = 1'b0; b = 1'b0; #5;
        a = 1'b0; b = 1'b1; #5;
        a = 1'b1; b = 1'b0; #5;
        a = 1'b1; b = 1'b1; #5; 
        $stop;
    end
endmodule