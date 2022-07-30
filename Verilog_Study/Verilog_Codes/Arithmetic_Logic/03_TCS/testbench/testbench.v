module testbench();
    reg [1:0] a;
    reg [1:0] b;
    wire [1:0] sum;
    wire carry;

    tcs test_unit0(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    integer i, k;

    initial begin
        for(i = 2'b0; i <= 2'b11; i = i + 1'b1)begin
            a = i;
            for (k = 2'b0; k <= 2'b11; k = k + 1'b1)begin
                b = k; #10;
            end
        end
        $stop;
    end
endmodule