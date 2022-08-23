module pattern_00(clk, rst, in, result);
    input clk, rst, in;
    output reg result;

    reg next, state;
    parameter [1:0] IDLE = 2'b00,
                    S1 = 2'b01,
                    S2 = 2'b10;

    always@(posedge clk, negedge rst)begin
        if(!rst) state <= IDLE;
        else state <= next;
    end

    always@(state or in)begin
        case(state)
            IDLE: next <= (in == 1'b0) ? S1 : IDLE;
            S1 <= (in == 1'b0) ? S2 : S1;
            default: next <= state;
        endcase
    end

    always@(posedge clk, negedge rst)begin
        case(state)
            IDLE: result = 1'b0;
            S1: 1'b0;
            S2: 1'b1;
        endcase
    end
endmodule