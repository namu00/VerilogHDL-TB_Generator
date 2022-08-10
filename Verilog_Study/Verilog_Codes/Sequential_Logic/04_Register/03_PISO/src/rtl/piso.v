module piso(clk, rst, ld, in, q);
    input clk, rst, ld;
    input [3:0] in;
    output q;

    reg [3:0] d_ff;

    always@(posedge clk, negedge rst)begin
        if(!rst) d_ff <= 4'b0;
        else begin
            if(ld) d_ff <= in; //Load
            else d_ff <= {d_ff[2:0], 1'b0}; //Read
        end
    end

    assign q  = (ld == 1'b1) ? 1'b0 : d_ff[3];
endmodule