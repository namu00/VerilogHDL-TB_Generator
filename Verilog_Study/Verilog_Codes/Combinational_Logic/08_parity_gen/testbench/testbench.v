module testbench();
    reg [3:0] data;
    reg trig;

    wire parity;

    parity_gen unit_0(
        .data(data),
        .trig(trig),
        .parity(parity)
    );

    integer i;

    initial begin
      trig = 1'b0;
      for (i = 4'b0; i <= 4'b1111; i = i + 1'b1)begin
        data = i; #5;
      end

      trig = 1'b1;
      for (i = 4'b0; i <= 4'b1111; i = i + 1'b1)begin
        data = i; #5; 
      end
      $stop;
    end
endmodule