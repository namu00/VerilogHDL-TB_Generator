module testbench();
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] sum;
    wire carry;

    cla_16bit test_unit0(
        .a(a),
        .b(b),
        .sum(sum),
        .carry_start(1'b0),
        .carry_out(carry)
    );

    integer i, k;
    initial begin
       for(i = 32'b0; i <= 32'hffff_ffff; i = i + 1'b1)begin
            a = i;
            for(k = 32'b0; k <= 32'hffff_ffff; k = k + 1'b1)begin
                b = k; #10;
            end
       end
       $stop;
    end
endmodule