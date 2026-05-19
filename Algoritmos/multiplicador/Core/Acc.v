module acumulador(rst,clk,b,add,out_r,load);
  input rst;
  input clk;
  input [31:0] b;
  input add;
  input load;
  output reg [31:0] out_r;

  always @(posedge clk or posedge rst)
    if(rst)
      out_r<= 0;
  else if (load)
    out_r <= 0;
  else 
      begin
        if(add)
          out_r<=out_r +b;
        else
          out_r<=out_r;
      end
endmodule


