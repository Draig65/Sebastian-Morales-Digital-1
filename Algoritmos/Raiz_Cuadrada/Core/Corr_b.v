module corrimiento_b (clk,rst,init,clear,shift,b0,B);
    input            clk;
    input            rst;
    input            init;
    input            clear;
    input            shift;
    input            set_b0;
  output reg [4:0] B;
  
    always @(posedge clk or posedge rst) begin
        if (rst || init || clear) begin
            B <= 5'b0;
        end 
else begin
            if (shift)  B <= B << 1;   
            if (b0) B[0] <= 1'b1;  
        end
    end
end
