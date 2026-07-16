module Corr_b (clk,start,shift,b0,B);
    input            clk;
    input            start;
    input            shift;
    input            b0;
  output reg [4:0] B;
always @(posedge clk or posedge start) begin
if (start) begin
            B = 5'b0;
        end 
else begin
    if (shift)  B <= B << 1;   
            if (b0) B[0] <= 1'b1;  
        end
    end
endmodule
