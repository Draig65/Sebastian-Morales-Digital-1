module comparador_aca (Ac, A, z);
  input  [15:0] Ac;
  input  [15:0] A;
  output        z;
 
  assign z = (Ac >= A) ? 1'b1 : 1'b0;
endmodule
