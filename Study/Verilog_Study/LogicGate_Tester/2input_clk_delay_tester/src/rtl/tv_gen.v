module tv_gen(clk, rst, in0,in1);
    input clk;
    input rst;
    output reg in0,in1;

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    reg [7:0]STEP = 5;

    reg [1:0] c_state, next;
    reg cnt_rst;
    wire div_clk;

    clk_counter frq_div(
        .clk(clk),
        .rst(rst),
        .step(STEP),
        .out(div_clk)
    );

    always@(posedge div_clk, negedge rst)begin
        if(!rst) c_state <= S0;
        else c_state <= next;
    end

    always@(*) begin
        case(c_state)
            S0 : next = S1;
            S1 : next = S2;
            S2 : next = S3;
            S3 : next = S0;
            default : next = S0;
        endcase
    end

    always@(*)begin
        case(c_state)
        S0 : begin
            in1 = 1'b0;
            in0 = 1'b0;
        end
        S1 : begin
            in1 = 1'b0;
            in0 = 1'b1;
        end
        S2 : begin
            in1 = 1'b1;
            in0 = 1'b0;
        end
        S3 : begin
            in1 <= 1'b1;
            in0 <= 1'b1;
        end
        endcase
    end
endmodule

module clk_counter(clk,rst,step,out);
    input clk, rst;
    input [7:0]step;
    output reg out;

    reg [7:0] counter;

    always@(posedge clk, negedge rst)begin
        if(!rst) begin
            counter <= 8'b1;
            out <=1'b0;
        end

        else begin
            if(counter == step) begin
                counter <= 8'b1;
                out <= 1'b1;
            end

            else begin
                counter <= counter + 1'b1;
                out <= 1'b0;
            end
        end
    end

endmodule