module control (clk, rst, start, b0, z_co, done, shift, load, inc, dec);
  input  clk, rst, start;
  input  b0;          
  input  z_co;        

  output reg done; 
  output reg shift;  
  output reg load;    
  output reg inc;
  output reg dec;     

  
  parameter START  = 2'b00,
   parameter LOAD   = 2'b01,
   parameter SHIFT  = 2'b10,
    parameter END_ST = 2'b11;

  reg [1:0] state;

  always @(posedge clk or posedge rst) begin
    if (rst)
      state <= START;
    else begin
      case (state)
        START : if (start) state <= LOAD;
        LOAD  :           state <= SHIFT;
        SHIFT : if (z_co) state <= END_ST;
        END_ST: if (!start) state <= START;  
      endcase
    end
  end


  always @(*) begin

    {done, shift, load, inc, dec} = 5'b0;
    case (state)
      LOAD : load      = 1'b1;
      SHIFT: begin
               shift     = 1'b1;
               dec       = 1'b1;
               inc  = b0;  
             end
      END_ST: done      = 1'b1;
    endcase
  end

`define BENCH
`ifdef BENCH
  reg [8*16:1] state_name;
  always @(*) begin
    case (state)
      START : state_name = "START";
      LOAD  : state_name = "LOAD";
      SHIFT : state_name = "SHIFT";
      END_ST: state_name = "END";
      default: state_name = "UNKN";
    endcase
  end
`endif
endmodule
