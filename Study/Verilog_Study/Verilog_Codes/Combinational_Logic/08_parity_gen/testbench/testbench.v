module testbench();
    reg [2:0] data;
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
      for (i = 3'b0; i <= 3'b111; i = i + 1'b1)begin
        data = i; #5;
      end

      trig = 1'b1;
      for (i = 3'b0; i <= 3'b111; i = i + 1'b1)begin
        data = i; #5; 
      end
      $stop;
    end
endmodule