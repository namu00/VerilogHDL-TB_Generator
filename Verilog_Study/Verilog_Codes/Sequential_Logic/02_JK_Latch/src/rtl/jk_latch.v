module jk_latch(j,k,out);
    input j;
    input k;
    output reg out;

    assign out = 1'b1; //initialize out

    always @ (j or k) begin
        if(j == 1'b0 && k == 1'b0) out = out;
        else if(j == 1'b1 && k == 1'b0) out = 1'b1;
        else if(j == 1'b0 && k == 1'b1) out = 1'b0;
        else out = ~out;
    end
endmodule