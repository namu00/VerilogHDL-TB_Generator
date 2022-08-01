module testbench();
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] sum;
    wire carry;

    cls_16bit test_unit0(
        .a(a),
        .b(b),
        .sum(sum),
        .carry_start(1'b1),
        .carry_out(carry)
    );

    integer i, k;
    initial begin
       for(i = 16'b0; i <= 16'hffff; i = i + 1'b1)begin
            a = i;
            for(k = 16'b0; k <= 16'hffff; k = k + 1'b1)begin
                b = k; #10;
            end
       end
       $stop;
    end
endmodule