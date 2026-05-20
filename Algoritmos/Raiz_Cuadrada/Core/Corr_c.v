module Corrimiento_c (clk,rst,init,load_b,B,calc_c,C);
    input            clk;
    input            rst;
    input            init;
    input            load_b;
    input      [4:0] B;
    input            calc_c;
    output reg [7:0] C;
    
    always @(posedge clk or posedge rst) begin
        if (rst || init) begin
            C <= 8'b0;
        end 
      else begin
            if (load_b) 
                C <= {3'b0, B};          
            else if (calc_c) 
                C <= (C << 2) | 8'b1;    
        end
    end
end
