module piso(clk, rst, ld, in, q);
    input clk, rst, ld;
    input [3:0] in;
    output reg q;

    reg [3:0] d_ff;

    always@(posedge clk, negedge rst)begin
        if(!rst) d_ff <= 4'b0;
        else begin
            if(ld) d_ff <= in; //Load
            else begin //Read
                q <= d_ff[3];
                d_ff <= {d_ff[2:0], 1'b0};
            end 
        end
    end
endmodule