module cmp(a,b,eq,neq,big_a,big_b);
    input a; //target1
    input b; //target2

    output reg eq; //equal flag
    output reg neq; //not equal flag
    output reg big_a; //a is biger than
    output reg big_b; //b is biger than

    assign eq = (a == b) ? 1'b1 : 1'b0;
    assign neq = ~eq; 

    always@(a or b)begin
      if(a>b) begin
        big_a = 1'b1;
        big_b = ~big_a;
      end

      else if(a<b) begin
        big_a = 1'b0;
        big_b = ~big_a;
      end

      else begin
        big_a = 1'b0;
        big_b = big_a;
      end   
    end
endmodule