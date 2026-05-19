module multi(clk,rst,init,b,a,r,done);
  
input         rst;
input         clk;
input         init;
input [15:0]  b;
input [15:0]  a;
output[31:0]  r;
output        done;

wire w_sh;
wire w_load;
wire w_add;
wire w_z;
  
wire [31:0] w_b;
wire [31:0] w_a;

Control      ctrl     (.rst(rst), .clk(clk), .init(init),.ao(w_a[0]),.shift(w_sh), .load(w_load),.add(w_add),.z(w_z),.done(done));
Corrimiento_iz lsh      (.rst(rst), .clk(clk), .shift(w_sh), .load(w_load), .b(b), .out_b(w_b)); 
Corrimiento_de rsh      (.rst(rst), .clk(clk), .shift(w_sh), .load(w_load), .a(a), .out_a(w_a));
acumulador     acc      (.rst(rst), .clk(clk), .b(w_b), .add(w_add), .out_r(r), .load(w_load));
comparador     comp     (.rst(rst), .a(w_a), .z(w_z));

endmodule
