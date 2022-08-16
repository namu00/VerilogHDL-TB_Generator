module pipo(clk, rst, in, q);
    input clk, rst;
    input [3:0] in;
    output reg [3:0] q;

    always@(posedge clk, negedge rst)begin
        if(!rst) q <= 4'b0;
        else q <= in;
    end
endmodule