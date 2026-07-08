module Corrimiento_ra (clk,rst,load,radical_in, shift,sub_en,C,A,R);
    input            clk;
    input            rst;
    input            load;
    input      [7:0] radical_in;
    input            shift;
    input            sub_en;
    input      [7:0] C;
    output reg [8:0] A;
    output reg [7:0] R;

    always @(posedge clk or posedge rst) begin
        if (rst ) begin
            A <= 9'b0;
            R <= 8'b0;
        end 
      else if (load) begin
          A <= {radical_in, 1'b1};
            R <= 8'b0;
        end 
      else begin
            if (shift) 
                {R, A} <= {R, A} << 2; 
            else if (sub_en) 
                R <= R - C;            
        end
    end
endmodule
