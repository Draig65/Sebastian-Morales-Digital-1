module resta_ac (Ac, A, ac_out);
  input  [15:0] Ac;
  input  [15:0] A;
  output [15:0] ac_out;
 
  assign ac_out = Ac - A;
endmodule
