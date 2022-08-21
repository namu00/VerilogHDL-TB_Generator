module testbench();
    reg [3:0] a;
    reg [3:0] b;
    wire carry;
    wire [3:0] out;

    fulladder unit_0(
        .a(a),
        .b(b),
        .carry(carry),
        .out(out)
    );

    integer i,k;
    initial begin 
        for(i = 0; i < 16; i = i + 1)begin
            a = i; b = i; #1;
            end
        $stop;
    end
endmodule