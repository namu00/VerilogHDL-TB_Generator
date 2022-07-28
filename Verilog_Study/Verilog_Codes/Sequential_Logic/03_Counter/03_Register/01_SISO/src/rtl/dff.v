module dff(clk, rst, d, out);
    input clk;
    input rst;
    input d;
    output reg out;

    always @ (posedge clk, negedge rst)begin
        if(!rst) out <= 1'b0;
        else out <= d;
    end
endmodule