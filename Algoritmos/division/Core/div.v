module div_32 (clk, rst, init, start, A, B, cociente, resto, done);
  input        clk, rst;
  input        init;    
  input        start;   
  input  [15:0] A;      
  input  [15:0] B;      
  output [15:0] cociente;
  output [15:0] resto;
  output        done;
 
  wire w_sh;            
  wire w_load;          
  wire w_load_ac;       
  wire w_r0;            
  wire w_dec;           
  wire w_z;             
  wire w_z_co;          
  wire w_msb;           
  wire [31:0] w_acb;    
  wire [15:0] w_ac_sub; 
 
  Corrimiento_acb    corr_acb (.clk(clk), .init(init),.in_B(B), .ac_sub(w_ac_sub),.shift(w_sh), .load(w_load), .load_ac(w_load_ac),.s_acb(w_acb), .msb(w_msb));
  resta_ac     dec (.Ac(w_acb[31:16]), .A(A), .ac_out(w_ac_sub));
  corrimiento_r      corr_r   (.clk(clk), .init(init),.shift(w_sh), .load(w_load), .r0(w_r0),.s_r(cociente));
  comparador_aca   comp(.Ac(w_acb[31:16]), .A(A), .z(w_z));
  contador cnt      (.clk(clk), .init(init), .rst(rst),.load(w_load), .dec(w_dec), .z_co(w_z_co));
  control ctrl    (.clk(clk), .rst(rst), .init(init),.start(start), .z(w_z), .z_co(w_z_co), .msb(w_msb),.done(done), .sh(w_sh), .load(w_load),.load_ac(w_load_ac), .r0(w_r0), .dec(w_dec));
  
  assign resto = w_acb[31:16];
endmodule
