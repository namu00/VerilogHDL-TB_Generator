module testbench();
    reg [3:0] a;
    reg [3:0] b;

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

    integer i,k;

    initial begin
        for (i = 0; i < 16; i = i + 1)begin
            a = i;
            for(k = 0; k < 16; k = k + 1)begin
                b = k;
                #5;
            end
        end
        $stop;
    end
endmodule