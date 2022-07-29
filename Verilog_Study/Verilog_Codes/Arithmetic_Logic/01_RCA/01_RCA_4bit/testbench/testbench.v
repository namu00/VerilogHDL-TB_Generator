module testbench();
    reg [3:0] a;
    reg [3:0] b;
    reg carry_start;
    wire [3:0] sum;
    wire carry;

    rca_4bit test_unit0(
        .a(a),
        .b(b),
        .sum(sum),
        .carry_start(1'b0),
        .carry(carry)
    );

    integer i, k;
    initial begin
       for(i = 4'b0000; i <= 4'b1111; i = i + 1'b1)begin
            a = i;
            for(k = 4'b0000; k <= 4'b1111; k = k + 1'b1)begin
                b = k; #10;
            end
       end
       $stop;
    end
endmodule