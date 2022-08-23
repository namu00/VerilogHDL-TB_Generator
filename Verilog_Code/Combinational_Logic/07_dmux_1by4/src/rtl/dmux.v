module dmux(in, sel, a,b,c,d);
    input [3:0]in;
    input [1:0] sel;

    output reg [3:0] a,b,c,d;

    always @ (sel or in) begin
     case(sel)
          2'b00 : {a,b,c,d} = {in,4'b0,4'b0,4'b0};
          2'b01 : {a,b,c,d} = {4'b0,in,4'b0,4'b0};
          2'b10 : {a,b,c,d} = {4'b0,4'b0,in,4'b0};
          2'b11 : {a,b,c,d} = {4'b0,4'b0,4'b0,in};
          default : {a,b,c,d} = {4'b0,4'b0,4'b0,4'b0};
     endcase
    end
endmodule