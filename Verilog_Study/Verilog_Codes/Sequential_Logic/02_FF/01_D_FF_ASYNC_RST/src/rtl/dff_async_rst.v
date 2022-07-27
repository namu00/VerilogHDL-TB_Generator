module dff_async_rst(clk, rst, d, q);
    input clk;
    input rst;
    input d;
    output reg q;

    always@(posedge clk or negedge rst) begin
        if(!rst) q <= 0;
        else q <= d;
    end
endmodule