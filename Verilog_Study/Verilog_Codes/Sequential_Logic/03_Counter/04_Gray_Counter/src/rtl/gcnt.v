//TOP MODULE BELLOW
module gcnt(clk, rst, trig, count_out);
    input clk, rst, trig;
    //trig == Order Trigger
    //trig 0 == UP_Counter
    //trig 1 == DOWN_Counter

    output [3:0] count_out;
    wire [3:0] bcnt_out;

    bcnt block_0(
        .clk(clk),
        .rst(rst),
        .trig(trig),
        .out(bcnt_out)
    );

    gray_gen block_1(
        .data(bcnt_out),
        .gray_out(count_out)
    );
endmodule

//Binary Counter BELLOW
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

//GrayCode Generator BELLOW
module gray_gen(data, gray_out);
    input [3:0] data;
    output reg [3:0] gray_out;

    integer i;

    always@(*) begin
        for(i = 3; i >= 0; i =  i - 1) begin
            if(i == 3) gray_out[i] = data[i];
            else gray_out[i] = (data[(i+1)] ^ data[i]);
        end
    end

endmodule