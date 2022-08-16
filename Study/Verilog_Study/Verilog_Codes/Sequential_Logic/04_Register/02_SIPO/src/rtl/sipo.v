module sipo(clk, rst, in, q);
    input clk, rst, in;
    output reg [3:0]q;

    always @(posedge clk, negedge rst)begin
        if(!rst) q <= 4'b0000;
        else {q[3:1], q[0]} <= {q[2:0], in };
    end
endmodule