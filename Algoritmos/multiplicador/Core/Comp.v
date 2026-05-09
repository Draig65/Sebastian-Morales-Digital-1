module comparador(rst, a, z)
  input rst;
  input [31:0] a;
  output reg   z;
  always @(*) 
    if (rst)
      z=0;
    else 
      z=(a==0)? 1'b1 : 1'b0;
endmodule 
