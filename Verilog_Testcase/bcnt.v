module bcnt(clk, rst, trig, out);
    input clk;
    input rst;
    input trig; //Order Trigger
    //trig 0 == UpCounter
    //trig 1 == DownCounter
    output reg [3:0]out;

    always@(posedge clk , negedge rst)
    begin
        if(!rst) out <= (trig == 1'b0) ? 4'b0000 : 4'b1111;

        else begin
            case(trig)
                1'b1 : out <= (out - 1'b1);
                default : out <= (out + 1'b1);
            endcase
        end 
    end
endmodule