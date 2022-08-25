module fulladder(a,b,carry,out);
    input [3:0]a;
    input [3:0]b;
    output carry;
    output [3:0] out;

    assign {carry,out} = {1'b0,a} + {1'b0,b};
endmodule