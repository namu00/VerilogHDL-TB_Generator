module tv_gen(clk, rst, in0, in1, in2);
    input clk;
    input rst;
    output reg in0,in1,in2;

    parameter S0 = 0;
    parameter S1 = 1;
    parameter S2 = 2;
    parameter S3 = 3;
    parameter S4 = 4;
    parameter S5 = 5;
    parameter S6 = 6;
    parameter S7 = 7;

    reg [2:0] c_state, next;

    always@(posedge clk, negedge rst)begin
        if(!rst) c_state <= S0;
        else c_state <= next;
    end

    always@(c_state) begin
        case(c_state)
            S0 : next = S1;
            S1 : next = S2;
            S2 : next = S3;
            S3 : next = S4;
            S4 : next = S5;
            S5 : next = S6;
            S6 : next = S7;
            S7 : next = S0;
        endcase
    end

    always@(c_state)begin
        case(c_state)
        S0 : begin
            in2 = 1'b0;
            in1 = 1'b0;
            in0 = 1'b0;
        end
        S1 : begin
            in2 = 1'b0;
            in1 = 1'b0;
            in0 = 1'b1;
        end
        S2 : begin
            in2 = 1'b0;
            in1 = 1'b1;
            in0 = 1'b0;
        end
        S3 : begin
            in2 = 1'b0;
            in1 <= 1'b1;
            in0 <= 1'b1;
        end
        S4 : begin
            in2 = 1'b1;
            in1 = 1'b0;
            in0 = 1'b0;
        end
        S5 : begin
            in2 = 1'b1;
            in1 = 1'b0;
            in0 = 1'b1;
        end
        S6 : begin
            in2 = 1'b1;
            in1 = 1'b1;
            in0 = 1'b0;
        end
        S7 : begin
            in2 = 1'b1;
            in1 = 1'b1;
            in0 = 1'b1;
        end
        endcase
    end
endmodule