
module cont(clk, rst, load, dec, z_co);
  input  clk;
  input  rst;
  input   load;           
  input  dec;            
  output z_co;           
  reg [4:0] cont;       

  assign z_co = (cont == 5'b0);
  always @(posedge clk) begin
    if (rst)
    cont <= 5'd16;
    else if ( load)
      cont <= 5'd16;
  else if (dec)
      cont <= cont - 1'b1;
  end
endmodule
