`timescale 1ns/1ps

module not_with_dff (
    clk,
    rst_n,
    in,
    out
);

  input clk;
  input rst_n;
  input in;
  output out;

  reg sig1;
  wire sig2;
  reg sig3;

  always @(posedge clk or negedge rst_n)
  begin
    if (!rst_n) begin
      sig1 <= 1'b0;
    end
    else begin
      sig1 <= #0.1 in;
    end
  end

  assign #0.1 sig2 = ~sig1;

  always @(posedge clk or negedge rst_n)
  begin
    if (!rst_n) begin
      sig3 <= 1'b0;
    end
    else begin
      sig3 <= #0.1 sig2;
    end
  end

  assign out = sig3;

endmodule
