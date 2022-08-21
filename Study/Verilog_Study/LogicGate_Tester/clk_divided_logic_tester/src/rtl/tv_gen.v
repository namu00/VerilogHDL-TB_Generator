//==================================
//Clock Divided TestVector Generator
//----------------------------------
//Top Module: tv_gen
//Sub Module: clk_counter
//==================================

module tv_gen(clk, rst, in0,in1); //Testvector Generator, Top Module
    input clk; //CLOCK
    input rst; //Reset Signal
    output reg in0,in1; //INPUT SIGNALS for ""Test_Unit""

    //STATES begin
    parameter S0 = 2'b00; 
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;
    //STATES end

    reg [9:0]STEP = 1000; //CLOCK DELAY PARAMATER, It means "Delay 1000 Clocks"

    reg [1:0] c_state, next;
    wire div_clk; //Divided Clock Wire

    //Module Instance for Clock Dividing
    clk_counter frq_div(
        .clk(clk),
        .rst(rst),
        .step(STEP),
        .out(div_clk)
    ); //Instance End

    always@(posedge div_clk, negedge rst)begin
        //Designating Running State
        if(!rst) c_state <= S0;
        else c_state <= next;
    end

    always@(c_state) begin
        //Designating Next State
        case(c_state)
            S0 : next = S1;
            S1 : next = S2;
            S2 : next = S3;
            S3 : next = S0;
            default : next = S0;
        endcase
    end

    always@(c_state)begin
        //Desginating Output
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

module clk_counter(clk,rst,step,out); //clk divider, Sub Module
    input clk, rst;
    input [9:0]step; //Clock Delay Parameter
    output reg out;  //New Clock OUTPUT

    reg [9:0] counter;

    always@(posedge clk, negedge rst)begin
        if(!rst) begin
            //RESET Condition
            counter <= 8'b1;
            out <=1'b0;
        end

        else begin
            if(counter == step) begin
                //Generate Rising Edge
                counter <= 8'b1;
                out <= 1'b1;
            end

            else begin
                //Default State, maintain LOW LEVEL
                counter <= counter + 1'b1;
                out <= 1'b0;
            end
        end
    end

    always @ (posedge clk, negedge clk)begin
        //Passthrow clk when STEP == 1
        if(step == 1) begin
            out <= clk;
        end
    end
endmodule