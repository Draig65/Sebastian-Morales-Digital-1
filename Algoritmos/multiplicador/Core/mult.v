module mult #(
  parameter width = 4
) (clk,init,rst,A,B,resultado,done);
  
input         rst;
input         clk;
input         init;
input [15:0]  A;
input [15:0]  B;
output[31:0]  resultado;
output        done;

wire w_sh;
wire w_load;
wire w_add;
wire w_z;
  
wire [31:0] w_b;
wire [31:0] w_a;

Control      ctrl     (.rst(rst), .clk(clk), .init(init),.ao(w_a[0]),.shift(w_sh), .load(w_load),.add(w_add),.z(w_z),.done(done));
Corrimiento_iz lsh      (.rst(rst), .clk(clk), .shift(w_sh), .load(w_load), .b(B), .out_b(w_b)); 
Corrimiento_de rsh      (.rst(rst), .clk(clk), .shift(w_sh), .load(w_load), .a(A), .out_a(w_a));
acumulador     acc      (.rst(rst), .clk(clk), .b(w_b), .add(w_add), .out_r(resultado), .load(w_load));
comparador     comp     (.rst(rst), .a(w_a), .z(w_z));

endmodule
