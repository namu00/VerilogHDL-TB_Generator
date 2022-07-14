module testbench();
    reg [3:0] data;
    reg trig;
    reg parity;

    wire out;

    parity_checker unit_0(
        .data(data),
        .parity(parity),
        .trig(trig),
        .out(out)
    );

    integer i;

    initial begin
      trig = 1'b0; parity = 1'b1;
      for (i = 4'b0; i <= 4'b1111; i = i + 1'b1)begin
        data = i; #5;
      end

      trig = 1'b1; parity = 1'b0;
      for (i = 4'b0; i <= 4'b1111; i = i + 1'b1)begin
        data = i; #5; 
      end
      $stop;
    end
endmodule