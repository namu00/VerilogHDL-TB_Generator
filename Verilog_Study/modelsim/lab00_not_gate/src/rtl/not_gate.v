`timescale 1ns/1ps

module not_gate (
    in,
    out
);

  input in;
  output out;

  assign out = ~in;

endmodule
