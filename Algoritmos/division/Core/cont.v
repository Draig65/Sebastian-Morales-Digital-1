module contador(clk, rst, load, dec, z_co);
  input  clk;
  input  rst;   
  input  load;    
  input  dec;     
  output z_co;    
 
reg [4:0] count;
 
  assign z_co = (count == 5'b0);
 
  always @(posedge clk) begin
    if (rst)
      count <= 5'd16;         
 else if (load)
      count <= 5'd16;         
    else if (dec)
      count <= count - 1'b1;  
  end
endmodul
