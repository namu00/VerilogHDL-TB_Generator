module ring_counter(clk, rst, trig, out);
    input clk;
    input rst;
    input trig; //Order Trigger
    //trig 0 == UP_Counter
    //trig 1 == DOWN_Counter
    output reg [3:0] out;

    always @ (posedge clk, negedge rst) begin

        if(!rst) out <= (trig == 1'b0) ? 4'b0000 : 4'b1000;

        else begin
            case(trig)
                1'b1 :  out <= out>>1;
                default : begin
                    if (out == 4'b0000) out <= 4'b0001;
                    else out <= out<<1;
                end
            endcase
        end

    end
endmodule