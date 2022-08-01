module testbench();
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] sum;
    wire carry;

    cls_8bit test_unit0(
        .a(a),
        .b(b),
        .sum(sum),
        .carry_start(1'b1),
        .carry_out(carry)
    );

    integer i, k;
    initial begin
       for(i = 8'b0; i <= 8'hf; i = i + 1'b1)begin
            a = i;
            for(k = 8'b0; k <= 8'hf; k = k + 1'b1)begin
                b = k; #10;
            end
       end
       $stop;
    end
endmodule